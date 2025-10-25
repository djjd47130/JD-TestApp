unit uTMDBListItem;

interface

//TODO: Change to inherit from new generalized list item object...

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JD.Common, JD.Ctrls, JD.Ctrls.FontButton, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  JD.TMDB.Intf,
  Vcl.Imaging.pngimage, Vcl.Imaging.GIFImg;

type
  TfrmTMDBListItem = class;

  TfrmTMDBListItemClass = class of TfrmTMDBListItem;

  TfrmTMDBListItem = class(TFrame)
    imgPicture: TImage;
    pDetail: TPanel;
    lblCaption: TLabel;
    pImage: TPanel;
    Bevel1: TBevel;
    btnDetail: TJDFontButton;
    procedure lblCaptionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    FItem: ITMDBItem;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property Item: ITMDBItem read FItem;

    procedure LoadItem(const Item: ITMDBItem); virtual;
  end;

implementation

{$R *.dfm}

constructor TfrmTMDBListItem.Create(AOwner: TComponent);
begin
  inherited;
  pDetail.Align:= alClient;
  imgPicture.Align:= alClient;
end;

destructor TfrmTMDBListItem.Destroy;
begin

  inherited;
end;

procedure TfrmTMDBListItem.lblCaptionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  //if Assigned(btnDetail.OnClick) then
    btnDetail.Click;
end;

procedure TfrmTMDBListItem.LoadItem(const Item: ITMDBItem);
begin
  FItem:= Item;

  lblCaption.Caption:= Item.GetText;


end;

end.
