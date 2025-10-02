unit uContentBrowser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uContentBase, WebView2, Winapi.ActiveX,
  Vcl.Edge, Vcl.StdCtrls, Vcl.ExtCtrls, JD.Common, JD.Ctrls, JD.Ctrls.FontButton,
  JD.TabController,
  ChromeTabsTypes,
  System.RegularExpressions,
  System.NetEncoding, Vcl.ComCtrls;

type
  TfrmContentBrowser = class(TfrmContentBase)
    Edge: TEdgeBrowser;
    pTop: TPanel;
    txtAddress: TEdit;
    btnGo: TJDFontButton;
    btnBack: TJDFontButton;
    btnForward: TJDFontButton;
    btnRefresh: TJDFontButton;
    btnFavorites: TJDFontButton;
    pFavorites: TPanel;
    lstFavorites: TListView;
    StaticText1: TStaticText;
    pFavoritesTop: TPanel;
    btnAddFavorite: TJDFontButton;
    btnMenu: TJDFontButton;
    procedure FormCreate(Sender: TObject);
    procedure EdgeDocumentTitleChanged(Sender: TCustomEdgeBrowser;
      const ADocumentTitle: string);
    procedure EdgeNewWindowRequested(Sender: TCustomEdgeBrowser;
      Args: TNewWindowRequestedEventArgs);
    procedure EdgeContentLoading(Sender: TCustomEdgeBrowser;
      IsErrorPage: Boolean; NavigationID: TUInt64);
    procedure btnGoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnForwardClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure EdgeContainsFullScreenElementChanged(Sender: TCustomEdgeBrowser;
      ContainsFullScreenElement: Boolean);
    procedure EdgeNavigationStarting(Sender: TCustomEdgeBrowser;
      Args: TNavigationStartingEventArgs);
    procedure EdgeNavigationCompleted(Sender: TCustomEdgeBrowser;
      IsSuccess: Boolean; WebErrorStatus: TOleEnum);
    procedure txtAddressDblClick(Sender: TObject);
    procedure EdgeZoomFactorChanged(Sender: TCustomEdgeBrowser; AZoomFactor: Double);
    procedure btnFavoritesClick(Sender: TObject);
    procedure btnAddFavoriteClick(Sender: TObject);
    procedure EdgeHistoryChanged(Sender: TCustomEdgeBrowser);
  private
    FInitialized: Boolean;
    procedure SetFullscreen(const Value: Boolean);
  protected
  public
    procedure UpdateHeader;
    procedure Navigate(const URL: String);
    function Tab: TJDTabRef;

    function GetImageIndex: Integer; override;
    procedure RefreshData; override;




    //TODO: Shell functions - #8
    /// <summary>
    /// Virtual function to return the shell root string.
    /// </summary>
    class function GetShellRoot: String; override;

    /// <summary>
    /// Virtual function to return the shell path string.
    /// </summary>
    class function GetShellPath: String; override;

    /// <summary>
    /// Virtual procedure to open a shell resource by its path.
    /// </summary>
    class procedure ShellOpen(const Path: String); override;



  end;

var
  frmContentBrowser: TfrmContentBrowser;

implementation

{$R *.dfm}

uses
  uMain;

function IsValidURLPath(const Input: string): Boolean;
const
  Patterns: array[0..5] of string = (
    '^[a-zA-Z][a-zA-Z0-9+\-.]*://',           // Any protocol
    '^([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(:\d+)?', // Domain with optional port
    '^www\.[a-zA-Z0-9-]+\.[a-zA-Z]{2,}',      // www-prefixed domain
    '^about:[a-zA-Z0-9\-]+$',                 // about: scheme
    '^localhost(:\d+)?',                      // localhost with optional port
    '^\d{1,3}(\.\d{1,3}){3}(:\d+)?'           // IPv4 with optional port
  );
var
  NormalizedInput: string;
  Pattern: string;
begin
  NormalizedInput := Trim(Input);
  Result := False;
  for Pattern in Patterns do begin
    if TRegEx.IsMatch(NormalizedInput, Pattern, [roIgnoreCase]) then begin
      Result := True;
      Break;
    end;
  end;
end;

{ TfrmContentBrowser }

procedure TfrmContentBrowser.EdgeContainsFullScreenElementChanged(
  Sender: TCustomEdgeBrowser; ContainsFullScreenElement: Boolean);
begin
  inherited;
  SetFullscreen(ContainsFullScreenElement);
end;

procedure TfrmContentBrowser.SetFullscreen(const Value: Boolean);
begin
  frmMain.FullScreen:= Value;
  frmMain.ContentOnly:= Value;
  pTop.Visible:= not Value;
end;

function TfrmContentBrowser.Tab: TJDTabRef;
begin
  Result:= TabController.TabByForm(Self);
end;

procedure TfrmContentBrowser.txtAddressDblClick(Sender: TObject);
begin
  inherited;


  txtAddress.SelectAll;
end;

procedure TfrmContentBrowser.EdgeContentLoading(Sender: TCustomEdgeBrowser;
  IsErrorPage: Boolean; NavigationID: TUInt64);
begin
  inherited;
  UpdateHeader;
end;

procedure TfrmContentBrowser.EdgeDocumentTitleChanged(Sender: TCustomEdgeBrowser;
  const ADocumentTitle: string);
begin
  inherited;
  UpdateHeader;
end;

procedure TfrmContentBrowser.EdgeHistoryChanged(Sender: TCustomEdgeBrowser);
begin
  inherited;
  //TODO: Update history...

