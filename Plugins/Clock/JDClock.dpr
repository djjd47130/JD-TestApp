library JDClock;

uses
  System.SysUtils,
  System.Classes,
  JD.Clock.Impl in 'JD.Clock.Impl.pas',
  JD.Plugins.Intf in '..\JD.Plugins.Intf.pas';

{$R *.res}

function JDCreatePluginObj: IJDPlugin; stdcall;
begin
  Result:= TJDClockPlugin.Create; //TODO
end;

exports
  JDCreatePluginObj;

begin
end.
