unit uTMDBHome;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uContentBase, uTMDBContentBase, JD.Common, JD.Ctrls,
  JD.Ctrls.FontButton, Vcl.ExtCtrls,
  System.NetEncoding,

  JD.TMDB.Common,
  JD.TMDB.Intf,

  //uAppSetup,
  uTMDB,
  uTMDBSetup,
  uContentCertsMovies,
  uContentCertsTV,
  uContentGenresMovie,
  uContentGenresTV,
  uContentSearchCollections,
  uContentSearchCompanies,
  uContentSearchKeywords,
  uContentSearchMovies,
  uContentSearchMulti,
  uContentSearchPeople,
  uContentSearchTV,
  uContentConfigCountries,
  uContentConfigLanguages,
  uContentConfigTimezones,
  uContentConfigJobs,
  uContentBrowser,
  uContentMoviePage,
  uContentDiscoverMovies,
  uContentChangesMovies,
  uContentTVPage,
  uTMDBSearch,

  Vcl.StdCtrls, uTMDBListItem, uTMDBMovieListItem, uTMDBVertMovieListItem, Vcl.Imaging.pngimage;

type
  TfrmTMDBHome = class(TfrmTMDBContentBase)
    SB: TScrollBox;
    pMovies: TPanel;
    Label1: TLabel;
    btnMovieCertifications: TJDFontButton;
    btnMovieGenres: TJDFontButton;
    btnMyMovieWatchlist: TJDFontButton;
    btnMyFavoriteMovies: TJDFontButton;
    btnMyRatedMovies: TJDFontButton;
    btnTopRatedMovies: TJDFontButton;
    btnUpcomingMovies: TJDFontButton;
    btnPopularMovies: TJDFontButton;
    btnNowPlayingMovies: TJDFontButton;
    btnDiscoverMovies: TJDFontButton;
    btnSearchCollections: TJDFontButton;
    btnSearchMovies: TJDFontButton;
    JDFontButton23: TJDFontButton;
    btnMovieChanges: TJDFontButton;
    pTV: TPanel;
    Label2: TLabel;
    btnSearchTV: TJDFontButton;
    btnDiscoverTV: TJDFontButton;
    JDFontButton4: TJDFontButton;
    JDFontButton31: TJDFontButton;
    JDFontButton7: TJDFontButton;
    JDFontButton8: TJDFontButton;
    JDFontButton10: TJDFontButton;
    JDFontButton28: TJDFontButton;
    JDFontButton13: TJDFontButton;
    JDFontButton2: TJDFontButton;
    JDFontButton9: TJDFontButton;
    JDFontButton12: TJDFontButton;
    JDFontButton14: TJDFontButton;
    JDFontButton15: TJDFontButton;
    pMisc: TPanel;
    Label3: TLabel;
    JDFontButton26: TJDFontButton;
    JDFontButton45: TJDFontButton;
    JDFontButton47: TJDFontButton;
    JDFontButton44: TJDFontButton;
    JDFontButton5: TJDFontButton;
    JDFontButton1: TJDFontButton;
    pConfig: TPanel;
    Label4: TLabel;
    JDFontButton3: TJDFontButton;
    JDFontButton22: TJDFontButton;
    JDFontButton21: TJDFontButton;
    JDFontButton20: TJDFontButton;
    JDFontButton19: TJDFontButton;
    JDFontButton18: TJDFontButton;
    JDFontButton17: TJDFontButton;
    JDFontButton49: TJDFontButton;
    pPeople: TPanel;
    Label5: TLabel;
    JDFontButton48: TJDFontButton;
    JDFontButton6: TJDFontButton;
    JDFontButton11: TJDFontButton;
    JDFontButton16: TJDFontButton;
    pTop: TPanel;
    btnUser: TJDFontButton;
    pUser: TPanel;
    gbUserLogin: TGroupBox;
    Panel3: TPanel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    rbCreds: TRadioButton;
    pAuthUser: TPanel;
    Label6: TLabel;
    txtAuthUser: TEdit;
    pAuthPass: TPanel;
    Label7: TLabel;
    txtAuthPass: TEdit;
    btnLogin: TJDFontButton;
    gbUserInfo: TGroupBox;
    pUserDetail: TPanel;
    lblUserName: TLabel;
    lblUserFullName: TLabel;
    Panel5: TPanel;
    imgUserAvatar: TImage;
    JDFontButton24: TJDFontButton;
    btnLogout: TJDFontButton;
    btnMenu: TJDFontButton;
    Panel1: TPanel;
    Label9: TLabel;
    sbTrendingMovies: TScrollBox;
    Panel2: TPanel;
    Label10: TLabel;
    sbPopularMovies: TScrollBox;
    Image1: TImage;
    JDFontButton25: TJDFontButton;
    tmrLoadDelay: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnSearchMoviesClick(Sender: TObject);
    procedure btnSearchCollectionsClick(Sender: TObject);
    procedure JDFontButton44Click(Sender: TObject);
    procedure JDFontButton45Click(Sender: TObject);
    procedure JDFontButton47Click(Sender: TObject);
    procedure JDFontButton48Click(Sender: TObject);
    procedure btnSearchTVClick(Sender: TObject);
    procedure JDFontButton49Click(Sender: TObject);
    procedure CategoryPanelGroup1MouseWheelDown(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure CategoryPanelGroup1MouseWheelUp(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure btnMovieCertificationsClick(Sender: TObject);
    procedure JDFontButton13Click(Sender: TObject);
    procedure btnMovieGenresClick(Sender: TObject);
    procedure JDFontButton28Click(Sender: TObject);
    procedure JDFontButton18Click(Sender: TObject);
    procedure JDFontButton20Click(Sender: TObject);
    procedure JDFontButton22Click(Sender: TObject);
    procedure JDFontButton19Click(Sender: TObject);
    procedure JDFontButton1Click(Sender: TObject);
    procedure btnNowPlayingMoviesClick(Sender: TObject);
    procedure btnPopularMoviesClick(Sender: TObject);
    procedure btnUpcomingMoviesClick(Sender: TObject);
    procedure btnTopRatedMoviesClick(Sender: TObject);
    procedure btnMyFavoriteMoviesClick(Sender: TObject);
    procedure btnMyMovieWatchlistClick(Sender: TObject);
    procedure JDFontButton23Click(Sender: TObject);
    procedure btnDiscoverMoviesClick(Sender: TObject);
    procedure btnMovieChangesClick(Sender: TObject);
    procedure JDFontButton12Click(Sender: TObject);
    procedure SBMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure SBMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure btnUserClick(Sender: TObject);
    procedure txtAuthPassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rbCredsClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure JDFontButton25Click(Sender: TObject);
    procedure tmrLoadDelayTimer(Sender: TObject);
  private
    FAuthMethod: Integer;
    procedure CalcScrollHeight;
    procedure ShowUserInfo;
    procedure ShowUserAvatar(const Path: String);
    procedure EnableItemsInPanel(const APanel: TPanel; const AEnabled: Boolean);
  public
    function CanClose: Boolean; override;
    procedure EnableTMDBItems(const AEnabled: Boolean);

    procedure LoadTrendingMovies;
    procedure LoadPopularMovies;

  end;

var
  frmTMDBHome: TfrmTMDBHome;

implementation

{$R *.dfm}

uses
  uMain,
  JD.TabController;

{ TfrmTMDBHome }

procedure TfrmTMDBHome.FormCreate(Sender: TObject);
begin
  inherited;
  TabCaption:= 'Main Menu';
  CalcScrollHeight;
  SB.VertScrollBar.Position:= 0;

  //User Auth
  gbUserInfo.Align:= alClient;
  gbUserLogin.Align:= alClient;
  FAuthMethod:= 2;





  //MOVED from FormShow...

  dmTMDB.PrepAPI;

  EnableTMDBItems(False);

  //Check whether API is configured and accessible.
  //  If not, navigate to App Setup accordingly.
  var Configured:= TMDBSetup.IsConfigured;

  // TMDB Related
  if not Configured then begin

    //TODO: Disable all TMDB functionality until valid API credentials are configured...
    //  - Config and Cache
    //  - Main Menu Items
    //  - User Authentication

    case MessageDlg('TMDB API must be properly configured to continue.'+
      sLineBreak+sLineBreak+'Open API setup?', mtError, [mbYes,mbNo], 0) of
      mrYes: begin
        //var Tab:=
          TabController.CreateTab(TfrmTMDBSetup);
      end;
      else begin
        //TODO: Is this even necessary?
        //  Why not let user utilize browser without TMDB?
        Application.Terminate;
      end;
    end;

  end else begin
    EnableTMDBItems(True);

    tmrLoadDelay.Enabled:= True;

  end;

  //TMDB User Auth
  //Restore user login session
  if (TMDBSetup.SessionID <> '') and (TMDBSetup.SessionGuest = False) then begin
    try
      if dmTMDB.TMDB.LoginState.RestoreSession(TMDBSetup.SessionID) then begin
        ShowUserInfo;

        //TODO: Show/hide data accordingly...

      end;
    except
      on E: Exception do begin
        //TODO
      end;
    end;
  end;

end;

procedure TfrmTMDBHome.FormResize(Sender: TObject);
begin
  inherited;
  if pUser.Visible then begin
    pUser.Width:= 300;
    pUser.Top:= pTop.Top + pTop.Height + 2;
    pUser.Left:= ClientWidth - pUser.Width;
  end;
end;

procedure TfrmTMDBHome.FormShow(Sender: TObject);
begin
  inherited;

  //

end;

procedure TfrmTMDBHome.CalcScrollHeight;
var
  X: Integer;
  H: Integer;
begin
  H:= 1;
  for X := 0 to SB.ControlCount-1 do begin
    H:= H + SB.Controls[X].Height;
  end;
  SB.VertScrollBar.Range:= H;
end;

function TfrmTMDBHome.CanClose: Boolean;
begin
  Result:= True;
end;

procedure TfrmTMDBHome.CategoryPanelGroup1MouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  inherited;
  SB.VertScrollBar.Position:= SB.VertScrollBar.Position + 20;
end;

procedure TfrmTMDBHome.CategoryPanelGroup1MouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  inherited;
  SB.VertScrollBar.Position:= SB.VertScrollBar.Position - 20;
end;

procedure TfrmTMDBHome.btnDiscoverMoviesClick(Sender: TObject);
begin
  inherited;

  TabController.CreateTab(TfrmContentDiscoverMovies);
  //HideMenu;

end;

procedure TfrmTMDBHome.btnLoginClick(Sender: TObject);

var
  Success: Boolean;
  GS: ITMDBAuthGuestSessionResult;
  US: ITMDBAuthSessionResult;
begin
  //User Auth
  inherited;
  dmTMDB.PrepAPI;
  Success:= False;
  case FAuthMethod of
    0: begin
      //Guest...
      GS:= dmTMDB.TMDB.LoginState.LoginAsGuest;
      Success:= GS.Success;
    end;
    1: begin
      //Normal...
      US:= dmTMDB.TMDB.LoginState.LoginAsUser;
      Success:= US.Success;
    end;
    2: begin
      //Credentials...
      US:= dmTMDB.TMDB.LoginState.LoginAsCreds(txtAuthUser.Text, txtAuthPass.Text);
      Success:= US.Success;
    end;
  end;
  if Success then begin
    //Proceed with authenticated user...
    pUser.Visible:= False;
    TMDBSetup.SessionID:= US.SessionID;
    TMDBSetup.SessionGuest:= dmTMDB.TMDB.LoginState.IsGuest;
    ShowUserInfo;
  end;
end;

procedure TfrmTMDBHome.btnLogoutClick(Sender: TObject);
begin
  inherited;
  //User Auth
  pUser.Visible:= False;
  if MessageDlg('Are you sure you wish to log out?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then begin
    dmTMDB.PrepAPI;
    if dmTMDB.TMDB.LoginState.Logout then begin
      ShowUserInfo;
    end;
  end;
end;

procedure TfrmTMDBHome.btnMovieCertificationsClick(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentCertsMovies);
  //HideMenu;
end;

procedure TfrmTMDBHome.btnMovieChangesClick(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentChangesMovies);
  //HideMenu;
end;

procedure TfrmTMDBHome.JDFontButton12Click(Sender: TObject);
var
  T: TJDTabRef;
  F: TfrmContentTVPage;
begin
  inherited;
  T:= TabController.CreateTab(TfrmContentTVPage);
  F:= TfrmContentTVPage(T.Content);
  F.BaseName:= 'Popular TV';
  F.OnGetPage:=
    procedure(Sender: TObject;
      const Page: Integer; var Data: ITMDBTVSeriesPage)
    begin
      Data:= TMDB.TVSeriesLists.GetPopular(TMDBSetup.Language, Page);
    end;
  F.RefreshData;
  //HideMenu;
end;

procedure TfrmTMDBHome.JDFontButton13Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentCertsTV);
  //HideMenu;
end;

procedure TfrmTMDBHome.JDFontButton18Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentConfigCountries);
  //HideMenu;
end;

procedure TfrmTMDBHome.JDFontButton19Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentConfigJobs);
  //HideMenu;
