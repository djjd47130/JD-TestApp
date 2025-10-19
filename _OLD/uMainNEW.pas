unit uMainNEW;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.AppEvnts,
  Vcl.ComCtrls, Vcl.ExtCtrls,
  JD.Common, JD.Ctrls, JD.Ctrls.FontButton,
  ChromeTabs, ChromeTabsClasses, ChromeTabsTypes,

  JD.AppController.Intf;

type
  TfrmMainNEW = class(TForm)
    pTop: TPanel;
    Tabs: TChromeTabs;
    btnMenu: TJDFontButton;
    pContent: TPanel;
    Stat: TStatusBar;
    pMenu: TPanel;
    AppEvents: TApplicationEvents;
    procedure TabsButtonAddClick(Sender: TObject; var Handled: Boolean);
    procedure TabsButtonCloseTabClick(Sender: TObject; ATab: TChromeTab; var Close: Boolean);
  private
    FAppWindow: IJDAppWindow;
  public
    constructor Create(AppWindow: IJDAppWindow; const Navigate: String = ''); reintroduce; virtual;
    destructor Destroy; override;

  end;

var
  frmMainNEW: TfrmMainNEW;

implementation

{$R *.dfm}

uses
  uAppController;

{ TfrmMainNEW }

constructor TfrmMainNEW.Create(AppWindow: IJDAppWindow; const Navigate: String = '');
begin
  inherited Create(nil);
  FAppWindow:= AppWindow;
  if Trim(Navigate) <> '' then begin
    //TODO: Open URI in new tab...

  end;
end;

destructor TfrmMainNEW.Destroy;
begin

  inherited;
end;

procedure TfrmMainNEW.TabsButtonAddClick(Sender: TObject; var Handled: Boolean);
begin
  //Open new tab and navigate to default...

end;

procedure TfrmMainNEW.TabsButtonCloseTabClick(Sender: TObject; ATab: TChromeTab; var Close: Boolean);
begin
  //
end;

end.
