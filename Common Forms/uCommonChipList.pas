unit uCommonChipList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  JD.TMDB.Intf, Vcl.ExtCtrls, JD.Common, JD.Ctrls, JD.Ctrls.ChipList, Vcl.StdCtrls, JD.Ctrls.FontButton;



type
  TfrmCommonChipList = class(TFrame)
    cboSearch: TComboBox;
    ChipList: TJDChipList;
    pTop: TPanel;
    btnAdd: TJDFontButton;
  private

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadList(AList: ITMDBItems);
  end;

implementation

{$R *.dfm}

uses
  StrUtils;

{ TfrmCommonDblCheckList }

constructor TfrmCommonChipList.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TfrmCommonChipList.Destroy;
begin

  inherited;
end;

procedure TfrmCommonChipList.LoadList(AList: ITMDBItems);
//var
  //i: Integer;
begin
  if not Assigned(AList) then Exit;

  {
  TV.BeginUpdate;
  try
    TV.Clear;

    for i := 0 to AList.GetCount - 1 do
    begin
      Node := TV.AddChild(nil); // Add node to the root level

      // Initialize node data
      NodeData := TV.GetNodeData(Node);
      if Assigned(NodeData) then
      begin
        NodeData^.Intf := AList.GetItem(i);
        NodeData^.WithChecked := False;
        NodeData^.WithoutChecked := False;
      end;
    end;
  finally
    TV.EndUpdate;
  end;
  }
end;

end.
