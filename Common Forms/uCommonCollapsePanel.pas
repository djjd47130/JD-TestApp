unit uCommonCollapsePanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, JD.Common, JD.Ctrls,
  JD.Ctrls.FontButton;

const
  ARR_UP = '';
  ARR_DN = '';

type
  TfrmCommonCollapsePanel = class;

  TfrmCommonCollapsePanelClass = class of TfrmCommonCollapsePanel;

  TfrmCommonCollapsePanel = class(TFrame)
    pTop: TPanel;
    btnCollapse: TJDFontButton;
    lblCaption: TStaticText;
    JDFontButton1: TJDFontButton;
    procedure btnCollapseClick(Sender: TObject);
  private
    FCollapsed: Boolean;
    FExpandedHeight: Integer;
    procedure SetCollapsed(const Value: Boolean);
    procedure SetExpandedHeight(const Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function CollapsedHeight: Integer;
  published
    property Collapsed: Boolean read FCollapsed write SetCollapsed;
    property ExpandedHeight: Integer read FExpandedHeight write SetExpandedHeight;
  end;

implementation

{$R *.dfm}

{ TfrmCommonCollapsePanel }

procedure TfrmCommonCollapsePanel.btnCollapseClick(Sender: TObject);
begin
  Collapsed:= not Collapsed;
end;

function TfrmCommonCollapsePanel.CollapsedHeight: Integer;
begin
  Result:= pTop.Height + pTop.Margins.Top + pTop.Margins.Bottom;
end;

constructor TfrmCommonCollapsePanel.Create(AOwner: TComponent);
begin
  inherited;
  FExpandedHeight:= 250;
  //Self.Height:= FExpandedHeight;
  Collapsed:= True;
end;

destructor TfrmCommonCollapsePanel.Destroy;
begin

  inherited;
end;

procedure TfrmCommonCollapsePanel.SetCollapsed(const Value: Boolean);
begin
  if Parent = nil then Exit;
  
  if FCollapsed <> Value then begin
    Parent.DisableAlign;
    try
      if Value then begin
        //Collapse...
        Self.Height:= CollapsedHeight;
        btnCollapse.Image.Text:= ARR_DN;
      end else begin
        //Expand...
        Self.Height:= ExpandedHeight;
        btnCollapse.Image.Text:= ARR_UP;
      end;
      FCollapsed := Value;
    finally
      Parent.EnableAlign;
    end;
  end;
end;

procedure TfrmCommonCollapsePanel.SetExpandedHeight(const Value: Integer);
begin
  FExpandedHeight := Value;
end;

end.
