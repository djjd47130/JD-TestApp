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
    procedure FormCreate(Sender: TObject);
  private
    FOwner: IJDAppController;
    FID: Integer;
    FMainForm: TForm;
    FURI: String;
  protected

  public

    //Methods from IJDAppTabRef
    function GetTabCaption: WideString stdcall;
    procedure SetTabCaption(const Value: WideString) stdcall;
    function GetID: Integer stdcall;
    function GetOwner: IJDAppController stdcall; reintroduce;
    function GetParent: IJDAppWindow stdcall;
    function GetURI: WideString stdcall;
    function GetIndex: Integer stdcall;

    procedure SetParentWindow(const Wnd: HWND) stdcall;
    procedure RefreshData stdcall; virtual;
    function CanClose: Boolean stdcall; virtual;
    procedure Navigate(const URI: WideString = '') stdcall;

  public
    //TODO: Pass instance of IJDAppController...
    constructor Create(AOwner: TComponent; AMainForm: TForm); reintroduce; virtual;
    destructor Destroy; override;

    property TabCaption: WideString read GetTabCaption write SetTabCaption;
    property ID: Integer read GetID;
    function ChromeTab: TChromeTab;

    //TODO: Favicons - #13
    function GetImageIndex: Integer; virtual;

    //TODO: Shell functions - #8
    class function GetShellRoot: String; virtual;
    class function GetShellPath: String; virtual;
    class procedure ShellOpen(const Path: String); virtual;

    //TODO: Main form shall become "Parent form".
    property MainForm: TForm read FMainForm;

    //TODO: Browsing / Navigation History


  end;

var
  frmJDAppTabContent: TfrmJDAppTabContent;




implementation

{$R *.dfm}

uses
  uAppController,
  uAppWindow,
  JD.TabController
  , IdURI
  ;




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



var
  _TabLastID: Int64;

function NewTabID: Int64;
begin
  _TabLastID:= _TabLastID + 1;
  Result:= _TabLastID;
end;

{ TfrmJDAppTabContent }

constructor TfrmJDAppTabContent.Create(AOwner: TComponent; AMainForm: TForm);
begin
  inherited Create(AOwner);
  FID:= NewTabID;
  FMainForm:= AMainForm;
  TabCaption:= Caption;
  {$IFDEF NEW_TABS}
  AppController.RegisterContent(Self);
  {$ELSE}

  {$ENDIF}
end;

destructor TfrmJDAppTabContent.Destroy;
begin

  {$IFDEF NEW_TABS}
  AppController.UnregisterContent(Self);
  {$ENDIF}
  inherited;
end;

procedure TfrmJDAppTabContent.FormCreate(Sender: TObject);
begin
  {$IFDEF NEW_TABS}
  pNav.Visible:= True;
  {$ELSE}
  pNav.Visible:= False;
  {$ENDIF}
end;

function TfrmJDAppTabContent.GetID: Integer;
begin
  Result:= FID;
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
begin
  {$IFNDEF NEW_TABS}
  var T:= TabController(MainForm).TabByForm(Self);
  if T <> nil then
    Result:= T.Caption;
  {$ELSE}
  //TODO: Use new app controller to fetch tab caption...
  Result:= inherited Caption;
  {$ENDIF}
end;

procedure TfrmJDAppTabContent.SetTabCaption(const Value: WideString);
begin
  {$IFNDEF NEW_TABS}
  var T:= TabController(MainForm).TabByForm(Self);
  if T <> nil then
    T.Caption:= Value;
  {$ELSE}
  //TODO: Use new app controller to update tab caption...
  var T:= Self.ChromeTab;
  if T <> nil then
    T.Caption:= Value;
  //TODO: Also update form caption, if this is the active tab...

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

function TfrmJDAppTabContent.CanClose: Boolean;
begin
  //Override supported
  Result:= True;
end;

function TfrmJDAppTabContent.ChromeTab: TChromeTab;
begin
  //Return TChromeTab associated with this content...
  Result:= TfrmAppWindow(MainForm).ChromeTabByID(FID);
end;

procedure TfrmJDAppTabContent.RefreshData;
begin
  //Override supported
  Self.Navigate(Self.FURI);
end;

function TfrmJDAppTabContent.GetIndex: Integer;
begin
  //Return this content's tab index within global registry...
  Result:= AppController.IndexOfTab(Self);
end;

procedure TfrmJDAppTabContent.SetParentWindow(const Wnd: HWND);
begin
  Winapi.Windows.SetParent(Self.Handle, Wnd);
end;

procedure TfrmJDAppTabContent.btnNavRefreshClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmJDAppTabContent.btnNavBackClick(Sender: TObject);
begin
  //TODO: Go back in history (Soft Nav)...

end;

procedure TfrmJDAppTabContent.btnNavFavoritesClick(Sender: TObject);
begin
  //TODO: Show/Hide favorites menu...

end;

procedure TfrmJDAppTabContent.btnNavForwardClick(Sender: TObject);
begin
  //TODO: Go forward in history (Soft Nav)...

end;

procedure TfrmJDAppTabContent.btnNavGoClick(Sender: TObject);
begin
  //TODO: Navigate to shell URI (Hard Nav)...
  Navigate(txtNavURI.Text);
end;

procedure TfrmJDAppTabContent.Navigate(const URI: WideString);
begin
  FURI:= URI;
  txtNavURI.Text:= URI;
  ChromeTab.SpinnerState:= TChromeTabSpinnerState.tssRenderedDownload;
  try
    DisableAlign;
    try
      //TODO: Unload whatever might be currently loaded...


      //TODO: Migrate this logic to an app-level handler...


      //TODO: Reload content to new screen (Hard Nav)...
      var U:= TIdURI.Create(URI);
      try
        //Determine protocol / host name and handle accordingly...
        if SameText(U.Protocol, 'jd') then begin
          if SameText(U.Host, 'system') then begin
            //TODO: Handle system-level command...

          end;
        end else
        if SameText(U.Protocol, 'http') or SameText(U.Protocol, 'https') then begin
          //TODO: Open in web browser...

        end else begin
          //TODO: Unknown protocol or command, lookup in plugins...

          //TODO: Return error screen, if needed...

        end;
      finally
        U.Free;
      end;
    finally
      EnableAlign;
    end;
  finally
    ChromeTab.SpinnerState:= TChromeTabSpinnerState.tssNone;
  end;
end;

end.
