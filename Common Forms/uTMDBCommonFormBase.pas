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
    FMainForm: TForm;
    function GetTMDB: TTMDB;
  public
    constructor Create(AOwner: TComponent; AMainForm: TForm); reintroduce; virtual;
    property TMDB: TTMDB read GetTMDB;
    property MainForm: TForm read FMainForm;
  end;

var
  frmTMDBCommonFormBase: TfrmTMDBCommonFormBase;

implementation

{$R *.dfm}

uses
  uMain;

{ TfrmTMDBCommonFormBase }

constructor TfrmTMDBCommonFormBase.Create(AOwner: TComponent; AMainForm: TForm);
begin
  inherited Create(AOwner);
  FMainForm:= AMainForm;
end;

function TfrmTMDBCommonFormBase.GetTMDB: TTMDB;
begin
  Result:= dmTMDB.TMDB;
end;

end.
