unit uAppController;

(*
  MASTER FORM
  This unit acts as the application's "main form", since VCL basically requires it.
  However, this form is never seen. It merely controles the lifecycle of
  multiple instances of the actual main form (uAppWindow.pas). The main purpose is
  to prevent any one form from becoming the "main form", and allow any number
  of instances at any given time.
*)

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections, System.ImageList,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus, Vcl.AppEvnts, Vcl.ImgList, Vcl.Themes,
  XSuperObject,
  JD.Favicons, JD.Graphics,

  ElComponent, ElBaseComp, ElTray,

  JD.AppController.Intf,
  JD.AppController.Impl,

  uAppWindow,
  uAppSetup;

type
  TfrmAppController = class(TForm, IJDAppController)
    imgFavicons16: TImageList;
    Favicons: TJDFavicons;
    AppEvents: TApplicationEvents;
    TrayIcon: TElTrayIcon;
    pmTray: TPopupMenu;
    mShow: TMenuItem;
    mExit: TMenuItem;
    mNewWindow: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mExitClick(Sender: TObject);
    procedure mShowClick(Sender: TObject);
    procedure FaviconsLookupFavicon(Sender: TObject; const URI: string; Ref: TJDFaviconRef; var Handled: Boolean);
    procedure mNewWindowClick(Sender: TObject);
  private
    FPlugins: TInterfaceList;
    FWindows: TInterfaceList;
    FTabs: TInterfaceList;
    FAppSetup: IJDAppSetup;
    FFavicons: IJDAppFavicons;
    procedure Initialize stdcall;
    procedure Uninitialize stdcall;
    procedure InitPlugins;
    procedure UninitPlugins;
    procedure HandleCmdLine(const CmdLine: WideString);
    function PluginsRegFilename: WideString;
  protected
    //From IJDAppController:
    function GetPluginCount: Integer stdcall;
    function GetPlugin(const Index: Integer): IJDAppPlugin stdcall;
    function GetWindowCount: Integer stdcall;
    function GetWindow(const Index: Integer): IJDAppWindow stdcall;
    function GetTabCount: Integer stdcall;
    function GetTab(const Index: Integer): IJDAppTabContent stdcall;
    function GetAppSetup: IJDAppSetup stdcall;
    function GetFavicons: IJDAppFavicons stdcall;
  public
    //From IJDAppController:
    procedure RegisterWindow(AWindow: IJDAppWindow) stdcall;
    procedure UnregisterWindow(AWindow: IJDAppWindow) stdcall;
    procedure HandleURI(const URI: WideString) stdcall;
    function CreateNewWindow(const URI: WideString = ''): IJDAppWindow stdcall;
    procedure CloseWindow(const Index: Integer) stdcall;
    procedure RegisterContent(AContent: IJDAppTabContent) stdcall;
    procedure UnregisterContent(AContent: IJDAppTabContent) stdcall;

    property PluginCount: Integer read GetPluginCount;
    property Plugins[const Index: Integer]: IJDAppPlugin read GetPlugin;
    property WindowCount: Integer read GetWindowCount;
    property Windows[const Index: Integer]: IJDAppWindow read GetWindow; default;
    property TabCount: Integer read GetTabCount;
    property Tabs[const Index: Integer]: IJDAppTabContent read GetTab;
    property AppSetup: IJDAppSetup read GetAppSetup;
  end;

var
  frmAppController: TfrmAppController;

function AppController: IJDAppController;

function AppSetup: TAppSetup;

implementation

{$R *.dfm}

uses
  JD.CmdLine,
  IdURI,
  System.IOUtils;

var
  _AppController: IJDAppController;

function AppController: IJDAppController;
begin
  if _AppController = nil then
    _AppController:= IJDAppController(frmAppController);
  Result:= _AppController;
end;



//TODO: OLD, migrage into TfrmAppController using new IJDAppSetup...
var
  _AppSetup: TAppSetup;

