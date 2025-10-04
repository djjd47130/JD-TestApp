unit JD.Clock.Impl;

interface

uses
  Winapi.Windows,
  System.Classes, System.SysUtils, System.Generics.Collections,
  JD.Plugins.Intf,
  JD.Plugins.Impl;

type
  TJDClockPlugin = class;



  TJDClockPlugin = class(TJDPlugin, IJDPlugin)
  private
    procedure ClockExecute(Sender: TObject; Item: IJDPluginMenuItem);
  protected
    function GetName: WideString; override; stdcall;
    function GetCaption: WideString; override; stdcall;
    function GetPublisher: WideString; override; stdcall;

    procedure PopulateMenuItems; override; stdcall;
    procedure PopulateShellRegs; override; stdcall;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;


implementation

{ TJDClockPlugin }

procedure TJDClockPlugin.ClockExecute(Sender: TObject; Item: IJDPluginMenuItem);
begin
  //TODO: Open clock...

end;

constructor TJDClockPlugin.Create;
begin
  inherited;

end;

destructor TJDClockPlugin.Destroy;
begin

  inherited;
end;

function TJDClockPlugin.GetCaption: WideString;
begin
  Result:= 'JD Clock';
end;

function TJDClockPlugin.GetName: WideString;
begin
  Result:= 'JD.Clock';
end;

function TJDClockPlugin.GetPublisher: WideString;
begin
  Result:= 'Jerry Dodge';
end;

procedure TJDClockPlugin.PopulateMenuItems;
begin
  inherited;

  var I:= MenuItems.Add;
  I.Name:= 'JD.Clock';
  I.Caption:= 'JD Clock';
  I.OnClick:= ClockExecute;

end;

procedure TJDClockPlugin.PopulateShellRegs;
begin
  inherited;

  var I:= ShellRegs.Add;
  I.ShellRoot:= 'JD';
  I.ShellPath:= 'Clock';

  //I.OnExecute:= ClockExecute;

  //I.OnExecute:= procedure
    //begin
      //TODO: Incompatible types Procedure and TProcedure...

    //end;
  //TODO

end;

end.
