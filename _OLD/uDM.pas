unit uDM;

(*
  Global Data Module controlling entire application.
  - Manages lifecycle of windows and tabs



*)

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes, Vcl.AppEvnts,
  JD.Favicons, System.ImageList,
  Vcl.Forms, Vcl.ImgList, Vcl.Controls,
  uAppSetup,
  JD.AppController.Intf, LMDCustomComponent, LMDWndProcComponent, LMDTrayIcon, Vcl.JumpList, System.Win.TaskbarCore,
  Vcl.Taskbar, ElComponent, ElBaseComp, ElTray, Vcl.Menus;

type
  TDM = class(TDataModule)
    imgFavicons16: TImageList;
    Favicons: TJDFavicons;
    AppEvents: TApplicationEvents;
    ElTrayIcon1: TElTrayIcon;
    PopupMenu1: TPopupMenu;
    Show1: TMenuItem;
    Show2: TMenuItem;
    procedure FaviconsLookupFavicon(Sender: TObject; const URI: string; Ref: TJDFaviconRef; var Handled: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure Show2Click(Sender: TObject);
  private
    //Global instance of app controller
    FAppController: IJDAppController;
  public
    procedure InitAppController;
    procedure HandleCmdLine(const CmdLine: String);

  end;

var
  DM: TDM;

function AppSetup: TAppSetup;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  JD.CmdLine,
  uMain;

var
  _AppSetup: TAppSetup;

function AppSetup: TAppSetup;
begin
  if _AppSetup = nil then
    _AppSetup:= TAppSetup.Create;
  Result:= _AppSetup;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  //APPLICATION STARTUP LOGIC STARTS HERE
  //  "DM" is a data module created before any other forms.
  //  It is responsible for managing the entirety of the app.

  InitAppController;

  //TEMPORARILY DISABLED
  //HandleCmdLine(System.CmdLine);


end;

procedure TDM.HandleCmdLine(const CmdLine: String);
begin

  // Handle command line...
  var Cmd:= TCmdLine.Create;
  try
    Cmd.AsString:= CmdLine;

    if Trim(Cmd.OpenFilename) <> '' then  begin
      //TODO: Open filename as URI...
      frmMain.OpenNewBrowserTab(Cmd.OpenFilename);
      //  Can't do this because frmMain isn't created yet!

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

procedure TDM.InitAppController;
begin

end;

procedure TDM.Show2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TDM.FaviconsLookupFavicon(Sender: TObject; const URI: string; Ref: TJDFaviconRef; var Handled: Boolean);
begin

  //Tabs
  //TODO: Return image if not a web URL...
end;

initialization
  _AppSetup:= nil;
finalization
  FreeAndNil(_AppSetup);
end.