function AppSetup: TAppSetup;
begin
  if _AppSetup = nil then
    _AppSetup:= TAppSetup.Create;
  Result:= _AppSetup;
end;



{ TfrmAppController }

procedure TfrmAppController.FormCreate(Sender: TObject);
begin

  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown:= True;
  {$ENDIF}

  //APPLICATION STARTUP LOGIC STARTS HERE
  FPlugins:= TInterfaceList.Create;
  FWindows:= TInterfaceList.Create;
  FTabs:= TInterfaceList.Create;
  FAppSetup:= TJDAppSetup.Create;
  FAppSetup._AddRef;
  //TODO: Favicons...

  //TODO: Add option for user to switch style...
  TStyleManager.TrySetStyle('Windows10 DarkGray', False);
  //TStyleManager.TrySetStyle('Carbon', False);
  //TStyleManager.TrySetStyle('Windows10 SlateGray', False);
  //TStyleManager.TrySetStyle('Cobalt XEMedia', False);
  //TStyleManager.TrySetStyle('Lime Graphite', False);
  ColorManager.BaseColor:= TStyleManager.ActiveStyle.GetStyleColor(TStyleColor.scWindow);

  ShowWindow(Self.Handle, SW_HIDE); //Attempted bug fix #22

  Initialize;
end;

procedure TfrmAppController.FormDestroy(Sender: TObject);
begin
  Uninitialize;

  //TODO: Favicons...
  FAppSetup._Release;
  FAppSetup:= nil;
  FreeAndNil(FTabs);
  FreeAndNil(FWindows);
  FreeAndNil(FPlugins);
end;

procedure TfrmAppController.Initialize;
begin
  InitPlugins;

  //TODO: Load saved windows / tabs...

  //TODO: Load icon cache...

  //Handle the command line, if any...
  {$WARN SYMBOL_PLATFORM OFF}
  HandleCmdLine(System.CmdLine);
  {$WARN SYMBOL_PLATFORM ON}

  Self.Hide;
end;

procedure TfrmAppController.Uninitialize;
begin
  //TODO: Save icon cache...

  //TODO: Save window / tab states...

  //TODO: Destroy tabs and app windows...

  UninitPlugins;
end;

function TfrmAppController.PluginsRegFilename: WideString;
begin
  Result:= ExtractFilePath(Application.ExeName);
  Result:= TPath.Combine(Result, FAppSetup.PluginsReg);
end;

procedure TfrmAppController.InitPlugins;
begin
  //TODO: Load all registered plugins...
  var O: ISuperObject:= TSuperObject.ParseFile(PluginsRegFilename);
  var A: ISuperArray:= O.A['plugins'];
  for var X := 0 to A.Length-1 do begin
    var PO:= A.O[X];
    var PluginFilename:= PO.S['path'];
    var PluginEnabled:= PO.B['enabled'];
    if PluginEnabled then begin
      if FileExists(PluginFilename) then begin

        //TODO: Load DLL and get proc addresses...

        //TODO: Instantiate plugin object...

        //TODO: Add to registered plugin list...

      end else begin
        //TODO: Plugin file not found...

      end;
    end;
  end;

end;

procedure TfrmAppController.UninitPlugins;
begin
  //TODO: Unload all loaded plugins...
  for var X := 0 to FPlugins.Count-1 do begin
    var P:= Self.Plugins[X];
    //TODO: Gracefully destruct plugin object...

  end;
end;

function TfrmAppController.GetAppSetup: IJDAppSetup;
begin
  Result:= FAppSetup;
end;

function TfrmAppController.GetFavicons: IJDAppFavicons;
begin
  Result:= FFavicons;
end;

function TfrmAppController.GetPlugin(const Index: Integer): IJDAppPlugin;
begin
  Result:= IJDAppPlugin(FPlugins[Index]);
end;

function TfrmAppController.GetPluginCount: Integer;
begin
  Result:= FPlugins.Count;
end;

function TfrmAppController.GetTab(const Index: Integer): IJDAppTabContent;
begin
  Result:= IJDAppTabContent(FTabs[Index]);
