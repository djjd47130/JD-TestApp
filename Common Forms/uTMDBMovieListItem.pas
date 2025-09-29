unit uTMDBMovieListItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTMDBListItem, JD.Common, JD.Ctrls, JD.Ctrls.FontButton, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  uTMDB,
  JD.TMDB.Intf, Vcl.Imaging.GIFImg, Vcl.Imaging.pngimage;

type
  TfrmTMDBMovieListItem = class(TfrmTMDBListItem)
    lblOverview: TLabel;
    pSubData: TPanel;
    lblGenre: TLabel;
    lblReleaseDate: TLabel;
    lblVoteAvg: TLabel;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure LoadItem(const Item: ITMDBItem); override;
  end;

var
  frmTMDBMovieListItem: TfrmTMDBMovieListItem;


implementation

{$R *.dfm}

{ TfrmCommonListItem1 }

constructor TfrmTMDBMovieListItem.Create(AOwner: TComponent);
begin
  inherited;

  if imgPicture.Picture.Graphic <> nil then begin
    if imgPicture.Picture.Graphic is TGIFImage then begin
      TGIFImage(imgPicture.Picture.Graphic).Animate:= True;
    end;
  end;

end;

destructor TfrmTMDBMovieListItem.Destroy;
begin

  inherited;
end;

procedure TfrmTMDBMovieListItem.LoadItem(const Item: ITMDBItem);
begin
  inherited;

  Self.DisableAlign;
  try

    lblOverview.Caption:= ITMDBMovie(Item).Overview;
    Self.lblCaption.Hint:= Item.GetText;
    imgPicture.Hint:= Item.GetText;

    //Release Date
    if ITMDBMovie(Item).ReleaseDate > 0 then begin
      lblReleaseDate.Caption:= FormatDateTime('mmm dd, yyyy', ITMDBMovie(Item).ReleaseDate);
    end else begin
      lblReleaseDate.Caption:= '(No Release Date)';
    end;

    //Genre(s)
    if ITMDBMovie(Item).Genres.Count > 0 then begin
      //lblGenre.Caption:= ITMDBMovie(Item).Genres[0].Name;

      var Tmp: String;
      for var X := 0 to ITMDBMovie(Item).Genres.Count-1 do begin
        var G:= ITMDBMovie(Item).Genres[X];
        if X > 0 then
          Tmp:= Tmp + ', ';
        Tmp:= Tmp + G.GetText;
        if X >= 2 then
          Break;
      end;
      lblGenre.Caption:= Tmp;
    end else begin
      lblGenre.Caption:= '';
    end;

    //Votes
    if ITMDBMovie(Item).VoteAverage > 0 then begin
      var Num:= (ITMDBMovie(Item).VoteAverage * 10); //Integer percentage
      lblVoteAvg.Caption:= FormatFloat('0%', Num);

      if (Num <= 25) then begin
        lblVoteAvg.Font.Color:= clRed;
      end else
      if (Num <= 50) then begin
        lblVoteAvg.Font.Color:= clYellow;
      end else
      if (Num <= 75) then begin
        lblVoteAvg.Font.Color:= clBlue;
      end else begin
        lblVoteAvg.Font.Color:= clGreen;
      end;

    end else begin
      lblVoteAvg.Caption:= '';
    end;

  finally
    Self.EnableAlign;
  end;

  //Image
  if ITMDBMovie(Item).PosterPath <> '' then
    TMDBDownloadImageAsync(ITMDBMovie(Item).PosterPath, imgPicture, 'w154',
      procedure
      begin
        //TODO: Change parent panel's background color accordingly...
        pImage.Color:= clBlack;
      end);

end;


end.
