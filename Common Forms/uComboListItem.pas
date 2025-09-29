unit uComboListItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uListItemBase, JD.Common, JD.Ctrls, JD.Ctrls.FontButton, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TComboListItem = class(TListItemBase)
    ComboBox1: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ComboListItem: TComboListItem;

implementation

{$R *.dfm}

end.
