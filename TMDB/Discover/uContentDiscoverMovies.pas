unit uContentDiscoverMovies;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls, Vcl.WinXPanels,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.CheckLst,
  System.ImageList, Vcl.ImgList,

  JD.Common, JD.Ctrls, JD.Ctrls.FontButton, JD.FontGlyphs,
  JD.Ctrls.ChipList, JD.Ctrls.ListBox,

  JD.TMDB.Intf,
  JD.TMDB.Common,

  VirtualTrees.BaseAncestorVCL, VirtualTrees.BaseTree, VirtualTrees.AncestorVCL,
  VirtualTrees,

  uTMDB,
  uTMDBSetup,
  uContentPageBase,
  //uCommonChipList,
  uContentMoviePage;


type
  PTMDBDualCheckNode = ^TTMDBDualCheckNode;
  TTMDBDualCheckNode = record
    Intf: IInterface;
    WithChecked: Boolean;
    WithoutChecked: Boolean;
  end;



type
  TComboBox = class(Vcl.StdCtrls.TComboBox)
  private
    FStoredItems: TStringList;
    procedure FilterItems;
    procedure StoredItemsChange(Sender: TObject);
    procedure SetStoredItems(const Value: TStringList);
    procedure CNCommand(var AMessage: TWMCommand); message CN_COMMAND;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property StoredItems: TStringList read FStoredItems write SetStoredItems;
  end;


type
  TInterfaceWrapper = class
  private
    FIntf: IInterface;
  public
    constructor Create(AIntf: IInterface);
    property Intf: IInterface read FIntf;
  end;


type
  TfrmContentDiscoverMovies = class(TfrmContentMoviePage)
    Img16: TImageList;
    Glyphs: TJDFontGlyphs;
    CategoryPanelGroup1: TCategoryPanelGroup;
    cpRelease: TCategoryPanel;
    Panel13: TPanel;
    Label14: TLabel;
    txtSearchMoviesPrimaryReleaseYear: TEdit;
    Panel14: TPanel;
    Label15: TLabel;
    txtSearchMoviesYear: TEdit;
    cpRegion: TCategoryPanel;
    Panel10: TPanel;
    Label11: TLabel;
    cboSearchMoviesRegion: TComboBox;
    cpCerts: TCategoryPanel;
    Label1: TLabel;
    cboCertCountry: TComboBox;
    lstCerts: TCheckListBox;
    Panel8: TPanel;
    Label9: TLabel;
    cboSearchMoviesAdult: TComboBox;
    CategoryPanel1: TCategoryPanel;
    CategoryPanel2: TCategoryPanel;
    Panel1: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Label3: TLabel;
    Edit2: TEdit;
    CategoryPanel3: TCategoryPanel;
    Panel3: TPanel;
    Label4: TLabel;
    Edit3: TEdit;
    Panel4: TPanel;
    Label5: TLabel;
    Edit4: TEdit;
    CategoryPanel4: TCategoryPanel;
    CategoryPanel6: TCategoryPanel;
    Panel11: TPanel;
    Label12: TLabel;
    CategoryPanel5: TCategoryPanel;
    Panel7: TPanel;
    Label8: TLabel;
    Edit7: TEdit;
    Panel9: TPanel;
    Label10: TLabel;
    Edit8: TEdit;
    CategoryPanel7: TCategoryPanel;
    Panel15: TPanel;
    Label16: TLabel;
    Edit11: TEdit;
    Panel16: TPanel;
    Label17: TLabel;
    Edit12: TEdit;
    JDChipList1: TJDChipList;
    Splitter2: TSplitter;
    Panel5: TPanel;
    Label6: TLabel;
    txtSearchKeyword: TSearchBox;
    clGenres: TJDChipList;
    Label7: TLabel;
    cboSearchGenres: TComboBox;
    CategoryPanel8: TCategoryPanel;
    Panel6: TPanel;
    Label13: TLabel;
    cboSort: TComboBox;
    procedure cboCertCountryClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lstCertsClickCheck(Sender: TObject);
    procedure cboSearchMoviesAdultClick(Sender: TObject);
    procedure cboSearchMoviesRegionClick(Sender: TObject);
    procedure cboSearchMoviesRegionChange(Sender: TObject);
    procedure cboSearchMoviesRegionCloseUp(Sender: TObject);
    procedure JDChipList1Resize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtSearchKeywordInvokeSearch(Sender: TObject);
    procedure cboSearchGenresKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnApplyClick(Sender: TObject);
    procedure btnPagePrevClick(Sender: TObject);
    procedure btnPageNextClick(Sender: TObject);
  private
    FPrepped: Boolean;
    function GetCertString: String;
    procedure ClearCertCountries;
    procedure UpdateImageIndices;
    procedure ChangeTitle;
  public
    function Page: ITMDBPage; override;
    //procedure SetupCols; override;
    procedure PrepSearch; override;
    function GetData(const APageNum: Integer): ITMDBPage; override;
    function GetItem(const Index: Integer): ITMDBItem; override;
    //procedure PopulateItem(const Index: Integer; Item: TListItem; Obj: ITMDBItem); override;
  end;

