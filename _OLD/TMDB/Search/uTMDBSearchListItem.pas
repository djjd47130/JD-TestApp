unit uTMDBSearchListItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTMDBListItem, JD.Common, JD.Ctrls, JD.Ctrls.FontButton, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  JD.TMDB.Common,
  JD.TMDB.Intf;

type
  TfrmTMDBSearchListItem = class(TfrmTMDBListItem)
    pData: TPanel;
    lblData1: TLabel;
    lblData2: TLabel;
  private
    { Private declarations }
  public
    procedure LoadMovie(AItem: ITMDBMovie);
    procedure LoadTV(AItem: ITMDBTVSerie);
    procedure LoadPerson(AItem: ITMDBPerson);
    procedure LoadCompany(AItem: ITMDBCompany);

  end;

var
  frmTMDBSearchListItem: TfrmTMDBSearchListItem;

implementation

{$R *.dfm}

{ TfrmTMDBSearchListItem }

procedure TfrmTMDBSearchListItem.LoadCompany(AItem: ITMDBCompany);
begin
  LoadItem(AItem);
  lblData2.Caption:= AItem.OriginCountry;
end;

procedure TfrmTMDBSearchListItem.LoadMovie(AItem: ITMDBMovie);
begin
  LoadItem(AItem);

  //ID
  lblData1.Caption:= IntToStr(AItem.ID);

  //Release Date
  if AItem.ReleaseDate > 0 then begin
    lblData2.Caption:= FormatDateTime('mmm dd, yyyy', AItem.ReleaseDate);
  end else begin
    lblData2.Caption:= '(No Release Date)';
  end;

end;

procedure TfrmTMDBSearchListItem.LoadPerson(AItem: ITMDBPerson);
begin

end;

procedure TfrmTMDBSearchListItem.LoadTV(AItem: ITMDBTVSerie);
begin

end;

end.