end;

procedure TfrmTMDBHome.JDFontButton1Click(Sender: TObject);
begin
  inherited;
  frmMain.OpenNewBrowserTab('https://www.themoviedb.org/');
  //HideMenu;
end;

procedure TfrmTMDBHome.JDFontButton20Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentConfigLanguages);
  //HideMenu;
end;

procedure TfrmTMDBHome.JDFontButton22Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentConfigTimezones);
  //HideMenu;
end;

procedure TfrmTMDBHome.JDFontButton23Click(Sender: TObject);
var
  T: TJDTabRef;
  F: TfrmContentMoviePage;
  //W: TTMDBTimeWindow;
begin
  inherited;
  T:= TabController.CreateTab(TfrmContentMoviePage);
  F:= TfrmContentMoviePage(T.Content);
  F.BaseName:= 'Trending Movies';
  F.OnGetPage:=
    procedure(Sender: TObject;
      const Page: Integer; var Data: ITMDBMoviePage)
    begin
      //TODO: Handle time window option...
      Data:= TMDB.Trending.GetMovies(twDay, TMDBSetup.Language, Page);
    end;
  F.RefreshData;
  //HideMenu;
end;

procedure TfrmTMDBHome.JDFontButton25Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmTMDBSearch);
end;

procedure TfrmTMDBHome.btnMovieGenresClick(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentGenresMovie);
  //HideMenu;