var
  frmContentDiscoverMovies: TfrmContentDiscoverMovies;

implementation

{$R *.dfm}

uses
  System.StrUtils,
  uAppWindow;

function ChipExtractWithIDsStr(AChipList: TJDChipList): String;
  procedure A(const ID: Integer);
  begin
    if Result <> '' then
      Result:= Result + ','; //AND
    Result:= Result + IntToStr(ID);
  end;
begin
  Result:= '';
  for var X := 0 to AChipList.Items.Count-1 do begin
    var Itm:= AChipList.Items[X];
    if not Itm.Exclude then begin
      A(Itm.Tag);
    end;
  end;
end;

function ChipExtractWithoutIDsStr(AChipList: TJDChipList): String;
  procedure A(const ID: Integer);
  begin
    if Result <> '' then
      Result:= Result + ','; //AND
    Result:= Result + IntToStr(ID);
  end;
begin
  Result:= '';
  for var X := 0 to AChipList.Items.Count-1 do begin
    var Itm:= AChipList.Items[X];
    if Itm.Exclude then begin
      A(Itm.Tag);
    end;
  end;
end;

{ TInterfaceWrapper }

constructor TInterfaceWrapper.Create(AIntf: IInterface);
begin
  inherited Create;
  FIntf := AIntf;
end;

{ TfrmContentDiscoverMovies }

procedure TfrmContentDiscoverMovies.FormCreate(Sender: TObject);
begin
  inherited;
  FPrepped:= False;
  CategoryPanelGroup1.CollapseAll;
  clGenres.Align:= alClient;

  //frmGenres.LoadList(TMDB.Cache.TVGenres);

end;

procedure TfrmContentDiscoverMovies.FormDestroy(Sender: TObject);
begin
  inherited;
  ClearCertCountries;
end;

procedure TfrmContentDiscoverMovies.FormShow(Sender: TObject);
begin
  inherited;
  if ResultCount = 0 then
    Self.btnApply.Click;
  ChangeTitle;
end;

function TfrmContentDiscoverMovies.GetData(const APageNum: Integer): ITMDBPage;
begin
  inherited;
  var Params:= TMDB.Discover.NewMovieParams;

  if cboCertCountry.ItemIndex > 0 then begin
    Params.CertificationCountry:= cboCertCountry.Text;
    Params.Certification:= GetCertString;
  end;
  Params.IncludeAdult:= TTMDBBoolean(cboSearchMoviesAdult.ItemIndex);
  Params.Language:= TMDBSetup.Language;
  Params.Region:= cboSearchMoviesRegion.Text;
  Params.PrimaryReleaseYear:= StrToIntDef(txtSearchMoviesPrimaryReleaseYear.Text, 0);
  Params.Year:= StrToIntDef(txtSearchMoviesYear.Text, 0);

  Params.WithGenres:= ChipExtractWithIDsStr(clGenres); // ''; //TODO
  Params.WithoutGenres:= ChipExtractWithoutIDsStr(clGenres); // ''; //TODO

  //TODO

  Params.SortBy:= cboSort.Text;





  Result:= TMDB.Discover.DiscoverMovies(Params, APageNum);

  ChangeTitle;

end;

procedure TfrmContentDiscoverMovies.ChangeTitle;
begin

  var Tmp:= 'Discover Movies';
  if Self.Page <> nil then begin
    if Self.ResultCount > 0 then begin
      Tmp:= Tmp + ' - ';
      for var X := 0 to Self.ResultCount-1 do begin
        if (X > 0) then
          Tmp:= Tmp + ', ';
        Tmp:= Tmp + Self.Page.Items[X].GetText;
        if X >= 2 then
          Break;
      end;
    end;
  end;
  TabCaption:= Tmp;

end;

function TfrmContentDiscoverMovies.GetItem(const Index: Integer): ITMDBItem;
var
  P: ITMDBMoviePage;
begin
  P:= ITMDBMoviePage(Page);
  Result:= P.Items.GetItem(Index);
end;

procedure TfrmContentDiscoverMovies.JDChipList1Resize(Sender: TObject);
begin
  inherited;
  //TODO: Resize parent accordingly...
  var P:= JDChipList1.Parent as TCustomControl;
  if P is TCategoryPanel then begin
    TCategoryPanel(P).Height:= JDChipList1.Top + JDChipList1.Height + 2;
  end else
    P.Height:= JDChipList1.Top + JDChipList1.Height + 2;
