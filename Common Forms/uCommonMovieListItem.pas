unit uCommonMovieListItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCommonListItem, JD.Common, JD.Ctrls, JD.Ctrls.FontButton, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  uTMDB,
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
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure LoadItem(const Item: ITMDBItem); override;
  end;

var
  frmCommonMovieListItem: TfrmCommonMovieListItem;


implementation

{$R *.dfm}

{ TfrmCommonListItem1 }

constructor TfrmCommonMovieListItem.Create(AOwner: TComponent);
begin
  inherited;

  if imgPicture.Picture.Graphic <> nil then begin
    if imgPicture.Picture.Graphic is TGIFImage then begin
      //TGIFImage(imgPicture.Picture.Graphic).AnimationSpeed:= 50;
      TGIFImage(imgPicture.Picture.Graphic).Animate:= True;
    end;
  end;

end;

destructor TfrmCommonMovieListItem.Destroy;
begin

  inherited;
end;

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


  //Image
  if ITMDBMovie(Item).PosterPath <> '' then
    TMDBDownloadImageAsync(ITMDBMovie(Item).PosterPath, imgPicture, 'w154',
      procedure
      begin
        pImage.Color:= clBlack;
      end);

end;


end.
