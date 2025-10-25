unit uTMDBListItemLayouts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, JD.ListController, JD.Common,
  JD.Ctrls, JD.Ctrls.FontButton, Vcl.Imaging.GIFImg;

type
  TfrmListItemLayouts = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    pBasicHorz: TPanel;
    Media: TTabSheet;
    pBasicVert: TPanel;
    lblCaption: TLabel;
    Label1: TLabel;
    pMediaHorz: TPanel;
    Label2: TLabel;
    pMediaVert: TPanel;
    lyMediaVert: TJDListItemLayout;
    pDetail: TPanel;
    Label3: TLabel;
    lblOverview: TLabel;
    pSubData: TPanel;
    lblGenre: TLabel;
    lblReleaseDate: TLabel;
    lblVoteAvg: TLabel;
    pImage: TPanel;
    imgPicture: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListItemLayouts: TfrmListItemLayouts;

implementation

{$R *.dfm}

end.