end;

procedure TfrmTMDBHome.btnMyFavoriteMoviesClick(Sender: TObject);
var
  T: TJDTabRef;
  F: TfrmContentMoviePage;
begin
  inherited;
  T:= TabController.CreateTab(TfrmContentMoviePage);
  F:= TfrmContentMoviePage(T.Content);
  F.BaseName:= 'My Favorite Movies';
  F.OnGetPage:=
    procedure(Sender: TObject;
      const Page: Integer; var Data: ITMDBMoviePage)
    begin
      Data:= TMDB.Account.GetFavoriteMovies(TMDB.LoginState.AccountID, Page,
        TMDBSetup.Language, TMDB.LoginState.SessionID);
    end;
  F.RefreshData;
  //HideMenu;
end;

procedure TfrmTMDBHome.btnMyMovieWatchlistClick(Sender: TObject);
var
  T: TJDTabRef;
  F: TfrmContentMoviePage;
begin
  inherited;
  T:= TabController.CreateTab(TfrmContentMoviePage);
  F:= TfrmContentMoviePage(T.Content);
  F.BaseName:= 'My Movie Watchlist';
  F.OnGetPage:=
    procedure(Sender: TObject;
      const Page: Integer; var Data: ITMDBMoviePage)
    begin
      Data:= TMDB.Account.GetWatchlistMovies(TMDB.LoginState.AccountID, Page,
        TMDBSetup.Language, TMDB.LoginState.SessionID);
    end;
  F.RefreshData;
  //HideMenu;
