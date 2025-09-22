inherited frmContentSearchCompanies: TfrmContentSearchCompanies
  Caption = 'Search Companies'
  PixelsPerInch = 96
  TextHeight = 18
  inherited pMain: TPanel
    inherited Splitter1: TSplitter
      Top = 32
      Align = alTop
      ExplicitLeft = 6
      ExplicitTop = 328
    end
    inherited pDetail: TPanel
      Top = 39
      Height = 461
      Align = alClient
      ExplicitTop = 39
      ExplicitHeight = 461
    end
    inherited sbItems: TScrollBox
      Top = 42
      Height = 455
      ExplicitTop = 42
      ExplicitHeight = 455
    end
  end
  inherited pSearch: TPanel
    object Panel7: TPanel
      Left = 0
      Top = 0
      Width = 265
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label8: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 259
        Height = 18
        Align = alTop
        Caption = 'Search Query:'
        ExplicitWidth = 107
      end
      object txtSearchMoviesQuery: TEdit
        AlignWithMargins = True
        Left = 3
        Top = 27
        Width = 259
        Height = 27
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 26
      end
    end
  end
end
