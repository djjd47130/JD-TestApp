unit JD.AppController.Intf;

(*
  NEW APP CONTROLLER CONCEPT
  IN ACTIVE DEVELOPMENT!!!
  - Merges TJDTabController and TJDPluginManager into brand new replacement IJDAppController.
  - Done entirely by scratch using interfaces, implementing plugins, separate windows, etc.


*)

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections, System.Types,
  System.UITypes,
  Winapi.Windows, Winapi.Messages,
  Vcl.Controls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Forms,
  Vcl.Dialogs,
  ChromeTabs, ChromeTabsClasses

  ;

type
  IJDAppListItem = interface;
  IJDAppListItems = interface;
  IJDAppController = interface;
  IJDAppWindow = interface;
  IJDAppContentBase = interface;
  IJDAppFavicon = interface;
  IJDAppFavicons = interface;
  IJDAppMenuItem = interface;
  IJDAppMenuItems = interface;
  IJDAppShellReg = interface;
  IJDAppShellRegs = interface;
  IJDAppSetup = interface;




  //Base for any list item app-wide.
  IJDAppListItem = interface
    ['{C868745A-4368-4494-A8EF-91125CFB66DE}']
    function GetCaption: WideString stdcall;
    function GetIndex: Integer stdcall;
    function GetID: WideString stdcall;

    property Caption: WideString read GetCaption;
    property Index: Integer read GetIndex;
    property ID: WideString read GetID;
  end;

  //Base for any list app-wide.
  IJDAppListItems = interface
    ['{FDC57088-CA12-4DB2-8769-121037CCDA40}']
    function GetCount: Integer stdcall;
    function GetItem(const Index: Integer): IJDAppListItem stdcall;

    property Count: Integer read GetCount;
    property Items[const Index: Integer]: IJDAppListItem read GetItem; default;
  end;




  //Overall app control
  //  Implemented by TfrmAppController
  IJDAppController = interface
    ['{48EC9E4B-C5F6-4B41-B5BD-8D609B59FD0A}']
    function GetWindowCount: Integer stdcall;
    function GetWindow(const Index: Integer): IJDAppWindow stdcall;
    function GetAppSetup: IJDAppSetup stdcall;
    function GetFavicons: IJDAppFavicons stdcall;

    procedure Initialize stdcall;
    procedure Uninitialize stdcall;
    procedure HandleURI(const CmdLine: WideString) stdcall;

    function CreateNewWindow(const URI: WideString = ''): IJDAppWindow stdcall;
    procedure CloseWindow(const Index: Integer) stdcall;

    property WindowCount: Integer read GetWindowCount;
    property Windows[const Index: Integer]: IJDAppWindow read GetWindow; default;
  end;

  //One of possibly multiple windows (TfrmMain) with empty tabular interface.
  //  Manages all the tabs contained within.
  //  If all tabs are closed, the window closes.
  //  If all windows are closed, the app closes.
  //  Implemented by TfrmAppWindow.
  IJDAppWindow = interface
    ['{53FA7E8E-3C7E-4194-9D0F-6975C7A9457E}']
    function GetOwner: IJDAppController stdcall;
    function GetTabCount: Integer stdcall;
    function GetTab(const Index: Integer): IJDAppContentBase stdcall;

    function CreateNewTab(const URI: WideString = ''): IJDAppWindow stdcall;
    procedure CloseTab(const TabIndex: Integer) stdcall;
    function MoveTab(const TabIndex: Integer; ADest: IJDAppWindow): IJDAppContentBase stdcall;

    property Owner: IJDAppController read GetOwner;
    property TabCount: Integer read GetTabCount;
    property Tabs[const Index: Integer]: IJDAppContentBase read GetTab; default;
  end;



  //Represents a single tab and its content.
  //  Can be moved between different app windows, or into its own new window.
  //  Implemented by TfrmContentBase.
  IJDAppContentBase = interface
    ['{A2F5D76D-99D6-4AFE-9D2A-12918478FE3C}']
    function GetOwner: IJDAppController stdcall;
    function GetParent: IJDAppWindow stdcall;
    function GetURI: WideString stdcall;
    function GetIndex: Integer stdcall;
    function GetTabCaption: WideString stdcall;
    procedure SetTabCaption(const Value: WideString) stdcall;

    /// <summary>
    /// Virtual method to refresh any data within the form.
    /// </summary>
    procedure RefreshData stdcall;

    /// <summary>
    /// Virtual function to return whether the form is allowed to close.
    /// </summary>
    function CanClose: Boolean stdcall;

    procedure Navigate(const URI: WideString = '') stdcall;

    property Owner: IJDAppController read GetOwner;
    property Parent: IJDAppWindow read GetParent;
    property URI: WideString read GetURI;
    property Index: Integer read GetIndex;
    property TabCaption: WideString read GetTabCaption write SetTabCaption;
  end;



  IJDAppFavicon = interface(IJDAppListItem)
    ['{6037B0A3-CB0D-41E9-BB3C-A963D90141AF}']
    function GetProtocol: WideString stdcall;
    function GetDomain: WideString stdcall;

  end;

  IJDAppFavicons = interface(IJDAppListItems)
    ['{C565C692-0866-4CDC-93D4-F8AFFCD94C74}']
    function GetItem(const Index: Integer): IJDAppFavicon stdcall;

  end;



  IJDAppSetup = interface
    ['{4813EFB1-1AC7-402E-ABD4-93BA1EE14E49}']
    function GetS(const N: WideString): WideString stdcall;
    function GetI(const N: WideString): Integer stdcall;
    function GetB(const N: WideString): Boolean stdcall;
    function GetF(const N: WideString): Double stdcall;
    function GetD(const N: WideString): TDateTime stdcall;
    //TODO

    function SetupFilename: WideString stdcall;
    procedure LoadSetup stdcall;
    procedure SaveSetup stdcall;
    function IsConfigured: Boolean stdcall;

  end;



  //////////////////////////////////////////////////////////////////////////////////////////
  ///                                    PLUGINS                                         ///
  //////////////////////////////////////////////////////////////////////////////////////////

  /// <summary>
  /// The core interface representing an entire plugin and its contents.
  /// Does not directly instantiate actual features - simply provides access to them.
  /// Task #11
  /// </summary>
  IJDPAppPlugin = interface
    ['{341CC125-0FCC-44D7-9444-34BCAD491341}']
    function GetName: WideString; stdcall;
    function GetCaption: WideString; stdcall;
    function GetPublisher: WideString; stdcall;
    function GetMenuItems: IJDAppMenuItems; stdcall;
    function GetShellRegs: IJDAppShellRegs; stdcall;

    property Name: WideString read GetName;
    property Caption: WideString read GetCaption;
    property Publisher: WideString read GetPublisher;
    property MenuItems: IJDAppMenuItems read GetMenuItems;
    property ShellRegs: IJDAppShellRegs read GetShellRegs;
  end;



  TJDPluginExecuteEvent = procedure(Sender: TObject; Item: IJDAppMenuItem) of object;


  /// <summary>
  /// Represents a single possible shell object to be registered.
  /// Task #8
  /// </summary>
  IJDAppShellReg = interface(IJDAppListItem)
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
  IJDAppShellRegs = interface(IJDAppListItems)
    ['{07C4D004-6558-43AC-8F6D-1BDD244ECD5E}']
    function GetItem(const Index: Integer): IJDAppShellReg; stdcall;

    function Add: IJDAppShellReg; stdcall;
    procedure Clear; stdcall;
    procedure Delete(const Index: Integer); stdcall;

    property Count: Integer read GetCount;
    property Items[const Index: Integer]: IJDAppShellReg read GetItem; default;
  end;

  /// <summary>
  /// Represents a single item to be listed in application's manu menu.
  /// Task #12
  /// </summary>
  IJDAppMenuItem = interface
    ['{75DB6257-F045-46C4-98AE-F97AF0BC1AA8}']
    function GetOwner: IJDAppMenuItems; stdcall;
    function GetCaption: WideString; stdcall;
    procedure SetCaption(const Value: WideString); stdcall;
    function GetName: WideString; stdcall;
    procedure SetName(const Value: WideString); stdcall;
    procedure PaintIcon(const DC: HDC; const Rect: TRect); stdcall;
    function GetOnClick: TJDPluginExecuteEvent; stdcall;
    procedure SetOnClick(const Value: TJDPluginExecuteEvent); stdcall;

    property Owner: IJDAppMenuItems read GetOwner;
    property Caption: WideString read GetCaption write SetCaption;
    property Name: WideString read GetName write SetName;
    property OnClick: TJDPluginExecuteEvent read GetOnClick write SetOnClick;
  end;

  /// <summary>
  /// A list of registered main menu items.
  /// Task #12
  /// </summary>
  IJDAppMenuItems = interface
    ['{85825BB0-6513-48E3-89C9-D9F39014B600}']
    function GetCount: Integer; stdcall;
    function GetItem(const Index: Integer): IJDAppMenuItem; stdcall;

    function Add: IJDAppMenuItem; stdcall;
    procedure Delete(const Index: Integer); stdcall;
    procedure Clear; stdcall;

    property Count: Integer read GetCount;
    property Items[const Index: Integer]: IJDAppMenuItem read GetItem; default;
  end;







  //////////////////////////////////////////////////////////////////////////////////////////
  ///                                    HISTORY                                         ///
  //////////////////////////////////////////////////////////////////////////////////////////


  IJDAppTabHistoryItem = interface
    ['{7EB652B8-6279-416E-B342-019CF45F9DCC}']
    function GetURI: Integer; stdcall;

  end;

  IJDAppTabHistory = interface
    ['{F521D6F5-D3F7-4E8D-8DA4-CAA9420EC4CD}']
    function GetMax: Integer; stdcall;
    procedure SetMax(const Value: Integer); stdcall;

  end;




  //Represents a single registered search engine option.
  //Google, Yahoo, or any custom search option, etc.
  IJDAppSearchEngine = interface(IJDAppListItem)
    ['{0DC3D215-F272-4ABE-8488-FE579307C5D4}']
    function GetCaption: WideString; stdcall;

    procedure ExecuteSearch(const Qry: WideString); stdcall;

  end;

  IJDAppSearchEngines = interface(IJDAppListItems)
    ['{D6E87AFF-4A0F-40FC-B3C0-6AAB3CFD816B}']
    function GetItem(const Index: Integer): IJDAppSearchEngine; stdcall;

  end;



implementation

end.