end;

procedure TfrmTMDBHome.btnNowPlayingMoviesClick(Sender: TObject);
var
  T: TJDTabRef;
  F: TfrmContentMoviePage;
begin
  inherited;
  T:= TabController.CreateTab(TfrmContentMoviePage);
  F:= TfrmContentMoviePage(T.Content);
  F.BaseName:= 'Now Playing Movies';
  F.OnGetPage:=
    procedure(Sender: TObject;
      const Page: Integer; var Data: ITMDBMoviePage)
    begin
      Data:= TMDB.MovieLists.GetNowPlaying(TMDBSetup.Language, Page, '');
    end;
  F.RefreshData;
  //HideMenu;
end;

procedure TfrmTMDBHome.btnPopularMoviesClick(Sender: TObject);
var
  T: TJDTabRef;
  F: TfrmContentMoviePage;
begin
  inherited;
  T:= TabController.CreateTab(TfrmContentMoviePage);
  F:= TfrmContentMoviePage(T.Content);
  F.BaseName:= 'Popular Movies';
  F.OnGetPage:=
    procedure(Sender: TObject;
      const Page: Integer; var Data: ITMDBMoviePage)
    begin
      Data:= TMDB.MovieLists.GetPopular(TMDBSetup.Language, Page, '');
    end;
  F.RefreshData;
  //HideMenu;
