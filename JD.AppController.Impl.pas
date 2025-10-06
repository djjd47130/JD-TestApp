unit JD.AppController.Impl;

interface

uses
  System.Classes, System.SysUtils,
  JD.AppController.Intf;

  {
type
  TJDAppController = class(TInterfacedObject, IJDAppController)
  private
    FWindows: TInterfaceList;
    function GetWindowCount: Integer; stdcall;
    function GetWindow(const Index: Integer): IJDAppWindow; stdcall;
  protected

  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure Initialize; virtual; stdcall;

    function CreateNewWindow(const URI: WideString = ''): IJDAppWindow; stdcall;
    procedure CloseWindow(const Index: Integer); stdcall;

  end;
  }

implementation

{ TJDAppController }
{

procedure TJDAppController.CloseWindow(const Index: Integer);
begin
  //TODO
end;

constructor TJDAppController.Create;
begin
  FWindows:= TInterfaceList.Create;

end;

function TJDAppController.CreateNewWindow(const URI: WideString): IJDAppWindow;
begin
  //TODO
end;

destructor TJDAppController.Destroy;
begin

  //TODO: Gracefully close...
  FWindows.Clear;
  FreeAndNil(FWindows);
  inherited;
end;

function TJDAppController.GetWindow(const Index: Integer): IJDAppWindow;
begin
  Result:= IJDAppWindow(FWindows[Index]);
end;

function TJDAppController.GetWindowCount: Integer;
begin
  Result:= FWindows.Count;
end;

procedure TJDAppController.Initialize;
begin
  //TODO: Setup plugins...

end;
}

end.
