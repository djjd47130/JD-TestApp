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
  TfrmAppController = class(TForm {, IJDAppController} )
    imgFavicons16: TImageList;
    Favicons: TJDFavicons;
    AppEvents: TApplicationEvents;
    ElTrayIcon1: TElTrayIcon;
    PopupMenu1: TPopupMenu;
    Show1: TMenuItem;
    Show2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Show2Click(Sender: TObject);
    procedure FaviconsLookupFavicon(Sender: TObject; const URI: string; Ref: TJDFaviconRef; var Handled: Boolean);
  private
    //Global instance of app controller
  public
    procedure InitAppController;
    procedure HandleCmdLine(const CmdLine: String);
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

procedure TfrmAppController.FaviconsLookupFavicon(Sender: TObject; const URI: string; Ref: TJDFaviconRef;
  var Handled: Boolean);
begin
  //ReportMemoryLeaksOnShutdown:= True;

  //Tabs
  //TODO: Return image if not a web URL...
end;

procedure TfrmAppController.FormCreate(Sender: TObject);
begin

  //APPLICATION STARTUP LOGIC STARTS HEREp.

  InitAppController;

  //TEMPORARILY DISABLED
  //HandleCmdLine(System.CmdLine);


  //Create the initial "main" form...
  var F:= TfrmAppWindow.Create(Application, nil);
  F.Show;
end;

procedure TfrmAppController.HandleCmdLine(const CmdLine: String);
begin

  // Handle command line...
  var Cmd:= TCmdLine.Create;
  try
    Cmd.AsString:= CmdLine;

    if Trim(Cmd.OpenFilename) <> '' then  begin
      //TODO: Open filename as URI...
      //frmAppWindow.OpenNewBrowserTab(Cmd.OpenFilename);
      //  Can't do this because frmAppWindow isn't created yet!

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

procedure TfrmAppController.InitAppController;
begin
  //TODO
end;

procedure TfrmAppController.Show2Click(Sender: TObject);
begin
  Application.Terminate;
end;

initialization
  _Forms:= TObjectList<TfrmAppWindow>.Create(False);
finalization
  FreeAndNil(_Forms);
end.
