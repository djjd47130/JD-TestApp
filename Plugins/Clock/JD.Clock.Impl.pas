unit JD.Clock.Impl;

interface

uses
  Winapi.Windows,
  System.Classes, System.SysUtils, System.Generics.Collections,
  JD.Plugins.Intf;

type

  TJDClockPlugin = class(TInterfacedObject, IJDPlugin)
  private
    FMenuItems: IJDPluginMenuItems;
    FShellRegs: IJDShellRegs;
  protected
    function GetName: WideString; stdcall;
    function GetCaption: WideString; stdcall;
    function GetPublisher: WideString; stdcall;
    function GetMenuItems: IJDPluginMenuItems; stdcall;
    function GetShellRegs: IJDShellRegs; stdcall;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TJDPluginContentForm = class(TInterfacedObject, IJDPluginContentForm)
  protected
    function GetOwner: IJDPlugin; stdcall;
    function GetName: WideString; stdcall;
    function GetCaption: WideString; stdcall;
    function GetID: WideString; stdcall;
  public
    function CreateWindow: HWND; stdcall;
    procedure SetParentWindow(const Handle: HWND); stdcall;

  end;


implementation

{ TJDClockPlugin }

constructor TJDClockPlugin.Create;
begin
  FShellRegs:= TJDShellRegs.Create;
  FMenuItems:= TJDPluginMenuItems.Create;
  //TODO

end;

destructor TJDClockPlugin.Destroy;
begin

  //TODO
  FMenuItems:= nil;
  FShellRegs:= nil;
  inherited;
end;

function TJDClockPlugin.GetCaption: WideString;
begin
  Result:= 'JD Clock';
end;

function TJDClockPlugin.GetMenuItems: IJDPluginMenuItems;
begin
  Result:= FMenuItems;
end;

function TJDClockPlugin.GetName: WideString;
begin
  Result:= 'JD.Clock';
end;

function TJDClockPlugin.GetPublisher: WideString;
begin
  Result:= 'Jerry Dodge';
end;

function TJDClockPlugin.GetShellRegs: IJDShellRegs;
begin
  Result:= FShellRegs;
end;

{ TJDPluginContentForm }

function TJDPluginContentForm.CreateWindow: HWND;
begin

end;

function TJDPluginContentForm.GetCaption: WideString;
begin

end;

function TJDPluginContentForm.GetID: WideString;
begin

end;

function TJDPluginContentForm.GetName: WideString;
begin

end;

function TJDPluginContentForm.GetOwner: IJDPlugin;
begin

end;

procedure TJDPluginContentForm.SetParentWindow(const Handle: HWND);
begin

end;

end.
