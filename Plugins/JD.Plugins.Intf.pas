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
  IJDPluginContentForm = interface;
  IJDPluginTabRef = interface;


  TJDPluginExecuteEvent = procedure(Sender: TObject; Item: IJDPluginMenuItem) of object;


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

  end;

  /// <summary>
  ///
  /// </summary>
  IJDPluginTabRef = interface
    ['{5C129031-99AF-4311-9AE9-5DD78C38428D}']

  end;

implementation

end.
