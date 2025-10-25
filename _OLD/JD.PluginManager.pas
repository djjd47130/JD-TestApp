unit JD.PluginManager;

(*
  JD Plugin Manager
  Task #11

  TJDPluginManager Loads and maintains all plugins for the app.

*)

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.Classes, System.SysUtils, System.Generics.Collections,
  JD.Plugins.Intf,
  JD.TabController,
  ChromeTabs, ChromeTabsTypes;

type
  TJDCreatePluginObj = function: IJDPlugin; stdcall;

type
  TJDPluginModule = class;
  TJDPluginManager = class;



  TJDPluginEvent = procedure(Sender: TObject; Plugin: TJDPluginModule) of object;




  /// <summary>
  /// Represents a single plugin module (DLL) registered in the app.
  /// </summary>
  TJDPluginModule = class(TObject)
  private
    FOwner: TJDPluginManager;
    FFilename: String;
    FModule: HMODULE;
    FJDCreatePluginObj: TJDCreatePluginObj;
    FPlugin: IJDPlugin;
  protected
    function GetPlugin: IJDPlugin;
    function GetName: String;
    function GetCaption: String;
    function GetPublisher: String;
  public
    constructor Create(AOwner: TJDPluginManager; const Filename: String);
    destructor Destroy; override;

    property Plugin: IJDPlugin read GetPlugin;
    property Name: String read GetName;
    property Caption: String read GetCaption;
    property Publisher: String read GetPublisher;
  end;

  /// <summary>
  /// Main component to instantiate and manage all registered plugins.
  /// </summary>
  TJDPluginManager = class(TComponent)
  private
    FModules: TObjectList<TJDPluginModule>;
    FTabController: TJDTabController;
    FOnPluginLoaded: TJDPluginEvent;
    FOnPluginUnloaded: TJDPluginEvent;
    procedure SetTabController(const Value: TJDTabController);
  protected
    function GetModule(const Index: Integer): TJDPluginModule; virtual;
    procedure DestroyModules; virtual;
    procedure DoPluginLoaded(Plugin: TJDPluginModule); virtual;
    procedure DoPluginUnloaded(Plugin: TJDPluginModule); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    /// <summary>
    /// Loads all plugin DLLs found in a given directory.
    /// </summary>
    procedure LoadDir(const Dir: String);

    /// <summary>
    /// Loads a specific plugin DLL by its full path and filename.
    /// </summary
    function LoadModule(const Filename: String): TJDPluginModule;

    /// <summary>
    /// Unloads a specific plugin DLL by its list index.
    /// </summary>
    procedure UnloadModule(const Index: Integer);

    /// <summary>
    /// Returns the total number of loaded plugin modules.
    /// </summary>
    function Count: Integer;

    /// <summary>
    /// Returns a loaded plugin module by its index.
    /// </summary>
    property Modules[const Index: Integer]: TJDPluginModule read GetModule; default;

    /// <summary>
    /// CORE function to execute any given Shell command by a given path
    /// </summary>
    function ShellExec(const Path: String): IJDShellReg;

  published

    /// <summary>
    /// The tab controller linked with the plugin manager to open new tabs as needed.
    /// </summary>
    property TabController: TJDTabController read FTabController write SetTabController;

    property OnPluginLoaded: TJDPluginEvent read FOnPluginLoaded write FOnPluginLoaded;
    property OnPluginUnloaded: TJDPluginEvent read FOnPluginUnloaded write FOnPluginUnloaded;

  end;




  /// <summary>
  /// Provides plugin access to the tabular interface.
  /// </summary>
  TJDPluginTabController = class(TInterfacedObject, IJDPluginTabController)
  private
    FParent: HWND;
    FTabController: TJDTabController;
    procedure SetTabController(const Value: TJDTabController);
  protected
    function GetParent: HWND; stdcall;
    procedure SetParent(const Value: HWND); stdcall;
    function GetCount: Integer; stdcall;
    function GetItem(const Index: Integer): IJDPluginTabRef; stdcall;
  public
    constructor Create(ATabController: TJDTabController; const AParent: HWND); virtual;
    destructor Destroy; override;

    function CreateTab(const Caption: WideString; const Index: Integer = -1): IJDPluginTabRef; stdcall;
    procedure DeleteTab(const Index: Integer); stdcall;

    property TabController: TJDTabController read FTabController write SetTabController;
    property Parent: HWND read GetParent write SetParent;
    property Count: Integer read GetCount;
    property Items[const Index: Integer]: IJDPluginTabRef read GetItem;
  end;

  /// <summary>
  /// Represents a single content tab within application UI.
  /// </summary>
  TJDPluginTabRef = class(TInterfacedObject, IJDPluginTabRef)
  private
    FOwner: IJDPluginTabController;
    FRef: TJDTabRef;
  protected
    function GetOwner: IJDPluginTabController; stdcall;
    function GetIndex: Integer; stdcall;
    function GetCaption: WideString; stdcall;
    procedure SetCaption(const Value: WideString); stdcall;
  public
    constructor Create(AOwner: IJDPluginTabController; const ARef: TJDTabRef); virtual;
    destructor Destroy; override;

    procedure ShowContent; stdcall;

    property Owner: IJDPluginTabController read GetOwner;
    property Index: Integer read GetIndex;
    property Caption: WideString read GetCaption write SetCaption;
  end;





