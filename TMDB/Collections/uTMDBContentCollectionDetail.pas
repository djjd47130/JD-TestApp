unit uTMDBContentCollectionDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTMDBContentBase, Vcl.ComCtrls, Vcl.StdCtrls,
  JD.TMDB.Intf,
  JD.TabController,
  uTMDBListItem,
  uTMDBMovieListItem,
  uTMDB,
  uCommonImages,
  uContentMovieDetail;

type
  TfrmTMDBContentCollectionDetail = class(TfrmTMDBContentBase)
    Pages: TPageControl;
    tabDetails: TTabSheet;
    lblTitle: TLabel;
    txtOverview: TMemo;
    tabParts: TTabSheet;
    tabImages: TTabSheet;
    tabTranslations: TTabSheet;
    sbItems: TScrollBox;
    procedure lstResultsClick(Sender: TObject);
    procedure PagesChange(Sender: TObject);
  private
    FDetail: ITMDBCollectionDetail;
    FImages: ITMDBMediaImageGroup;
    //FTranslations: ITMDBTranslations;
    FDetailImages: TfrmCommonImages;
    //function GetCollectionDetail(const ID: Integer): ITMDBCollectionDetail;
    procedure LoadDetails;
    procedure LoadImages;
    procedure LoadParts;
    procedure LoadTranslations;
    //procedure ShowDetail(const Index: Integer; Item: TfrmTMDBListItem; Obj: ITMDBItem);
    function AddListItem(AItem: ITMDBItem): TfrmTMDBListItem;
  public
    procedure DisplayCollectionDetail(const Value: ITMDBCollectionDetail);
    procedure LoadCollection(const ACollectionID: Integer);
  end;

var
  frmTMDBContentCollectionDetail: TfrmTMDBContentCollectionDetail;

implementation

{$R *.dfm}

{
function TfrmTMDBContentCollectionDetail.GetCollectionDetail(const ID: Integer): ITMDBCollectionDetail;
begin
  PrepAPI;
  Result:= TMDB.Client.Collections.GetDetails(ID, TMDBSetup.Language);
end;
}

{
procedure TfrmTMDBContentCollectionDetail.ShowDetail(const Index: Integer;
  Item: TfrmTMDBListItem; Obj: ITMDBItem);
var
  ID: Integer;
  O: ITMDBCollection;
begin
  Screen.Cursor:= crHourglass;
  try
    FDetail:= nil;
    PrepAPI;
    O:= (Obj) as ITMDBCollection;
    ID:= O.ID;
    FDetail:= GetCollectionDetail(ID);
  finally
    Screen.Cursor:= crDefault;
  end;
  DisplayCollectionDetail(FDetail);
  inherited;
end;
}

procedure TfrmTMDBContentCollectionDetail.DisplayCollectionDetail(const Value: ITMDBCollectionDetail);
begin
  //Refresh detail of selected tab...
  FDetail:= Value;
  Screen.Cursor:= crHourglass;
  try
    case Pages.ActivePageIndex of
      0: LoadDetails;
      1: LoadParts;
      2: LoadImages;
      3: LoadTranslations;
    end;
  finally
    Screen.Cursor:= crDefault;
  end;
  Self.TabCaption:= FDetail.Name+' - Collection Detail';
end;

procedure TfrmTMDBContentCollectionDetail.LoadCollection(const ACollectionID: Integer);
begin
  //TODO
  var D:= TMDB.Collections.GetDetails(ACollectionID, TMDBSetup.Language);
  DisplayCollectionDetail(D);
end;

procedure TfrmTMDBContentCollectionDetail.LoadDetails;
begin
  lblTitle.Caption:= FDetail.Name;
  txtOverview.Lines.Text:= FDetail.Overview;

end;

procedure TfrmTMDBContentCollectionDetail.LoadImages;
begin
  FImages:= FDetail.GetImages(TMDBSetup.Language);
  FDetailImages.LoadImages(FImages);
end;

function TfrmTMDBContentCollectionDetail.AddListItem(AItem: ITMDBItem): TfrmTMDBListItem;
begin
  //var H:= GetTotalItemsHeight;
  var P:= TfrmTMDBMovieListItem.Create(sbItems);
  P.Name:= 'pItem'+IntToStr(AItem.Index);
  P.Tag:= AItem.ID;
  P.btnDetail.Tag:= AItem.ID;
  P.lblCaption.Tag:= AItem.ID;
  P.btnDetail.Tag:= AItem.Index;
  P.Parent:= sbItems;
  P.Align:= alTop;
  P.Top:= 1000000; // H + 1;
  P.LoadItem(AItem);
  P.btnDetail.OnClick:= lstResultsClick;
  P.lblCaption.OnClick:= lstResultsClick;
  Result:= P;

  P.Show;
  //P.BringToFront;
  //Application.ProcessMessages;

  //ChangeTitle;
end;

procedure TfrmTMDBContentCollectionDetail.LoadParts;
var
  X: Integer;
  //I: TListItem;
  O: ITMDBMovie;
begin

  sbItems.DisableAlign;
  try
    while sbItems.ControlCount > 0 do begin
      sbItems.Controls[0].Free;
    end;

    for X := 0 to FDetail.Parts.Count-1 do begin
      O:= FDetail.Parts[X];
      AddListItem(O);

    end;

  finally
    sbItems.EnableAlign;
  end;

  {
  lstParts.Items.BeginUpdate;
  try
    lstParts.Items.Clear;
    for X := 0 to FDetail.Parts.Count-1 do begin
      O:= FDetail.Parts[X];
      I:= lstParts.Items.Add;
      I.Caption:= O.Title;
      I.SubItems.Add(FormatFloat('0.0', O.Popularity));
      I.SubItems.Add(TMDBMediaTypeToStr(O.MediaType));
      if O.Genres.Count > 0 then
        I.SubItems.Add(O.Genres.Items[0].Name)
      else
        I.SubItems.Add('');
      if O.ReleaseDate > 0 then
        I.SubItems.Add(FormatDateTime('yyyy-mm-dd', O.ReleaseDate))
      else
        I.SubItems.Add('');
      I.SubItems.Add(O.Overview);
    end;
  finally
    lstParts.Items.EndUpdate;
  end;
  }
end;

procedure TfrmTMDBContentCollectionDetail.LoadTranslations;
begin
  //TODO

end;

procedure TfrmTMDBContentCollectionDetail.lstResultsClick(Sender: TObject);
begin
  //var MovieID:= (Sender as TControl).Tag;
  //var T:= TabController.CreateTab(TfrmContentMovieDetail, -1,  0); //TODO
  //TfrmContentMovieDetail(T.Content).LoadMovie(MovieID);
end;

procedure TfrmTMDBContentCollectionDetail.PagesChange(Sender: TObject);
begin
  inherited;
  DisplayCollectionDetail(FDetail);
end;

end.
