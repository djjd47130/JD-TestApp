unit uMain;

(*
  JD Test Application
  A compilation and demonstration of all JD libraries and solutions.

  TODO:
  - Modify main form to allow more than 1 instance
    - Move global stuff into central data module
    - Implement dragging tabs into new window
    - TTabController must be modified to account for multiple windows
  - Create "plugin" like concept
  - Strip TMDB away into a separate layer
  - Introduce other third-party API wrappers

*)

interface

uses
  Winapi.Windows, Winapi.Messages, System.ImageList,
  System.SysUtils, System.Variants, System.Classes, System.Types, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ImgList, Vcl.AppEvnts,

  JD.Common, JD.Ctrls, JD.Ctrls.FontButton, JD.Graphics, JD.Favicons,
  JD.TabController,

  uMainMenu,

  ChromeTabs, ChromeTabsClasses, ChromeTabsTypes,

  Vcl.Styles.Utils,
  Vcl.Styles.Fixes, LMDDckSite;

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
    AppEvents: TApplicationEvents;
    btnDummy: TJDFontButton;
    Panel1: TPanel;
    txtAddress: TEdit;
    btnGo: TJDFontButton;
    btnBack: TJDFontButton;
    btnForward: TJDFontButton;
    btnRefresh: TJDFontButton;
    btnFavorites: TJDFontButton;
    JDFontButton1: TJDFontButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TabsActiveTabChanged(Sender: TObject; ATab: TChromeTab);
    procedure TabsButtonCloseTabClick(Sender: TObject; ATab: TChromeTab;
      var Close: Boolean);
    procedure btnMenuClick(Sender: TObject);
    procedure TabsButtonAddClick(Sender: TObject; var Handled: Boolean);
    procedure AppEventsHint(Sender: TObject);
    procedure TabsShowHint(Sender: TObject; HitTestResult: THitTestResult; var HintText: string;
      var HintTimeout: Integer);
    procedure TabsCreateDragForm(Sender: TObject; ATab: TChromeTab; var DragForm: TForm);
    procedure TabsTabDragDrop(Sender: TObject; X, Y: Integer; DragTabObject: IDragTabObject; Cancelled: Boolean;
      var TabDropOptions: TTabDropOptions);
    procedure TabsNeedDragImageControl(Sender: TObject; ATab: TChromeTab; var DragControl: TWinControl);
  private
    FTabController: TJDTabController;
    FMenu: TfrmMainMenu;
    FFullScreen: Boolean;
    FRect: TRect;
    FState: TWindowState;
    FContentOnly: Boolean;
    FLoaded: Boolean;
    procedure SetFullScreen(const Value: Boolean);
    procedure SetContentOnly(const Value: Boolean);
    procedure ProcessDroppedTab(Sender: TObject; X, Y: Integer; DragTabObject: IDragTabObject; Cancelled: Boolean;
      var TabDropOptions: TTabDropOptions);
  public
    property Menu: TfrmMainMenu read FMenu;
    function MenuVisible: Boolean;
    procedure ShowMenu(const Value: Boolean);
    property FullScreen: Boolean read FFullScreen write SetFullScreen;
    property ContentOnly: Boolean read FContentOnly write SetContentOnly;
    function OpenNewBrowserTab(const URL: String = ''): TJDTabRef;
    property TabController: TJDTabController read FTabController;
  end;

var
  frmMain: TfrmMain;

function TabController(const MainForm: TForm): TJDTabController;

implementation

uses
  uAppSetup,
  uContentBrowser,
  System.IOUtils,
  Vcl.Themes,
  uDM;

{$R *.dfm}


procedure MakeFormIndependent(Form: TForm);
begin
  Application.MainFormOnTaskbar := False;
  ShowWindow(Application.Handle, SW_HIDE);


  SetWindowLong(Form.Handle, GWL_HWNDPARENT, 0);
end;