implementation

uses
  System.IOUtils,
  IdURI,
  uContentPluginBase,
  uContentBrowser,
  uAppSetup;

{ TJDPluginManager }

constructor TJDPluginManager.Create(AOwner: TComponent);
begin
  inherited;
  FModules:= TObjectList<TJDPluginModule>.Create(False);

end;

destructor TJDPluginManager.Destroy;
begin

  DestroyModules;
  FreeAndNil(FModules);
  inherited;
end;

procedure TJDPluginManager.DestroyModules;
begin
  while FModules.Count > 0 do
    UnloadModule(0);
end;

procedure TJDPluginManager.DoPluginLoaded(Plugin: TJDPluginModule);
begin
  if Assigned(FOnPluginLoaded) then
    FOnPluginLoaded(Self, Plugin);
end;

procedure TJDPluginManager.DoPluginUnloaded(Plugin: TJDPluginModule);
begin
  if Assigned(FOnPluginUnloaded) then
    FOnPluginUnloaded(Self, Plugin);
end;

function TJDPluginManager.Count: Integer;
begin
  Result:= FModules.Count;
end;

function TJDPluginManager.GetModule(const Index: Integer): TJDPluginModule;
begin
  Result:= FModules[Index];
end;

procedure TJDPluginManager.LoadDir(const Dir: String);
begin
  DestroyModules;
  var L:= TDirectory.GetFiles(Dir, '*.dll');
  for var X := 0 to Length(L) do begin
    var FN:= L[X];
    LoadModule(FN);
  end;
end;

procedure TJDPluginManager.SetTabController(const Value: TJDTabController);
begin
  FTabController := Value;
end;

function TJDPluginManager.ShellExec(const Path: String): IJDShellReg;
begin
  //TODO: Execute shell command based on Path using new Plugin Shell concept...
  //Task #8

  var U:= TIdURI.Create(Path);
  try
    if SameText(U.Protocol, 'http') or SameText(U.Protocol, 'https') then begin
      //Open in web browser...
      var F:= TabController.CreateTab(TfrmContentBrowser);
      TfrmContentBrowser(F).Navigate(Path);
    end else
    if SameText(U.Protocol, 'jd') then begin
      if SameText(U.Path, 'config') then begin
        //Open app config...
        TabController.CreateTab(TfrmAppSetup);

      end else
      if SameText(U.Path, 'home') then begin
        //TODO: Open home page...

      end else begin
        //TODO: Return 404 not found...

      end;
    end else
    begin
      //TODO - Lookup each registered shell command in each registered plugin...
      var Executed: Boolean:= False;
      for var X := 0 to FModules.Count-1 do begin
        var M:= FModules[X];
        for var Y := 0 to M.Plugin.ShellRegs.Count-1 do begin
          var Reg:= M.Plugin.ShellRegs[Y];
          if SameText(U.Protocol, Reg.ShellRoot) then begin
            if SameText(U.Path, Reg.ShellPath) then begin
              Reg.ShellExec(Path);
              Executed:= True;
            end;
          end;
        end;
      end;
      if not Executed then begin
        //TODO: Return 404 not found...

      end;
    end;
  finally
    U.Free;
  end;

end;

