unit uTMDBSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTMDBContentBase, JD.Common, JD.Ctrls, JD.Ctrls.FontButton,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ComCtrls,
  JD.TMDB.Common,
  JD.TMDB.Intf,
  uTMDBListItem,
  uTMDBMovieListItem,
  uTMDBSearchListItem, uListItemBase, uComboListItem;

type


  TTMDBSearchMode = (smMovies, smCollections, smTelevision, smPeople, smKeywords,
    smCompanies);

  TfrmTMDBSearch = class(TfrmTMDBContentBase)
    pTop: TPanel;
    JDFontButton25: TJDFontButton;
    sbItems: TScrollBox;
    cboSearchMode: TComboBoxEx;
    txtSearchQuery: TButtonedEdit;
    btnLoadMore: TJDFontButton;
    btnMenu: TJDFontButton;
    pSearchOptions: TPanel;
    ComboListItem1: TComboListItem;
    ComboListItem2: TComboListItem;
    ComboListItem3: TComboListItem;
    procedure txtSearchQueryInvokeSearch(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLoadMoreClick(Sender: TObject);
    procedure sbItemsMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure sbItemsMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
  private
    FLastPage: ITMDBPage;
    function AddItem(AItem: ITMDBItem): TfrmTMDBSearchListItem;
    procedure SetSearchMode(const Value: TTMDBSearchMode);
    function GetSearchMode: TTMDBSearchMode;
  public
    procedure ClearItems;
    procedure LoadPage(APage: ITMDBPage; const AClearItems: Boolean = True);

    property SearchMode: TTMDBSearchMode read GetSearchMode write SetSearchMode;
  end;

var
  frmTMDBSearch: TfrmTMDBSearch;

implementation

{$R *.dfm}


type
  TScrollBox = class(Vcl.Forms.TScrollBox)
  protected
    procedure WndProc(var Message: TMessage); override;
  end;

procedure TScrollBox.WndProc(var Message: TMessage);
begin
  inherited WndProc(Message);

  case Message.Msg of
    WM_VSCROLL, WM_HSCROLL:
      begin
        // Scroll detected!
        // You can respond here, e.g., log, update UI, etc.
        OutputDebugString('ScrollBox scrolled');
      end;
  end;
end;


function TfrmTMDBSearch.AddItem(AItem: ITMDBItem): TfrmTMDBSearchListItem;
begin
  case SearchMode of
    smMovies: begin
      //Result:= TfrmTMDBMovieListItem.Create(sbItems);
      //Result.LoadItem(ITMDBMovie(AItem));
      Result:= TfrmTMDBSearchListItem.Create(sbItems); //TODO
      Result.LoadItem(AItem);
      //Result.LoadMovie(ITMDBMovie(AItem));
    end;
    smCollections: begin
      Result:= TfrmTMDBSearchListItem.Create(sbItems); //TODO
      Result.LoadItem(AItem);
    end;
    smTelevision: begin
      Result:= TfrmTMDBSearchListItem.Create(sbItems); //TODO
      Result.LoadItem(AItem);
    end;
    smPeople: begin
      Result:= TfrmTMDBSearchListItem.Create(sbItems); //TODO
      Result.LoadItem(AItem);
    end;
    smKeywords: begin
      Result:= TfrmTMDBSearchListItem.Create(sbItems); //TODO
      Result.LoadItem(AItem);
    end;
    smCompanies: begin
      Result:= TfrmTMDBSearchListItem.Create(sbItems); //TODO
      Result.LoadItem(AItem);
      //Result.LoadCompany(ITMDBCompany(AItem));
    end;
  end;
  Result.Name:= 'ListItem'+IntToStr(sbItems.ControlCount-1);
  Result.Parent:= sbItems;
  Result.Align:= alTop;
  Result.Top:= 50000;

end;

procedure TfrmTMDBSearch.btnLoadMoreClick(Sender: TObject);
var
  Page: ITMDBPage;
begin
  inherited;

  var Qry:= txtSearchQuery.Text;

  Screen.Cursor:= crHourglass;
  try
    case SearchMode of
      smMovies:       Page:= TMDB.Search.SearchMovies(Qry, bDefault, '', '', '', '', FLastPage.Page+1);
      smCollections:  Page:= TMDB.Search.SearchCollections(Qry, bDefault, '', '', FLastPage.Page+1);
      smTelevision:   Page:= TMDB.Search.SearchTV(Qry);
      smPeople:       Page:= TMDB.Search.SearchPeople(Qry);
      smKeywords:     Page:= TMDB.Search.SearchKeywords(Qry);
      smCompanies:    Page:= TMDB.Search.SearchCompanies(Qry);
    end;
    LoadPage(Page, False);
  finally
    Screen.Cursor:= crDefault;
  end;

end;

procedure TfrmTMDBSearch.ClearItems;
begin
  for var X := Self.sbItems.ControlCount-1 downto 0 do begin
    var C:= sbItems.Controls[X];
    if (C is TfrmTMDBListItem) then begin
      C.Free;
    end;
  end;
  btnLoadMore.Visible:= False;
  FLastPage:= nil;
end;

procedure TfrmTMDBSearch.FormCreate(Sender: TObject);
begin
  inherited;
  cboSearchMode.ItemIndex:= 0;

end;

procedure TfrmTMDBSearch.LoadPage(APage: ITMDBPage; const AClearItems: Boolean = True);
var
  I: ITMDBItem;
  F: TfrmTMDBListItem;
begin
  sbItems.DisableAlign;
  try
    if AClearItems then begin
      ClearItems;
    end;
    for var X := 0 to APage.Items.Count-1 do begin
      I:= APage.Items[X];
      F:= Self.AddItem(I);
    end;

  finally
    sbItems.EnableAlign;
  end;

  if APage.Page < APage.TotalPages then begin
    btnLoadMore.Visible:= True;
    btnLoadMore.Top:= 1000000;
  end else begin
    btnLoadMore.Visible:= False;
  end;

  FLastPage:= APage;
end;

procedure TfrmTMDBSearch.sbItemsMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
begin
  inherited;

  sbItems.VertScrollBar.Position:= sbItems.VertScrollBar.Position + 20;
end;

procedure TfrmTMDBSearch.sbItemsMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
begin
  inherited;

  sbItems.VertScrollBar.Position:= sbItems.VertScrollBar.Position - 20;
end;

function TfrmTMDBSearch.GetSearchMode: TTMDBSearchMode;
begin
  Result:= TTMDBSearchMode(cboSearchMode.ItemIndex);
end;

procedure TfrmTMDBSearch.SetSearchMode(const Value: TTMDBSearchMode);
begin
  cboSearchMode.ItemIndex:= Integer(Value);
  //TODO: Refresh...
end;

procedure TfrmTMDBSearch.txtSearchQueryInvokeSearch(Sender: TObject);
var
  Page: ITMDBPage;
begin
  inherited;
  var Qry:= txtSearchQuery.Text;

  Screen.Cursor:= crHourglass;
  try
    case SearchMode of
      smMovies:       Page:= TMDB.Search.SearchMovies(Qry);
      smCollections:  Page:= TMDB.Search.SearchCollections(Qry);
      smTelevision:   Page:= TMDB.Search.SearchTV(Qry);
      smPeople:       Page:= TMDB.Search.SearchPeople(Qry);
      smKeywords:     Page:= TMDB.Search.SearchKeywords(Qry);
      smCompanies:    Page:= TMDB.Search.SearchCompanies(Qry);
    end;

    LoadPage(Page);
  finally
    Screen.Cursor:= crDefault;
  end;
end;

end.
