unit uContentBase;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,

  ChromeTabs, ChromeTabsClasses, ChromeTabsTypes
  , JD.AppController.Intf
  ;

type

  //References to detail list items, and handling click events.

  TDetailRef = class;

  TDetailRefEvent = reference to procedure(Ref: TDetailRef);

  TDetailRef = class(TObject)
  private
    FOnClick: TDetailRefEvent;
    FItem: TListItem;
    procedure SetOnClick(const Value: TDetailRefEvent);
    function GetClickable: Boolean;
  public
    constructor Create(AItem: TListItem);
    property Clickable: Boolean read GetClickable;
    property Item: TListItem read FItem;
    property OnClick: TDetailRefEvent read FOnClick write SetOnClick;
  end;



type
  TfrmContentBase = class;

  TfrmContentBaseClass = class of TfrmContentBase;

  TfrmContentBase = class(TForm, IJDAppContentBase)
  private
    FOwner: IJDAppController;
    FMainForm: TForm;
    FURI: String;
  protected

  public

    //Methods from IJDAppTabRef
    function GetTabCaption: WideString stdcall;
    procedure SetTabCaption(const Value: WideString) stdcall;
    function GetOwner: IJDAppController stdcall; reintroduce;
    function GetParent: IJDAppWindow stdcall;
    function GetURI: WideString stdcall;
    function GetIndex: Integer stdcall;
    procedure RefreshData stdcall; virtual;
    function CanClose: Boolean stdcall; virtual;
    procedure Navigate(const URI: WideString = '') stdcall;

  public
    //TODO: Pass instance of IJDAppController...
    constructor Create(AOwner: TComponent; AMainForm: TForm); reintroduce; virtual;
    destructor Destroy; override;

    property TabCaption: WideString read GetTabCaption write SetTabCaption;

    //TODO: Favicons - #13
    function GetImageIndex: Integer; virtual;

    //TODO: Shell functions - #8
    class function GetShellRoot: String; virtual;
    class function GetShellPath: String; virtual;
    class procedure ShellOpen(const Path: String); virtual;

    property MainForm: TForm read FMainForm;


  end;

var
  frmContentBase: TfrmContentBase;



//TODO: Registered content forms for shell addresses - #8
{
function RegisteredContentForms: TList<TfrmContentBaseClass>;
procedure RegisterContentForm(AClass: TfrmContentBaseClass);
procedure UnregisterContentForm(AClass: TfrmContentBaseClass);
}


implementation

{$R *.dfm}

uses
  uAppWindow,
  JD.TabController;



//TODO: Registered content forms for shell addresses - #8
{
var
  _RegisteredContentForms: TList<TfrmContentBaseClass>;

function RegisteredContentForms: TList<TfrmContentBaseClass>;
begin
  if _RegisteredContentForms = nil then
    _RegisteredContentForms:= TList<TfrmContentBaseClass>.Create;
  Result:= _RegisteredContentForms;
end;

procedure RegisterContentForm(AClass: TfrmContentBaseClass);
begin
  var I:= RegisteredContentForms.IndexOf(AClass);
  if I < 0 then
    RegisteredContentForms.Add(AClass);
end;

procedure UnregisterContentForm(AClass: TfrmContentBaseClass);
begin
  var I:= RegisteredContentForms.IndexOf(AClass);
  if I < 0 then
    RegisteredContentForms.Delete(I);
end;
}




{ TDetailRef }

constructor TDetailRef.Create(AItem: TListItem);
begin
  FItem:= AItem;
end;

function TDetailRef.GetClickable: Boolean;
begin
  Result:= Assigned(FOnClick);
end;

procedure TDetailRef.SetOnClick(const Value: TDetailRefEvent);
begin
  FOnClick := Value;
end;

{ TfrmContentBase }

constructor TfrmContentBase.Create(AOwner: TComponent; AMainForm: TForm);
begin
  inherited Create(AOwner);
  FMainForm:= AMainForm;
  TabCaption:= Caption;
end;

destructor TfrmContentBase.Destroy;
begin

  inherited;
end;

function TfrmContentBase.GetImageIndex: Integer;
begin
  Result:= -1;
end;

class function TfrmContentBase.GetShellPath: String;
begin
  //Override expected
  Result:= '';
end;

class function TfrmContentBase.GetShellRoot: String;
begin
  //Override expected
  Result:= 'App';
end;

class procedure TfrmContentBase.ShellOpen(const Path: String);
begin
  //Override expected
end;

function TfrmContentBase.GetTabCaption: WideString;
var
  T: TJDTabRef;
begin
  T:= TabController(MainForm).TabByForm(Self);
  if T <> nil then
    Result:= T.Caption;
end;

function TfrmContentBase.GetIndex: Integer;
begin
  //TODO: Return index of tab within window, or global registry???
  //  Is this even necessary?

end;

function TfrmContentBase.GetOwner: IJDAppController;
begin
  Result:= FOwner;
end;

function TfrmContentBase.GetParent: IJDAppWindow;
begin
  Result:= IJDAppWindow(TfrmAppWindow(FMainForm));
end;

function TfrmContentBase.GetURI: WideString;
begin
  Result:= FURI;
end;

procedure TfrmContentBase.Navigate(const URI: WideString);
begin
  //TODO
  FURI:= URI;
  //TODO: Reload content to new screen...

end;

function TfrmContentBase.CanClose: Boolean;
begin
  //Override supported
  Result:= True;
end;

procedure TfrmContentBase.RefreshData;
begin
  //Override expected
end;

procedure TfrmContentBase.SetTabCaption(const Value: WideString);
var
  T: TJDTabRef;
begin
  T:= TabController(MainForm).TabByForm(Self);
  if T <> nil then
    T.Caption:= Value;
end;

initialization
  //_RegisteredContentForms:= nil;

finalization
  //FreeAndNil(_RegisteredContentForms);

end.