function TJDPluginManager.LoadModule(const Filename: String): TJDPluginModule;
begin
  if FileExists(Filename) then begin
    //TODO: Check if module is already loaded...

    //Internally creates library...
    Result:= TJDPluginModule.Create(Self, Filename);
    FModules.Add(Result);
    DoPluginLoaded(Result);
  end else begin
    raise Exception.Create('File does not exist: "'+ExtractFileName(Filename)+'"');
  end;
end;

procedure TJDPluginManager.UnloadModule(const Index: Integer);
begin
  DoPluginUnloaded(FModules[Index]);

  //Internally frees library...
  FModules.Delete(Index);
end;

{ TJDPluginModule }

constructor TJDPluginModule.Create(AOwner: TJDPluginManager; const Filename: String);
begin
  FOwner:= AOwner;
  FFilename:= Filename;
  ////////////////////////////////////////////////////////////////////////////////////
  FModule:= LoadLibrary(PChar(Filename));
  ////////////////////////////////////////////////////////////////////////////////////
  if FModule > 0 then begin
    try

      //Create plugin object from plugin DLL...
      FJDCreatePluginObj:= GetProcAddress(FModule, 'JDCreatePluginObj');
      FPlugin:= FJDCreatePluginObj;

    except
      on E: Exception do begin
        raise Exception.Create('An error occurred while loading module: '+E.Message);
      end;
    end;
  end else begin
    raise Exception.Create('The call to LoadLibrary failed.');
  end;
end;

destructor TJDPluginModule.Destroy;
begin
  if FModule <> 0 then
  ////////////////////////////////////////////////////////////////////////////////////
    FreeLibrary(FModule);
  ////////////////////////////////////////////////////////////////////////////////////
  inherited;
end;

function TJDPluginModule.GetCaption: String;
begin
  Result:= FPlugin.GetCaption;
end;

function TJDPluginModule.GetName: String;
begin
  Result:= FPlugin.GetName;
end;

function TJDPluginModule.GetPlugin: IJDPlugin;
begin
  Result:= FPlugin;
end;

function TJDPluginModule.GetPublisher: String;
begin
  Result:= FPlugin.GetPublisher;
end;

{ TJDPluginTabController }

constructor TJDPluginTabController.Create(ATabController: TJDTabController; const AParent: HWND);
begin
  FTabController:= ATabController;
  FParent:= AParent;
end;

function TJDPluginTabController.CreateTab(const Caption: WideString; const Index: Integer): IJDPluginTabRef;
begin
  var T:= FTabController.CreateTab(TfrmContentPluginBase, Index);
  //TODO: Assign ref...
  Result:= TJDPluginTabRef.Create(Self, T);
  Result.Caption:= Caption;

  //TODO: Create and embed content...
  //var Frm:= //TODO
  //T.Content:= Frm;
  //Winapi.Windows.SetParent(T.Content.Handle, FParent);

end;

destructor TJDPluginTabController.Destroy;
begin

  inherited;
end;

procedure TJDPluginTabController.DeleteTab(const Index: Integer);
begin
  FTabController.DeleteTab(Index);
end;

function TJDPluginTabController.GetCount: Integer;
begin
  Result:= FTabController.TabCount;
end;

function TJDPluginTabController.GetItem(const Index: Integer): IJDPluginTabRef;
begin

end;

function TJDPluginTabController.GetParent: HWND;
begin
  Result:= FParent;
end;

procedure TJDPluginTabController.SetParent(const Value: HWND);
begin
  FParent:= Value;
  //TODO
end;

procedure TJDPluginTabController.SetTabController(const Value: TJDTabController);
begin
  FTabController := Value;
end;

{ TJDPluginTabRef }

constructor TJDPluginTabRef.Create(AOwner: IJDPluginTabController; const ARef: TJDTabRef);
begin
  FOwner:= AOwner;
  FRef:= ARef;
  //TODO

end;

destructor TJDPluginTabRef.Destroy;
begin

  //TODO
  inherited;
end;

function TJDPluginTabRef.GetCaption: WideString;
begin
  Result:= FRef.Caption;
end;

function TJDPluginTabRef.GetIndex: Integer;
begin
  Result:= FRef.Index;
end;

function TJDPluginTabRef.GetOwner: IJDPluginTabController;
begin
  Result:= FOwner;
end;

procedure TJDPluginTabRef.SetCaption(const Value: WideString);
begin
  FRef.Caption:= Value;
end;

procedure TJDPluginTabRef.ShowContent;
begin
  //TODO
end;

end.
