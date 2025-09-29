unit uContentTVPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uContentPageBase, JD.Common, JD.Ctrls, JD.Ctrls.FontButton, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls,
  JD.TMDB.Intf,
  JD.TabController,
  uContentTVSerieDetail,
  uTMDBListItem;

type
  TTVPageProc = reference to procedure(Sender: TObject;
    const Page: Integer; var Data: ITMDBTVSeriesPage);

  TfrmContentTVPage = class(TfrmContentPageBase)
    procedure btnRefreshClick(Sender: TObject);
  private
    FBaseName: String;
    FOnGetPage: TTVPageProc;
    procedure SetBaseName(const Value: String);
  protected
    function Page: ITMDBPage; override;
    //procedure SetupCols; override;
    procedure PrepSearch; override;
    function GetData(const APageNum: Integer): ITMDBPage; override;
    function GetItem(const Index: Integer): ITMDBItem; override;
    procedure HideDetail; override;
    //procedure PopulateItem(const Index: Integer; Item: TListItem; Obj: ITMDBItem); override;
    procedure ShowDetail(const Index: Integer; Item: TfrmTMDBListItem; Obj: ITMDBItem); override;
    procedure ItemClick(const Index: Integer; Item: TfrmTMDBListItem; Obj: ITMDBItem); override;


    procedure DoOnGetPage(const Page: Integer; var Data: ITMDBTVSeriesPage); virtual;
  public
    property BaseName: String read FBaseName write SetBaseName;

    property OnGetPage: TTVPageProc read FOnGetPage write FOnGetPage;
  end;

var
  frmContentTVPage: TfrmContentTVPage;

implementation

{$R *.dfm}

{ TfrmContentTVPage }

procedure TfrmContentTVPage.btnRefreshClick(Sender: TObject);
begin
  inherited;
  Self.RefreshData;
end;

procedure TfrmContentTVPage.DoOnGetPage(const Page: Integer; var Data: ITMDBTVSeriesPage);
begin
  if Assigned(FOnGetPage) then
    FOnGetPage(Self, Page, Data);
end;

function TfrmContentTVPage.GetData(const APageNum: Integer): ITMDBPage;
var
  P: ITMDBTVSeriesPage;
begin
  inherited;
  DoOnGetPage(APageNum, P);
  Result:= P;
  TabCaption:= Self.BaseName;
end;

function TfrmContentTVPage.GetItem(const Index: Integer): ITMDBItem;
var
  P: ITMDBTVSeriesPage;
begin
  P:= ITMDBTVSeriesPage(Page);
  Result:= P.Items.GetItem(Index);
end;

procedure TfrmContentTVPage.HideDetail;
begin
  inherited;
  pDetail.Visible:= False;
end;

procedure TfrmContentTVPage.ItemClick(const Index: Integer; Item: TfrmTMDBListItem; Obj: ITMDBItem);
var
  T: TJDTabRef;
  M: ITMDBTVSerie;
begin
  inherited;
  M:= Obj as ITMDBTVSerie;
  T:= TabController.CreateTab(TfrmContentTVSerieDetail);
  (T.Content as TfrmContentTVSerieDetail).LoadSeries(M.ID);
end;

function TfrmContentTVPage.Page: ITMDBPage;
begin
  Result:= ITMDBTVSeriesPage(inherited Page);
end;

{
procedure TfrmContentTVPage.PopulateItem(const Index: Integer; Item: TListItem; Obj: ITMDBItem);
var
  O: ITMDBTVSerie;
begin
  inherited;
  O:= Obj as ITMDBTVSerie;
  Item.Caption:= O.Title;
  Item.SubItems.Add(FormatFloat('0.000', O.Popularity));
  if O.Genres.Count > 0 then
    Item.SubItems.Add(O.Genres[0].Name)
  else
    Item.SubItems.Add('(Unknown)');
  if O.FirstAirDate <> 0 then
    Item.SubItems.Add(FormatDateTime('yyyy-mm-dd', O.FirstAirDate))
  else
    Item.SubItems.Add('');
  Item.SubItems.Add(O.Overview);
end;
}

procedure TfrmContentTVPage.PrepSearch;
begin
  inherited;

end;

procedure TfrmContentTVPage.SetBaseName(const Value: String);
begin
  FBaseName := Value;
end;

{
procedure TfrmContentTVPage.SetupCols;
begin
  inherited;
  AddCol('Title', 400);
  AddCol('Popularity', 100);
  AddCol('Genre', 150);
  AddCol('First Aired', 160);
  AddCol('Description', 700);
end;
}

procedure TfrmContentTVPage.ShowDetail(const Index: Integer; Item: TfrmTMDBListItem; Obj: ITMDBItem);
begin
  inherited;
  pDetail.Visible:= False;
end;

end.
