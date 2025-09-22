unit uCommonMovieListItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCommonListItem, JD.Common, JD.Ctrls, JD.Ctrls.FontButton, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  JD.TMDB.Intf, Vcl.Imaging.GIFImg, Vcl.Imaging.pngimage;

type
  TfrmCommonMovieListItem = class(TfrmCommonListItem)
    lblOverview: TLabel;
    lblReleaseDate: TLabel;
    lblGenre: TLabel;
    lblVoteAvg: TLabel;
  private
    { Private declarations }
  public
    procedure LoadItem(const Item: ITMDBItem); override;
  end;

var
  frmCommonMovieListItem: TfrmCommonMovieListItem;

implementation

{$R *.dfm}

{ TfrmCommonListItem1 }

procedure TfrmCommonMovieListItem.LoadItem(const Item: ITMDBItem);
begin
  inherited;

  lblOverview.Caption:= ITMDBMovie(Item).Overview;

  if ITMDBMovie(Item).ReleaseDate > 0 then begin
    //lblReleaseDate.Caption:= FormatDateTime('yyyy-mm-dd', ITMDBMovie(Item).ReleaseDate);
    lblReleaseDate.Caption:= FormatDateTime('mmm dd, yyyy', ITMDBMovie(Item).ReleaseDate);
  end else begin
    lblReleaseDate.Caption:= '(No Release Date)';
  end;

  if ITMDBMovie(Item).Genres.Count > 0 then begin
    lblGenre.Caption:= ITMDBMovie(Item).Genres[0].Name;
  end else begin
    lblGenre.Caption:= '';
  end;

  if ITMDBMovie(Item).VoteAverage > 0 then begin
    lblVoteAvg.Caption:= 'Votes: '+ FormatFloat('0%', (ITMDBMovie(Item).VoteAverage * 10));
  end else begin
    lblVoteAvg.Caption:= '';
  end;

end;

end.
