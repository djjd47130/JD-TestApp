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
    procedure HandleURI(const URI: WideString) stdcall;
    function CreateNewWindow(const URI: WideString = ''): IJDAppWindow stdcall;
    procedure CloseWindow(const Index: Integer) stdcall;
    property WindowCount: Integer read GetWindowCount;
    property Windows[const Index: Integer]: IJDAppWindow read GetWindow; default;
  end;

var
  frmAppController: TfrmAppController;

function AppSetup: TAppSetup;

procedure RegisterForm(AForm: TfrmAppWindow);
procedure UnregisterForm(AForm: TfrmAppWindow);
function RegisteredForms: TObjectList<TfrmAppWindow>;

implementation

{$R *.dfm}

uses
  JD.CmdLine;

var
  _Forms: TObjectList<TfrmAppWindow>;
  _AppSetup: TAppSetup;

//TODO: OLD, migrage into TfrmAppController...
function AppSetup: TAppSetup;
begin
  if _AppSetup = nil then
    _AppSetup:= TAppSetup.Create;
  Result:= _AppSetup;
end;

procedure RegisterForm(AForm: TfrmAppWindow);
begin
  _Forms.Add(AForm);
end;

procedure UnregisterForm(AForm: TfrmAppWindow);
begin
  var I:= _Forms.IndexOf(AForm);
  _Forms.Delete(I);
end;

function RegisteredForms: TObjectList<TfrmAppWindow>;
begin
  Result:= _Forms;
end;

{ TfrmAppController }

procedure TfrmAppController.FormCreate(Sender: TObject);
begin

  ReportMemoryLeaksOnShutdown:= True;

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
  //Create the initial "main" form...
  CreateNewWindow('');
  //var F:= TfrmAppWindow.Create(Application, nil);
  //F.Show;

  //Load saved windows / tabs...

  //Load icon cache...

  //Finally, handle the command line...
  HandleCmdLine(System.CmdLine);
end;

procedure TfrmAppController.Uninitialize;
begin
  //TODO: Save icon cache...

  //TODO: Save window / tab states...

  //TODO: Destroy tabs and app windows...

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

end;

procedure TfrmAppController.CloseWindow(const Index: Integer);
begin
  var F:= GetWindow(Index);
  F.Close;
end;

function TfrmAppController.CreateNewWindow(const URI: WideString): IJDAppWindow;
begin
  Result:= TfrmAppWindow.Create(Application, nil);
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

initialization
  _Forms:= TObjectList<TfrmAppWindow>.Create(False);
finalization
  FreeAndNil(_Forms);
end.
