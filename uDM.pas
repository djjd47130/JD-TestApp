unit uDM;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes, Vcl.AppEvnts,
  JD.Favicons, System.ImageList,
  Vcl.Forms, Vcl.ImgList, Vcl.Controls,
  uAppSetup;

type
  TDM = class(TDataModule)
    imgFavicons16: TImageList;
    Favicons: TJDFavicons;
    AppEvents: TApplicationEvents;
    procedure FaviconsLookupFavicon(Sender: TObject; const URI: string; Ref: TJDFaviconRef; var Handled: Boolean);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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



  //TODO: Handle command line...
  var Cmd:= TCmdLine.Create;
  try

    if Trim(Cmd.OpenFilename) <> '' then  begin
      //TODO: Open filename as URI...

    end;

    if Cmd.Exists('private', True) or Cmd.Exists('p', True) then begin
      //TODO: Open in private browsing mode...

    end;

    if Cmd.Exists('content', True) or Cmd.Exists('c', True) then begin
      //TODO: Open window as content only (single tab, no menu)...

    end;


  finally
    Cmd.Free;
  end;
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