end;

procedure TfrmTMDBHome.JDFontButton28Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentGenresTV);
  //HideMenu;
end;

procedure TfrmTMDBHome.btnSearchCollectionsClick(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentSearchCollections);
  //HideMenu;
end;

procedure TfrmTMDBHome.btnSearchTVClick(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentSearchTV);
  //HideMenu;
end;

procedure TfrmTMDBHome.btnTopRatedMoviesClick(Sender: TObject);
var
  T: TJDTabRef;
  F: TfrmContentMoviePage;
begin
  inherited;
  T:= TabController.CreateTab(TfrmContentMoviePage);
  F:= TfrmContentMoviePage(T.Content);
  F.BaseName:= 'Top Rated Movies';
  F.OnGetPage:=
    procedure(Sender: TObject;
      const Page: Integer; var Data: ITMDBMoviePage)
    begin
      Data:= TMDB.MovieLists.GetTopRated(TMDBSetup.Language, Page, '');
    end;
  F.RefreshData;
  //HideMenu;
end;

procedure TfrmTMDBHome.btnUpcomingMoviesClick(Sender: TObject);
var
  T: TJDTabRef;
  F: TfrmContentMoviePage;
begin
  inherited;
  T:= TabController.CreateTab(TfrmContentMoviePage);
  F:= TfrmContentMoviePage(T.Content);
  F.BaseName:= 'Upcoming Movies';
  F.OnGetPage:=
    procedure(Sender: TObject;
      const Page: Integer; var Data: ITMDBMoviePage)
    begin
      Data:= TMDB.MovieLists.GetUpcoming(TMDBSetup.Language, Page, '');
    end;
  F.RefreshData;
  //HideMenu;
end;

