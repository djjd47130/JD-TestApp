unit uMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uContentBase, JD.Common, JD.Ctrls,
  JD.Ctrls.FontButton, Vcl.ExtCtrls,

  JD.TMDB.Common,
  JD.TMDB.Intf,

  uAppSetup,
  uTMDBHome,

  uContentBrowser,
  uContentClock,
  uContentFileBrowser,
  uJDSysMonGaugesTest,

  Vcl.StdCtrls;

type
  TfrmMainMenu = class(TfrmContentBase)
    SB: TScrollBox;
    pFeatures: TPanel;
    Label3: TLabel;
    pConfig: TPanel;
    Label4: TLabel;
    JDFontButton49: TJDFontButton;
    JDFontButton24: TJDFontButton;
    JDFontButton4: TJDFontButton;
    JDFontButton3: TJDFontButton;
    JDFontButton5: TJDFontButton;
    JDFontButton6: TJDFontButton;
    Panel1: TPanel;
    Label1: TLabel;
    JDFontButton7: TJDFontButton;
    Panel2: TPanel;
    Label2: TLabel;
    JDFontButton1: TJDFontButton;
    JDFontButton8: TJDFontButton;
    JDFontButton9: TJDFontButton;
    JDFontButton10: TJDFontButton;
    JDFontButton11: TJDFontButton;
    JDFontButton12: TJDFontButton;
    JDFontButton2: TJDFontButton;
    procedure FormCreate(Sender: TObject);
    procedure JDFontButton49Click(Sender: TObject);
    procedure CategoryPanelGroup1MouseWheelDown(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure CategoryPanelGroup1MouseWheelUp(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure FormResize(Sender: TObject);
    procedure JDFontButton1Click(Sender: TObject);
    procedure JDFontButton24Click(Sender: TObject);
    procedure JDFontButton2Click(Sender: TObject);
    procedure JDFontButton4Click(Sender: TObject);
    procedure JDFontButton5Click(Sender: TObject);
    procedure JDFontButton6Click(Sender: TObject);
    procedure JDFontButton1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JDFontButton7Click(Sender: TObject);
    procedure JDFontButton8Click(Sender: TObject);
    procedure JDFontButton11Click(Sender: TObject);
    procedure JDFontButton9Click(Sender: TObject);
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
  uMain,
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
  frmMain.ShowMenu(False);
end;

procedure TfrmMainMenu.SetNarrowMode(const Value: Boolean);
const
  BTN_HEIGHT = 38;
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
          B.Font.Size:= 14;
          B.Margins.Top:= 0;
          B.Margins.Bottom:= 0;

          B.Image.Font.Size:= 24;

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
        P.ClientHeight:= ((P.ControlCount-1) * BTN_HEIGHT) + 2; // 20;
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

procedure TfrmMainMenu.JDFontButton11Click(Sender: TObject);
begin
  inherited;

  HideMenu;
end;

procedure TfrmMainMenu.JDFontButton1Click(Sender: TObject);
begin
  inherited;
  frmMain.OpenNewBrowserTab;
  HideMenu;
end;

procedure TfrmMainMenu.JDFontButton1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_SPACE) and (Sender is TJDFontButton) then begin
    var Tmp:= TJDFontButton(Sender);
    Tmp.Click;
  end;
end;

procedure TfrmMainMenu.JDFontButton24Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmTMDBHome, -1, 0);
  HideMenu;
end;

procedure TfrmMainMenu.JDFontButton2Click(Sender: TObject);
begin
  inherited;

  HideMenu;
end;

procedure TfrmMainMenu.JDFontButton49Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmAppSetup, -1, 0);
  HideMenu;
end;

procedure TfrmMainMenu.JDFontButton4Click(Sender: TObject);
begin
  inherited;

  HideMenu;
end;

procedure TfrmMainMenu.JDFontButton5Click(Sender: TObject);
begin
  inherited;

  HideMenu;
end;

procedure TfrmMainMenu.JDFontButton6Click(Sender: TObject);
begin
  inherited;

  HideMenu;
end;

procedure TfrmMainMenu.JDFontButton7Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentClock, -1, 0);
  HideMenu;
end;

procedure TfrmMainMenu.JDFontButton8Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmContentFileBrowser, -1, 0);
  HideMenu;
end;

procedure TfrmMainMenu.JDFontButton9Click(Sender: TObject);
begin
  inherited;
  TabController.CreateTab(TfrmJDSSysMonGaugesTest, -1, 0);
  HideMenu;
end;

end.
