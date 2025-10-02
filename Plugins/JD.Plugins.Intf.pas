unit JD.Plugins.Intf;

(*
  JD Plugins - Interface Definitions
  Task #11

  This unit contains all the core interface definitions for the plugin mechanism.
  Each plugin will need to implement each of these which is to be supported by said plugin.

*)

interface

uses
  Winapi.Windows,
  System.Classes, System.SysUtils;

type
  IJDPlugin = interface;
  IJDShellReg = interface;
  IJDShellRegs = interface;
  IJDPluginMenuItem = interface;
  IJDPluginMenuItems = interface;



  IJDPlugin = interface
    ['{8C58062A-5294-4BB5-9B9C-33261958CCB9}']
    function GetName: WideString; stdcall;
    function GetCaption: WideString; stdcall;
    function GetPublisher: WideString; stdcall;
    function GetMenuItems: IJDPluginMenuItems; stdcall;
    function GetShellRegs: IJDShellRegs; stdcall;

  end;

  //Represents a single possible shell object
  IJDShellReg = interface
    ['{102E9813-E917-4444-84F3-003437F97AD7}']
    function GetShellRoot: WideString; stdcall;
    procedure SetShellRoot(const Value: WideString); stdcall;
    function GetShellPath: WideString; stdcall;
    procedure SetShellPath(const Value: WideString); stdcall;
    function GetOnExecute: TProcedure;
    procedure SetOnExecute(const Value: TProcedure);

    procedure ShellExec(const Path: WideString); stdcall;

  end;

  IJDShellRegs = interface
    ['{07C4D004-6558-43AC-8F6D-1BDD244ECD5E}']
    function GetCount: Integer; stdcall;
    function GetItem(const Index: Integer): IJDShellReg; stdcall;

  end;

  IJDPluginContentForm = interface
    ['{73438811-4CCA-4E96-A70D-10F8F4D54F24}']
    function GetOwner: IJDPlugin; stdcall;
    function GetName: WideString; stdcall;
    function GetCaption: WideString; stdcall;
    function GetID: WideString; stdcall;

    function CreateWindow: HWND; stdcall;
    procedure SetParentWindow(const Handle: HWND); stdcall;

  end;

  IJDPluginTabRef = interface
    ['{5C129031-99AF-4311-9AE9-5DD78C38428D}']

  end;

  TJDPluginMenuItemClickEvent = procedure(Sender: TObject; Item: IJDPluginMenuItem) of object;

  IJDPluginMenuItem = interface
    ['{75DB6257-F045-46C4-98AE-F97AF0BC1AA8}']
    function GetOwner: IJDPluginMenuItems; stdcall;
    function GetCaption: WideString; stdcall;
    function GetName: WideString; stdcall;
    procedure PaintIcon(const DC: HDC; const Rect: TRect); stdcall;

    function GetOnClick: TJDPluginMenuItemClickEvent; stdcall;

  end;

  IJDPluginMenuItems = interface
    ['{85825BB0-6513-48E3-89C9-D9F39014B600}']
    function GetCount: Integer; stdcall;
    function GetItem(const Index: Integer): IJDPluginMenuItem; stdcall;


  end;






  //COMMON

  TJDShellReg = class(TInterfacedObject, IJDShellReg)
  private
    FRoot: WideString;
    FPath: WideString;
    FOnExecute: TProcedure;
  protected
    function GetShellRoot: WideString; stdcall;
    procedure SetShellRoot(const Value: WideString); stdcall;
    function GetShellPath: WideString; stdcall;
    procedure SetShellPath(const Value: WideString); stdcall;
    function GetOnExecute: TProcedure;
    procedure SetOnExecute(const Value: TProcedure);

    procedure ShellExec(const Path: WideString); stdcall;


  end;

  TJDShellRegs = class(TInterfacedObject, IJDShellRegs)
  protected
    function GetCount: Integer; stdcall;
    function GetItem(const Index: Integer): IJDShellReg; stdcall;

  end;



  TJDPluginMenuItem = class(TInterfacedObject, IJDPluginMenuItem)
  protected
    function GetOwner: IJDPluginMenuItems; stdcall;
    function GetCaption: WideString; stdcall;
    function GetName: WideString; stdcall;
    procedure PaintIcon(const DC: HDC; const Rect: TRect); stdcall;

    function GetOnClick: TJDPluginMenuItemClickEvent; stdcall;

  end;

  TJDPluginMenuItems = class(TInterfacedObject, IJDPluginMenuItems)
  private
    FOwner: IJDPlugin;
    FItems: TInterfaceList;
  protected
    function GetCount: Integer; stdcall;
    function GetItem(const Index: Integer): IJDPluginMenuItem; stdcall;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Delete(const Index: Integer); stdcall;
    procedure Clear; stdcall;

    property Count: Integer read GetCount;
    property Items[const Index: Integer]: IJDPluginMenuItem read GetItem; default;
  end;



implementation



{ TJDShellReg }

function TJDShellReg.GetShellPath: WideString;
begin
  Result:= FPath;
end;

function TJDShellReg.GetShellRoot: WideString;
begin
  Result:= FRoot;
end;

procedure TJDShellReg.SetShellPath(const Value: WideString);
begin
  FPath:= Value;
end;

procedure TJDShellReg.SetShellRoot(const Value: WideString);
begin
  FRoot:= Value;
end;

procedure TJDShellReg.ShellExec(const Path: WideString);
begin

end;

{ TJDShellRegs }

function TJDShellRegs.GetCount: Integer;
begin

end;

function TJDShellRegs.GetItem(const Index: Integer): IJDShellReg;
begin

end;



{ TJDPluginMenuItem }

function TJDPluginMenuItem.GetCaption: WideString;
begin

end;

function TJDPluginMenuItem.GetName: WideString;
begin

end;

function TJDPluginMenuItem.GetOnClick: TJDPluginMenuItemClickEvent;
begin

end;

function TJDPluginMenuItem.GetOwner: IJDPluginMenuItems;
begin

end;

procedure TJDPluginMenuItem.PaintIcon(const DC: HDC; const Rect: TRect);
begin

end;

{ TJDPluginMenuItems }

procedure TJDPluginMenuItems.Clear;
begin
  while Count > 0 do
    Delete(0);
end;

constructor TJDPluginMenuItems.Create;
begin
  FItems:= TInterfaceList.Create;
end;

procedure TJDPluginMenuItems.Delete(const Index: Integer);
begin
  FItems.Delete(Index);
end;

destructor TJDPluginMenuItems.Destroy;
begin
  Clear;
  FreeAndNil(FItems);
  inherited;
end;

function TJDPluginMenuItems.GetCount: Integer;
begin
  Result:= FItems.Count;
end;

function TJDPluginMenuItems.GetItem(const Index: Integer): IJDPluginMenuItem;
begin
  Result:= IJDPluginMenuItem(FItems[Index]);
end;

end.
