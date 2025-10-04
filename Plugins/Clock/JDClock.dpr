library JDClock;

uses
  System.SysUtils,
  System.Classes,
  JD.Clock.Impl in 'JD.Clock.Impl.pas',
  JD.Plugins.Intf in '..\JD.Plugins.Intf.pas',
  JD.Plugins.Impl in '..\JD.Plugins.Impl.pas';

{$R *.res}

function JDCreatePluginObj: IJDPlugin; stdcall;
begin
  Result:= TJDClockPlugin.Create;
end;

exports
  JDCreatePluginObj;

begin
end.
