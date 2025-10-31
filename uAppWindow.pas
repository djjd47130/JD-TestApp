unit uAppWindow;

(*
  JD Test Application
  A compilation and demonstration of all JD libraries and solutions.

  TODO:
  - Modify main form to allow more than 1 instance
    - Move global stuff into central data module
    - Implement dragging tabs into new window
    - TTabController must be modified to account for multiple windows
  - Create "plugin" like concept

*)

interface

uses
  Winapi.Windows, Winapi.Messages,

  System.ImageList, System.SysUtils, System.Variants, System.Classes, System.Types, System.UITypes,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Menus, Vcl.ImgList, Vcl.AppEvnts,

  JD.Common, JD.Ctrls, JD.Ctrls.FontButton, JD.Graphics, JD.Favicons,
  JD.TabController,
  JD.AppController.Intf,

  uMainMenu,

  ChromeTabs, ChromeTabsClasses, ChromeTabsTypes

  , Vcl.Styles.Utils
  , Vcl.Styles.Fixes
  ;

const
  MAIN_MENU_WIDTH_OPEN = 320;
  MAIN_MENU_WIDTH_CLOSED = 50;

type
  TfrmAppWindow = class(TForm, IJDAppWindow)
    pTop: TPanel;
    pContent: TPanel;
    Stat: TStatusBar;
    pMenu: TPanel;
    btnMenu: TJDFontButton;
    Tabs: TChromeTabs;
    AppEvents: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure AppEventsHint(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure TabsActiveTabChanged(Sender: TObject; ATab: TChromeTab);
    procedure TabsButtonCloseTabClick(Sender: TObject; ATab: TChromeTab;
      var Close: Boolean);
    procedure TabsButtonAddClick(Sender: TObject; var Handled: Boolean);
    procedure TabsShowHint(Sender: TObject; HitTestResult: THitTestResult; var HintText: string;
      var HintTimeout: Integer);
    procedure TabsCreateDragForm(Sender: TObject; ATab: TChromeTab; var DragForm: TForm);
    procedure TabsTabDragDrop(Sender: TObject; X, Y: Integer; DragTabObject: IDragTabObject; Cancelled: Boolean;
      var TabDropOptions: TTabDropOptions);
    procedure TabsNeedDragImageControl(Sender: TObject; ATab: TChromeTab; var DragControl: TWinControl);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    //FAppController: IJDAppController;
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
  protected
    //From IJDAppWindow
    function GetOwner: IJDAppController stdcall; reintroduce;
    function GetTabCount: Integer stdcall;
    function GetTab(const Index: Integer): IJDAppTabContent stdcall;
    function GetLeft: Integer stdcall;
    function GetTop: Integer stdcall;
    function GetWidth: Integer stdcall;
    function GetHeight: Integer stdcall;
    procedure SetLeft(const Value: Integer) stdcall;
    procedure SetTop(const Value: Integer) stdcall;
    procedure SetWidth(const Value: Integer) stdcall;
    procedure SetHeight(const Value: Integer) stdcall;

  public
    //From IJDAppWindow
    procedure Show stdcall; reintroduce;
    procedure Close stdcall; reintroduce;
    function CreateNewTab(const URI: WideString = ''): IJDAppTabContent stdcall;
    procedure CloseTab(const TabIndex: Integer) stdcall;
    function MoveTab(const TabIndex: Integer; ADest: IJDAppWindow): IJDAppTabContent stdcall;

    property Left: Integer read GetLeft write SetLeft;
    property Top: Integer read GetTop write SetTop;
    property Width: Integer read GetTop write SetTop;
    property Height: Integer read GetHeight write SetHeight;
  public
    //constructor Create(AOwner: TComponent; AAppController: IJDAppController); reintroduce; virtual;

    property Menu: TfrmMainMenu read FMenu;
    function MenuVisible: Boolean;
    procedure ShowMenu(const Value: Boolean);
    property FullScreen: Boolean read FFullScreen write SetFullScreen;
    property ContentOnly: Boolean read FContentOnly write SetContentOnly;
    function OpenNewBrowserTab(const URL: String = ''): TJDTabRef;
    property TabController: TJDTabController read FTabController;
  end;

var
  frmAppWindow: TfrmAppWindow;

function TabController(const AppWindow: TForm): TJDTabController;

implementation

uses
  uAppSetup,
  uContentBrowser,
  System.IOUtils,
  Vcl.Themes,
  uAppController,
  uAppTabContent;

{$R *.dfm}

procedure MakeFormIndependent(Form: TForm);
begin
  Application.ShowMainForm:= False;
  Application.MainFormOnTaskbar := False;
  ShowWindow(Application.Handle, SW_HIDE);
  SetWindowLong(Form.Handle, GWL_HWNDPARENT, 0);
end;

function TabController(const AppWindow: TForm): TJDTabController;
begin
  Result:= TfrmAppWindow(AppWindow).TabController;
end;

{ TfrmAppWindow }

procedure TfrmAppWindow.FormCreate(Sender: TObject);
begin
  FLoaded:= False;

  //UI
  //TODO: Add option for user to switch style...
  //TStyleManager.TrySetStyle('Carbon', False);
  TStyleManager.TrySetStyle('Windows10 DarkGray', False);
  //TStyleManager.TrySetStyle('Windows10 SlateGray', False);
  //TStyleManager.TrySetStyle('Cobalt XEMedia', False);
  //TStyleManager.TrySetStyle('Lime Graphite', False);
  ColorManager.BaseColor:= TStyleManager.ActiveStyle.GetStyleColor(TStyleColor.scWindow);
  pContent.Align:= alClient;

  Position := poDesigned;
  Width:= 1200;
  Height:= 800;

  //Tabs - TODO: Replace with new App Controller interface...
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

  //Give form its own taskbar icon...
  MakeFormIndependent(Self);

  FLoaded:= True;

  //Force form to show...
  //Show;
  //BringToFront;
  //Application.ProcessMessages;

end;

procedure TfrmAppWindow.FormDestroy(Sender: TObject);
begin

  //TODO: WHY IS THIS NOT GETTING EXECUTED?!

end;

procedure TfrmAppWindow.FormShow(Sender: TObject);
begin
  //Main Menu
  Self.ShowMenu(True);
end;

procedure TfrmAppWindow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  AppController.UnregisterWindow(Self);
  Self._Release;

  //Tabs
  FreeAndNil(FTabController);
end;

procedure TfrmAppWindow.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //Tabs
  CanClose:= TabController.CloseQuery;
end;

procedure TfrmAppWindow.TabsActiveTabChanged(Sender: TObject; ATab: TChromeTab);
begin
  //Tabs
  pContent.DisableAlign;
  try
    TabController.HandleTabChanged(ATab);
  finally
    pContent.EnableAlign;
  end;
end;

procedure TfrmAppWindow.TabsButtonAddClick(Sender: TObject; var Handled: Boolean);
begin
  //Tabs
  Handled:= True;
  OpenNewBrowserTab;
end;

function TfrmAppWindow.OpenNewBrowserTab(const URL: String = ''): TJDTabRef;
begin
  //Tabs
  var TURL:= URL;
  if TURL = '' then
    TURL:= 'https://google.com'; //TODO: Use default home page option...
  Result:= TabController.CreateTab(TfrmContentBrowser);
  (Result.Content as TfrmContentBrowser).Navigate(TURL);
  ShowMenu(False);
end;

procedure TfrmAppWindow.TabsButtonCloseTabClick(Sender: TObject; ATab: TChromeTab;
  var Close: Boolean);
begin
  //Tabs
  Close:= False;
  TabController.DeleteTab(ATab.Index);
  //TODO: This closes wrong tab if one has been moved (wrong index)...

  //TODO: This often leaves behind a void where tab used to be...

end;

procedure TfrmAppWindow.TabsCreateDragForm(Sender: TObject; ATab: TChromeTab; var DragForm: TForm);
begin
  //Tabs
  var Ref:= TabController.TabByTab(ATab);
  DragForm:= Ref.Content;
end;

procedure TfrmAppWindow.TabsNeedDragImageControl(Sender: TObject; ATab: TChromeTab; var DragControl: TWinControl);
begin

  DragControl := pContent;
end;

procedure TfrmAppWindow.TabsShowHint(Sender: TObject; HitTestResult: THitTestResult; var HintText: string;
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

procedure TfrmAppWindow.ProcessDroppedTab(Sender: TObject; X, Y: Integer;
  DragTabObject: IDragTabObject; Cancelled: Boolean;
  var TabDropOptions: TTabDropOptions);
var
  WinX, WinY: Integer;
  NewForm: IJDAppWindow;
begin
  //Tabs

  //Dragged tab has been dropped somewhere - determine where and how to handle...
  //Task #9
  //Three scenarios:
  //  - Within its original container - Default handling - No action needed
  //  - Within container in another window - Move tab and content to other window's tabs tabs
  //  - Anywhere else - Move tab and content to new window

  //TODO: Update below code to follow above rules...

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
    NewForm:= AppController.CreateNewWindow('');
    NewForm.Left := WinX;
    NewForm.Top := WinY;

    //TODO: MOVE content form and tab to new location...
    TabDropOptions := [];
    //var OldTab:= TabController.Tabs[DragTabObject.DropTabIndex];
    //NewForm.TabController.CreateTab()
    //TabController.DeleteTab(DragTabObject.DropTabIndex);


    //TODO: IMPLEMENT NEW METHOD:
    //Self.MoveTab(DragTabObject.DropTabIndex, NewForm);

  end;
end;

procedure TfrmAppWindow.TabsTabDragDrop(Sender: TObject; X, Y: Integer; DragTabObject: IDragTabObject; Cancelled: Boolean;
  var TabDropOptions: TTabDropOptions);
begin
  //Tabs

  ProcessDroppedTab(Sender, X, Y, DragTabObject, Cancelled, TabDropOptions);
end;

procedure TfrmAppWindow.AppEventsHint(Sender: TObject);
begin
  //UI
  Stat.Panels[0].Text:= Application.Hint;
end;

procedure TfrmAppWindow.SetContentOnly(const Value: Boolean);
begin
  //UI
  FContentOnly := Value;
  pTop.Visible:= not Value;
  pMenu.Visible:= not Value;
  Stat.Visible:= not Value;
end;

procedure TfrmAppWindow.SetFullScreen(const Value: Boolean);
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

procedure TfrmAppWindow.SetHeight(const Value: Integer);
begin
  inherited Height:= Value;
end;

procedure TfrmAppWindow.SetLeft(const Value: Integer);
begin
  inherited Left:= Value;
end;

procedure TfrmAppWindow.SetTop(const Value: Integer);
begin
  inherited Top:= Value;
end;

procedure TfrmAppWindow.SetWidth(const Value: Integer);
begin
  inherited Width:= Value;
end;

procedure TfrmAppWindow.Show;
begin
  inherited Show;
end;

procedure TfrmAppWindow.ShowMenu(const Value: Boolean);
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
  finally
    Self.EnableAlign;
  end;
end;

procedure TfrmAppWindow.btnMenuClick(Sender: TObject);
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

function TfrmAppWindow.GetHeight: Integer;
begin
  Result:= inherited Height;
end;

function TfrmAppWindow.GetLeft: Integer;
begin
  Result:= inherited Left;
end;

function TfrmAppWindow.GetOwner: IJDAppController;
begin
  Result:= AppController;
end;

function TfrmAppWindow.GetTab(const Index: Integer): IJDAppTabContent;
begin
  //TODO: Return reference to tab at given index...
end;

function TfrmAppWindow.GetTabCount: Integer;
begin
  Result:= Tabs.Tabs.Count;
end;

function TfrmAppWindow.GetTop: Integer;
begin
  Result:= inherited Top;
end;

function TfrmAppWindow.GetWidth: Integer;
begin
  Result:= inherited Width;
end;

function TfrmAppWindow.MenuVisible: Boolean;
begin
  //Main Menu
  Result:= pMenu.Tag = 1;
end;

function TfrmAppWindow.MoveTab(const TabIndex: Integer; ADest: IJDAppWindow): IJDAppTabContent;
begin
  //TODO: Move tab and content to destination...
end;

procedure TfrmAppWindow.Close;
begin
  inherited Close;
end;

procedure TfrmAppWindow.CloseTab(const TabIndex: Integer);
begin
  //TODO: Close the tab at given index...
end;

function TfrmAppWindow.CreateNewTab(const URI: WideString): IJDAppTabContent;
begin
  //TODO: Create new tab and navigate to URI...
  //Result:= TfrmJDAppTabContent.Create(nil, Self);

end;

end.
