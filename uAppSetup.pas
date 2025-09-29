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
  Vcl.ComCtrls, Vcl.CheckLst, uCommonCollapsePanel, uListItemBase, uSwitchListItem, uComboListItem;

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
    tabBrowser: TTabSheet;
    tabGeneral: TTabSheet;
    TabSheet1: TTabSheet;
    sbItems: TScrollBox;
    ListSwitchItem1: TListSwitchItem;
    ListSwitchItem2: TListSwitchItem;
    ScrollBox1: TScrollBox;
    ComboListItem2: TComboListItem;
    ComboListItem3: TComboListItem;
    ListSwitchItem3: TListSwitchItem;
    Label1: TLabel;
    Label3: TLabel;
    ScrollBox2: TScrollBox;
    Label5: TLabel;
    ComboListItem1: TComboListItem;
    ComboListItem4: TComboListItem;
    ListSwitchItem4: TListSwitchItem;
    ListSwitchItem5: TListSwitchItem;
    ListSwitchItem6: TListSwitchItem;
    ListSwitchItem7: TListSwitchItem;
    ListSwitchItem8: TListSwitchItem;
    procedure FormCreate(Sender: TObject);
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

end;

procedure TfrmAppSetup.FormShow(Sender: TObject);
begin
  inherited;
  LoadSetup;
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

  //TODO

end;

procedure TfrmAppSetup.SaveSetup;
begin

  //TODO

  AppSetup.SaveSetup;
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