end;

procedure TfrmContentDiscoverMovies.lstCertsClickCheck(Sender: TObject);
begin
  inherited;
  Self.UpdateImageIndices;

end;

function TfrmContentDiscoverMovies.Page: ITMDBPage;
begin
  Result:= ITMDBMoviePage(inherited Page);
end;

{
procedure TfrmContentDiscoverMovies.PopulateItem(const Index: Integer;
  Item: TListItem; Obj: ITMDBItem);
var
  O: ITMDBMovie;
begin
  inherited;
  O:= Obj as ITMDBMovie;
  Item.Caption:= O.Title;
  Item.SubItems.Add(FormatFloat('0.000', O.Popularity));
  if O.Genres.Count > 0 then
    Item.SubItems.Add(O.Genres[0].Name)
  else
    Item.SubItems.Add('(Unknown)');
  if O.ReleaseDate <> 0 then
    Item.SubItems.Add(FormatDateTime('yyyy-mm-dd', O.ReleaseDate))
  else
    Item.SubItems.Add('');
  Item.SubItems.Add(O.Overview);
end;
}

procedure TfrmContentDiscoverMovies.cboSearchGenresKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if (Key = VK_RETURN) then begin
    var S:= cboSearchGenres.Text;
    var Idx:= cboSearchGenres.Items.IndexOf(S);

    if Idx >= 0 then begin
      var GID:= Integer(cboSearchGenres.Items.Objects[Idx]);
      cboSearchGenres.Text:= '';
      var I:= clGenres.Items.Add;
      I.Caption:= S;
      I.Tag:= GID;
    end else begin
      //Not a valid selection
    end;

    Key:= 0;

  end;

end;

procedure TfrmContentDiscoverMovies.cboSearchMoviesAdultClick(Sender: TObject);
begin
  inherited;

  UpdateImageIndices;
end;

procedure TfrmContentDiscoverMovies.cboSearchMoviesRegionChange(
  Sender: TObject);
begin
  inherited;

  UpdateImageIndices;
end;

procedure TfrmContentDiscoverMovies.cboSearchMoviesRegionClick(Sender: TObject);
begin
  inherited;

  UpdateImageIndices;
end;

procedure TfrmContentDiscoverMovies.cboSearchMoviesRegionCloseUp(
  Sender: TObject);
begin
  inherited;

  UpdateImageIndices;
end;

procedure TfrmContentDiscoverMovies.ClearCertCountries;
begin
  for var X := 1 to cboCertCountry.Items.Count-1 do begin
    TInterfaceWrapper(cboCertCountry.Items.Objects[X]).Free;
  end;
end;

procedure TfrmContentDiscoverMovies.PrepSearch;
begin
  inherited;

  if not FPrepped then begin

    //Region
    TMDB.ListCountries(cboSearchMoviesRegion.Items);
    cboSearchMoviesRegion.ItemIndex:= cboSearchMoviesRegion.Items.IndexOf(TMDBSetup.Country);

    //Certifications
    lstCerts.Align:= alClient;
    cboCertCountry.Items.Clear;
    var Certs:= TMDB.Certifications.GetMovieCertifications;
    var Lst:= TStringList.Create;
    try
      for var X := 0 to Certs.Count-1 do begin
        var C:= Certs.Items[X];
        var O:= TInterfaceWrapper.Create(C);
        Lst.AddObject(C.CountryCode, O);
      end;
      Lst.Sort;
      cboCertCountry.Items.Assign(Lst);
    finally
      Lst.Free;
    end;
    cboCertCountry.ItemIndex:= cboCertCountry.Items.IndexOf(TMDBSetup.Country);
    cboCertCountryClick(nil);

    //Genres
    cboSearchGenres.StoredItems.BeginUpdate;
    try
      cboSearchGenres.StoredItems.Clear;
      TMDB.ListMovieGenres(cboSearchGenres.StoredItems);
    finally
      cboSearchGenres.StoredItems.EndUpdate;
    end;


    //TODO.............................................................

    FPrepped:= True;
  end;
end;

function CheckListBoxHasChecks(ACheckListBox: TCheckListBox): Boolean;
begin
  Result:= False;
  for var X := 0 to ACheckListBox.Items.Count-1 do begin
    if ACheckListBox.Checked[X] then begin
      Result:= True;
      Break;
    end;
  end;
end;

procedure SetCategoryPanelImageIndices(APanel: TCategoryPanel; const AUsed: Boolean);
begin
  if AUsed then begin
    APanel.CollapsedImageIndex:= 2;
    APanel.ExpandedImageIndex:= 3;
  end else begin
    APanel.CollapsedImageIndex:= 0;
    APanel.ExpandedImageIndex:= 1;
  end;

  //TODO: This is a very sloppy solution to images not refreshing when changed.
  //  The REAL solution is to replace it with something custom and robust...
  //APanel.Visible:= False;
  //APanel.Visible:= True;
