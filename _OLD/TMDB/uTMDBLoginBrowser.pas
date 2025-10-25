unit uTMDBLoginBrowser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, WebView2, Winapi.ActiveX, Vcl.Edge,
  IdURI;

type
  TfrmTMDBLoginBrowser = class(TForm)
    Edge: TEdgeBrowser;
    procedure EdgeNavigationCompleted(Sender: TCustomEdgeBrowser;
      IsSuccess: Boolean; WebErrorStatus: TOleEnum);
  private
    { Private declarations }
  public
    procedure LoadURL(const URL: String);
    function Success: Boolean;
  end;

var
  frmTMDBLoginBrowser: TfrmTMDBLoginBrowser;

implementation

{$R *.dfm}

{ TfrmTMDBLoginBrowser }

procedure TfrmTMDBLoginBrowser.EdgeNavigationCompleted(Sender: TCustomEdgeBrowser;
  IsSuccess: Boolean; WebErrorStatus: TOleEnum);
begin
  //Caption:= Sender.LocationURL;
  // https://www.themoviedb.org/authenticate/<token>/allow
  if Success then
    ModalResult:= mrOK;
end;

procedure TfrmTMDBLoginBrowser.LoadURL(const URL: String);
begin
  Edge.ReinitializeWebView;
  Edge.Navigate(URL);
end;

function TfrmTMDBLoginBrowser.Success: Boolean;
var
  U: String;
  URI: TIdURI;
begin
  Result:= False;
  U:= Edge.LocationURL;
  URI:= TIdURI.Create(U);
  try
    if URI.Document = 'authgranted' then begin
      Result:= True;
    end;
  finally
    URI.Free;
  end;
end;

end.
