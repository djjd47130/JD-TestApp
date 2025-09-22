unit uAppSetup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uContentBase, Vcl.StdCtrls, Vcl.ExtCtrls,
  XSuperObject,
  //JD.TMDB.Common,
  //JD.TMDB.Intf,
  JD.Common, JD.Ctrls, JD.Ctrls.FontButton,
  JD.TabController,
  uContentBrowser,
  Vcl.ComCtrls, Vcl.CheckLst, uCommonCollapsePanel;

type

  TAppSetup = class(TObject)
  private
    FAppSetup: ISuperObject;

  public
    constructor Create;
    destructor Destroy; override;

    procedure LoadSetup;
    procedure SaveSetup;
    function SetupFilename: String;

    function IsConfigured: Boolean;

  end;

  TfrmAppSetup = class(TfrmContentBase)
    btnSave: TJDFontButton;
    Pages: TPageControl;
    tabAPIAuth: TTabSheet;
    tabBrowser: TTabSheet;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    Panel4: TPanel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    sbTMDB: TScrollBox;
    gbAPIAuthMethod: TGroupBox;
    gbAPIAuthMethodAPIKey: TPanel;
    Label1: TLabel;
    txtAPIKey: TEdit;
    gbAPIAuthMethodAccessToken: TPanel;
    Label3: TLabel;
    txtAccessToken: TEdit;
    Panel2: TPanel;
    rAuthToken: TRadioButton;
    rAuthKey: TRadioButton;
    btnValidateKey: TButton;
    gbLocaleOptions: TGroupBox;
    Panel6: TPanel;
    Label5: TLabel;
    cboLanguage: TComboBox;
    Panel5: TPanel;
    Label6: TLabel;
    cboCountry: TComboBox;
    Panel1: TPanel;
    Label7: TLabel;
    cboTimeZone: TComboBox;
    pTMDBAuth: TfrmCommonCollapsePanel;
    Label8: TLabel;
    Label9: TLabel;
    tabGeneral: TTabSheet;
    GroupBox2: TGroupBox;
    Panel8: TPanel;
    Label11: TLabel;
    ComboBox2: TComboBox;
    Panel7: TPanel;
    Label10: TLabel;
    ComboBox3: TComboBox;
    procedure FormCreate(Sender: TObject);

    procedure APIAuthMethodRadioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure txtAPIKeyChange(Sender: TObject);
    procedure txtAccessTokenChange(Sender: TObject);
    procedure cboLanguageChange(Sender: TObject);
    procedure Label9Click(Sender: TObject);
  private

  public
    procedure LoadSetup;
    procedure SaveSetup;

  end;

var
  frmAppSetup: TfrmAppSetup;

implementation

{$R *.dfm}

uses
  System.IOUtils,
  uMain;

{ TAppSetup }

constructor TAppSetup.Create;
begin
  LoadSetup;

end;

destructor TAppSetup.Destroy;
begin

  SaveSetup;
  inherited;
end;

function TAppSetup.IsConfigured: Boolean;
begin
  Result:= True; //TEMP


end;

function TAppSetup.SetupFilename: String;
begin
  Result:= ExtractFilePath(ParamStr(0));
  Result:= TPath.Combine(Result, 'AppConfig.json');
end;

procedure TAppSetup.LoadSetup;
begin
  if FileExists(SetupFilename) then begin
    FAppSetup:= TSuperObject.ParseFile(SetupFilename);
  end else begin
    FAppSetup:= SO;
  end;
end;

procedure TAppSetup.SaveSetup;
begin
  if FAppSetup <> nil then
    FAppSetup.SaveTo(SetupFilename, True);
end;

{ TfrmAppSetup }

procedure TfrmAppSetup.FormCreate(Sender: TObject);
begin
  inherited;
  //Setup UI
  Pages.Align:= alClient;

  sbTMDB.Align:= alClient;


end;

procedure TfrmAppSetup.FormShow(Sender: TObject);
begin
  inherited;
  LoadSetup;
  {
  if not AppSetup.IsConfigured then begin
    //TODO: Hide all other tabs...
    Self.Pages.ActivePage:= tabAPIAuth;
  end else begin

    btnSave.Enabled:= False;
  end;
  }
end;

procedure TfrmAppSetup.Label9Click(Sender: TObject);
begin
  inherited;
  //Navigate to TMDB API page
  var F:= TabController.CreateTab(TfrmContentBrowser);
  TfrmContentBrowser(F.Content).Navigate('https://www.themoviedb.org/settings/api');
end;

procedure TfrmAppSetup.LoadSetup;
begin


end;

procedure TfrmAppSetup.SaveSetup;
begin

  AppSetup.SaveSetup;
end;

procedure TfrmAppSetup.APIAuthMethodRadioClick(Sender: TObject);
var
  T: Integer;
  procedure HideAll;
  begin
    gbAPIAuthMethodAPIKey.Visible:= False;
    gbAPIAuthMethodAccessToken.Visible:= False;
  end;
begin
  inherited;
  HideAll;
  T:= TControl(Sender).Tag;
  case T of
    0: gbAPIAuthMethodAPIKey.Visible:= True;
    1: gbAPIAuthMethodAccessToken.Visible:= True;
  end;
  btnSave.Enabled:= True;
end;

procedure TfrmAppSetup.btnSaveClick(Sender: TObject);
begin
  inherited;
  //TODO: Validate setup...

  //TODO: Re-enable app-wide controls if valid...
  //frmMain.Menu.EnableTMDBItems(True);

  SaveSetup;
  btnSave.Enabled:= False;
end;

procedure TfrmAppSetup.cboLanguageChange(Sender: TObject);
begin
  inherited;
  btnSave.Enabled:= True;
end;

procedure TfrmAppSetup.txtAccessTokenChange(Sender: TObject);
begin
  inherited;
  btnSave.Enabled:= True;
end;

procedure TfrmAppSetup.txtAPIKeyChange(Sender: TObject);
begin
  inherited;
  btnSave.Enabled:= True;
end;

end.
