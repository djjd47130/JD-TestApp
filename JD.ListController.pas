unit JD.ListController;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.Classes, System.SysUtils, System.Generics.Collections,
  Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Forms,
  uListItemBase;

type
  TJDListItem = class;
  TJDListItems = class;
  TJDListController = class;
  TJDListItemLayout = class;

  TJDListOrientation = (loVertical, loHorizontal, loVerticalTile, loHorizontalTile);


  TJDListItem = class(TCollectionItem)
  private
    FID: Int64;
    FCaption: TCaption;
    FData: Pointer;
    procedure SetCaption(const Value: TCaption);
    procedure SetData(const Value: Pointer);
    procedure SetID(const Value: Int64);
  protected
    function GetDisplayName: String; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    property Data: Pointer read FData write SetData;
  published
    property Caption: TCaption read FCaption write SetCaption;
    property ID: Int64 read FID write SetID;
  end;

  TJDListItems = class(TOwnedCollection)
  private
    FOwner: TJDListController;
    function GetItem(const Index: Integer): TJDListItem;
    procedure SetItem(const Index: Integer; const Value: TJDListItem);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    function Add: TJDListItem;
    property Items[const Index: Integer]: TJDListItem read GetItem write SetItem; default;
  end;

  TJDListItemEvent = procedure(Sender: TObject; Item: TJDListItem) of object;

  TJDListController = class(TComponent)
  private
    FItems: TJDListItems;
    FContainer: TScrollBox;
    FOrientation: TJDListOrientation;
    FItemHeight: Integer;
    FItemWidth: Integer;
    FLayout: TJDListItemLayout;
    FOnItemDeleted: TJDListItemEvent;
    FOnItemEdited: TJDListItemEvent;
    FOnItemAdded: TJDListItemEvent;
    procedure SetContainer(const Value: TScrollBox);
    procedure SetOrientation(const Value: TJDListOrientation);
    procedure SetItemHeight(const Value: Integer);
    procedure SetItemWidth(const Value: Integer);
    procedure SetLayout(const Value: TJDListItemLayout);
  protected
    procedure DoOnItemAdded(Item: TJDListItem); virtual;
    procedure DoOnItemEdited(Item: TJDListItem); virtual;
    procedure DoOnItemDeleted(Item: TJDListItem); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Count: Integer;
    function Add: TListItemBase;
    procedure Delete(const Index: Integer);
    procedure Clear;
  published
    property Container: TScrollBox read FContainer write SetContainer;
    property ItemHeight: Integer read FItemHeight write SetItemHeight default 300;
    property ItemWidth: Integer read FItemWidth write SetItemWidth default 300;
    property Layout: TJDListItemLayout read FLayout write SetLayout;
    property Orientation: TJDListOrientation read FOrientation write SetOrientation default loVertical;

    property OnItemAdded: TJDListItemEvent read FOnItemAdded write FOnItemAdded;
    property OnItemEdited: TJDListItemEvent read FOnItemEdited write FOnItemEdited;
    property OnItemDeleted: TJDListItemEvent read FOnItemDeleted write FOnItemDeleted;
  end;

  TJDListItemLayout = class(TComponent)
  private
    FContentControl: TCustomControl;
    procedure SetContentControl(const Value: TCustomControl);
  public
  published
    //TODO!!!
    property ContentControl: TCustomControl read FContentControl write SetContentControl;
  end;

procedure RegisterListItemClass(AClass: TListItemBaseClass);
procedure GetRegisteredListItemClasses(AList: TStrings);

procedure Register;

implementation

var
  RegisteredListItemClasses: TList;

procedure RegisterListItemClass(AClass: TListItemBaseClass);
begin
  if not Assigned(RegisteredListItemClasses) then
    RegisteredListItemClasses := TList.Create;

  if RegisteredListItemClasses.IndexOf(Pointer(AClass)) = -1 then
    RegisteredListItemClasses.Add(Pointer(AClass));
end;

procedure GetRegisteredListItemClasses(AList: TStrings);
var
  I: Integer;
begin
  AList.Clear;
  if not Assigned(RegisteredListItemClasses) then
    Exit; // Prevent access violation

  for I := 0 to RegisteredListItemClasses.Count - 1 do
    AList.Add(TListItemBaseClass(RegisteredListItemClasses[I]).ClassName);
end;

procedure Register;
begin
  RegisterComponents('JD Lists', [TJDListController, TJDListItemLayout]);
