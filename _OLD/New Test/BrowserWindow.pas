unit BrowserWindow;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw,
  Vcl.StdCtrls, ChromeTabs, ChromeTabsClasses, ChromeTabsUtils;

type
  TTabData = record
    URL: string;
    Title: string;
  end;

  TFrmBrowserWindow = class(TForm)
    ChromeTabs: TChromeTabs;
    BtnNewTab: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ChromeTabsNewTabButtonVisibleChanging(Sender: TObject;
      var Visible: Boolean);
    procedure ChromeTabsTabAdd(Sender: TObject; ATab: TChromeTab;
      AIndex: Integer);
    procedure ChromeTabsTabDelete(Sender: TObject; ATab: TChromeTab);
    procedure ChromeTabsActiveTabChanged(Sender: TObject; ATab: TChromeTab);
    procedure BtnNewTabClick(Sender: TObject);
    procedure ChromeTabsTabDragDrop(Sender: TObject; ATab: TChromeTab;
      const ScreenPoint: TPoint; var Handled: Boolean);
    procedure ChromeTabsTabDraggedOut(Sender: TObject; ATab: TChromeTab;
      const ScreenPoint: TPoint; var Handled: Boolean);
  private
    FWebViews: TObjectDictionary<TChromeTab, TWebBrowser>;
    FSingleTab: Boolean;
    FAttachToken: string;
    procedure CreateWebViewForTab(ATab: TChromeTab; const URL: string);
    procedure DestroyWebViewForTab(ATab: TChromeTab);
    function ActiveWebView: TWebBrowser;
    procedure OpenURLInNewTab(const URL: string);
    procedure AdoptTabToNewWindow(ATab: TChromeTab);
    procedure LayoutActiveWebView;
  protected
    procedure Resize; override;
    procedure WMAdoptTab(var Msg: TMessage); message WM_APP + $100;
    procedure WMAttachToken(var Msg: TMessage); message WM_APP + $101;
  public
    StartupURL: string;
    ForceSingleTab: Boolean;
    AttachToken: string;
  end;

implementation

{$R *.dfm}

uses
  ShellAPI;

procedure TFrmBrowserWindow.FormCreate(Sender: TObject);
begin
  FWebViews := TObjectDictionary<TChromeTab, TWebBrowser>.Create([doOwnsValues]);
  ChromeTabs.Options.DragDrop.Enabled := True;
  ChromeTabs.Options.DragDrop.DragOutsideEnabled := True;
  ChromeTabs.Options.Display.CloseButtonCross := True;
  ChromeTabs.Options.ShowNewTabButton := True;

  FSingleTab := ForceSingleTab;
  if StartupURL <> '' then
    OpenURLInNewTab(StartupURL)
  else
    OpenURLInNewTab('about:blank');
end;

procedure TFrmBrowserWindow.FormDestroy(Sender: TObject);
begin
  FWebViews.Free;
end;

procedure TFrmBrowserWindow.ChromeTabsNewTabButtonVisibleChanging(Sender: TObject;
  var Visible: Boolean);
begin
  // Hide the new-tab button if this window is configured for a single tab
  if FSingleTab then
    Visible := False;
end;

procedure TFrmBrowserWindow.ChromeTabsTabAdd(Sender: TObject; ATab: TChromeTab;
  AIndex: Integer);
begin
  // Title initially
  ATab.Caption := 'New Tab';
end;

procedure TFrmBrowserWindow.ChromeTabsTabDelete(Sender: TObject; ATab: TChromeTab);
begin
  DestroyWebViewForTab(ATab);
end;

procedure TFrmBrowserWindow.ChromeTabsActiveTabChanged(Sender: TObject; ATab: TChromeTab);
begin
  LayoutActiveWebView;
end;

procedure TFrmBrowserWindow.BtnNewTabClick(Sender: TObject);
begin
  OpenURLInNewTab('about:blank');
end;

procedure TFrmBrowserWindow.CreateWebViewForTab(ATab: TChromeTab; const URL: string);
var
  WB: TWebBrowser;