end;

function TfrmAppController.GetTabCount: Integer;
begin
  Result:= FTabs.Count;
end;

function TfrmAppController.GetWindow(const Index: Integer): IJDAppWindow;
begin
  Result:= IJDAppWindow(FWindows[Index]);
end;

function TfrmAppController.GetWindowCount: Integer;
begin
  Result:= FWindows.Count;
end;

procedure TfrmAppController.HandleCmdLine(const CmdLine: WideString);
begin

  // Handle command line...
  var Cmd:= TCmdLine.Create;
  try
    Cmd.AsString:= CmdLine;

    //TODO: Check for existing app instance...
    //  If none found, proceed...
    //  If instance found...
    //  - If URI provided, show and open new tab in active window...
    //  - If no URI provided, just show active window...

    if Trim(Cmd.OpenFilename) <> '' then  begin
      //TODO: Open filename as URI...
      HandleURI(Cmd.OpenFilename);
    end else begin
      //TODO: Open new tab to default...
      CreateNewWindow('');
    end;

    if Cmd.Exists('private', True) or Cmd.Exists('p', True) then begin
      //TODO: Open in private browsing mode...

    end;

    if Cmd.Exists('content', True) or Cmd.Exists('c', True) then begin
      //TODO: Open window as content only (single tab, no menu)...

    end;

    if Cmd.Exists('kiosk', True) or Cmd.Exists('k', True) then begin
      //TODO: Open window as full-screen kiosk mode...

    end;



  finally
    Cmd.Free;
  end;
end;

procedure TfrmAppController.HandleURI(const URI: WideString);
begin
  //Handle internal URI / Shell command...
  //TODO: Strategically decide how to handle URI. For example, some things might
  //  want to prevent duplicate instances, and open the existing instance.

  CreateNewWindow(URI);

end;

function TfrmAppController.CreateNewWindow(const URI: WideString): IJDAppWindow;
begin
  Result:= TfrmAppWindow.Create(nil);
  Result._AddRef;
  FWindows.Add(Result);
  Result.Show;

  //TODO: Navigate to URI...

end;

procedure TfrmAppController.CloseWindow(const Index: Integer);
begin
  var F:= GetWindow(Index);
  FWindows.Delete(Index);
  F.Close;
end;

procedure TfrmAppController.FaviconsLookupFavicon(Sender: TObject; const URI: string; Ref: TJDFaviconRef;
  var Handled: Boolean);
begin
  //Tabs
  //TODO: Return image if not a web URL...
  var U:= TIdURI.Create(URI);
  try
    if (not SameText(U.Protocol, 'http')) and (not SameText(U.Protocol, 'https')) then begin
      //Protocol is not HTTP or HTTPS, use different approach to fetch favicon...

    end;
  finally
    U.Free;
  end;
end;

procedure TfrmAppController.mExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmAppController.mNewWindowClick(Sender: TObject);
begin
  AppController.CreateNewWindow('');
end;

procedure TfrmAppController.mShowClick(Sender: TObject);
begin
  if AppController.WindowCount > 0 then
    Self.Windows[0].Show;
end;

procedure TfrmAppController.RegisterWindow(AWindow: IJDAppWindow);
begin
  FWindows.Add(AWindow);
end;

procedure TfrmAppController.RegisterContent(AContent: IJDAppTabContent);
begin
  FTabs.Add(AContent);
end;

procedure TfrmAppController.UnregisterContent(AContent: IJDAppTabContent);
begin
  var I:= FTabs.IndexOf(AContent);
  FTabs.Delete(I);
  //TODO
end;

procedure TfrmAppController.UnregisterWindow(AWindow: IJDAppWindow);
begin
  var I:= FWindows.IndexOf(AWindow);
  FWindows.Delete(I);
  if WindowCount = 0 then
    Application.Terminate;
end;

initialization
  _AppController:= nil;
finalization
  _AppController:= nil;
end.
