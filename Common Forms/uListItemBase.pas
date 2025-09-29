unit uListItemBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, JD.Common, JD.Ctrls, JD.Ctrls.FontButton,
  Vcl.StdCtrls;

type
  TListItemBase = class;

  TListItemBaseClass = class of TListItemBase;

  TListItemBase = class(TFrame)
    Bevel1: TBevel;
    pData: TPanel;
    lblCaption: TLabel;
    pImage: TPanel;
    imgPicture: TImage;
    btnLeft: TJDFontButton;
    btnRight: TJDFontButton;
  private
    FIsIntf: Boolean;
    FData: Pointer;
    FIntf: IInterface;
  protected
    procedure DoSetup; virtual;
    function GetText: String; virtual;
    function GetID: Int64; virtual;
  public
    constructor Create(AOwner: TComponent; AData: Pointer); overload; virtual;
    constructor Create(AOwner: TComponent; AIntf: IInterface); overload; virtual;
    destructor Destroy; override;

    function IsIntf: Boolean;

    property Data: Pointer read FData;
    property Intf: IInterface read FIntf;
  end;

implementation

{$R *.dfm}

{ TListItemBase }

constructor TListItemBase.Create(AOwner: TComponent; AIntf: IInterface);
begin
  inherited Create(AOwner);
  FIntf:= AIntf;
  FIsIntf:= True;
  DoSetup;
end;

constructor TListItemBase.Create(AOwner: TComponent; AData: Pointer);
begin
  inherited Create(AOwner);
  FData:= AData;
  FIsIntf:= False;
  DoSetup;
end;

destructor TListItemBase.Destroy;
begin

  inherited;
end;

procedure TListItemBase.DoSetup;
begin
  pData.Align:= alClient;
  imgPicture.Align:= alClient;
end;

function TListItemBase.GetID: Int64;
begin
  //Override expected
  Result:= 0;
end;

function TListItemBase.GetText: String;
begin
  //Override expected
  Result:= 'Item';
end;

function TListItemBase.IsIntf: Boolean;
begin
  Result:= FIsIntf;
end;

end.