function TabController(const MainForm: TForm): TJDTabController;
begin
  Result:= TfrmMain(MainForm).TabController;
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
  //  especially the large system buttons in the top-right. However, need to create
  //  a custom version with a dark-gray but not pure black base color.
  //TStyleManager.TrySetStyle('Carbon', False);
  TStyleManager.TrySetStyle('Windows10 DarkGray', False);
  //TStyleManager.TrySetStyle('Windows10 SlateGray', False);
  //TStyleManager.TrySetStyle('Cobalt XEMedia', False);
  //TStyleManager.TrySetStyle('Lime Graphite', False);
  ColorManager.BaseColor:= TStyleManager.ActiveStyle.GetStyleColor(TStyleColor.scWindow);
  pContent.Align:= alClient;

  Width:= 1200;
  Height:= 800;

  //Tabs - TODO: Move TJDTabController to TfrmMain as installed component
  //InitTabController;
  FTabController:= TJDTabController.Create(nil);
  FTabController.MainForm:= Self;
  FTabController.ChromeTabs:= Tabs;
  FTabController.Container:= pContent;

  //Main Menu
  FMenu:= TfrmMainMenu.Create(pMenu, Self);
  FMenu.Parent:= pMenu;
  FMenu.BorderStyle:= bsNone;
  FMenu.Align:= alClient;
  FMenu.Show;

  //Move dummy button out of view...
  btnDummy.Left:= -50000;

  MakeFormIndependent(Self);

  FLoaded:= True;

end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  //Tabs
  FreeAndNil(FTabController);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  //Main Menu
  Self.ShowMenu(True);
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

procedure TfrmMain.TabsCreateDragForm(Sender: TObject; ATab: TChromeTab; var DragForm: TForm);
begin
  //Tabs
  var Ref:= TabController.TabByTab(ATab);
  DragForm:= Ref.Content;
end;

procedure TfrmMain.TabsNeedDragImageControl(Sender: TObject; ATab: TChromeTab; var DragControl: TWinControl);
begin

  DragControl := pContent;
end;

procedure TfrmMain.TabsShowHint(Sender: TObject; HitTestResult: THitTestResult; var HintText: string;
  var HintTimeout: Integer);
begin
  //Tabs
  if HitTestResult.HitTestArea in [THitTestArea.htTab, THitTestArea.htTabImage] then begin
    var Tab:= Tabs.Tabs[HitTestResult.TabIndex];
    Stat.Panels[0].Text:= Tab.Caption;
  end else begin
    Stat.Panels[0].Text:= Application.Hint;
  end;
end;

procedure TfrmMain.ProcessDroppedTab(Sender: TObject; X, Y: Integer;
  DragTabObject: IDragTabObject; Cancelled: Boolean;
  var TabDropOptions: TTabDropOptions);
var
  WinX, WinY: Integer;
  NewForm: TfrmMain;
begin
  //Tabs

  // Make sure that the drag drop hasn't been cancelled and that
  // we are not dropping on a TChromeTab control
  if (not Cancelled) and
     (DragTabObject.SourceControl <> DragTabObject.DockControl) and
     (DragTabObject.DockControl = nil) then
  begin
    // Find the drop position
    WinX := Mouse.CursorPos.X - DragTabObject.DragCursorOffset.X - ((Width - ClientWidth) div 2);
    WinY := Mouse.CursorPos.Y - DragTabObject.DragCursorOffset.Y - (Height - ClientHeight) + ((Width - ClientWidth) div 2);

    // Create a new form
    NewForm := TfrmMain.Create(Application);

    // Set the new form position
    NewForm.Position := poDesigned;
    NewForm.Left := WinX;
    NewForm.Top := WinY;

    // Show the form
    NewForm.Show;

    // Remove the original tab
    //TabDropOptions := [tdDeleteDraggedTab];
    var OldTab:= TabController.Tabs[DragTabObject.DropTabIndex];
    //NewForm.TabController.CreateTab()
    TabController.DeleteTab(OldTab.Index);
  end;
end;

procedure TfrmMain.TabsTabDragDrop(Sender: TObject; X, Y: Integer; DragTabObject: IDragTabObject; Cancelled: Boolean;
  var TabDropOptions: TTabDropOptions);
begin
  //Tabs

  ProcessDroppedTab(Sender, X, Y, DragTabObject, Cancelled, TabDropOptions);
end;

procedure TfrmMain.AppEventsHint(Sender: TObject);
begin
  //UI
  Stat.Panels[0].Text:= Application.Hint;
end;

procedure TfrmMain.SetContentOnly(const Value: Boolean);
begin
  //UI
  FContentOnly := Value;
  pTop.Visible:= not Value;
  pMenu.Visible:= not Value;
  Stat.Visible:= not Value;
end;

procedure TfrmMain.SetFullScreen(const Value: Boolean);
var
  M: TMonitor;
begin
  //UI
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
  //TODO: Change mechanism to populate menu with registered menu items...

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
    //Take focus away from everything...
    try
      if btnDummy.CanFocus and btnDummy.Visible then
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

end.
