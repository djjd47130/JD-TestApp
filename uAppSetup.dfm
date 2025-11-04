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
  inherited pNav: TPanel
    Width = 829
    TabOrder = 2
    ExplicitWidth = 829
    inherited txtNavURI: TEdit
      Width = 628
      ExplicitWidth = 628
    end
    inherited btnNavGo: TJDFontButton
      Left = 733
      ExplicitLeft = 733
    end
    inherited btnNavFavorites: TJDFontButton
      Left = 765
      ExplicitLeft = 765
    end
    inherited btnNavMenu: TJDFontButton
      Left = 797
      ExplicitLeft = 797
    end
  end
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
    Top = 33
    Width = 829
    Height = 433
    ActivePage = tabGeneral
    Align = alTop
    TabOrder = 1
    object tabGeneral: TTabSheet
      Caption = '  General  '
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ScrollBox1: TScrollBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 815
        Height = 394
        VertScrollBar.Smooth = True
        VertScrollBar.Tracking = True
        Align = alClient
        BorderStyle = bsNone
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        object Label1: TLabel
          AlignWithMargins = True
          Left = 8
          Top = 3
          Width = 799
          Height = 32
          Margins.Left = 8
          Margins.Right = 8
          Align = alTop
          AutoSize = False
          Caption = 'User Interface'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitTop = -5
          ExplicitWidth = 795
        end
        inline ComboListItem2: TComboListItem
          Left = 0
          Top = 93
          Width = 815
          Height = 55
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ExplicitTop = 93
          ExplicitWidth = 815
          inherited Bevel1: TBevel
            Width = 815
            ExplicitWidth = 811
          end
          inherited pData: TPanel
            inherited lblCaption: TLabel
              Width = 118
              Hint = 'What to open when clicking the new tab button'
              Caption = 'New Tab Button'
              ExplicitWidth = 118
            end
          end
          inherited btnLeft: TJDFontButton
            Image.Text = #61543
          end
          inherited btnRight: TJDFontButton
            Left = 571
            ExplicitLeft = 571
          end
          inherited ComboBox1: TComboBox
            Left = 627
            Style = csDropDownList
            ItemIndex = 1
            Text = 'Web Browser'
            Items.Strings = (
              '(None)'
              'Web Browser'
              'TMDB'
              'Discover Movies (TMDB)'
              'Discover TV (TMDB)')
            ExplicitLeft = 627
          end
        end
        inline ComboListItem3: TComboListItem
          Left = 0
          Top = 38
          Width = 815
          Height = 55
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ExplicitTop = 38
          ExplicitWidth = 815
          inherited Bevel1: TBevel
            Width = 815
            ExplicitWidth = 811
          end
          inherited pData: TPanel
            inherited lblCaption: TLabel
              Width = 88
              Hint = 'What to open when the application starts up'
              Caption = 'App Startup'
              ExplicitWidth = 88
            end
          end
          inherited btnLeft: TJDFontButton
            Image.Text = #61537
          end
          inherited btnRight: TJDFontButton
            Left = 571
            ExplicitLeft = 571
          end
          inherited ComboBox1: TComboBox
            Left = 627
            Style = csDropDownList
            ItemIndex = 0
            Text = '(None)'
            Items.Strings = (
              '(None)'
              'Web Browser'
              'TMDB'
              'Discover Movies (TMDB)'
              'Discover TV (TMDB)')
            ExplicitLeft = 627
          end
        end
        inline ListSwitchItem3: TListSwitchItem
          Left = 0
          Top = 148
          Width = 815
          Height = 55
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ExplicitTop = 148
          ExplicitWidth = 815
          inherited Bevel1: TBevel
            Width = 815
            ExplicitWidth = 811
          end
          inherited pData: TPanel
            Width = 402
            ExplicitWidth = 402
            inherited lblCaption: TLabel
              Width = 186
              Hint = 'Automatically collapse main menu when navigating'
              Caption = 'Auto Collapse Main Menu'
              ExplicitWidth = 186
            end
          end
          inherited pImage: TPanel
            Left = 59
            ExplicitLeft = 59
          end
          inherited btnLeft: TJDFontButton
            Left = 3
            Image.Text = #61641
            ExplicitLeft = 3
          end
          inherited btnRight: TJDFontButton
            Left = 674
            ExplicitLeft = 674
          end
          inherited ToggleSwitch2: TToggleSwitch
            Left = 730
            ExplicitLeft = 730
          end
        end
      end
    end
    object tabMainMenu: TTabSheet
      Caption = 'Main Menu'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object TabSheet1: TTabSheet
      Caption = '  Addons  '
      ImageIndex = 2
      object sbItems: TScrollBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 815
        Height = 394
        VertScrollBar.Smooth = True
        VertScrollBar.Tracking = True
        Align = alClient
        BorderStyle = bsNone
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        object Label3: TLabel
          AlignWithMargins = True
          Left = 8
          Top = 3
          Width = 799
          Height = 32
          Margins.Left = 8
          Margins.Right = 8
          Align = alTop
          AutoSize = False
          Caption = 'Enable and Disable Plugins'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitLeft = -2
          ExplicitTop = -5
          ExplicitWidth = 795
        end
        inline ListSwitchItem1: TListSwitchItem
          Left = 0
          Top = 38
          Width = 815
          Height = 55
          Hint = 'Turn plugins on or off'
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ExplicitTop = 38
          ExplicitWidth = 815
          inherited Bevel1: TBevel
            Width = 815
            ExplicitWidth = 815
          end
          inherited pData: TPanel
            Width = 402
            Hint = 'Item'
            ExplicitWidth = 402
            inherited lblCaption: TLabel
              Width = 237
              Caption = 'SPACEBALLS: The Web Browser'
              ExplicitWidth = 237
            end
          end
          inherited btnLeft: TJDFontButton
            Image.Text = #61612
            Image.StandardColor = fcBlue
          end
          inherited btnRight: TJDFontButton
            Left = 674
            Hint = 'Configure Addon'
            Visible = True
            ExplicitLeft = 674
          end
          inherited ToggleSwitch2: TToggleSwitch
            Left = 730
            Hint = 'Enable or Disable Addon'
            ThumbColor = clLime
            ExplicitLeft = 730
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
      object ScrollBox2: TScrollBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 815
        Height = 394
        VertScrollBar.Smooth = True
        VertScrollBar.Tracking = True
        Align = alClient
        BorderStyle = bsNone
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        object Label5: TLabel
          AlignWithMargins = True
          Left = 8
          Top = 3
          Width = 799
          Height = 32
          Margins.Left = 8
          Margins.Right = 8
          Align = alTop
          AutoSize = False
          Caption = 'Web Browser Configuration'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitTop = -5
          ExplicitWidth = 795
        end
        inline ComboListItem1: TComboListItem
          Left = 0
          Top = 93
          Width = 815
          Height = 55
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ExplicitTop = 93
          ExplicitWidth = 815
          inherited Bevel1: TBevel
            Width = 815
            ExplicitWidth = 811
          end
          inherited pData: TPanel
            inherited lblCaption: TLabel
              Width = 106
              Hint = 'What search engine the browser should use'
              Caption = 'Search Engine'
              ExplicitWidth = 106
            end
          end
          inherited btnLeft: TJDFontButton
            Image.Text = #61442
            Image.StandardColor = fcOrange
          end
          inherited btnRight: TJDFontButton
            Left = 571
            ExplicitLeft = 571
          end
          inherited ComboBox1: TComboBox
            Left = 627
            Style = csDropDownList
            ItemIndex = 1
            Text = 'Google'
            Items.Strings = (
              '(None)'
              'Google'
              'Yahoo!'
              'TMDB')
            ExplicitLeft = 627
          end
        end
        inline ComboListItem4: TComboListItem
          Left = 0
          Top = 38
          Width = 815
          Height = 55
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ExplicitTop = 38
          ExplicitWidth = 815
          inherited Bevel1: TBevel
            Width = 815
            ExplicitWidth = 811
          end
          inherited pData: TPanel
            inherited lblCaption: TLabel
              Width = 83
              Hint = 'What to open by default in your browser'
              Caption = 'Home Page'
              ExplicitWidth = 83
            end
          end
          inherited btnLeft: TJDFontButton
            Image.Text = #61461
            Image.StandardColor = fcBlue
          end
          inherited btnRight: TJDFontButton
            Left = 571
            ExplicitLeft = 571
          end
          inherited ComboBox1: TComboBox
            Left = 627
            ItemIndex = 1
            Text = 'www.google.com'
            Items.Strings = (
              '(None)'
              'www.google.com'
              '')
            ExplicitLeft = 627
          end
        end
        inline ListSwitchItem4: TListSwitchItem
          Left = 0
          Top = 148
          Width = 815
          Height = 55
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ExplicitTop = 148
          ExplicitWidth = 815
          inherited Bevel1: TBevel
            Width = 815
            ExplicitWidth = 811
          end
          inherited pData: TPanel
            Width = 402
            ExplicitWidth = 402
            inherited lblCaption: TLabel
              Width = 183
              Hint = 'Whether to enable browsing history'
              Caption = 'Enable Browsing History'
              ExplicitWidth = 183
            end
          end
          inherited pImage: TPanel
            Left = 59
            ExplicitLeft = 59
          end
          inherited btnLeft: TJDFontButton
            Left = 3
            Image.Text = #61914
            ExplicitLeft = 3
          end
          inherited btnRight: TJDFontButton
            Left = 674
            ExplicitLeft = 674
          end
          inherited ToggleSwitch2: TToggleSwitch
            Left = 730
            ExplicitLeft = 730
          end
        end
      end
    end
  end
end
