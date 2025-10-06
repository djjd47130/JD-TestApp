unit uMainNEW;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.AppEvnts, Vcl.ComCtrls, JD.Common, JD.Ctrls,
  JD.Ctrls.FontButton, ChromeTabs, Vcl.ExtCtrls,
  JD.AppController.Intf;

type
  TfrmMainNEW = class(TForm)
    pTop: TPanel;
    Tabs: TChromeTabs;
    btnMenu: TJDFontButton;
    pContent: TPanel;
    Stat: TStatusBar;
    pMenu: TPanel;
    btnDummy: TJDFontButton;
    AppEvents: TApplicationEvents;
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
  uDM;

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

end.
