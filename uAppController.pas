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
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  JD.Favicons,
  uAppWindow,
  uAppSetup,
  JD.AppController.Intf,
  Vcl.Menus, ElComponent, ElBaseComp, ElTray, Vcl.AppEvnts, System.ImageList, Vcl.ImgList;

type
  TfrmAppController = class(TForm, IJDAppController)
    imgFavicons16: TImageList;
    Favicons: TJDFavicons;
    AppEvents: TApplicationEvents;
    TrayIcon: TElTrayIcon;
    pmTray: TPopupMenu;
    mShow: TMenuItem;
    mExit: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure mExitClick(Sender: TObject);
    procedure FaviconsLookupFavicon(Sender: TObject; const URI: string; Ref: TJDFaviconRef; var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    FPlugins: TInterfaceList;
    FWindows: TInterfaceList;
    FAppSetup: IJDAppSetup;
    FFavicons: IJDAppFavicons;
    procedure HandleCmdLine(const CmdLine: WideString);
  protected
    //From IJDAppController:
    function GetWindowCount: Integer stdcall;
    function GetWindow(const Index: Integer): IJDAppWindow stdcall;
    function GetAppSetup: IJDAppSetup stdcall;
    function GetFavicons: IJDAppFavicons stdcall;
  public
    //From IJDAppController:
    procedure Initialize stdcall;
    procedure Uninitialize stdcall;
    procedure RegisterWindow(AWindow: IJDAppWindow) stdcall;
    procedure UnregisterWindow(AWindow: IJDAppWindow) stdcall;
    procedure HandleURI(const URI: WideString) stdcall;
    function CreateNewWindow(const URI: WideString = ''): IJDAppWindow stdcall;
    procedure CloseWindow(const Index: Integer) stdcall;
    property WindowCount: Integer read GetWindowCount;
    property Windows[const Index: Integer]: IJDAppWindow read GetWindow; default;
  end;

var
  frmAppController: TfrmAppController;

function AppController: IJDAppController;




function AppSetup: TAppSetup;

implementation

{$R *.dfm}

uses
  JD.CmdLine;

var
  _AppController: IJDAppController;

function AppController: IJDAppController;
begin
  if _AppController = nil then
    _AppController:= IJDAppController(frmAppController);
  Result:= _AppController;
end;

var
  _AppSetup: TAppSetup;

//TODO: OLD, migrage into TfrmAppController...
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
  //TODO: App Setup...
  //TODO: Favicons...

  Initialize;
end;

procedure TfrmAppController.FormDestroy(Sender: TObject);
begin
  Uninitialize;

  //TODO: Favicons...
  //TODO: App Setup...
  FreeAndNil(FWindows);
  FreeAndNil(FPlugins);
end;

function TfrmAppController.GetAppSetup: IJDAppSetup;
begin
  Result:= FAppSetup;
end;

function TfrmAppController.GetFavicons: IJDAppFavicons;
begin
  Result:= FFavicons;
end;

function TfrmAppController.GetWindow(const Index: Integer): IJDAppWindow;
begin
  Result:= IJDAppWindow(FWindows[Index]);
end;

function TfrmAppController.GetWindowCount: Integer;
begin
  Result:= FWindows.Count;
end;

procedure TfrmAppController.Initialize;
begin
  //TODO: Load all plugins...

  //TODO: Load saved windows / tabs...

  //TODO: Load icon cache...

  //Handle the command line, if any...
  {$WARN SYMBOL_PLATFORM OFF}
  HandleCmdLine(System.CmdLine);
  {$WARN SYMBOL_PLATFORM ON}
end;

procedure TfrmAppController.Uninitialize;
begin
  //TODO: Save icon cache...

  //TODO: Save window / tab states...

  //TODO: Destroy tabs and app windows...

  //TODO: Unload all plugins...

end;

procedure TfrmAppController.HandleCmdLine(const CmdLine: WideString);
begin

  // Handle command line...
  var Cmd:= TCmdLine.Create;
  try
    Cmd.AsString:= CmdLine;

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
  CreateNewWindow(URI);

end;

procedure TfrmAppController.CloseWindow(const Index: Integer);
begin
  var F:= GetWindow(Index);
  FWindows.Delete(Index);
  F.Close;
end;

function TfrmAppController.CreateNewWindow(const URI: WideString): IJDAppWindow;
begin
  Result:= TfrmAppWindow.Create(Application, nil);
  FWindows.Add(Result);
  Result.Show;
end;

procedure TfrmAppController.FaviconsLookupFavicon(Sender: TObject; const URI: string; Ref: TJDFaviconRef;
  var Handled: Boolean);
begin
  //Tabs
  //TODO: Return image if not a web URL...
end;

procedure TfrmAppController.mExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmAppController.RegisterWindow(AWindow: IJDAppWindow);
begin
  FWindows.Add(AWindow);
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
