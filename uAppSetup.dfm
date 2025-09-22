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
    ActivePage = tabGeneral
    Align = alTop
    TabOrder = 1
    object tabGeneral: TTabSheet
      Caption = '  General  '
      ImageIndex = 2
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
  end
end
