program NewTest;

uses
  System.SysUtils,
  System.Classes,
  Winapi.Windows,
  Vcl.Forms,
  AppController in 'AppController.pas',
  BrowserWindow in 'BrowserWindow.pas' {frmBrowserWindow};

{$R *.res}

function GetParam(const Name: string): string;
var
  i: Integer;
  p: string;
begin
  Result := '';
  for i := 1 to ParamCount do
  begin
    p := ParamStr(i);
    if SameText(Copy(p, 1, Length('--' + Name + '=')), '--' + Name + '=') then
      Exit(Copy(p, Length('--' + Name + '=') + 1, MaxInt));
  end;
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

var
  Role: string;
begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.ShowMainForm := False;

  Role := GetParam('role'); // controller | window | tab
  if Role = '' then
    Role := 'controller';

  if SameText(Role, 'controller') then
  begin
    TAppController.Run; // headless controller loop
    Exit;
  end
  else if SameText(Role, 'window') then
  begin
    // Create a multi-tab window instance
    with TFrmBrowserWindow.Create(nil) do
    begin
      StartupURL := GetParam('url');
      AttachToken := GetParam('attach-token'); // optional target for drag-in
      Show;
      Application.Run; // runs until this window closes
      Free;
    end;
    Exit;
  end
  else if SameText(Role, 'tab') then
  begin
    // Create a single-tab window (used for drag-out to new window)
    with TFrmBrowserWindow.Create(nil) do
    begin
      StartupURL := GetParam('url');
      ForceSingleTab := True;
      Show;
      Application.Run;
      Free;
    end;
    Exit;
  end;

  // Fallback: spawn a normal window if role mistyped
  with TFrmBrowserWindow.Create(nil) do
  begin
    Show;
    Application.Run;
    Free;
  end;
end.
