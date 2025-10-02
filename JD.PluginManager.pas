unit JD.PluginManager;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.Classes, System.SysUtils, System.Generics.Collections,
  JD.Plugins.Intf;

type
  TJDCreatePluginObj = function: IJDPlugin; stdcall;

type
  TJDPluginModule = class;
  TJDPluginManager = class;



  TJDPluginModule = class(TObject)
  private
    FOwner: TJDPluginManager;
    FFilename: String;
    FModule: HMODULE;
    FJDCreatePluginObj: TJDCreatePluginObj;
    FPlugin: IJDPlugin;
  public
    constructor Create(AOwner: TJDPluginManager; const Filename: String);
    destructor Destroy; override;

    function GetName: String;
    function GetCaption: String;
    function GetPublisher: String;
  end;

  TJDPluginManager = class(TComponent)
  private
    FModules: TObjectList<TJDPluginModule>;
    function GetModule(const Index: Integer): TJDPluginModule;
    procedure DestroyModules;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function LoadModule(const Filename: String): TJDPluginModule;
    procedure UnloadModule(const Index: Integer);
    function Count: Integer;
    property Modules[const Index: Integer]: TJDPluginModule read GetModule; default;

    function ShellExec(const Path: String): IJDShellReg;

  published

  end;


implementation

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

function TJDPluginManager.Count: Integer;
begin
  Result:= FModules.Count;
end;

function TJDPluginManager.GetModule(const Index: Integer): TJDPluginModule;
begin
  Result:= FModules[Index];
end;

function TJDPluginManager.LoadModule(const Filename: String): TJDPluginModule;
begin
  if FileExists(Filename) then begin
    //Internally creates library...
    Result:= TJDPluginModule.Create(Self, Filename);
    FModules.Add(Result);
  end else begin
    raise Exception.Create('File does not exist: "'+Filename+'"');
  end;
end;

function TJDPluginManager.ShellExec(const Path: String): IJDShellReg;
begin
  //TODO: Load tab based on Path using new Plugin Shell concept...

  //TODO: Implement new Shell Path parser...

end;

procedure TJDPluginManager.UnloadModule(const Index: Integer);
begin
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

function TJDPluginModule.GetPublisher: String;
begin
  Result:= FPlugin.GetPublisher;
end;

end.
