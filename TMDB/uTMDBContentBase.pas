unit uTMDBContentBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uContentBase,
  uTMDB,
  JD.TMDB,
  JD.TMDB.Intf;

type
  TfrmTMDBContentBase = class;

  TfrmTMDBContentBaseClass = class of TfrmTMDBContentBase;

  TfrmTMDBContentBase = class(TfrmContentBase)
  private
    { Private declarations }
  public
    function TMDB: TTMDB;
    function Client: ITMDBClient;
    procedure PrepAPI;
  end;

var
  frmTMDBContentBase: TfrmTMDBContentBase;

implementation

{$R *.dfm}

uses uMain;

procedure TfrmTMDBContentBase.PrepAPI;
begin
  dmTMDB.PrepAPI;
end;

function TfrmTMDBContentBase.TMDB: TTMDB;
begin
  Result:= dmTMDB.TMDB;
end;

function TfrmTMDBContentBase.Client: ITMDBClient;
begin
  Result:= TMDB.Client;
end;

end.
