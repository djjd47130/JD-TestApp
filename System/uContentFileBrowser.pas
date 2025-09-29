unit uContentFileBrowser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uContentBase, VirtualTrees.BaseAncestorVCL, VirtualTrees.BaseTree,
  VirtualTrees.AncestorVCL, VirtualTrees,
  System.IOUtils, Vcl.ExtCtrls;

type
  TfrmContentFileBrowser = class(TfrmContentBase)
    VirtualStringTree1: TVirtualStringTree;
    Panel1: TPanel;
    Splitter1: TSplitter;
    pMain: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PopulateTree;
  end;

var
  frmContentFileBrowser: TfrmContentFileBrowser;

implementation

{$R *.dfm}

{ TfrmContentFileBrowser }

procedure TfrmContentFileBrowser.FormCreate(Sender: TObject);
begin
  inherited;
  pMain.Align:= alClient;

end;

procedure TfrmContentFileBrowser.PopulateTree;
begin
  //TODO: Populate root-level items (Drives, etc.)...

end;

end.
