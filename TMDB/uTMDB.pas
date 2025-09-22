unit uTMDB;

interface

uses
  System.SysUtils, System.Classes, JD.TMDB, JD.TMDB.Common,
  XSuperObject,
  uTMDBLoginBrowser;

type

  TTMDBSetup = class(TObject)
  private
    FAppSetup: ISuperObject;
    function GetAccessToken: String;
    function GetAPIAuth: TTMDBAuthMethod;
    function GetAPIKey: String;
    function GetCountry: String;
    function GetLanguage: String;
    function GetSessionGuest: Boolean;
    function GetSessionID: String;
    function GetTimezone: String;
    procedure SetAccessToken(const Value: String);
    procedure SetAPIAuth(const Value: TTMDBAuthMethod);
    procedure SetAPIKey(const Value: String);
    procedure SetCountry(const Value: String);
    procedure SetLanguage(const Value: String);
    procedure SetSessionGuest(const Value: Boolean);
    procedure SetSessionID(const Value: String);
    procedure SetTimezones(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;

    procedure LoadSetup;
    procedure SaveSetup;
    function SetupFilename: String;
    function IsConfigured: Boolean;

    property APIKey: String read GetAPIKey write SetAPIKey;
    property AccessToken: String read GetAccessToken write SetAccessToken;
    property APIAuth: TTMDBAuthMethod read GetAPIAuth write SetAPIAuth;
    property Language: String read GetLanguage write SetLanguage;
    property Country: String read GetCountry write SetCountry;
    property SessionID: String read GetSessionID write SetSessionID;
    property Timezone: String read GetTimezone write SetTimezones;
    property SessionGuest: Boolean read GetSessionGuest write SetSessionGuest;
  end;



  TdmTMDB = class(TDataModule)
    TMDB: TTMDB;
    procedure TMDBUserAuthRequest(Sender: TObject; const URL: WideString; var Result: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PrepAPI;
  end;

var
  dmTMDB: TdmTMDB;

function TMDBSetup: TTMDBSetup;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  uMain,
  uAppSetup,
  System.IOUtils;

var
  _TMDBSetup: TTMDBSetup;

function TMDBSetup: TTMDBSetup;
begin
  if not Assigned(_TMDBSetup) then
    _TMDBSetup:= TTMDBSetup.Create;
  Result:= _TMDBSetup;
end;

procedure TdmTMDB.PrepAPI;
begin
  //API Auth
  TMDB.APIKey:= TMDBSetup.APIKey;
  TMDB.AccessToken:= TMDBSetup.AccessToken;
  TMDB.AuthMethod:= TMDBSetup.APIAuth;
  //TMDB.AppUserAgent:= ''; //TODO
  //TMDB.RateLimiting:= True; //TODO
  //TMDB.RateLimitMsec:= 100; //TODO

end;


{ TTMDBSetup }

constructor TTMDBSetup.Create;
begin
  LoadSetup;

end;

destructor TTMDBSetup.Destroy;
begin

  SaveSetup;
  inherited;
end;

function TTMDBSetup.SetupFilename: String;
begin
  Result:= ExtractFilePath(ParamStr(0));
  Result:= TPath.Combine(Result, 'TMDBConfig.json');
end;

procedure TTMDBSetup.LoadSetup;
begin
  if FileExists(SetupFilename) then begin
    FAppSetup:= TSuperObject.ParseFile(SetupFilename);
  end else begin
    FAppSetup:= SO;
  end;
end;

procedure TTMDBSetup.SaveSetup;
begin
  if FAppSetup <> nil then
    FAppSetup.SaveTo(SetupFilename, True);
end;

function TTMDBSetup.GetAccessToken: String;
begin
  Result:= FAppSetup.S['access_token'];
end;

function TTMDBSetup.GetAPIAuth: TTMDBAuthMethod;
begin
  Result:= TTMDBAuthMethod(FAppSetup.I['api_auth']);
end;

function TTMDBSetup.GetAPIKey: String;
begin
  Result:= FAppSetup.S['api_key'];
end;

function TTMDBSetup.GetCountry: String;
begin
  Result:= FAppSetup.S['default_country'];
end;

function TTMDBSetup.GetLanguage: String;
begin
  Result:= FAppSetup.S['default_language'];
end;

function TTMDBSetup.GetSessionGuest: Boolean;
begin
  Result:= FAppSetup.B['session_guest'];
end;

function TTMDBSetup.GetSessionID: String;
begin
  Result:= FAppSetup.S['session_id'];
end;

function TTMDBSetup.GetTimezone: String;
begin
  Result:= FAppSetup.S['default_timezone'];
end;

function TTMDBSetup.IsConfigured: Boolean;
begin
  Result:= False;
  var Tmp:= '';
  case Self.APIAuth of
    amAPIKey: Tmp:= Self.APIKey;
    amAccessToken: Tmp:= Self.AccessToken;
  end;
  if Trim(Tmp) <> '' then
    Result:= True;
  if Result then begin
    var Res:= dmTMDB.TMDB.Authentication.ValidateKey;
    Result:= Res.Success;
  end;
end;

procedure TTMDBSetup.SetAccessToken(const Value: String);
begin
  FAppSetup.S['access_token']:= Value;
end;

procedure TTMDBSetup.SetAPIAuth(const Value: TTMDBAuthMethod);
begin
  FAppSetup.I['api_auth']:= Integer(Value);
end;

procedure TTMDBSetup.SetAPIKey(const Value: String);
begin
  FAppSetup.S['api_key']:= Value;
end;

procedure TTMDBSetup.SetCountry(const Value: String);
begin
  FAppSetup.S['default_country']:= Value;
end;

procedure TTMDBSetup.SetLanguage(const Value: String);
begin
  FAppSetup.S['default_language']:= Value;
end;

procedure TTMDBSetup.SetSessionGuest(const Value: Boolean);
begin
  FAppSetup.B['session_guest']:= Value;
end;

procedure TTMDBSetup.SetSessionID(const Value: String);
begin
  FAppSetup.S['session_id']:= Value;
end;

procedure TTMDBSetup.SetTimezones(const Value: String);
begin
  FAppSetup.S['default_timezone']:= Value;
end;


procedure TdmTMDB.TMDBUserAuthRequest(Sender: TObject; const URL: WideString; var Result: Boolean);

var
  F: TfrmTMDBLoginBrowser;
  U: String;
begin
  //User Auth

  //Open URL in web browser to authenticate user...
  //TODO: Change this to open in new tab instead of modal window...
  F:= TfrmTMDBLoginBrowser.Create(nil);
  try
    //We instruct it to redirect to our web server upon successful login...
    //U:= URL + '?redirect_to=http://localhost:'+IntToStr(TMDB.WebServer.Port)+'/authgranted';
    U:= URL + '?redirect_to=http://localhost:'+IntToStr(14200)+'/authgranted';
    //Turns out local HTTP server is totally unnecessary.
    F.LoadURL(U);
    F.ShowModal;
    Result:= F.Success;
  finally
    F.Free;
  end;
end;

initialization
  _TMDBSetup:= nil;

finalization
  FreeAndNil(_TMDBSetup);
end.
