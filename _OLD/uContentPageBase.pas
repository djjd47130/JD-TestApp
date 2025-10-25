unit uContentPageBase;

(*
  TfrmContentPageBase - A tabular form intented to show a list of items with pagination capabilities.

  TODO:
  - Change list item concept to be more general-purpose, not tied to TMDB
    - New concept in uContentListBase / uListItemBase
  - Implement optional images
  -

*)

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uContentBase, uTMDBContentBase,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  JD.TMDB.Intf,
  JD.Common, JD.Ctrls, JD.Ctrls.FontButton,
  uTMDBListItem;


type
  TfrmContentPageBase = class(TfrmTMDBContentBase)
    pMain: TPanel;
    pTop: TPanel;
    lblResults: TLabel;
    lblPage: TLabel;
    pSearch: TPanel;
    pDetail: TPanel;
    Splitter1: TSplitter;
    btnApply: TJDFontButton;
    btnRefresh: TJDFontButton;
    sbItems: TScrollBox;
    btnPageNext: TJDFontButton;
    btnPagePrev: TJDFontButton;
    procedure lstResultsClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnPagePrevClick(Sender: TObject);
    procedure btnPageNextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure sbItemsMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure sbItemsMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
  private
    FObj: ITMDBPage;
  protected
    procedure PrepSearch; virtual;
    procedure UpdateFooter; virtual;
    procedure HideDetail; virtual;
    procedure ClearResults; virtual;
    function AddListItem(AItem: ITMDBItem): TfrmTMDBListItem; virtual;

    function Page: ITMDBPage; virtual;
    function LoadPage(const APageNum: Integer): Boolean; virtual;
    procedure PopulateResults; virtual;

    function GetData(const APageNum: Integer): ITMDBPage; virtual; //TODO: Rename to GetPageData
    function GetItem(const Index: Integer): ITMDBItem; virtual; //TODO: Rename to GetItemByIndex
    procedure ShowDetail(const Index: Integer; Item: TfrmTMDBListItem; Obj: ITMDBItem); virtual;
    procedure ItemClick(const Index: Integer; Item: TfrmTMDBListItem; Obj: ITMDBItem); virtual;

    function GetTotalItemsHeight: Integer;

  public

    procedure RefreshData; override;
    procedure PageNext; virtual;
    procedure PagePrev; virtual;
    function PageCount: Integer; virtual;
    function ResultCount: Integer; virtual;
    function TotalResults: Integer; virtual;
    function PageNum: Integer; virtual;
    procedure Refresh; virtual;

  end;

var
  frmContentPageBase: TfrmContentPageBase;

implementation

{$R *.dfm}

{ TfrmContentPageBase }

procedure TfrmContentPageBase.FormCreate(Sender: TObject);
begin
  inherited;
  //SetupCols;
  UpdateFooter;
end;

procedure TfrmContentPageBase.FormDestroy(Sender: TObject);
begin
  inherited;
  FObj:= nil;
end;

procedure TfrmContentPageBase.FormShow(Sender: TObject);
begin
  inherited;
  PrepSearch;
end;

procedure TfrmContentPageBase.btnApplyClick(Sender: TObject);
begin
  inherited;
  LoadPage(1);
end;

procedure TfrmContentPageBase.btnPageNextClick(Sender: TObject);
begin
  inherited;
  PageNext;
end;

procedure TfrmContentPageBase.btnPagePrevClick(Sender: TObject);
begin
  inherited;
  PagePrev;
end;

procedure TfrmContentPageBase.btnRefreshClick(Sender: TObject);
begin
  inherited;
  Self.RefreshData;
end;

function TfrmContentPageBase.GetData(const APageNum: Integer): ITMDBPage;
begin
  //Override required
end;

function TfrmContentPageBase.GetItem(const Index: Integer): ITMDBItem;
begin
  Result:= FObj.Items[Index];
end;

procedure TfrmContentPageBase.HideDetail;
begin
  Splitter1.Visible:= False;
  pDetail.Visible:= False;
end;


procedure TfrmContentPageBase.ItemClick(const Index: Integer; Item: TfrmTMDBListItem;
  Obj: ITMDBItem);
begin
  //Override expected
end;

function TfrmContentPageBase.LoadPage(const APageNum: Integer): Boolean;
begin
  inherited;
  PrepAPI;
  sbItems.Tag:= APageNum;
  FObj:= GetData(APageNum);
  HideDetail;
  UpdateFooter;
  PopulateResults;
  sbItems.VertScrollBar.Position:= 0;
  Result:= True;
end;

procedure TfrmContentPageBase.lstResultsClick(Sender: TObject);
var
  I: TControl;
  X: Integer;
  O: ITMDBItem;
