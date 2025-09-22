unit uCommonListItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JD.Common, JD.Ctrls, JD.Ctrls.FontButton, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  JD.TMDB.Intf,
  Vcl.Imaging.pngimage, Vcl.Imaging.GIFImg;

type
  TfrmCommonListItem = class;

  TfrmCommonListItemClass = class of TfrmCommonListItem;

  TfrmCommonListItem = class(TFrame)
    imgPicture: TImage;
    pDetail: TPanel;
    lblCaption: TLabel;
    btnDetail: TJDFontButton;
    pImage: TPanel;
    Bevel1: TBevel;
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

constructor TfrmCommonListItem.Create(AOwner: TComponent);
begin
  inherited;
  pDetail.Align:= alClient;
  imgPicture.Align:= alClient;
end;

destructor TfrmCommonListItem.Destroy;
begin

  inherited;
end;

procedure TfrmCommonListItem.LoadItem(const Item: ITMDBItem);
begin
  FItem:= Item;

  lblCaption.Caption:= Item.GetText;

end;

end.