procedure TfrmTMDBHome.btnUserClick(Sender: TObject);
begin
  inherited;
  //User Auth
  if pUser.Visible then begin
    pUser.Visible:= False;
  end else begin
    pUser.Width:= 300;
    pUser.Top:= pTop.Top + pTop.Height + 2;
    pUser.Left:= ClientWidth - pUser.Width;
    pUser.Visible:= True;
    pAuthUser.Top:= 200;
    pAuthPass.Top:= 200;
    btnLogin.Top:= 200;
    if gbUserLogin.Visible and rbCreds.Visible and txtAuthUser.CanFocus then begin
      txtAuthUser.SetFocus;
      txtAuthuser.SelectAll;
    end;
  end;
  pUser.BringToFront;
end;

procedure TfrmTMDBHome.JDFontButton44Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentSearchCompanies);
  //HideMenu;
end;

procedure TfrmTMDBHome.JDFontButton45Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentSearchKeywords);
  //HideMenu;
end;

procedure TfrmTMDBHome.btnSearchMoviesClick(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentSearchMovies);
  //HideMenu;
end;

procedure TfrmTMDBHome.JDFontButton47Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentSearchMulti);
  //HideMenu;
end;

procedure TfrmTMDBHome.JDFontButton48Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentSearchPeople);
  //HideMenu;
end;

procedure TfrmTMDBHome.JDFontButton49Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmTMDBSetup, -1, 0);
  //HideMenu;
end;

procedure TfrmTMDBHome.rbCredsClick(Sender: TObject);
var
  I: Integer;
begin
  //User Auth
  inherited;
  I:= TComponent(Sender).Tag;
  FAuthMethod:= I;
  case I of
    2: begin
      pAuthUser.Visible:= True;
      pAuthPass.Visible:= True;
      pAuthUser.Top:= 200;
      pAuthPass.Top:= 200;
      btnLogin.Top:= 200;
      txtAuthUser.SetFocus;
      txtAuthUser.SelectAll;
    end;
    else begin
      pAuthUser.Visible:= False;
      pAuthPass.Visible:= False;
    end;
  end;
end;

procedure TfrmTMDBHome.SBMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  inherited;
  SB.VertScrollBar.Position:= SB.VertScrollBar.Position + 20;
end;

procedure TfrmTMDBHome.SBMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  inherited;
  SB.VertScrollBar.Position:= SB.VertScrollBar.Position - 20;
end;

procedure TfrmTMDBHome.ShowUserAvatar(const Path: String);

var
  D: WideString;
  S: TStringStream;
  Enc: TBase64Encoding;
begin
  //User Auth
  imgUserAvatar.Picture.Assign(nil);
  if Path <> '' then begin
    if dmTMDB.TMDB.Client.GetImage(D, Path, 'w185') then begin
      Enc:= TBase64Encoding.Create(0);
      try
        D:= Enc.Decode(D);
        S:= TStringStream.Create(D);
        try
          S.Position:= 0;
          imgUserAvatar.Picture.LoadFromStream(S);
        finally
          S.Free;
        end;
      finally
        Enc.Free;
      end;
    end else begin
      //raise Exception.Create('Failed to fetch image.');
    end;
  end;
end;

procedure TfrmTMDBHome.ShowUserInfo;

var
  D: ITMDBAccountDetail;
begin
  //User Auth
  imgUserAvatar.Picture.Assign(nil);
  if dmTMDB.TMDB.LoginState.IsAuthenticated then begin
    btnLogin.Tag:= 1;
    gbUserInfo.Visible:= True;
    gbUserLogin.Visible:= False;
    gbUserInfo.Align:= alClient;
    if dmTMDB.TMDB.LoginState.IsGuest then begin
      lblUserName.Caption:= 'GUEST';
      lblUserFullName.Caption:= 'GUEST USER';
      btnUser.Text:= 'GUEST';
    end else begin
      D:= dmTMDB.TMDB.LoginState.AccountDetail;
      lblUserName.Caption:= D.UserName;
      lblUserFullName.Caption:= D.Name;
      if D.Name <> '' then
        btnUser.Text:= D.Name
      else
        btnUser.Text:= D.UserName;
      ShowUserAvatar(D.TMDBAvatarPath);
    end;
  end else begin
    btnLogin.Tag:= 0;
    gbUserInfo.Visible:= False;
    gbUserLogin.Visible:= True;
    txtAuthUser.Text:= '';
    txtAuthPass.Text:= '';
    btnUser.Text:= 'User Login';
  end;
