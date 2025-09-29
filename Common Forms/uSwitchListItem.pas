unit uSwitchListItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uListItemBase, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXCtrls, JD.Common, JD.Ctrls,
  JD.Ctrls.FontButton;

type
  TListSwitchItem = class(TListItemBase)
    ToggleSwitch2: TToggleSwitch;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListSwitchItem: TListSwitchItem;

implementation

{$R *.dfm}

end.