end;

{ TJDListController }

constructor TJDListController.Create(AOwner: TComponent);
begin
  inherited;
  //FItems:= TObjectList<TListItemBase>.Create(True);
  FItems:= TJDListItems.Create(Self);
  FItemWidth:= 300;
  FItemHeight:= 300;
end;

destructor TJDListController.Destroy;
begin

  Clear;
  FreeAndNil(FItems);
  inherited;
end;

procedure TJDListController.DoOnItemAdded(Item: TJDListItem);
begin
  if Assigned(FOnItemAdded) then
    FOnItemAdded(Self, Item);
end;

procedure TJDListController.DoOnItemDeleted(Item: TJDListItem);
begin
  if Assigned(FOnItemDeleted) then
    FOnItemDeleted(Self, Item);
end;

procedure TJDListController.DoOnItemEdited(Item: TJDListItem);
begin
  if Assigned(FOnItemEdited) then
    FOnItemEdited(Self, Item);
end;

function TJDListController.Add: TListItemBase;
begin

  var Itm:= FItems.Add;
  //TODO


  Result:= TListItemBase.Create(nil);
  //FItems.Add(Result);

  if Assigned(Container) then
    Container.DisableAlign;
  try
    case Self.FOrientation of
      loVertical: begin
        Result.Align:= alTop;
        Result.Top:= 1000000; //TODO
      end;
      loHorizontal: begin
        Result.Align:= alLeft;
        Result.Left:= 1000000; //TODO
      end;
      loVerticalTile: begin
        //TODO
      end;
      loHorizontalTile: begin
        //TODO
      end;
    end;
    Result.Parent:= Container;
    Result.Visible:= (Container <> nil);

    DoOnItemAdded(Itm);

  finally
    if Assigned(Container) then
      Container.EnableAlign;
  end;
end;

procedure TJDListController.Delete(const Index: Integer);
begin
  DoOnItemDeleted(FItems[Index]);
  FItems.Delete(Index);
end;

procedure TJDListController.Clear;
begin
  while Count > 0 do
    Delete(0);
end;

function TJDListController.Count: Integer;
begin
  Result:= FItems.Count;
end;

procedure TJDListController.SetContainer(const Value: TScrollBox);
var
  X: Integer;
begin
  FContainer := Value;
  //Migrate all items over to new container...
  for X := 0 to FItems.Count-1 do begin
    //FItems[X].Parent:= Container;
    //FItems[X].Visible:= (Container <> nil);
  end;
end;

procedure TJDListController.SetItemHeight(const Value: Integer);
begin
  FItemHeight := Value;
  //TODO
end;

procedure TJDListController.SetItemWidth(const Value: Integer);
begin
  FItemWidth := Value;
  //TODO
end;

procedure TJDListController.SetLayout(const Value: TJDListItemLayout);
begin
  FLayout := Value;
  //TODO
end;

procedure TJDListController.SetOrientation(const Value: TJDListOrientation);
begin
  FOrientation := Value;
  //TODO
end;

{ TJDListItems }

constructor TJDListItems.Create(AOwner: TComponent);
begin
  inherited Create(AOwner, TJDListItem);
  FOwner:= TJDListController(AOwner);

end;

function TJDListItems.GetItem(const Index: Integer): TJDListItem;
begin
  Result:= TJDListItem(inherited GetItem(Index));
end;

procedure TJDListItems.SetItem(const Index: Integer; const Value: TJDListItem);
begin
  inherited SetItem(Index, Value);
end;

function TJDListItems.Add: TJDListItem;
begin
  Result:= TJDListItem(inherited Add);
end;

{ TJDListItem }

constructor TJDListItem.Create(Collection: TCollection);
begin
  inherited;

  //TODO: Create control...

end;

destructor TJDListItem.Destroy;
begin

  inherited;
end;

function TJDListItem.GetDisplayName: String;
begin
  inherited; //TODO
end;

procedure TJDListItem.SetCaption(const Value: TCaption);
begin
  FCaption := Value;
end;

procedure TJDListItem.SetData(const Value: Pointer);
begin
  FData := Value;
end;

procedure TJDListItem.SetID(const Value: Int64);
begin
  FID := Value;
end;

{ TJDListItemLayout }

procedure TJDListItemLayout.SetContentControl(const Value: TCustomControl);
begin
  FContentControl := Value;
end;

initialization

finalization
  RegisteredListItemClasses.Free;

end.