begin
  inherited;
  I:= (Sender as TControl);
  X:= I.Tag;
  O:= GetItem(X);
  ItemClick(X, nil, O);
end;

function TfrmContentPageBase.Page: ITMDBPage;
begin
  Result:= FObj;
end;

function TfrmContentPageBase.PageCount: Integer;
begin
  if FObj <> nil then begin
    Result:= FObj.TotalPages;
  end else begin
    Result:= 0;
  end;
end;

procedure TfrmContentPageBase.PageNext;
begin
  sbItems.Tag:= sbItems.Tag + 1;
  LoadPage(sbItems.Tag);
end;

function TfrmContentPageBase.PageNum: Integer;
begin
  Result:= sbItems.Tag;
end;

procedure TfrmContentPageBase.PagePrev;
begin
  sbItems.Tag:= sbItems.Tag - 1;
  LoadPage(sbItems.Tag);
end;


procedure TfrmContentPageBase.ClearResults;
begin
  while sbItems.ControlCount > 0 do begin
    sbItems.Controls[0].Free;
  end;
end;

function TfrmContentPageBase.GetTotalItemsHeight: Integer;
var
  I: TControl;
begin
  Result:= 0;
  for var X := 0 to sbItems.ControlCount-1 do begin
    I:= sbItems.Controls[X];
    Result:= Result + I.Height;
  end;
end;

function TfrmContentPageBase.AddListItem(AItem: ITMDBItem): TfrmTMDBListItem;
begin
  var H:= GetTotalItemsHeight;
  var P:= TfrmTMDBListItem.Create(sbItems);
  P.Tag:= AItem.Index;
  P.btnDetail.Tag:= AItem.Index;
  P.Name:= 'pItem'+IntToStr(AItem.Index);
  P.Parent:= sbItems;
  P.Align:= alTop;
  P.Top:= H + 1;
  P.btnDetail.OnClick:= Self.lstResultsClick;
  Result:= P;

  try
    P.LoadItem(AItem);
  except
    on E: Exception do begin
      //TODO
    end;
  end;

end;

procedure TfrmContentPageBase.PopulateResults;
var
  O: ITMDBItem;
  X: Integer;
begin
  sbItems.DisableAlign;
  try
    ClearResults;
    if FObj = nil then Exit;

    for X := 0 to FObj.Items.Count-1 do begin
      O:= GetItem(X);
      AddListItem(O);
    end;

  finally
    sbItems.EnableAlign;
  end;

  Application.ProcessMessages; //TODO

end;

procedure TfrmContentPageBase.PrepSearch;
begin
  //Override expected
end;

procedure TfrmContentPageBase.Refresh;
begin
  LoadPage(PageNum);
end;

procedure TfrmContentPageBase.RefreshData;
var
  P: Integer;
begin
  inherited;
  P:= PageNum;
  if P = 0 then
    P:= 1;
  Self.LoadPage(P);
end;

function TfrmContentPageBase.ResultCount: Integer;
begin
  if FObj <> nil then begin
    Result:= FObj.Items.Count;
  end else begin
    Result:= 0;
  end;
end;

function TfrmContentPageBase.TotalResults: Integer;
begin
  if FObj <> nil then begin
    Result:= FObj.TotalResults;
  end else begin
    Result:= 0;
  end;
end;

procedure TfrmContentPageBase.sbItemsMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
begin
  inherited;

  inherited;
  sbItems.VertScrollBar.Position:= sbItems.VertScrollBar.Position + 20;
end;

procedure TfrmContentPageBase.sbItemsMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
begin
  inherited;
  sbItems.VertScrollBar.Position:= sbItems.VertScrollBar.Position - 20;
end;

procedure TfrmContentPageBase.ShowDetail(const Index: Integer; Item: TfrmTMDBListItem;
  Obj: ITMDBItem);
begin
  Splitter1.Visible:= True;
  pDetail.Visible:= True;
  pDetail.Top:= 1;
  Splitter1.Top:= 10000;
end;

procedure TfrmContentPageBase.UpdateFooter;
begin
  var Start: Integer:= ((PageNum-1) * ResultCount) + 1;
  var Stop: Integer:= (Start + ResultCount) - 1;
  var R:= 'Showing '+IntToStr(Start)+' to '+IntToStr(Stop)+' of '+FormatFloat('#,###,##0', (TotalResults));
  lblResults.Caption:= R;
  lblPage.Caption:= 'Page '+FormatFloat('#,###,##0', PageNum)+
    ' of '+FormatFloat('#,###,##0', PageCount);
  btnPagePrev.Enabled:= PageNum > 1;
  btnPageNext.Enabled:= PageNum < PageCount;
end;

end.
