unit uContentBase;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  ChromeTabs, ChromeTabsClasses, ChromeTabsTypes;



type

  //References to detail list items, and handling click events.

  TDetailRef = class;

  TDetailRefEvent = reference to procedure(Ref: TDetailRef);

  TDetailRef = class(TObject)
  private
    FOnClick: TDetailRefEvent;
    FItem: TListItem;
    procedure SetOnClick(const Value: TDetailRefEvent);
    function GetClickable: Boolean;
  public
    constructor Create(AItem: TListItem);
    property Clickable: Boolean read GetClickable;
    property Item: TListItem read FItem;
    property OnClick: TDetailRefEvent read FOnClick write SetOnClick;
  end;



type
  TfrmContentBase = class;

  TfrmContentBaseClass = class of TfrmContentBase;

  TfrmContentBase = class(TForm)
  protected
    function GetTabCaption: String;
    procedure SetTabCaption(const Value: String);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    /// <summary>
    /// Controls the caption of the tab and form simultaneously.
    /// </summary>
    property TabCaption: String read GetTabCaption write SetTabCaption;

    /// <summary>
    /// Virtual method to refresh any data within the form.
    /// </summary>
    procedure RefreshData; virtual;

    /// <summary>
    /// Virtual function to return whether the form is allowed to close.
    /// </summary>
    function CanClose: Boolean; virtual;



    //TODO: Favicons - #13
    /// <summary>
    /// Virtual function to return the image index associated with the tab.
    /// </summary>
    function GetImageIndex: Integer; virtual;



    //TODO: Shell functions - #8
    /// <summary>
    /// Virtual function to return the shell root string.
    /// </summary>
    class function GetShellRoot: String; virtual;

    /// <summary>
    /// Virtual function to return the shell path string.
    /// </summary>
    class function GetShellPath: String; virtual;

    /// <summary>
    /// Virtual procedure to open a shell resource by its path.
    /// </summary>
    class procedure ShellOpen(const Path: String); virtual;



  end;

var
  frmContentBase: TfrmContentBase;



//TODO: Registered content forms for shell addresses - #8
function RegisteredContentForms: TList<TfrmContentBaseClass>;
procedure RegisterContentForm(AClass: TfrmContentBaseClass);
procedure UnregisterContentForm(AClass: TfrmContentBaseClass);



implementation

{$R *.dfm}

uses
  uMain,
  JD.TabController;



//TODO: Registered content forms for shell addresses - #8
var
  _RegisteredContentForms: TList<TfrmContentBaseClass>;

function RegisteredContentForms: TList<TfrmContentBaseClass>;
begin
  if _RegisteredContentForms = nil then
    _RegisteredContentForms:= TList<TfrmContentBaseClass>.Create;
  Result:= _RegisteredContentForms;
end;

procedure RegisterContentForm(AClass: TfrmContentBaseClass);
begin
  var I:= RegisteredContentForms.IndexOf(AClass);
  if I < 0 then
    RegisteredContentForms.Add(AClass);
end;

procedure UnregisterContentForm(AClass: TfrmContentBaseClass);
begin
  var I:= RegisteredContentForms.IndexOf(AClass);
  if I < 0 then
    RegisteredContentForms.Delete(I);
end;



{ TDetailRef }

constructor TDetailRef.Create(AItem: TListItem);
begin
  FItem:= AItem;
end;

function TDetailRef.GetClickable: Boolean;
begin
  Result:= Assigned(FOnClick);
end;

procedure TDetailRef.SetOnClick(const Value: TDetailRefEvent);
begin
  FOnClick := Value;
end;

{ TfrmContentBase }

constructor TfrmContentBase.Create(AOwner: TComponent);
begin
  inherited;
  TabCaption:= Caption;
end;

destructor TfrmContentBase.Destroy;
begin

  inherited;
end;

function TfrmContentBase.GetImageIndex: Integer;
begin
  Result:= -1;
end;

class function TfrmContentBase.GetShellPath: String;
begin
  //Override expected
  Result:= '';
end;

class function TfrmContentBase.GetShellRoot: String;
begin
  //Override expected
  Result:= 'App';
end;

class procedure TfrmContentBase.ShellOpen(const Path: String);
begin
  //Override expected
end;

function TfrmContentBase.GetTabCaption: String;
var
  T: TJDTabRef;
begin
  T:= TabController.TabByForm(Self);
  if T <> nil then
    Result:= T.Caption;
end;

function TfrmContentBase.CanClose: Boolean;
begin
  Result:= True;
end;

procedure TfrmContentBase.RefreshData;
begin

end;

procedure TfrmContentBase.SetTabCaption(const Value: String);
var
  T: TJDTabRef;
begin
  T:= TabController.TabByForm(Self);
  if T <> nil then
    T.Caption:= Value;
end;

initialization
  _RegisteredContentForms:= nil;

finalization
  FreeAndNil(_RegisteredContentForms);

end.
