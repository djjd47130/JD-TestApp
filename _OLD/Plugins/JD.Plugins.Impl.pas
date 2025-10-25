unit JD.Plugins.Impl;

(*
  JD Plugins - Implementation Definitions
  Task #11

  This unit contains all the core implementation for the plugin mechanism.
  Each plugin will need to inherit and implement the following:
  - TJDPlugin - The core object referencing the entire plugin.
    - TJDPluginMenuItem/s
    - TJDPluginShellReg/s
  - TJDPluginContentForm - Encapsulates a single possible form to be embedded with a tab.

*)

interface

uses
  Winapi.Windows,
  System.Classes, System.SysUtils,
  JD.Plugins.Intf;

type
  TJDPlugin = class;
  TJDPluginContentForm = class;
  TJDPluginShellReg = class;
  TJDPluginShellRegs = class;
  TJDPluginMenuItem = class;
  TJDPluginMenuItems = class;



  TJDPlugin = class(TInterfacedObject, IJDPlugin)
  private
    FMenuItems: IJDPluginMenuItems;
    FShellRegs: IJDShellRegs;
  protected
    function GetName: WideString; virtual; stdcall;
    function GetCaption: WideString; virtual; stdcall;
    function GetPublisher: WideString; virtual; stdcall;
    function GetMenuItems: IJDPluginMenuItems; virtual; stdcall;
    function GetShellRegs: IJDShellRegs; virtual; stdcall;
    procedure PopulateMenuItems; virtual; stdcall;
    procedure PopulateShellRegs; virtual; stdcall;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    property Name: WideString read GetName;
    property Caption: WideString read GetCaption;
    property Publisher: WideString read GetPublisher;
    property MenuItems: IJDPluginMenuItems read GetMenuItems;
    property ShellRegs: IJDShellRegs read GetShellRegs;
  end;

  TJDPluginContentForm = class(TInterfacedObject, IJDPluginContentForm)
  private
    FOwner: IJDPlugin;
  protected
    function GetOwner: IJDPlugin; stdcall;
    function GetName: WideString; stdcall;
    function GetCaption: WideString; stdcall;
    function GetID: WideString; stdcall;
  public
    constructor Create(AOwner: IJDPlugin); virtual;
    destructor Destroy; override;
    //TODO: Design ability to embed forms from DLL into content panel...
    function CreateWindow: HWND; stdcall;
    procedure SetParentWindow(const Handle: HWND); stdcall;

    procedure CloseQuery(var CanClose: Boolean); stdcall;

  end;

  TJDPluginShellReg = class(TInterfacedObject, IJDShellReg)
  private
    FRoot: WideString;
    FPath: WideString;
    FOnExecute: TJDPluginExecuteEvent;
  protected
    function GetShellRoot: WideString; stdcall;
    procedure SetShellRoot(const Value: WideString); stdcall;
    function GetShellPath: WideString; stdcall;
    procedure SetShellPath(const Value: WideString); stdcall;
    function GetOnExecute: TJDPluginExecuteEvent;
    procedure SetOnExecute(const Value: TJDPluginExecuteEvent);
  public
    procedure ShellExec(const Path: WideString); stdcall;

    property ShellRoot: WideString read GetShellRoot write SetShellRoot;
    property ShellPath: WideString read GetShellPath write SetShellPath;
    property OnExecute: TJDPluginExecuteEvent read GetOnExecute write SetOnExecute;
  end;

  TJDPluginShellRegs = class(TInterfacedObject, IJDShellRegs)
  private
    FOwner: IJDPlugin;
    FItems: TInterfaceList;
  protected
    function GetCount: Integer; stdcall;
    function GetItem(const Index: Integer): IJDShellReg; stdcall;
  public
    constructor Create(AOwner: IJDPlugin);
    destructor Destroy; override;

    function Add: IJDShellReg; stdcall;
    procedure Clear; stdcall;
    procedure Delete(const Index: Integer); stdcall;

    property Count: Integer read GetCount;
    property Items[const Index: Integer]: IJDShellReg read GetItem; default;
  end;

  TJDPluginMenuItem = class(TInterfacedObject, IJDPluginMenuItem)
  private
    FOwner: IJDPluginMenuItems;
    FCaption: WideString;
    FName: WideString;
    FOnClick: TJDPluginExecuteEvent;
  protected
    function GetOwner: IJDPluginMenuItems; stdcall;
    function GetCaption: WideString; stdcall;
    procedure SetCaption(const Value: WideString); stdcall;
    function GetName: WideString; stdcall;
    procedure SetName(const Value: WideString); stdcall;
    procedure PaintIcon(const DC: HDC; const Rect: TRect); stdcall;
    function GetOnClick: TJDPluginExecuteEvent; stdcall;
    procedure SetOnClick(const Value: TJDPluginExecuteEvent); stdcall;
  public
    constructor Create(AOwner: IJDPluginMenuItems);
    destructor Destroy; override;

    property Owner: IJDPluginMenuItems read FOwner;
    property Caption: WideString read GetCaption write SetCaption;
    property Name: WideString read GetName write SetName;
    property OnClick: TJDPluginExecuteEvent read GetOnClick write SetOnClick;

  end;

  TJDPluginMenuItems = class(TInterfacedObject, IJDPluginMenuItems)
  private
    FOwner: IJDPlugin;
    FItems: TInterfaceList;
  protected
    function GetCount: Integer; stdcall;
    function GetItem(const Index: Integer): IJDPluginMenuItem; stdcall;
  public
    constructor Create(AOwner: IJDPlugin);
    destructor Destroy; override;

    function Add: IJDPluginMenuItem; stdcall;
    procedure Delete(const Index: Integer); stdcall;
    procedure Clear; stdcall;

    property Count: Integer read GetCount;
    property Items[const Index: Integer]: IJDPluginMenuItem read GetItem; default;
  end;

