unit uTMDBSetup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uContentBase, uTMDBContentBase,
  Vcl.StdCtrls, Vcl.ExtCtrls, uCommonCollapsePanel,
  JD.TMDB.Common, JD.TMDB.Intf,
  JD.TabController,
  JD.Common, JD.Ctrls, JD.Ctrls.FontButton,
  XSuperObject,
  uTMDB,
  uContentBrowser;

type


  TfrmTMDBSetup = class(TfrmTMDBContentBase)
    sbTMDB: TScrollBox;
    gbAPIAuthMethod: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
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
    btnSave: TJDFontButton;
    procedure FormCreate(Sender: TObject);
    procedure sbTMDBMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure sbTMDBMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);

    procedure APIAuthMethodRadioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PagesChanging(Sender: TObject; var AllowChange: Boolean);
    procedure Label9Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnValidateKeyClick(Sender: TObject);
    procedure txtAPIKeyChange(Sender: TObject);
  private
    function GetAPIAuth: TTMDBAuthMethod;
    procedure SetAPIAuth(const Value: TTMDBAuthMethod);

  public
    procedure LoadSetup;
    procedure SaveSetup;

    property APIAuth: TTMDBAuthMethod read GetAPIAuth write SetAPIAuth;
  end;

var
  frmTMDBSetup: TfrmTMDBSetup;

implementation

{$R *.dfm}

procedure TfrmTMDBSetup.APIAuthMethodRadioClick(Sender: TObject);
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

procedure TfrmTMDBSetup.btnSaveClick(Sender: TObject);
begin
  inherited;
  //TODO: Validate setup...

  //TODO: Re-enable app-wide controls if valid...
  //frmMain.Menu.EnableTMDBItems(True);

  SaveSetup;
  btnSave.Enabled:= False;
end;

procedure TfrmTMDBSetup.btnValidateKeyClick(Sender: TObject);
var
  O: ITMDBAuthValidateKeyResult;
begin
  inherited;
  PrepAPI;
  O:= TMDB.Client.Authentication.ValidateKey;
  ShowMessage('API Key Validation Result: '+O.StatusMessage);
end;

procedure TfrmTMDBSetup.FormCreate(Sender: TObject);
begin
  inherited;
  sbTMDB.Align:= alClient;

  //var F:= TfrmCommonCollapsePanel.Create(sbTMDB);
  //F.Parent:= sbTMDB;
  //F.Align:= alTop;
  //F.Top:= -1;
end;

procedure TfrmTMDBSetup.FormShow(Sender: TObject);
begin
  LoadSetup;
  PrepAPI;
  if not TMDBSetup.IsConfigured then begin
    //TODO: Hide all other tabs...
    //Self.Pages.ActivePage:= tabAPIAuth;
  end else begin
    TMDB.ListPrimaryTranslations(cboLanguage.Items);
    TMDB.ListLanguages(cboLanguage.Items);
    TMDB.ListCountries(cboCountry.Items);
    TMDB.ListTimeZones(cboTimezone.Items, cboCountry.Text);
    btnSave.Enabled:= False;
  end;
end;

function TfrmTMDBSetup.GetAPIAuth: TTMDBAuthMethod;
begin
  if rAuthKey.Checked then
    Result:= TTMDBAuthMethod.amAPIKey
  else
    Result:= TTMDBAuthMethod.amAccessToken;
end;

procedure TfrmTMDBSetup.Label9Click(Sender: TObject);
begin
  //Navigate to TMDB API page
  var F:= TabController.CreateTab(TfrmContentBrowser);
  TfrmContentBrowser(F.Content).Navigate('https://www.themoviedb.org/settings/api');
end;

procedure TfrmTMDBSetup.LoadSetup;
begin
  //TODO: Check whether API is properly configured...

  txtAPIKey.Text:= TMDBSetup.APIKey;
  txtAccessToken.Text:= TMDBSetup.AccessToken;
  APIAuth:= TMDBSetup.APIAuth;

  cboLanguage.Text:= TMDBSetup.Language;
  cboCountry.Text:= TMDBSetup.Country;
  TMDB.ListTimeZones(cboTimezone.Items, cboCountry.Text);
  cboTimezone.Text:= TMDBSetup.Timezone;
end;

procedure TfrmTMDBSetup.PagesChanging(Sender: TObject; var AllowChange: Boolean);
begin
  //TODO: Prevent changing to TMDB-specific tabs if app isn't properly configured yet..
end;

procedure TfrmTMDBSetup.SaveSetup;
begin

  TMDBSetup.APIKey:= txtAPIKey.Text;
  TMDBSetup.AccessToken:= txtAccessToken.Text;
  TMDBSetup.APIAuth:= APIAuth;
  TMDBSetup.Language:= cboLanguage.Text;
  TMDBSetup.Country:= cboCountry.Text;
  TMDBSetup.Timezone:= cboTimezone.Text;

  TMDBSetup.SaveSetup;
end;

procedure TfrmTMDBSetup.sbTMDBMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
begin
  inherited;
  sbTMDB.VertScrollBar.Position:= sbTMDB.VertScrollBar.Position + 20;
end;

procedure TfrmTMDBSetup.sbTMDBMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  inherited;
  sbTMDB.VertScrollBar.Position:= sbTMDB.VertScrollBar.Position - 20;
end;

procedure TfrmTMDBSetup.SetAPIAuth(const Value: TTMDBAuthMethod);
var
  R: TRadioButton;
begin
  case Value of
    amAPIKey: R:= rAuthKey;
    else R:= rAuthToken;
  end;
  R.Checked:= True;
  APIAuthMethodRadioClick(R);
end;

procedure TfrmTMDBSetup.txtAPIKeyChange(Sender: TObject);
begin
  inherited;

  btnSave.Enabled:= True;
end;

end.
