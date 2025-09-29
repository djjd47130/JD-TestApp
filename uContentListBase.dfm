inherited frmContentListBase: TfrmContentListBase
  Caption = 'List'
  PixelsPerInch = 96
  TextHeight = 18
  object sbItems: TScrollBox
    AlignWithMargins = True
    Left = 3
    Top = 35
    Width = 748
    Height = 435
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    Align = alClient
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    ExplicitLeft = 8
  end
  object pTop: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 645
    object lblResults: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 262
      Height = 26
      Align = alLeft
      AutoSize = False
      Caption = '0 Results'
      Layout = tlCenter
    end
    object btnRefresh: TJDFontButton
      AlignWithMargins = True
      Left = 710
      Top = 3
      Width = 41
      Height = 26
      Cursor = crHandPoint
      Hint = 'Refresh List'
      Align = alRight
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Image.AutoSize = False
      Image.Text = #61473
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -24
      Image.Font.Name = 'FontAwesome'
      Image.Font.Style = []
      Image.Font.Quality = fqAntialiased
      Image.StandardColor = fcGreen
      Overlay.Text = #57715
      Overlay.Font.Charset = DEFAULT_CHARSET
      Overlay.Font.Color = clWindowText
      Overlay.Font.Height = -7
      Overlay.Font.Name = 'FontAwesome'
      Overlay.Font.Style = []
      Overlay.Font.Quality = fqAntialiased
      Overlay.Position = foNone
      Overlay.Margin = 3
      ImagePosition = fpImgOnly
      Margin = 8
      Spacing = 8
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 0
      Text = 'Apply Search'
      ExplicitLeft = 601
    end
  end
end
