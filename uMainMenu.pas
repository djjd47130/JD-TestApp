unit uMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uAppTabContent, JD.Common, JD.Ctrls,
  JD.Ctrls.FontButton, Vcl.ExtCtrls,

  JD.TMDB.Common,
  JD.TMDB.Intf,

  uAppSetup,
  uContentBrowser,

  Vcl.StdCtrls;

type
  TfrmMainMenu = class(TfrmJDAppTabContent)
    SB: TScrollBox;
    btnMenuTEST: TJDFontButton;
    Panel2: TPanel;
    Label2: TLabel;
    btnMenuWebBrowser: TJDFontButton;
    btnMenuAppSetup: TJDFontButton;
    procedure FormCreate(Sender: TObject);
    procedure btnMenuAppSetupClick(Sender: TObject);
    procedure CategoryPanelGroup1MouseWheelDown(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure CategoryPanelGroup1MouseWheelUp(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure FormResize(Sender: TObject);
    procedure btnMenuWebBrowserClick(Sender: TObject);
    procedure btnMenuWebBrowserKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure CalcScrollHeight;
    procedure SetNarrowMode(const Value: Boolean);
  protected
  public
    function CanClose: Boolean; override;
    procedure HideMenu;
  end;

var
  frmMainMenu: TfrmMainMenu;

implementation

{$R *.dfm}

uses
  uAppWindow,
  JD.TabController;

type
  THackCategoryPanelGroup = class(TCategoryPanelGroup)
  protected
    procedure CreateParams (var Params: TCreateParams); override;
  end;

{ THackCategoryPanelGroup }

procedure THackCategoryPanelGroup.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style:= Params.Style  and  not  WS_BORDER;

end;

{ TfrmTMDBMenu }

procedure TfrmMainMenu.FormCreate(Sender: TObject);
begin
  inherited;
  TabCaption:= 'Main Menu';
  CalcScrollHeight;
  SB.VertScrollBar.Position:= 0;
end;

procedure TfrmMainMenu.FormResize(Sender: TObject);
begin
  inherited;
  if Width >= 120 then begin
    SetNarrowMode(False);
  end else begin
    SetNarrowMode(True);
  end;
end;

procedure TfrmMainMenu.HideMenu;
begin
  //TODO: Add user option whether to auto-close menu, enabled by default.
  TfrmAppWindow(MainForm).ShowMenu(False);
end;

procedure TfrmMainMenu.SetNarrowMode(const Value: Boolean);
const
  BTN_HEIGHT = 32;
var
  X, Y: Integer;
  P: TPanel;
  C: TControl;
  L: TLabel;
  B: TJDFontButton;
begin
  for X := 0 to SB.ControlCount-1 do begin
    if SB.Controls[X] is TPanel then begin
      L:= nil;
      P:= SB.Controls[X] as TPanel;
      for Y := 0 to P.ControlCount-1 do begin
        if P.Controls[Y] is TLabel then begin
          L:= P.Controls[Y] as TLabel;
          Break;
        end;
      end;
      if Assigned(L) then begin
        L.Visible:= not Value;
        L.Top:= -1;
      end;
      for Y := 0 to P.ControlCount-1 do begin
        C:= P.Controls[Y];
        if C is TJDFontButton then begin
          B:= C as TJDFontButton;

          B.Height:= BTN_HEIGHT;
          B.Font.Size:= 11;
          B.Margins.Top:= 0;
          B.Margins.Bottom:= 0;
          B.TabStop:= False;

          B.Image.Font.Size:= 15;

          B.ShowHint:= True;
          B.Hint:= B.Text;
          if Assigned(L) then begin
            B.Hint:= L.Caption + ' - ' + B.Hint;
          end;
          if Value then begin
            B.ImagePosition:= fpImgOnly;
            B.Margins.Left:= 5;
            B.Margins.Right:= 5;
          end else begin
            B.ImagePosition:= fpImgLeft;
            B.Margins.Left:= 10; // 20;
            B.Margins.Right:= 10; // 20;
          end;

        end;
      end;
      if Value then begin
        P.ClientHeight:= ((P.ControlCount-1) * BTN_HEIGHT) + 2;
      end else begin
        P.ClientHeight:= ((P.ControlCount-1) * BTN_HEIGHT) + L.Height + 10;
      end;
    end;
  end;
  CalcScrollHeight;
end;

procedure TfrmMainMenu.CalcScrollHeight;
var
  X: Integer;
  H: Integer;
begin
  H:= 1;
  for X := 0 to SB.ControlCount-1 do begin
    H:= H + SB.Controls[X].Height;
  end;
  SB.VertScrollBar.Range:= H;
end;

function TfrmMainMenu.CanClose: Boolean;
begin
  Result:= False;
end;

procedure TfrmMainMenu.CategoryPanelGroup1MouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  inherited;
  SB.VertScrollBar.Position:= SB.VertScrollBar.Position + 20;
end;

procedure TfrmMainMenu.CategoryPanelGroup1MouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  inherited;
  SB.VertScrollBar.Position:= SB.VertScrollBar.Position - 20;
end;

procedure TfrmMainMenu.btnMenuWebBrowserClick(Sender: TObject);
begin
  inherited;
  TfrmAppWindow(MainForm).OpenNewBrowserTab;
  HideMenu;
end;

procedure TfrmMainMenu.btnMenuWebBrowserKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_SPACE) and (Sender is TJDFontButton) then begin
    var Tmp:= TJDFontButton(Sender);
    Tmp.Click;
  end;
end;

procedure TfrmMainMenu.btnMenuAppSetupClick(Sender: TObject);
begin
  inherited;
  TabController(MainForm).CreateTab(TfrmAppSetup, -1, 0);
  HideMenu;
end;

end.
