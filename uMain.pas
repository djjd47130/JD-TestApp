unit uMain;

(*
  JD Test Application
  A compilation and demonstration of all JD libraries and solutions.

  TODO:
  - Create "plugin" like concept
  - Strip TMDB away into a separate layer
  - Introduce other third-party API wrappers

*)

interface

uses
  Winapi.Windows, Winapi.Messages, System.ImageList,

  System.SysUtils, System.Variants, System.Classes, System.Types, System.UITypes,
  System.Generics.Collections,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Menus,
  Vcl.ImgList, Vcl.AppEvnts,

  JD.Common, JD.Ctrls, JD.Ctrls.FontButton, JD.Graphics, JD.Favicons,
  JD.TabController,

  uMainMenu,
  uAppSetup,
  uContentBase,
  uContentBrowser,

  Jpeg, PngImage,

  XSuperObject, XSuperJSON,

  ChromeTabs, ChromeTabsClasses, ChromeTabsTypes,

  Vcl.Styles.Utils,
  Vcl.Styles.Fixes;

const
  MAIN_MENU_WIDTH_OPEN = 380;
  MAIN_MENU_WIDTH_CLOSED = 70;

type
  TfrmMain = class(TForm)
    pTop: TPanel;
    pContent: TPanel;
    Stat: TStatusBar;
    pMenu: TPanel;
    btnMenu: TJDFontButton;
    Tabs: TChromeTabs;
    imgFavicons16: TImageList;
    Favicons: TJDFavicons;
    AppEvents: TApplicationEvents;
    btnDummy: TJDFontButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TabsActiveTabChanged(Sender: TObject; ATab: TChromeTab);
    procedure TabsButtonCloseTabClick(Sender: TObject; ATab: TChromeTab;
      var Close: Boolean);
    procedure btnMenuClick(Sender: TObject);
    procedure TabsButtonAddClick(Sender: TObject; var Handled: Boolean);
    procedure FaviconsLookupFavicon(Sender: TObject; const URI: string; Ref: TJDFaviconRef; var Handled: Boolean);
    procedure AppEventsHint(Sender: TObject);
    procedure TabsShowHint(Sender: TObject; HitTestResult: THitTestResult; var HintText: string;
      var HintTimeout: Integer);
  private
    FMenu: TfrmMainMenu;
    FFullScreen: Boolean;
    FRect: TRect;
    FState: TWindowState;
    FContentOnly: Boolean;
    FLoaded: Boolean;
    procedure SetFullScreen(const Value: Boolean);
    procedure SetContentOnly(const Value: Boolean);
  public
    property Menu: TfrmMainMenu read FMenu;
    function MenuVisible: Boolean;
    procedure ShowMenu(const Value: Boolean);
    property FullScreen: Boolean read FFullScreen write SetFullScreen;
    property ContentOnly: Boolean read FContentOnly write SetContentOnly;
    function OpenNewBrowserTab(const URL: String = ''): TJDTabRef;
  end;

var
  frmMain: TfrmMain;

function AppSetup: TAppSetup;

implementation

uses
  System.IOUtils,
  Vcl.Themes;

{$R *.dfm}



var
  _AppSetup: TAppSetup;

function AppSetup: TAppSetup;
begin
  if _AppSetup = nil then
    _AppSetup:= TAppSetup.Create;
  Result:= _AppSetup;
end;




{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG}
  //ReportMemoryLeaksOnShutdown:= True;
  //MEMORY LEAKS! TEMPORARILY DISABLING TO HIDE MESSAGE! - Issue #5
  //https://github.com/djjd47130/JD-TMDB/issues/5
  {$ENDIF}

  FLoaded:= False;

  //UI
  //TODO: Add option for user to switch style...
  //TODO: I like the style of "Windows10 Dark" when it comes to overall control styling,
  //  especially the system buttons in the top-right. However, need to create
  //  a custom version with a dark-gray but not pure black base color.
  //TStyleManager.TrySetStyle('Carbon', False);
  TStyleManager.TrySetStyle('Windows10 Dark', False);
  //TStyleManager.TrySetStyle('Windows10 SlateGray', False);
  //TStyleManager.TrySetStyle('Cobalt XEMedia', False);
  //TStyleManager.TrySetStyle('Lime Graphite', False);
  ColorManager.BaseColor:= TStyleManager.ActiveStyle.GetStyleColor(TStyleColor.scWindow);
  pContent.Align:= alClient;

  Width:= 1200;
  Height:= 800;

  //Tabs
  InitTabController;
  TabController.ChromeTabs:= Tabs;
  TabController.Container:= pContent;
  TabController.MainForm:= Self;

  //Main Menu
  FMenu:= TfrmMainMenu.Create(pMenu);
  FMenu.Parent:= pMenu;
  FMenu.BorderStyle:= bsNone;
  FMenu.Align:= alClient;
  FMenu.Show;

  //Move dummy button out of view...
  btnDummy.Left:= -50000;

  FLoaded:= True;

