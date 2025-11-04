unit JD.AppController.Impl;

interface

uses
  System.Classes, System.SysUtils,
  JD.AppController.Intf,
  XSuperObject;

type
  TJDAppListItem = class;
  TJDAppListItems = class;
  //IJDAppController implemented in uAppController.TJDAppController
  //IJDAppWindow implemented in uAppWindow.TJDAppWindow
  //IJDAppTabContent implemented in uAppTabContent.TJDAppTabContent



  TJDAppListItem = class(TInterfacedObject, IJDAppListItem)
  private
    FOwner: IJDAppListItems;
    FCaption: WideString;
    FID: WideString;
  protected
    function GetOwner: IJDAppListItems stdcall;
    function GetCaption: WideString stdcall;
    function GetIndex: Integer stdcall;
    function GetID: WideString stdcall;

  public
    constructor Create(AOwner: IJDAppListItems); virtual;
    destructor Destroy; override;

    property Caption: WideString read GetCaption;
    property Index: Integer read GetIndex;
    property ID: WideString read GetID;
  end;

  TJDAppListItems = class(TInterfacedObject, IJDAppListItems)
  private
    FItems: TInterfaceList;
  protected
    function GetCount: Integer stdcall;
    function GetItem(const Index: Integer): IJDAppListItem stdcall;

  public
    constructor Create; virtual;
    destructor Destroy; override;

  public
    function IndexOf(const Item: IJDAppListItem): Integer stdcall;
    procedure Clear stdcall; virtual;
    procedure Delete(const Index: Integer) stdcall; virtual;

    property Count: Integer read GetCount;
    property Items[const Index: Integer]: IJDAppListItem read GetItem; default;
  end;



  TJDAppSetup = class(TInterfacedObject, IJDAppSetup)
  private
    FObj: ISuperObject;
  protected
    //From IJDAppSetup
    function GetS(const N: WideString): WideString stdcall;
    function GetI(const N: WideString): Integer stdcall;
    function GetB(const N: WideString): Boolean stdcall;
    function GetF(const N: WideString): Double stdcall;
    function GetD(const N: WideString): TDateTime stdcall;

    procedure SetS(const N: WideString; const Value: WideString) stdcall;
    procedure SetI(const N: WideString; const Value: Integer) stdcall;
    procedure SetB(const N: WideString; const Value: Boolean) stdcall;
    procedure SetF(const N: WideString; const Value: Double) stdcall;
    procedure SetD(const N: WideString; const Value: TDateTime) stdcall;
    //TODO

    function GetPluginsReg: WideString stdcall;
    function GetAppStartupCmd: WideString stdcall;
    procedure SetAppStartupCmd(const Value: WideString) stdcall;
  public
    constructor Create; virtual;
    destructor Destroy; override;

  public
    //From IJDAppSetup
    function SetupFilename: WideString stdcall; virtual;
    procedure LoadSetup stdcall; virtual;
    procedure SaveSetup stdcall; virtual;
    function IsConfigured: Boolean stdcall; virtual;

    property S[const N: WideString]: WideString read GetS write SetS;
    property I[const N: WideString]: Integer read GetI write SetI;
    property B[const N: WideString]: Boolean read GetB write SetB;
    property F[const N: WideString]: Double read GetF write SetF;
    property D[const N: WideString]: TDateTime read GetD write SetD;

    property PluginsReg: WideString read GetPluginsReg;
    property AppStartupCmd: WideString read GetAppStartupCmd write SetAppStartupCmd;

  end;

implementation

uses
  System.IOUtils;

{ TJDAppListItem }

constructor TJDAppListItem.Create(AOwner: IJDAppListItems);
begin
  FOwner:= AOwner;
end;

destructor TJDAppListItem.Destroy;
begin

  inherited;
end;

function TJDAppListItem.GetCaption: WideString;
begin
  Result:= FCaption;
end;

function TJDAppListItem.GetID: WideString;
begin
  Result:= FID;
end;

function TJDAppListItem.GetIndex: Integer;
begin
  Result:= FOwner.IndexOf(Self);
end;

function TJDAppListItem.GetOwner: IJDAppListItems;
begin
  Result:= FOwner;
end;

{ TJDAppListItems }

procedure TJDAppListItems.Clear;
begin
  while Count > 0 do
    Delete(0);
end;

constructor TJDAppListItems.Create;
begin
  FItems:= TInterfaceList.Create;
end;

procedure TJDAppListItems.Delete(const Index: Integer);
begin
  FItems.Delete(Index);
end;

destructor TJDAppListItems.Destroy;
begin
  Clear;
  FreeAndNil(FItems);
  inherited;
end;

function TJDAppListItems.GetCount: Integer;
begin
  Result:= FItems.Count;
end;

function TJDAppListItems.GetItem(const Index: Integer): IJDAppListItem;
begin
  Result:= IJDAppListItem(FItems[Index]);
end;

function TJDAppListItems.IndexOf(const Item: IJDAppListItem): Integer;
begin
  Result:= FItems.IndexOf(Item);
end;

{ TJDAppSetup }

constructor TJDAppSetup.Create;
begin
  LoadSetup;

end;

destructor TJDAppSetup.Destroy;
begin

  SaveSetup;
  inherited;
end;

function TJDAppSetup.GetAppStartupCmd: WideString;
begin
  Result:= S['app_startup_cmd'];
end;

function TJDAppSetup.GetB(const N: WideString): Boolean;
begin
  Result:= FObj.B[N];
end;

function TJDAppSetup.GetD(const N: WideString): TDateTime;
begin
  Result:= FObj.D[N];
end;

function TJDAppSetup.GetF(const N: WideString): Double;
begin
  Result:= FObj.F[N];
end;

function TJDAppSetup.GetI(const N: WideString): Integer;
begin
  Result:= FObj.I[N];
end;

function TJDAppSetup.GetPluginsReg: WideString;
begin
  Result:= GetS('plugins_reg');
end;

function TJDAppSetup.GetS(const N: WideString): WideString;
begin
  Result:= FObj.S[N];
end;

function TJDAppSetup.IsConfigured: Boolean;
begin
  Result:= True; //TODO

end;

procedure TJDAppSetup.LoadSetup;
begin
  if FileExists(SetupFilename) then begin
    FObj:= TSuperObject.ParseFile(SetupFilename);
  end else begin
    FObj:= SO;
    //TODO: Defaults...
  end;
end;

procedure TJDAppSetup.SaveSetup;
begin
  if FObj <> nil then
    FObj.SaveTo(SetupFilename, True);
end;

procedure TJDAppSetup.SetAppStartupCmd(const Value: WideString);
begin
  S['app_startup_cmd']:= Value;
end;

procedure TJDAppSetup.SetB(const N: WideString; const Value: Boolean);
begin
  FObj.B[N]:= Value;
end;

procedure TJDAppSetup.SetD(const N: WideString; const Value: TDateTime);
begin
  FObj.D[N]:= Value;
end;

procedure TJDAppSetup.SetF(const N: WideString; const Value: Double);
begin
  FObj.F[N]:= Value;
end;

procedure TJDAppSetup.SetI(const N: WideString; const Value: Integer);
begin
  FObj.I[N]:= Value;
end;

procedure TJDAppSetup.SetS(const N: WideString; const Value: WideString);
begin
  FObj.S[N]:= Value;
end;

function TJDAppSetup.SetupFilename: WideString;
begin
  Result:= ExtractFilePath(ParamStr(0));
  Result:= TPath.Combine(Result, 'AppConfig.json');
end;

end.
