unit JD.Plugins.Intf;

(*
  JD Plugins - Interface Definitions
  Task #11

  This unit contains all the core interface definitions for the plugin mechanism.
  Each plugin will need to implement each of these which is to be supported by said plugin.
  IJDPlugin must be accessible from within plugin DLL via exported function "JDCreatePluginObj".
  This function is called once upon initial loading of plugin, and the instance returned
  carries all integration details of the plugin.
*)

interface

uses
  Winapi.Windows,
  System.Classes, System.SysUtils;

type
  IJDPluginTabController = interface;
  IJDPluginTabRef = interface;
  IJDPlugin = interface;
  IJDShellReg = interface;
  IJDShellRegs = interface;
  IJDPluginMenuItem = interface;
  IJDPluginMenuItems = interface;
  IJDPluginContentForm = interface;


  TJDPluginExecuteEvent = procedure(Sender: TObject; Item: IJDPluginMenuItem) of object;


  /// <summary>
  /// Represents up to 4 segment version strings.
  /// </summary>
  IJDVersion = record
  private
    FP1: Integer;
    FP2: Integer;
    FP3: Integer;
    FP4: Integer;
    function GetP1: Integer; stdcall;
    function GetP2: Integer; stdcall;
    function GetP3: Integer; stdcall;
    function GetP4: Integer; stdcall;
  public
    function GetStr: WideString; stdcall;
    procedure SetStr(const Value: WideString); stdcall;

    property P1: Integer read GetP1;
    property P2: Integer read GetP2;
    property P3: Integer read GetP3;
    property P4: Integer read GetP4;
    property AsString: WideString read GetStr write SetStr;
  end;



  /// <summary>
  /// Provides plugin access to the tabular interface.
  /// </summary>
  IJDPluginTabController = interface
    ['{C4EEA179-EA74-4969-BD52-E7F84334B992}']
    function GetParent: HWND; stdcall;
    procedure SetParent(const Value: HWND); stdcall;
    function GetCount: Integer; stdcall;
    function GetItem(const Index: Integer): IJDPluginTabRef; stdcall;

    function CreateTab(const Caption: WideString; const Index: Integer = -1): IJDPluginTabRef; stdcall;
    procedure DeleteTab(const Index: Integer); stdcall;

    property Parent: HWND read GetParent write SetParent;
    property Count: Integer read GetCount;
    property Items[const Index: Integer]: IJDPluginTabRef read GetItem;
  end;

  /// <summary>
  /// Represents a single content tab within application UI.
  /// </summary>
  IJDPluginTabRef = interface
    ['{5C129031-99AF-4311-9AE9-5DD78C38428D}']
    function GetOwner: IJDPluginTabController; stdcall;
    function GetIndex: Integer; stdcall;
    function GetCaption: WideString; stdcall;
    procedure SetCaption(const Value: WideString); stdcall;

    procedure ShowContent; stdcall;

    property Owner: IJDPluginTabController read GetOwner;
    property Index: Integer read GetIndex;
    property Caption: WideString read GetCaption write SetCaption;
  end;



  /// <summary>
  /// The core interface representing an entire plugin and its contents.
  /// Does not directly instantiate actual features - simply provides access to them.
  /// Task #11
  /// </summary>
  IJDPlugin = interface
    ['{8C58062A-5294-4BB5-9B9C-33261958CCB9}']
    function GetName: WideString; stdcall;
    function GetCaption: WideString; stdcall;
    function GetPublisher: WideString; stdcall;
    function GetMenuItems: IJDPluginMenuItems; stdcall;
    function GetShellRegs: IJDShellRegs; stdcall;

    property Name: WideString read GetName;
    property Caption: WideString read GetCaption;
    property Publisher: WideString read GetPublisher;
    property MenuItems: IJDPluginMenuItems read GetMenuItems;
    property ShellRegs: IJDShellRegs read GetShellRegs;
  end;

  /// <summary>
  /// Represents a single possible shell object to be registered.
  /// Task #8
  /// </summary>
  IJDShellReg = interface
    ['{102E9813-E917-4444-84F3-003437F97AD7}']
    function GetShellRoot: WideString; stdcall;
    procedure SetShellRoot(const Value: WideString); stdcall;
    function GetShellPath: WideString; stdcall;
    procedure SetShellPath(const Value: WideString); stdcall;
    function GetOnExecute: TJDPluginExecuteEvent;
    procedure SetOnExecute(const Value: TJDPluginExecuteEvent);

    /// <summary>
    /// Executes a shell command associated with this registered entry.
    /// Implementation is responsible for handling this call accordingly.
    /// </summary>
    procedure ShellExec(const Path: WideString); stdcall;

    property ShellRoot: WideString read GetShellRoot write SetShellRoot;
    property ShellPath: WideString read GetShellPath write SetShellPath;
    property OnExecute: TJDPluginExecuteEvent read GetOnExecute write SetOnExecute;
  end;

  /// <summary>
  /// A list of all the registered shell commands within a plugin.
  /// Task #8
  /// </summary>
  IJDShellRegs = interface
    ['{07C4D004-6558-43AC-8F6D-1BDD244ECD5E}']
    function GetCount: Integer; stdcall;
    function GetItem(const Index: Integer): IJDShellReg; stdcall;

    function Add: IJDShellReg; stdcall;
    procedure Clear; stdcall;
    procedure Delete(const Index: Integer); stdcall;

    property Count: Integer read GetCount;
    property Items[const Index: Integer]: IJDShellReg read GetItem; default;
  end;

  /// <summary>
  /// Represents a single item to be listed in application's manu menu.
  /// Task #12
  /// </summary>
  IJDPluginMenuItem = interface
    ['{75DB6257-F045-46C4-98AE-F97AF0BC1AA8}']
    function GetOwner: IJDPluginMenuItems; stdcall;
    function GetCaption: WideString; stdcall;
    procedure SetCaption(const Value: WideString); stdcall;
    function GetName: WideString; stdcall;
    procedure SetName(const Value: WideString); stdcall;
    procedure PaintIcon(const DC: HDC; const Rect: TRect); stdcall;
    function GetOnClick: TJDPluginExecuteEvent; stdcall;
    procedure SetOnClick(const Value: TJDPluginExecuteEvent); stdcall;

    property Owner: IJDPluginMenuItems read GetOwner;
    property Caption: WideString read GetCaption write SetCaption;
    property Name: WideString read GetName write SetName;
    property OnClick: TJDPluginExecuteEvent read GetOnClick write SetOnClick;
  end;

  /// <summary>
  /// A list of registered main menu items.
  /// Task #12
  /// </summary>
  IJDPluginMenuItems = interface
    ['{85825BB0-6513-48E3-89C9-D9F39014B600}']
    function GetCount: Integer; stdcall;
    function GetItem(const Index: Integer): IJDPluginMenuItem; stdcall;

    function Add: IJDPluginMenuItem; stdcall;
    procedure Delete(const Index: Integer); stdcall;
    procedure Clear; stdcall;

    property Count: Integer read GetCount;
    property Items[const Index: Integer]: IJDPluginMenuItem read GetItem; default;
  end;

  /// <summary>
  /// Represents an instance of a single embedded form with associated tab.
  /// </summary>
  IJDPluginContentForm = interface
    ['{73438811-4CCA-4E96-A70D-10F8F4D54F24}']
    function GetOwner: IJDPlugin; stdcall;
    function GetName: WideString; stdcall;
    function GetCaption: WideString; stdcall;
    function GetID: WideString; stdcall;

    function CreateWindow: HWND; stdcall;
    procedure SetParentWindow(const Handle: HWND); stdcall;

    procedure CloseQuery(var CanClose: Boolean); stdcall;

  end;

implementation

{ IJDVersion }

function IJDVersion.GetP1: Integer;
begin
  Result:= FP1;
end;

function IJDVersion.GetP2: Integer;
begin
  Result:= FP2;
end;

function IJDVersion.GetP3: Integer;
begin
  Result:= FP3;
end;

function IJDVersion.GetP4: Integer;
begin
  Result:= FP4;
end;

function IJDVersion.GetStr: WideString;
begin
  Result:= IntToStr(FP1) + '.' + IntToStr(FP2) + '.' +
    IntToStr(FP3) + '.' + IntToStr(FP4);
  //TODO: Handle number of digits...
end;

procedure IJDVersion.SetStr(const Value: WideString);
begin
  //TODO: Parse version from string into individual values...

end;

end.
