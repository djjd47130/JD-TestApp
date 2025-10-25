unit uContentClock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uContentBase, RzStatus;

type
  TfrmContentClock = class(TfrmContentBase)
    RzClockStatus1: TRzClockStatus;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContentClock: TfrmContentClock;

implementation

{$R *.dfm}

end.
