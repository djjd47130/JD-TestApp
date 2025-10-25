object frmTMDBListItem: TfrmTMDBListItem
  Left = 0
  Top = 0
  Width = 574
  Height = 45
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  ParentDoubleBuffered = False
  ParentFont = False
  TabOrder = 0
  object Bevel1: TBevel
    Left = 0
    Top = 43
    Width = 574
    Height = 2
    Align = alBottom
    Shape = bsBottomLine
    ExplicitTop = -2
  end
  object pDetail: TPanel
    AlignWithMargins = True
    Left = 129
    Top = 3
    Width = 395
    Height = 37
    Align = alRight
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 0
    object lblCaption: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 63
      Height = 19
      Cursor = crHandPoint
      Hint = 'Item Caption'
      Align = alLeft
      Caption = 'Caption'
      ShowAccelChar = False
      Layout = tlCenter
      OnMouseDown = lblCaptionMouseDown
    end
  end
  object pImage: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 54
    Height = 37
    Hint = 'Movie Poster'
    Align = alLeft
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    Visible = False
    StyleElements = [seFont, seBorder]
    object imgPicture: TImage
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 38
      Height = 31
      Align = alLeft
      Center = True
      Proportional = True
      Stretch = True
    end
  end
  object btnDetail: TJDFontButton
    AlignWithMargins = True
    Left = 530
    Top = 3
    Width = 41
    Height = 37
    Cursor = crHandPoint
    Hint = 'Open Item Details'
    Align = alRight
    DrawStyle = fdTransparent
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Image.AutoSize = False
    Image.Text = #61524
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
    TabOrder = 2
    Text = 'Apply Search'
    Visible = False
  end
end
