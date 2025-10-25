inherited frmTMDBSearch: TfrmTMDBSearch
  Caption = 'TMDB Search'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object pTop: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 47
    Align = alTop
    BevelEdges = [beTop, beBottom]
    BevelKind = bkSoft
    BevelOuter = bvNone
    DoubleBuffered = True
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 0
    object JDFontButton25: TJDFontButton
      AlignWithMargins = True
      Left = 709
      Top = 3
      Width = 42
      Height = 37
      Cursor = crHandPoint
      Hint = 'Search TMDB'
      Align = alRight
      Default = True
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Image.AutoSize = False
      Image.Text = #61442
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -27
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
      TabOrder = 1
      Text = 'User Login'
      OnClick = txtSearchQueryInvokeSearch
    end
    object cboSearchMode: TComboBoxEx
      AlignWithMargins = True
      Left = 51
      Top = 8
      Width = 134
      Height = 27
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alLeft
      ItemsEx = <
        item
          Caption = 'Movies'
        end
        item
          Caption = 'Collections'
        end
        item
          Caption = 'Television'
        end
        item
          Caption = 'People'
        end
        item
          Caption = 'Keywords'
        end
        item
          Caption = 'Companies'
        end>
      Style = csExDropDownList
      TabOrder = 2
    end
    object txtSearchQuery: TButtonedEdit
      AlignWithMargins = True
      Left = 193
      Top = 8
      Width = 505
      Height = 27
      Margins.Left = 0
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alClient
      RightButton.Visible = True
      TabOrder = 0
      ExplicitLeft = 228
      ExplicitWidth = 470
      ExplicitHeight = 26
    end
    object btnMenu: TJDFontButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 42
      Height = 37
      Cursor = crHandPoint
      Hint = 'TMDB Search Options'
      Align = alLeft
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Image.AutoSize = False
      Image.Text = #61459
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -27
      Image.Font.Name = 'FontAwesome'
      Image.Font.Style = []
      Image.Font.Quality = fqAntialiased
      Image.StandardColor = fcGray
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
      TabOrder = 3
      TabStop = False
      Text = 'User Login'
    end
  end
  object sbItems: TScrollBox
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 748
    Height = 420
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    Align = alClient
    BorderStyle = bsNone
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnMouseWheelDown = sbItemsMouseWheelDown
    OnMouseWheelUp = sbItemsMouseWheelUp
    object btnLoadMore: TJDFontButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 742
      Height = 42
      Cursor = crHandPoint
      Hint = 'TMDB Configuration'
      Align = alTop
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Image.AutoSize = False
      Image.Text = #61470
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -27
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
      Margin = 8
      Spacing = 8
      SubTextFont.Charset = DEFAULT_CHARSET
      SubTextFont.Color = clGray
      SubTextFont.Height = -11
      SubTextFont.Name = 'Tahoma'
      SubTextFont.Style = []
      TabOrder = 0
      TabStop = False
      Text = 'Load More...'
      Visible = False
      OnClick = btnLoadMoreClick
    end
  end
  object pSearchOptions: TPanel
    Left = 51
    Top = 136
    Width = 350
    Height = 225
    TabOrder = 2
    Visible = False
    inline ComboListItem1: TComboListItem
      Left = 1
      Top = 57
      Width = 348
      Height = 56
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 57
      ExplicitWidth = 348
      ExplicitHeight = 56
      inherited Bevel1: TBevel
        Top = 54
        Width = 348
        ExplicitTop = 54
        ExplicitWidth = 348
      end
      inherited pData: TPanel
        Left = 3
        Width = 210
        Height = 48
        ExplicitLeft = 0
        ExplicitWidth = 210
        ExplicitHeight = 48
        inherited lblCaption: TLabel
          Width = 72
          Caption = 'Language'
          ExplicitWidth = 72
        end
      end
      inherited pImage: TPanel
        Left = 16
        Top = 67
        Align = alNone
        ExplicitLeft = 16
        ExplicitTop = 67
        inherited imgPicture: TImage
          Left = 19
          Top = 35
          Align = alNone
          ExplicitLeft = 19
          ExplicitTop = 35
        end
      end
      inherited btnLeft: TJDFontButton
        Left = 118
        Top = 59
        Align = alNone
        Visible = False
        ExplicitLeft = 118
        ExplicitTop = 59
      end
      inherited btnRight: TJDFontButton
        Left = 408
        Top = 60
        Align = alNone
        ExplicitLeft = 408
        ExplicitTop = 60
      end
      inherited ComboBox1: TComboBox
        Left = 160
        Text = 'en'
        ExplicitLeft = 160
      end
    end
    inline ComboListItem2: TComboListItem
      Left = 1
      Top = 1
      Width = 348
      Height = 56
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 348
      ExplicitHeight = 56
      inherited Bevel1: TBevel
        Top = 54
        Width = 348
        ExplicitTop = 54
        ExplicitWidth = 476
      end
      inherited pData: TPanel
        Left = 3
        Width = 210
        Height = 48
        ExplicitLeft = 3
        ExplicitWidth = 210
        ExplicitHeight = 48
        inherited lblCaption: TLabel
          Width = 52
          Caption = 'Region'
          ExplicitWidth = 52
        end
      end
      inherited pImage: TPanel
        Left = 16
        Top = 67
        Align = alNone
        ExplicitLeft = 16
        ExplicitTop = 67
        inherited imgPicture: TImage
          Left = 19
          Top = 35
          Align = alNone
          ExplicitLeft = 19
          ExplicitTop = 35
        end
      end
      inherited btnLeft: TJDFontButton
        Left = 118
        Top = 59
        Align = alNone
        Visible = False
        ExplicitLeft = 118
        ExplicitTop = 59
      end
      inherited btnRight: TJDFontButton
        Left = 408
        Top = 60
        Align = alNone
        ExplicitLeft = 408
        ExplicitTop = 60
      end
      inherited ComboBox1: TComboBox
        Left = 160
        Text = 'US'
        ExplicitLeft = 160
      end
    end
    inline ComboListItem3: TComboListItem
      Left = 1
      Top = 113
      Width = 348
      Height = 56
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      ExplicitLeft = 1
      ExplicitTop = 170
      ExplicitWidth = 348
      ExplicitHeight = 56
      inherited Bevel1: TBevel
        Top = 54
        Width = 348
        ExplicitTop = 54
        ExplicitWidth = 348
      end
      inherited pData: TPanel
        Left = 3
        Width = 210
        Height = 48
        ExplicitLeft = 0
        ExplicitWidth = 210
        ExplicitHeight = 48
        inherited lblCaption: TLabel
          Width = 99
          Caption = 'Include Adult'
          ExplicitWidth = 99
        end
      end
      inherited pImage: TPanel
        Left = 16
        Top = 67
        Align = alNone
        ExplicitLeft = 16
        ExplicitTop = 67
        inherited imgPicture: TImage
          Left = 19
          Top = 35
          Align = alNone
          ExplicitLeft = 19
          ExplicitTop = 35
        end
      end
      inherited btnLeft: TJDFontButton
        Left = 118
        Top = 59
        Align = alNone
        Visible = False
        ExplicitLeft = 118
        ExplicitTop = 59
      end
      inherited btnRight: TJDFontButton
        Left = 408
        Top = 60
        Align = alNone
        ExplicitLeft = 408
        ExplicitTop = 60
      end
      inherited ComboBox1: TComboBox
        Left = 160
        ItemIndex = 0
        Text = 'Default'
        Items.Strings = (
          'Default'
          'False'
          'True')
        ExplicitLeft = 160
      end
    end
  end
end