end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  //Tabs
  UninitTabController;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  //Main Menu
  //TODO: Populate menu with configured features...

  Self.ShowMenu(True);
end;

procedure TfrmMain.FaviconsLookupFavicon(Sender: TObject; const URI: string; Ref: TJDFaviconRef;
  var Handled: Boolean);
begin
  //Tabs
  //TODO: Return image if not a web URL...

end;

function TfrmMain.MenuVisible: Boolean;
begin
  //Main Menu
  Result:= pMenu.Tag = 1;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //Tabs
  CanClose:= TabController.CloseQuery;
end;

procedure TfrmMain.TabsActiveTabChanged(Sender: TObject; ATab: TChromeTab);
begin
  //Tabs
  pContent.DisableAlign;
  try
    TabController.HandleTabChanged(ATab);
  finally
    pContent.EnableAlign;
  end;
end;

procedure TfrmMain.TabsButtonAddClick(Sender: TObject; var Handled: Boolean);
begin
  //Tabs
  Handled:= True;
  OpenNewBrowserTab;
end;

function TfrmMain.OpenNewBrowserTab(const URL: String = ''): TJDTabRef;
begin
  //Tabs
  var TURL:= URL;
  if TURL = '' then
    TURL:= 'https://google.com'; //TODO: Use default home page option...
  Result:= TabController.CreateTab(TfrmContentBrowser);
  (Result.Content as TfrmContentBrowser).Navigate(TURL);
  ShowMenu(False);
end;

procedure TfrmMain.TabsButtonCloseTabClick(Sender: TObject; ATab: TChromeTab;
  var Close: Boolean);
begin
  //Tabs
  Close:= False;
  TabController.DeleteTab(ATab.Index);
  //TODO: This closes wrong tab if one has been moved (wrong index)...

  //TODO: This often leaves behind a void where tab used to be...

end;

procedure TfrmMain.TabsShowHint(Sender: TObject; HitTestResult: THitTestResult; var HintText: string;
  var HintTimeout: Integer);
begin
  if HitTestResult.HitTestArea in [THitTestArea.htTab, THitTestArea.htTabImage] then begin
    var Tab:= Tabs.Tabs[HitTestResult.TabIndex];
    //Application.Hint:= Tab.Caption;
    Stat.Panels[0].Text:= Tab.Caption;
  end else begin
    //Application.Hint:= '';
    Stat.Panels[0].Text:= Application.Hint;
  end;
end;

procedure TfrmMain.AppEventsHint(Sender: TObject);
begin
  Stat.Panels[0].Text:= Application.Hint;
end;

procedure TfrmMain.SetContentOnly(const Value: Boolean);
begin
  FContentOnly := Value;
  pTop.Visible:= not Value;
  pMenu.Visible:= not Value;
  Stat.Visible:= not Value;
end;

procedure TfrmMain.SetFullScreen(const Value: Boolean);
var
  M: TMonitor;
begin
  FFullScreen := Value;
  M:= Screen.MonitorFromRect(BoundsRect);

  if Value then begin
    FRect:= BoundsRect;
    FState:= WindowState;
    //Parent:= nil;
    //BringToFront;
    BorderStyle:= bsNone;
    WindowState:= wsMaximized;
    SetBounds(M.Left, M.Top, M.Width, M.Height);
  end else begin
    //Parent:= TabController.Container;
    BorderStyle:= bsSizeable;
    SetBounds(FRect.Left, FRect.Top, FRect.Right, FRect.Bottom);
    WindowState:= FState;
  end;
end;

procedure TfrmMain.ShowMenu(const Value: Boolean);
begin
  //Main Menu
  Self.DisableAlign;
  try
    if Value then begin
      pMenu.Tag:= 1;
      pMenu.Width:= MAIN_MENU_WIDTH_OPEN;
    end else begin
      pMenu.Tag:= 0;
      pMenu.Width:= MAIN_MENU_WIDTH_CLOSED;
    end;
    try
      if btnDummy.CanFocus then
        btnDummy.SetFocus;
    except
      on E: Exception do begin

      end;
    end;
  finally
    Self.EnableAlign;
  end;
end;

procedure TfrmMain.btnMenuClick(Sender: TObject);
begin
  //Main Menu
  case pMenu.Tag of
    0: begin
      ShowMenu(True);
    end;
    1: begin
      ShowMenu(False);
    end;
  end;
end;

initialization
  _AppSetup:= nil;
finalization
  FreeAndNil(_AppSetup);
end.
