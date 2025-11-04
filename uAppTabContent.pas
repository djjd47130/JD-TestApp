unit uAppTabContent;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,

  ChromeTabs, ChromeTabsClasses, ChromeTabsTypes,
  JD.AppController.Intf, JD.Common, JD.Ctrls, JD.Ctrls.FontButton;



//References to detail list items, and handling click events.
//TODO: Find a better place for this...
type
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
  TfrmJDAppTabContent = class;

  TfrmJDAppTabContentClass = class of TfrmJDAppTabContent;

  TfrmJDAppTabContent = class(TForm, IJDAppTabContent)
    pNav: TPanel;
    txtNavURI: TEdit;
    btnNavGo: TJDFontButton;
    btnNavBack: TJDFontButton;
    btnNavForward: TJDFontButton;
    btnNavRefresh: TJDFontButton;
    btnNavFavorites: TJDFontButton;
    btnNavMenu: TJDFontButton;
    procedure btnNavGoClick(Sender: TObject);
    procedure btnNavRefreshClick(Sender: TObject);
    procedure btnNavBackClick(Sender: TObject);
    procedure btnNavForwardClick(Sender: TObject);
    procedure btnNavFavoritesClick(Sender: TObject);
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
  frmJDAppTabContent: TfrmJDAppTabContent;




implementation

{$R *.dfm}

uses
  uAppWindow,
  JD.TabController;




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

{ TfrmJDAppTabContent }

constructor TfrmJDAppTabContent.Create(AOwner: TComponent; AMainForm: TForm);
begin
  inherited Create(AOwner);
  FMainForm:= AMainForm;
  TabCaption:= Caption;
end;

destructor TfrmJDAppTabContent.Destroy;
begin

  inherited;
end;

function TfrmJDAppTabContent.GetImageIndex: Integer;
begin
  Result:= -1;
end;

class function TfrmJDAppTabContent.GetShellPath: String;
begin
  //Override expected
  Result:= '';
end;

class function TfrmJDAppTabContent.GetShellRoot: String;
begin
  //Override expected
  Result:= 'App';
end;

class procedure TfrmJDAppTabContent.ShellOpen(const Path: String);
begin
  //Override expected
end;

function TfrmJDAppTabContent.GetTabCaption: WideString;
var
  T: TJDTabRef;
begin
  {$IFNDEF NEW_TABS}
  T:= TabController(MainForm).TabByForm(Self);
  if T <> nil then
    Result:= T.Caption;
  {$ELSE}
  //TODO: Use new app controller...

  {$ENDIF}
end;

function TfrmJDAppTabContent.GetOwner: IJDAppController;
begin
  Result:= FOwner;
end;

function TfrmJDAppTabContent.GetParent: IJDAppWindow;
begin
  Result:= IJDAppWindow(TfrmAppWindow(FMainForm));
end;

function TfrmJDAppTabContent.GetURI: WideString;
begin
  Result:= FURI;
end;

procedure TfrmJDAppTabContent.btnNavRefreshClick(Sender: TObject);
begin
  Self.RefreshData;
end;

function TfrmJDAppTabContent.CanClose: Boolean;
begin
  //Override supported
  Result:= True;
end;

procedure TfrmJDAppTabContent.RefreshData;
begin
  //Override expected
end;

function TfrmJDAppTabContent.GetIndex: Integer;
begin
  //TODO: Return index of tab within window, or global registry???
  //  Is this even necessary?

end;

procedure TfrmJDAppTabContent.SetTabCaption(const Value: WideString);
var
  T: TJDTabRef;
begin
  {$IFNDEF NEW_TABS}
  T:= TabController(MainForm).TabByForm(Self);
  if T <> nil then
    T.Caption:= Value;
  {$ELSE}
  //TODO: Use new app controller...

  {$ENDIF}
end;

procedure TfrmJDAppTabContent.Navigate(const URI: WideString);
begin
  //TODO
  FURI:= URI;
  //TODO: Reload content to new screen...

end;

procedure TfrmJDAppTabContent.btnNavBackClick(Sender: TObject);
begin
  //TODO: Go back in history...

end;

procedure TfrmJDAppTabContent.btnNavFavoritesClick(Sender: TObject);
begin
  //TODO: Show/Hide favorites menu...

end;

procedure TfrmJDAppTabContent.btnNavForwardClick(Sender: TObject);
begin
  //TODO: Go forward in history...

end;

procedure TfrmJDAppTabContent.btnNavGoClick(Sender: TObject);
begin
  //TODO: Navigate to shell URI...

end;

end.