implementation

{ TJDPlugin }

constructor TJDPlugin.Create;
begin
  FShellRegs:= TJDPluginShellRegs.Create(Self);
  FMenuItems:= TJDPluginMenuItems.Create(Self);

  PopulateShellRegs;
  PopulateMenuItems;
end;

destructor TJDPlugin.Destroy;
begin

  FMenuItems.Clear;
  FMenuItems:= nil;

  FShellRegs.Clear;
  FShellRegs:= nil;

  inherited;
end;

function TJDPlugin.GetCaption: WideString;
begin
  Result:= 'Untitled Plugin';
end;

function TJDPlugin.GetMenuItems: IJDPluginMenuItems;
begin
  Result:= FMenuItems;
end;

function TJDPlugin.GetName: WideString;
begin
  Result:= 'User.Plugin';
end;

function TJDPlugin.GetPublisher: WideString;
begin
  Result:= 'User';
end;

function TJDPlugin.GetShellRegs: IJDShellRegs;
begin
  Result:= FShellRegs;
end;

procedure TJDPlugin.PopulateMenuItems;
begin
  FMenuItems.Clear;
  //Override expected
end;

procedure TJDPlugin.PopulateShellRegs;
begin
  FShellRegs.Clear;
  //Override expected
end;

{ TJDPluginContentForm }

procedure TJDPluginContentForm.CloseQuery(var CanClose: Boolean);
begin
  CanClose:= True;
  //Override expected
end;

constructor TJDPluginContentForm.Create(AOwner: IJDPlugin);
begin
  FOwner:= AOwner;

end;

destructor TJDPluginContentForm.Destroy;
begin

  inherited;
end;

function TJDPluginContentForm.CreateWindow: HWND;
begin
  Result:= 0; //TODO
end;

function TJDPluginContentForm.GetCaption: WideString;
begin
  Result:= 'Untitled Form';
end;

function TJDPluginContentForm.GetID: WideString;
begin
  Result:= '';
end;

