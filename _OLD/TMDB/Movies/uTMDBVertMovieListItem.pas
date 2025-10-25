unit uTMDBVertMovieListItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTMDBMovieListItem, JD.Common, JD.Ctrls, JD.Ctrls.FontButton,
  Vcl.Imaging.GIFImg, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmTMDBVertMovieListItem = class(TfrmTMDBMovieListItem)
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmTMDBVertMovieListItem: TfrmTMDBVertMovieListItem;

implementation

{$R *.dfm}

{ TfrmTMDBVertMovieListItem }

constructor TfrmTMDBVertMovieListItem.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TfrmTMDBVertMovieListItem.Destroy;
begin

  inherited;
end;

end.
