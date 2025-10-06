unit uContentPluginBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uContentBase,
  JD.PluginManager,
  JD.Plugins.Intf, JD.Common, JD.Ctrls, JD.Ctrls.FontButton, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmContentPluginBase = class;

  TfrmContentPluginBaseClass = class of TfrmContentPluginBase;

  TfrmContentPluginBase = class(TfrmContentBase)
    Panel1: TPanel;
    txtAddress: TEdit;
    btnGo: TJDFontButton;
    btnBack: TJDFontButton;
    btnForward: TJDFontButton;
    btnRefresh: TJDFontButton;
    btnFavorites: TJDFontButton;
    JDFontButton1: TJDFontButton;
  private
    FContentForm: IJDPluginContentForm;
  public
    constructor Create(AOwner: TComponent; AContentForm: IJDPluginContentForm); reintroduce; virtual;
    destructor Destroy; override;

    property ContentForm: IJDPluginContentForm read FContentForm;
  end;

var
  frmContentPluginBase: TfrmContentPluginBase;

implementation

{$R *.dfm}

{ TfrmContentPluginBase }

constructor TfrmContentPluginBase.Create(AOwner: TComponent; AContentForm: IJDPluginContentForm);
begin
  inherited Create(AOwner, MainForm);
  FContentForm:= AContentForm;

end;

destructor TfrmContentPluginBase.Destroy;
begin

  inherited;
end;

end.
