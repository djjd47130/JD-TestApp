unit uContentListBase;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  uContentBase, JD.Common, JD.Ctrls, JD.Ctrls.FontButton, Vcl.ExtCtrls,
  uListItemBase, JD.ListController;

type
  TfrmContentListBase = class(TForm)
    sbItems: TScrollBox;
    pTop: TPanel;
    lblResults: TLabel;
    btnRefresh: TJDFontButton;
    pTemplate: TPanel;
    pData: TPanel;
    lblCaption: TLabel;
    pImage: TPanel;
    imgPicture: TImage;
    btnLeft: TJDFontButton;
    btnRight: TJDFontButton;
    Lst: TJDListController;
    LstLayout: TJDListItemLayout;
  private
    FOwnsItems: Boolean;
  protected
    procedure ItemClick(const Index: Integer; Item: TListItemBase); virtual;

  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateOwnsItems(AOwner: TComponent); virtual;
    destructor Destroy; override;

    function AddItem(AData: Pointer): TListItemBase; overload; virtual;
    function AddItem(AIntf: IInterface): TListItemBase; overload; virtual;
    procedure Clear; virtual;
  end;

var
  frmContentListBase: TfrmContentListBase;

implementation

{$R *.dfm}

{ TfrmContentListBase }

constructor TfrmContentListBase.Create(AOwner: TComponent);
begin
  inherited;
  //FItems:= TObjectList<TJDListItem>.Create(False);
  FOwnsItems:= False;

end;

constructor TfrmContentListBase.CreateOwnsItems(AOwner: TComponent);
begin
  Create(AOwner);
  FOwnsItems:= True;
end;

destructor TfrmContentListBase.Destroy;
begin
  Clear;
  //FreeAndNil(FItems);
  inherited;
end;

procedure TfrmContentListBase.ItemClick(const Index: Integer; Item: TListItemBase);
begin
  //User clicked on list item
  //Override expected
end;

function TfrmContentListBase.AddItem(AIntf: IInterface): TListItemBase;
begin
  Result:= TListItemBase.Create(sbItems, AIntf);
end;

function TfrmContentListBase.AddItem(AData: Pointer): TListItemBase;
begin
  Result:= TListItemBase.Create(sbItems, AData);
end;

procedure TfrmContentListBase.Clear;
begin
  if FOwnsItems then begin
    {
    while FItems.Count > 0 do begin
      if FItems[0].IsIntf then begin

      end else begin

      end;
    end;
    }
  end;
  //FItems.Clear;
end;

end.