end;

procedure TfrmContentBrowser.UpdateHeader;
var
  T: String;
begin
  T:= Edge.DocumentTitle;
  if T = '' then
    T:= '(Blank Page)';
  TabCaption:= T;
  txtAddress.Text:= Edge.LocationURL;
  btnBack.Enabled:= Edge.CanGoBack;
  btnForward.Enabled:= Edge.CanGoForward;
end;

procedure TfrmContentBrowser.EdgeNavigationCompleted(Sender: TCustomEdgeBrowser;
  IsSuccess: Boolean; WebErrorStatus: TOleEnum);
begin
  inherited;
  Tab.ChromeTab.SpinnerState:= tssNone;
  btnGo.Tag:= 0;
  btnGo.Image.Text:= ''; //Go

  try
    Tab.ChromeTab.ImageIndex:= Self.GetImageIndex;
  except
    on E: Exception do begin
      //TODO
    end;
  end;
end;

procedure TfrmContentBrowser.EdgeNavigationStarting(Sender: TCustomEdgeBrowser;
  Args: TNavigationStartingEventArgs);
begin
  inherited;
  Tab.ChromeTab.SpinnerState:= tssRenderedDownload;
  btnGo.Tag:= 1;
  btnGo.Image.Text:= ''; //Stop

  //Tab.ChromeTab.ImageIndex:= Self.GetImageIndex;
end;

procedure TfrmContentBrowser.EdgeNewWindowRequested(Sender: TCustomEdgeBrowser;
  Args: TNewWindowRequestedEventArgs);
var
  URI: PWideChar;
  T: TJDTabRef;
begin
  inherited;
  Args.ArgsInterface.Set_Handled(1);
  if Args.ArgsInterface.Get_uri(URI) = S_OK then begin
    T:= TabController.CreateTab(TfrmContentBrowser);
    (T.Content as TfrmContentBrowser).Navigate(URI);
  end;
end;

procedure TfrmContentBrowser.EdgeZoomFactorChanged(Sender: TCustomEdgeBrowser; AZoomFactor: Double);
begin
  inherited;
  //TODO: Save zoom factor for current domain...

end;

procedure TfrmContentBrowser.FormCreate(Sender: TObject);
begin
  inherited;
  Edge.Align:= alClient;
  FInitialized:= False;
end;

procedure TfrmContentBrowser.FormShow(Sender: TObject);
begin
  inherited;
  if not FInitialized then begin
    Edge.ReinitializeWebView;
    FInitialized:= True;
  end;
  UpdateHeader;
end;

function TfrmContentBrowser.GetImageIndex: Integer;
begin
  Result:= -1;
  try
    var Ref:= frmMain.Favicons.GetFavicon(txtAddress.Text);
    if Assigned(Ref) then
      Result:= frmMain.Favicons.GetFavicon(txtAddress.Text).ImageIndex;
  except
    on E: Exception do begin

    end;
  end;
end;

class function TfrmContentBrowser.GetShellPath: String;
begin

end;

class function TfrmContentBrowser.GetShellRoot: String;
begin

end;

class procedure TfrmContentBrowser.ShellOpen(const Path: String);
begin
  inherited;

end;

{
procedure TfrmContentBrowser.Navigate(const URL: String);
var
  S: String;
  P: Integer;
begin
  S:= URL;

  if IsValidURLPath(S) then begin
    P:= Pos('://', S);
    if P < 1 then
      S:= 'https://' + S;
    txtAddress.Text:= S;
    Edge.Navigate(S);
  end else begin
    //TODO: Perform search...

  end;
  UpdateHeader;
end;
}

procedure TfrmContentBrowser.Navigate(const URL: String);
var
  S: String;
  P: Integer;
begin
  S := Trim(URL);

  if IsValidURLPath(S) then
  begin
    P := Pos('://', S);
    if P < 1 then
      S := 'https://' + S;
    txtAddress.Text := S;
    Edge.Navigate(S);
  end
  else
  begin
    // Perform Google search
    S := 'https://www.google.com/search?q=' + TNetEncoding.URL.Encode(S);
    txtAddress.Text := S;
    Edge.Navigate(S);
  end;

  UpdateHeader;
end;

procedure TfrmContentBrowser.RefreshData;
begin
  inherited;
  Navigate(txtAddress.Text);
  //Edge.Refresh;
end;

procedure TfrmContentBrowser.btnAddFavoriteClick(Sender: TObject);
begin
  inherited;
  //TODO: Add current page to favorites...

end;

procedure TfrmContentBrowser.btnBackClick(Sender: TObject);
begin
  inherited;
  Edge.GoBack;
end;

procedure TfrmContentBrowser.btnFavoritesClick(Sender: TObject);
begin
  inherited;
  pFavorites.Visible:= not pFavorites.Visible;
  if pFavorites.Visible then begin
    //TODO: Load favorites list...

  end;
end;

procedure TfrmContentBrowser.btnForwardClick(Sender: TObject);
begin
  inherited;
  Edge.GoForward;
end;

procedure TfrmContentBrowser.btnGoClick(Sender: TObject);
begin
  inherited;
  case btnGo.Tag of
    0: Navigate(txtAddress.Text);
    1: Edge.Stop;
  end;
end;

procedure TfrmContentBrowser.btnRefreshClick(Sender: TObject);
begin
  inherited;
  Edge.Refresh;
end;

end.
