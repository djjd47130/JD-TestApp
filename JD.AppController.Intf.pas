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

  , uContentBase

  ;

type
  IJDAppController = interface;
  IJDAppWindow = interface;
  IJDAppTabRef = interface;


  IJDAppListItem = interface
    ['{C868745A-4368-4494-A8EF-91125CFB66DE}']
    function GetCaption: WideString; stdcall;
    function GetIndex: Integer; stdcall;
    function GetID: WideString; stdcall;

  end;

  IJDAppListItems = interface
    ['{FDC57088-CA12-4DB2-8769-121037CCDA40}']
    function GetCount: Integer; stdcall;
    function GetItem(const Index: Integer): IJDAppListItem; stdcall;

  end;




  //Overall app control
  IJDAppController = interface
    ['{48EC9E4B-C5F6-4B41-B5BD-8D609B59FD0A}']
    function GetWindowCount: Integer; stdcall;
    function GetWindow(const Index: Integer): IJDAppWindow; stdcall;

    procedure Initialize; stdcall;

    function CreateNewWindow(const URI: WideString = ''): IJDAppWindow; stdcall;
    procedure CloseWindow(const Index: Integer); stdcall;

  end;

  //One of possibly multiple windows (TfrmMain) with empty tabular interface.
  //  Manages all the tabs contained within.
  //  If all tabs are closed, the window closes.
  //  If all windows are closed, the app closes.
  IJDAppWindow = interface
    ['{53FA7E8E-3C7E-4194-9D0F-6975C7A9457E}']
    function GetOwner: IJDAppController; stdcall;
    function GetTabCount: Integer; stdcall;
    function GetTab(const Index: Integer): IJDAppTabRef; stdcall;

    procedure HandleNewTabClick; stdcall;
    function CreateNewTab(const URI: WideString = ''): IJDAppWindow; stdcall;
    procedure CloseTab(const TabIndex: Integer); stdcall;
    function MoveTab(const TabIndex: Integer; ADest: IJDAppWindow): IJDAppTabRef; stdcall;

  end;

  IJDAppTabRef = interface
    ['{A2F5D76D-99D6-4AFE-9D2A-12918478FE3C}']
    function GetOwner: IJDAppController stdcall;
    function GetParent: IJDAppWindow; stdcall;
    function GetURI: WideString; stdcall;
    procedure SetURI(const Value: WideString); stdcall;

    procedure Navigate(const URI: WideString = ''); stdcall;

  end;



  //////////////////////////////////////////////////////////////////////////////////////////
  ///                                    PLUGINS                                         ///
  //////////////////////////////////////////////////////////////////////////////////////////

  /// <summary>
  /// The core interface representing an entire plugin and its contents.
  /// Does not directly instantiate actual features - simply provides access to them.
  /// Task #11
  /// </summary>
  IJDPApplugin = interface
    ['{341CC125-0FCC-44D7-9444-34BCAD491341}']
    function GetName: WideString; stdcall;
    function GetCaption: WideString; stdcall;
    function GetPublisher: WideString; stdcall;
    //function GetMenuItems: IJDPluginMenuItems; stdcall;
    //function GetShellRegs: IJDShellRegs; stdcall;

    property Name: WideString read GetName;
    property Caption: WideString read GetCaption;
    property Publisher: WideString read GetPublisher;
    //property MenuItems: IJDPluginMenuItems read GetMenuItems;
    //property ShellRegs: IJDShellRegs read GetShellRegs;
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
  IJDAppSearchEngine = interface
    ['{0DC3D215-F272-4ABE-8488-FE579307C5D4}']
    function GetCaption: WideString; stdcall;

    procedure ExecuteSearch(const Qry: WideString); stdcall;

  end;







implementation

end.