function TJDPluginContentForm.GetName: WideString;
begin
  Result:= 'UntitledForm';
end;

function TJDPluginContentForm.GetOwner: IJDPlugin;
begin
  Result:= FOwner;
end;

procedure TJDPluginContentForm.SetParentWindow(const Handle: HWND);
begin
  //TODO
end;

{ TJDPluginShellReg }

function TJDPluginShellReg.GetOnExecute: TJDPluginExecuteEvent;
begin
  Result:= FOnExecute;
end;

function TJDPluginShellReg.GetShellPath: WideString;
begin
  Result:= FPath;
end;

function TJDPluginShellReg.GetShellRoot: WideString;
begin
  Result:= FRoot;
end;

procedure TJDPluginShellReg.SetOnExecute(const Value: TJDPluginExecuteEvent);
begin
  FOnExecute:= Value;
end;

procedure TJDPluginShellReg.SetShellPath(const Value: WideString);
begin
  FPath:= Value;
end;

procedure TJDPluginShellReg.SetShellRoot(const Value: WideString);
begin
  FRoot:= Value;
end;

procedure TJDPluginShellReg.ShellExec(const Path: WideString);
begin
  //TODO: Execute specified shell command...

end;

{ TJDPluginShellRegs }

function TJDPluginShellRegs.Add: IJDShellReg;
begin
  Result:= TJDPluginShellReg.Create;
  FItems.Add(Result);
end;

procedure TJDPluginShellRegs.Clear;
begin
  while GetCount > 0 do
    Delete(0);
end;

constructor TJDPluginShellRegs.Create(AOwner: IJDPlugin);
begin
  FOwner:= AOwner;
  FItems:= TInterfaceList.Create;

end;

procedure TJDPluginShellRegs.Delete(const Index: Integer);
begin
  FItems.Delete(Index);
end;

destructor TJDPluginShellRegs.Destroy;
begin

  Clear;
  FreeAndNil(FItems);
  inherited;
end;

function TJDPluginShellRegs.GetCount: Integer;
begin
  Result:= FItems.Count;
end;

function TJDPluginShellRegs.GetItem(const Index: Integer): IJDShellReg;
begin
  Result:= IJDShellReg(FItems[Index]);
end;

{ TJDPluginMenuItem }

constructor TJDPluginMenuItem.Create(AOwner: IJDPluginMenuItems);
begin
  FOwner:= AOwner;

end;

destructor TJDPluginMenuItem.Destroy;
begin

  FOwner:= nil;
  inherited;
end;

function TJDPluginMenuItem.GetCaption: WideString;
begin
  Result:= FCaption;
end;

function TJDPluginMenuItem.GetName: WideString;
begin
  Result:= FName;
end;

function TJDPluginMenuItem.GetOnClick: TJDPluginExecuteEvent;
begin
  Result:= FOnClick;
end;

function TJDPluginMenuItem.GetOwner: IJDPluginMenuItems;
begin
  Result:= FOwner;
end;

procedure TJDPluginMenuItem.PaintIcon(const DC: HDC; const Rect: TRect);
begin
  //TODO
end;

procedure TJDPluginMenuItem.SetCaption(const Value: WideString);
begin
  FCaption:= Value;
end;

procedure TJDPluginMenuItem.SetName(const Value: WideString);
begin
  FName:= Value;
end;

procedure TJDPluginMenuItem.SetOnClick(const Value: TJDPluginExecuteEvent);
begin
  FOnClick:= Value;
end;

{ TJDPluginMenuItems }

function TJDPluginMenuItems.Add: IJDPluginMenuItem;
begin
  Result:= TJDPluginMenuItem.Create(Self);
  FItems.Add(Result);
end;

procedure TJDPluginMenuItems.Clear;
begin
  while Count > 0 do
    Delete(0);
end;

constructor TJDPluginMenuItems.Create(AOwner: IJDPlugin);
begin
  FOwner:= AOwner;
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