begin
  WB := TWebBrowser.Create(Self);
  WB.Parent := Self;
  WB.Align := alNone; // we manage layout manually to overlay only active tab
  WB.Silent := True;
  FWebViews.Add(ATab, WB);
  if URL <> '' then
    WB.Navigate(URL);
end;

procedure TFrmBrowserWindow.DestroyWebViewForTab(ATab: TChromeTab);
var
  WB: TWebBrowser;
begin
  if FWebViews.TryGetValue(ATab, WB) then
  begin
    FWebViews.Remove(ATab);
    WB.Free;
  end;
end;

function TFrmBrowserWindow.ActiveWebView: TWebBrowser;
var
  WB: TWebBrowser;
begin
  Result := nil;
  if Assigned(ChromeTabs.ActiveTab) then
    FWebViews.TryGetValue(ChromeTabs.ActiveTab, WB);
  Result := WB;
end;

procedure TFrmBrowserWindow.OpenURLInNewTab(const URL: string);
var
  Tab: TChromeTab;
begin
  if FSingleTab and (ChromeTabs.Tabs.Count > 0) then
  begin
    // Reuse active tab
    if Assigned(ActiveWebView) then
      ActiveWebView.Navigate(URL);
    Exit;
  end;

  Tab := ChromeTabs.AddTab(-1, 'Loading...', '');
  CreateWebViewForTab(Tab, URL);
  ChromeTabs.ActiveTab := Tab;
  LayoutActiveWebView;
end;

procedure TFrmBrowserWindow.LayoutActiveWebView;
var
  WB: TWebBrowser;
  R: TRect;
begin
  WB := ActiveWebView;
  if WB <> nil then
  begin
    R := ClientRect;
    // Reserve top space for the tabs
    R.Top := ChromeTabs.Height;
    WB.SetBounds(R.Left, R.Top, R.Right - R.Left, R.Bottom - R.Top);
    WB.Visible := True;
    // Hide inactive webviews
    for var Pair in FWebViews do
      if Pair.Value <> WB then
        Pair.Value.Visible := False;
  end;
end;

procedure TFrmBrowserWindow.Resize;
begin
  inherited;
  LayoutActiveWebView;
end;

procedure TFrmBrowserWindow.ChromeTabsTabDragDrop(Sender: TObject; ATab: TChromeTab;
  const ScreenPoint: TPoint; var Handled: Boolean);
begin
  // Inter-window drag-drop is handled by ChromeTabs; here we can add custom behavior.
  // For this demo, we mark as unhandled so ChromeTabs will process normal reordering in-window.
  Handled := False;
end;

procedure TFrmBrowserWindow.ChromeTabsTabDraggedOut(Sender: TObject; ATab: TChromeTab;
  const ScreenPoint: TPoint; var Handled: Boolean);
begin
  // Create a new process/window and hand off the tab (simulate process-per-tab).
  AdoptTabToNewWindow(ATab);
  Handled := True;
end;

procedure TFrmBrowserWindow.AdoptTabToNewWindow(ATab: TChromeTab);
var
  WB: TWebBrowser;
  URL: string;
  Cmd: string;
begin
  URL := 'about:blank';
  if FWebViews.TryGetValue(ATab, WB) then
  begin
    try
      URL := WB.LocationURL;
    except
      // ignore
    end;
  end;

  // Launch a new single-tab window hosting this URL
  Cmd := '--role=tab --url=' + URL;
  ShellExecute(Handle, 'open', PChar(ParamStr(0)), PChar(Cmd), nil, SW_SHOWNORMAL);

  // Remove the tab locally to simulate process transfer
  ChromeTabs.DeleteTab(ATab);
end;

procedure TFrmBrowserWindow.WMAdoptTab(var Msg: TMessage);
begin
  // Placeholder for IPC where another window asks this one to adopt a tab.
  // Could parse URL via WM_COPYDATA and call OpenURLInNewTab(URL).
end;

procedure TFrmBrowserWindow.WMAttachToken(var Msg: TMessage);
begin
  // Placeholder to associate attach tokens for targeted drag-in.
end;

end.