end;

procedure TfrmTMDBHome.tmrLoadDelayTimer(Sender: TObject);
begin
  inherited;

  tmrLoadDelay.Enabled:= False;

  Screen.Cursor:= crHourglass;
  try
    //TODO: Show/hide accordingly...
    LoadTrendingMovies;
    LoadPopularMovies;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmTMDBHome.txtAuthPassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  //User Auth
  if Key = VK_RETURN then begin
    btnLogin.Click;
  end;
end;

procedure TfrmTMDBHome.EnableItemsInPanel(const APanel: TPanel; const AEnabled: Boolean);
begin
  for var X := 0 to APanel.ControlCount-1 do begin
    if APanel.Controls[X].Tag = 1 then
      APanel.Controls[X].Enabled:= AEnabled;
    if APanel.Controls[X].Tag = 2 then
      APanel.Controls[X].Enabled:= False;
  end;
end;

procedure TfrmTMDBHome.EnableTMDBItems(const AEnabled: Boolean);
begin
  //TODO: Assign "Enabled" property for all TMDB-specific items.
  //  Meant to deactivate anything which cannot be accessed without valid setup or connection.
  EnableItemsInPanel(pConfig, AEnabled);
  EnableItemsInPanel(pMovies, AEnabled);
  EnableItemsInPanel(pMisc, AEnabled);
  EnableItemsInPanel(pPeople, AEnabled);
  EnableItemsInPanel(pTV, AEnabled);
end;

procedure TfrmTMDBHome.LoadPopularMovies;
var
  F: TfrmTMDBVertMovieListItem;
begin

  sbPopularMovies.DisableAlign;
  try

    //Delete all items...
    while sbPopularMovies.ControlCount > 0 do begin
      sbPopularMovies.Controls[0].Free;
    end;

    //Application.ProcessMessages;

    //Fetch list...
    var Data:= TMDB.MovieLists.GetPopular;
    for var X := 0 to Data.Items.Count-1 do begin
      var I:= Data.Items[X];

      F:= TfrmTMDBVertMovieListItem.Create(sbPopularMovies);
      F.Name:= 'frmPopularMovie'+IntToStr(X);
      F.Width:= 220;
      F.Align:= alLeft;
      F.LoadItem(I);
      F.Parent:= sbPopularMovies;


    end;

  finally
    sbPopularMovies.EnableAlign;
  end;

end;

procedure TfrmTMDBHome.LoadTrendingMovies;
var
  F: TfrmTMDBVertMovieListItem;
begin

  sbTrendingMovies.DisableAlign;
  try

    //Delete all items...
    while sbTrendingMovies.ControlCount > 0 do begin
      sbTrendingMovies.Controls[0].Free;
    end;

    //Application.ProcessMessages;

    //Fetch list...
    var Data:= TMDB.MovieLists.GetTopRated;
    for var X := 0 to Data.Items.Count-1 do begin
      var I:= Data.Items[X];

      F:= TfrmTMDBVertMovieListItem.Create(sbTrendingMovies);
      F.Name:= 'frmTrendingMovie'+IntToStr(X);
      F.Width:= 250;
      F.Align:= alLeft;
      F.LoadItem(I);
      F.Parent:= sbTrendingMovies;

    end;

  finally
    sbTrendingMovies.EnableAlign;
  end;

end;

end.