end;

procedure TfrmContentDiscoverMovies.UpdateImageIndices;
begin

  SetCategoryPanelImageIndices(cpCerts, CheckListBoxHasChecks(lstCerts) or (cboSearchMoviesAdult.ItemIndex > 0));
  SetCategoryPanelImageIndices(cpRegion, (cboSearchMoviesRegion.ItemIndex >= 0));

end;

procedure TfrmContentDiscoverMovies.btnApplyClick(Sender: TObject);
begin
  inherited;

  ChangeTitle;
end;

procedure TfrmContentDiscoverMovies.btnPageNextClick(Sender: TObject);
begin
  inherited;

  ChangeTitle;
end;

procedure TfrmContentDiscoverMovies.btnPagePrevClick(Sender: TObject);
begin
  inherited;

  ChangeTitle;
end;

procedure TfrmContentDiscoverMovies.cboCertCountryClick(Sender: TObject);
var
  O: TInterfaceWrapper;
  C: ITMDBCertificationCountry;
begin
  inherited;
  lstCerts.Items.Clear;
  if cboCertCountry.ItemIndex > 0 then begin
    O:= TInterfaceWrapper(cboCertCountry.Items.Objects[cboCertCountry.ItemIndex]);
    C:= ITMDBCertificationCountry(O.Intf);
    for var X := 0 to C.Count-1 do begin
      lstCerts.Items.Add(C.Items[X].Certification);
    end;
  end;
  UpdateImageIndices;
end;

function TfrmContentDiscoverMovies.GetCertString: String;
begin
  Result:= '';
  for var X := 0 to lstCerts.Items.Count-1 do begin
    if lstCerts.Checked[X] then begin
      if Result <> '' then
        Result:= Result + '|';
      Result:= Result + lstCerts.Items[X];
    end;
  end;
end;

procedure TfrmContentDiscoverMovies.txtSearchKeywordInvokeSearch(Sender: TObject);
begin
  inherited;

  var S:= txtSearchKeyword.Text;
  txtSearchKeyword.Text:= '';
  var I:= JDChipList1.Items.Add;
  I.Caption:= S;
end;

{
procedure TfrmContentDiscoverMovies.SetupCols;
begin
  inherited;
  AddCol('Movie', 400);
  AddCol('Popularity', 100);
  AddCol('Genre', 150);
  AddCol('Released', 160);
  AddCol('Description', 700);
end;
}





{ TComboBox }

constructor TComboBox.Create(AOwner: TComponent);
begin
  inherited;
  AutoComplete := False;
  FStoredItems := TStringList.Create;
  FStoredItems.OnChange := StoredItemsChange;
end;

destructor TComboBox.Destroy;
begin
  FStoredItems.Free;
  inherited;
end;

procedure TComboBox.CNCommand(var AMessage: TWMCommand);
begin
  // we have to process everything from our ancestor
  inherited;
  // if we received the CBN_EDITUPDATE notification
  if AMessage.NotifyCode = CBN_EDITUPDATE then
    // fill the items with the matches
    FilterItems;
end;

procedure TComboBox.FilterItems;
var
  I: Integer;
  Selection: TSelection;
begin
  // store the current combo edit selection
  SendMessage(Handle, CB_GETEDITSEL, WPARAM(@Selection.StartPos),
    LPARAM(@Selection.EndPos));
  // begin with the items update
  Items.BeginUpdate;
  try
    // if the combo edit is not empty, then clear the items
    // and search through the FStoredItems
    if Text <> '' then
    begin
      // clear all items
      Items.Clear;
      // iterate through all of them
      for I := 0 to FStoredItems.Count - 1 do
        // check if the current one contains the text in edit
        if ContainsText(FStoredItems[I], Text) then
          // and if so, then add it to the items
          Items.Add(FStoredItems[I]);
    end
    // else the combo edit is empty
    else
      // so then we'll use all what we have in the FStoredItems
      Items.Assign(FStoredItems)
  finally
    // finish the items update
    Items.EndUpdate;
  end;
  // and restore the last combo edit selection
  SendMessage(Handle, CB_SETEDITSEL, 0, MakeLParam(Selection.StartPos,
    Selection.EndPos));
end;

procedure TComboBox.StoredItemsChange(Sender: TObject);
begin
  if Assigned(FStoredItems) then
    FilterItems;
end;

procedure TComboBox.SetStoredItems(const Value: TStringList);
begin
  if Assigned(FStoredItems) then
    FStoredItems.Assign(Value)
  else
    FStoredItems := Value;
end;

end.
