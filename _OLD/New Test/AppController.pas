unit AppController;

interface

uses
  System.SysUtils, System.Classes, Winapi.Windows, Winapi.Messages;

type
  TAppController = class
  private
    class procedure ProcessArgs;
    class procedure OpenNewWindow(const URL: string);
    class procedure OpenNewTab(const URL: string);
    class procedure BroadcastAttachToken(const Token: string);
  public
    class procedure Run;
  end;

implementation

const
  WM_APP_ADOPT_TAB = WM_APP + $100;
  WM_APP_ATTACH_TOKEN = WM_APP + $101;

function ShellRunDetached(const CmdLine: string): Boolean;
var
  SI: TStartupInfo;
  PI: TProcessInformation;
  App: string;
begin
  Result := False;
  ZeroMemory(@SI, SizeOf(SI));
  SI.cb := SizeOf(SI);
  ZeroMemory(@PI, SizeOf(PI));
  App := ParamStr(0);
  if CreateProcess(PChar(App), PChar('"' + App + '" ' + CmdLine), nil, nil, False,
                   CREATE_NO_WINDOW, nil, nil, SI, PI) then
  begin
    CloseHandle(PI.hThread);
    CloseHandle(PI.hProcess);
    Result := True;
  end;
end;

function GetParam(const Name: string): string;
var
  i: Integer;
  p, pref: string;
begin
  pref := '--' + Name + '=';
  for i := 1 to ParamCount do
  begin
    p := ParamStr(i);
    if SameText(Copy(p, 1, Length(pref)), pref) then
      Exit(Copy(p, Length(pref) + 1, MaxInt));
  end;
  Result := '';
end;

function HasFlag(const Name: string): Boolean;
var
  i: Integer;
begin
  for i := 1 to ParamCount do
    if SameText(ParamStr(i), '--' + Name) then
      Exit(True);
  Result := False;
end;

{ TAppController }

class procedure TAppController.BroadcastAttachToken(const Token: string);
begin
  // In a real app, you’d enumerate windows and send WM_APP_ATTACH_TOKEN with Token via WM_COPYDATA.
  // For skeleton simplicity, we don’t implement enumeration here.
end;

class procedure TAppController.OpenNewTab(const URL: string);
begin
  // Ask an existing window to adopt a tab via IPC; if none, open a new window.
  if not ShellRunDetached('--role=window --url=' + URL) then
    ShellRunDetached('--role=window');
end;

class procedure TAppController.OpenNewWindow(const URL: string);
begin
  ShellRunDetached('--role=window --url=' + URL);
end;

class procedure TAppController.ProcessArgs;
var
  URL: string;
begin
  // Examples:
  // --new-tab=https://example.com
  // --new-window=https://example.com
  // --attach-token=abc123
  if HasFlag('help') then
    Exit;

  URL := GetParam('new-tab');
  if URL <> '' then
  begin
    OpenNewTab(URL);
    Exit;
  end;

  URL := GetParam('new-window');
  if URL <> '' then
  begin
    OpenNewWindow(URL);
    Exit;
  end;

  // Default: open a single empty window
  OpenNewWindow('');
end;

class procedure TAppController.Run;
begin
  // Headless controller: just process args and exit, or keep a hidden message loop if needed.
  ProcessArgs;
end;

end.
