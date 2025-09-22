inherited frmTMDBSetup: TfrmTMDBSetup
  AutoScroll = True
  Caption = 'TMDB Setup'
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 18
  object sbTMDB: TScrollBox
    Left = 0
    Top = 0
    Width = 737
    Height = 441
    Align = alTop
    BorderStyle = bsNone
    TabOrder = 0
    OnMouseWheelDown = sbTMDBMouseWheelDown
    OnMouseWheelUp = sbTMDBMouseWheelUp
    ExplicitWidth = 771
    object gbAPIAuthMethod: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 814
      Height = 254
      Align = alTop
      Caption = 'API Authentication'
      TabOrder = 0
      ExplicitWidth = 731
      object Label8: TLabel
        AlignWithMargins = True
        Left = 7
        Top = 23
        Width = 800
        Height = 32
        Margins.Left = 5
        Margins.Right = 5
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 
          'You must configure a valid TMDB API key or access token to conti' +
          'nue.'
        Layout = tlCenter
        WordWrap = True
        ExplicitLeft = 9
        ExplicitTop = 25
        ExplicitWidth = 622
      end
      object Label9: TLabel
        AlignWithMargins = True
        Left = 7
        Top = 61
        Width = 800
        Height = 37
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Right = 5
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Click here to obtain your own TMDB API key.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSkyBlue
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
        StyleElements = [seClient, seBorder]
        OnClick = Label9Click
        ExplicitLeft = 5
        ExplicitWidth = 622
      end
      object gbAPIAuthMethodAPIKey: TPanel
        Left = 2
        Top = 129
        Width = 810
        Height = 55
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 744
        DesignSize = (
          710
          55)
        object Label1: TLabel
          Left = 16
          Top = 8
          Width = 64
          Height = 18
          Caption = 'API Key:'
        end
        object txtAPIKey: TEdit
          Left = 16
          Top = 29
          Width = 682
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnChange = txtAPIKeyChange
          ExplicitWidth = 716
        end
      end
      object gbAPIAuthMethodAccessToken: TPanel
        Tag = 1
        Left = 2
        Top = 184
        Width = 710
        Height = 60
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        Visible = False
        ExplicitWidth = 744
        DesignSize = (
          710
          60)
        object Label3: TLabel
          Left = 16
          Top = 8
          Width = 136
          Height = 18
          Caption = 'API Access Token:'
        end
        object txtAccessToken: TEdit
          Left = 16
          Top = 32
          Width = 682
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnChange = txtAPIKeyChange
          ExplicitWidth = 716
        end
      end
      object Panel2: TPanel
        Left = 2
        Top = 101
        Width = 710
        Height = 28
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitWidth = 744
        object rAuthToken: TRadioButton
          Tag = 1
          AlignWithMargins = True
          Left = 103
          Top = 3
          Width = 130
          Height = 22
          Align = alLeft
          Caption = 'Access Token'
          TabOrder = 0
          OnClick = APIAuthMethodRadioClick
        end
        object rAuthKey: TRadioButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 94
          Height = 22
          Align = alLeft
          Caption = 'API Key'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = APIAuthMethodRadioClick
        end
        object btnValidateKey: TButton
          AlignWithMargins = True
          Left = 741
          Top = 3
          Width = 66
          Height = 22
          Cursor = crHandPoint
          Align = alRight
          Caption = 'Validate'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnValidateKeyClick
          ExplicitLeft = 675
        end
      end
    end
    object gbLocaleOptions: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 263
      Width = 714
      Height = 222
      Align = alTop
      Caption = 'Locale Options'
      TabOrder = 1
      ExplicitWidth = 731
      object Panel6: TPanel
        Left = 2
        Top = 89
        Width = 810
        Height = 69
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 744
        object Label5: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 804
          Height = 18
          Align = alTop
          AutoSize = False
          Caption = 'Default Language:'
          ExplicitLeft = 16
          ExplicitTop = 8
          ExplicitWidth = 64
        end
        object cboLanguage: TComboBox
          AlignWithMargins = True
          Left = 3
          Top = 27
          Width = 804
          Height = 26
          Cursor = crHandPoint
          Align = alTop
          TabOrder = 0
          OnChange = txtAPIKeyChange
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 20
        Width = 710
        Height = 69
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 744
        object Label6: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 804
          Height = 18
          Align = alTop
          AutoSize = False
          Caption = 'Default Country:'
          ExplicitLeft = 16
          ExplicitTop = 8
          ExplicitWidth = 64
        end
        object cboCountry: TComboBox
          AlignWithMargins = True
          Left = 3
          Top = 27
          Width = 804
          Height = 26
          Cursor = crHandPoint
          Align = alTop
          TabOrder = 0
          OnChange = txtAPIKeyChange
        end
      end
      object Panel1: TPanel
        Left = 2
        Top = 158
        Width = 710
        Height = 69
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitWidth = 744
        object Label7: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 804
          Height = 18
          Align = alTop
          AutoSize = False
          Caption = 'Default Timezone:'
          ExplicitLeft = 16
          ExplicitTop = 8
          ExplicitWidth = 64
        end
        object cboTimeZone: TComboBox
          AlignWithMargins = True
          Left = 3
          Top = 27
          Width = 804
          Height = 26
          Cursor = crHandPoint
          Align = alTop
          TabOrder = 0
          OnChange = txtAPIKeyChange
        end
      end
    end
  end
  object btnSave: TJDFontButton
    Left = 0
    Top = 441
    Width = 737
    Height = 46
    Cursor = crHandPoint
    Align = alBottom
    DrawStyle = fdTransparent
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Image.AutoSize = False
    Image.Text = #61452
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
    Margin = 8
    Spacing = 8
    SubTextFont.Charset = DEFAULT_CHARSET
    SubTextFont.Color = clGray
    SubTextFont.Height = -11
    SubTextFont.Name = 'Tahoma'
    SubTextFont.Style = []
    TabOrder = 1
    Text = 'Save Setup'
    OnClick = btnSaveClick
  end
end
