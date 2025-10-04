inherited frmTMDBContentCollectionDetail: TfrmTMDBContentCollectionDetail
  Caption = 'Collection Detail'
  PixelsPerInch = 96
  TextHeight = 18
  object Pages: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 748
    Height = 467
    ActivePage = tabDetails
    Align = alClient
    TabOrder = 0
    OnChange = PagesChange
    ExplicitLeft = 11
    ExplicitTop = 11
    ExplicitWidth = 639
    ExplicitHeight = 246
    object tabDetails: TTabSheet
      Caption = 'Details'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lblTitle: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 734
        Height = 29
        Align = alTop
        AutoSize = False
        Caption = 'Collection Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 19
        ExplicitWidth = 625
      end
      object txtOverview: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 38
        Width = 734
        Height = 105
        Align = alTop
        BorderStyle = bsNone
        Color = clBtnFace
        Lines.Strings = (
          'txtOverview')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object tabParts: TTabSheet
      Caption = 'Parts'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sbItems: TScrollBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 734
        Height = 428
        VertScrollBar.Smooth = True
        VertScrollBar.Tracking = True
        Align = alClient
        BorderStyle = bsNone
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
    end
    object tabImages: TTabSheet
      Caption = 'Images'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tabTranslations: TTabSheet
      Caption = 'Translations'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
end
