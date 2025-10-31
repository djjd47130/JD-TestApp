program JDTestApp;

{$WARN DUPLICATE_CTOR_DTOR OFF}

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  uAppController in 'uAppController.pas' {frmAppController},
  uAppWindow in 'uAppWindow.pas' {frmAppWindow},
  uAppTabContent in 'uAppTabContent.pas' {frmJDAppTabContent},
  uContentListBase in 'uContentListBase.pas' {frmContentListBase},
  JD.TabController in 'JD.TabController.pas',
  uMainMenu in 'uMainMenu.pas' {frmMainMenu},
  uAppSetup in 'uAppSetup.pas' {frmAppSetup},
  uContentBrowser in 'uContentBrowser.pas' {frmContentBrowser},
  JD.ListController in 'JD.ListController.pas',
  JD.AppController.Intf in 'JD.AppController.Intf.pas',
  JD.CmdLine in 'JD.CmdLine.pas',
  JD.AppController.Impl in 'JD.AppController.Impl.pas',
  uComboListItem in 'Common Forms\uComboListItem.pas' {ComboListItem: TFrame},
  uCommonChipList in 'Common Forms\uCommonChipList.pas' {frmCommonChipList: TFrame},
  uCommonCollapsePanel in 'Common Forms\uCommonCollapsePanel.pas' {frmCommonCollapsePanel: TFrame},
  uListItemBase in 'Common Forms\uListItemBase.pas' {ListItemBase: TFrame},
  uSwitchListItem in 'Common Forms\uSwitchListItem.pas' {ListSwitchItem: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.ShowMainForm:= False;
  Application.Title := 'JD Testing Grounds';
  Application.CreateForm(TfrmAppController, frmAppController);
  Application.Run;
end.
