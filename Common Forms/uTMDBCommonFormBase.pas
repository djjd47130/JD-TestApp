unit uTMDBCommonFormBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uTMDB,
  JD.TMDB;

type
  TfrmTMDBCommonFormBase = class;

  TfrmTMDBCommonFormBaseClass = class of TfrmTMDBCommonFormBase;

  TfrmTMDBCommonFormBase = class(TForm)
  private
    function GetTMDB: TTMDB;
  public
    property TMDB: TTMDB read GetTMDB;
  end;

var
  frmTMDBCommonFormBase: TfrmTMDBCommonFormBase;

implementation

{$R *.dfm}

uses
  uMain;

{ TfrmTMDBCommonFormBase }

function TfrmTMDBCommonFormBase.GetTMDB: TTMDB;
begin
  Result:= dmTMDB.TMDB;
end;

end.
