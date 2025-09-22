inherited frmAppSetup: TfrmAppSetup
  Caption = 'App Setup'
  ClientHeight = 501
  ClientWidth = 829
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 845
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 18
  object btnSave: TJDFontButton
    Left = 0
    Top = 455
    Width = 829
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
    TabOrder = 0
    Text = 'Save Setup'
    OnClick = btnSaveClick
  end
  object Pages: TPageControl
    Left = 0
    Top = 0
    Width = 829
    Height = 433
    ActivePage = tabAPIAuth
    Align = alTop
    TabOrder = 1
    object tabGeneral: TTabSheet
      Caption = '  General  '
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox2: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 815
        Height = 150
        Align = alTop
        Caption = 'User Interface'
        TabOrder = 0
        object Panel8: TPanel
          Left = 2
          Top = 20
          Width = 811
          Height = 55
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label11: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 805
            Height = 18
            Align = alTop
            AutoSize = False
            Caption = 'Open on App Startup:'
            ExplicitLeft = 16
            ExplicitTop = 6
            ExplicitWidth = 111
          end
          object ComboBox2: TComboBox
            AlignWithMargins = True
            Left = 3
            Top = 27
            Width = 805
            Height = 26
            Cursor = crHandPoint
            Align = alTop
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 0
            Text = '(None)'
            OnChange = cboLanguageChange
            Items.Strings = (
              '(None)'
              'Web Browser'
              'TMDB'
              'Discover Movies (TMDB)'
              'Discover TV (TMDB)')
          end
        end
        object Panel7: TPanel
          Left = 2
          Top = 75
          Width = 811
          Height = 55
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label10: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 805
            Height = 18
            Align = alTop
            AutoSize = False
            Caption = 'Auto-Collapse Main Menu:'
            ExplicitLeft = 16
            ExplicitTop = 6
            ExplicitWidth = 111
          end
          object ComboBox3: TComboBox
            AlignWithMargins = True
            Left = 3
            Top = 27
            Width = 805
            Height = 26
            Cursor = crHandPoint
            Align = alTop
            Style = csDropDownList
            ItemIndex = 1
            TabOrder = 0
            Text = 'Enabled'
            OnChange = cboLanguageChange
            Items.Strings = (
              'Disabled'
              'Enabled')
          end
        end
      end
    end
    object tabBrowser: TTabSheet
      Caption = '  Browser  '
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 815
        Height = 150
        Align = alTop
        Caption = 'Browser Options'
        TabOrder = 0
        object Panel3: TPanel
          Left = 2
          Top = 20
          Width = 811
          Height = 55
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label2: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 805
            Height = 18
            Align = alTop
            AutoSize = False
            Caption = 'Home Page:'
            ExplicitLeft = 16
            ExplicitTop = 8
            ExplicitWidth = 88
          end
          object Edit1: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 27
            Width = 805
            Height = 26
            Align = alTop
            TabOrder = 0
            Text = 'www.google.com'
            OnChange = txtAPIKeyChange
          end
        end
        object Panel4: TPanel
          Left = 2
          Top = 75
          Width = 811
          Height = 55
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label4: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 805
            Height = 18
            Align = alTop
            AutoSize = False
            Caption = 'Search Engine:'
            ExplicitLeft = 16
            ExplicitTop = 6
            ExplicitWidth = 111
          end
          object ComboBox1: TComboBox
            AlignWithMargins = True
            Left = 3
            Top = 27
            Width = 805
            Height = 26
            Cursor = crHandPoint
            Align = alTop
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 0
            Text = '(None)'
            OnChange = cboLanguageChange
            Items.Strings = (
              '(None)'
              'Google'
              'Yahoo!')
          end
        end
      end
    end
    object tabAPIAuth: TTabSheet
      Caption = '  TMDB  '
      object sbTMDB: TScrollBox
        Left = 0
        Top = 0
        Width = 821
        Height = 377
        Align = alTop
        BorderStyle = bsNone
        TabOrder = 0
        object gbAPIAuthMethod: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 199
          Width = 798
          Height = 254
          Align = alTop
          Caption = 'API Authentication'
          TabOrder = 0
          object Label8: TLabel
            AlignWithMargins = True
            Left = 7
            Top = 23
            Width = 784
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
            ExplicitLeft = 18
            ExplicitTop = 0
          end
          object Label9: TLabel
            AlignWithMargins = True
            Left = 7
            Top = 61
            Width = 784
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
            ExplicitLeft = 18
            ExplicitTop = 38
          end
          object gbAPIAuthMethodAPIKey: TPanel
            Left = 2
            Top = 129
            Width = 794
            Height = 55
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              794
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
              Width = 766
              Height = 26
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              OnChange = txtAPIKeyChange
            end
          end
          object gbAPIAuthMethodAccessToken: TPanel
            Tag = 1
            Left = 2
            Top = 184
            Width = 794
            Height = 60
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            Visible = False
            DesignSize = (
              794
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
              Width = 766
              Height = 26
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              OnChange = txtAccessTokenChange
            end
          end
          object Panel2: TPanel
            Left = 2
            Top = 101
            Width = 794
            Height = 28
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
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
              Left = 725
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
            end
          end
        end
        object gbLocaleOptions: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 459
          Width = 798
          Height = 222
          Align = alTop
          Caption = 'Locale Options'
          TabOrder = 1
          object Panel6: TPanel
            Left = 2
            Top = 89
            Width = 794
            Height = 69
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label5: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 788
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
              Width = 788
              Height = 26
              Cursor = crHandPoint
              Align = alTop
              TabOrder = 0
              OnChange = cboLanguageChange
            end
          end
          object Panel5: TPanel
            Left = 2
            Top = 20
            Width = 794
            Height = 69
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label6: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 788
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
              Width = 788
              Height = 26
              Cursor = crHandPoint
              Align = alTop
              TabOrder = 0
            end
          end
          object Panel1: TPanel
            Left = 2
            Top = 158
            Width = 794
            Height = 69
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object Label7: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 788
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
              Width = 788
              Height = 26
              Cursor = crHandPoint
              Align = alTop
              TabOrder = 0
              OnChange = cboLanguageChange
            end
          end
        end
        inline pTMDBAuth: TfrmCommonCollapsePanel
          Left = 0
          Top = 0
          Width = 804
          Height = 196
          Align = alTop
          TabOrder = 2
          ExplicitWidth = 804
          ExplicitHeight = 196
          inherited pTop: TPanel
            Width = 798
            ExplicitWidth = 798
            inherited btnCollapse: TJDFontButton
              Left = 748
              ExplicitLeft = 748
            end
            inherited lblCaption: TStaticText
              Width = 128
              Caption = 'API Authentication'
              ExplicitWidth = 128
            end
          end
        end
      end
    end
  end
end
