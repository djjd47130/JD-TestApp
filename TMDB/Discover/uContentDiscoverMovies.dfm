inherited frmContentDiscoverMovies: TfrmContentDiscoverMovies
  Caption = 'Discover Movies'
  ClientHeight = 501
  ClientWidth = 929
  ExplicitWidth = 945
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 18
  object Splitter2: TSplitter [0]
    Left = 257
    Top = 0
    Width = 5
    Height = 501
    ExplicitLeft = 281
  end
  inherited pMain: TPanel
    Left = 262
    Width = 667
    Height = 501
    ExplicitLeft = 262
    ExplicitWidth = 667
    ExplicitHeight = 501
    inherited Splitter1: TSplitter
      Top = 431
      Width = 667
      ExplicitTop = 297
      ExplicitWidth = 664
    end
    inherited pTop: TPanel
      Width = 667
      ExplicitWidth = 667
      inherited lblPage: TLabel
        Left = 426
        ExplicitLeft = 430
      end
      inherited btnRefresh: TJDFontButton
        Left = 623
        ExplicitLeft = 623
      end
      inherited btnPageNext: TJDFontButton
        Left = 576
        ExplicitLeft = 576
      end
      inherited btnPagePrev: TJDFontButton
        Left = 379
        ExplicitLeft = 379
      end
    end
    inherited pDetail: TPanel
      Top = 438
      Width = 667
      Height = 63
      ExplicitTop = 438
      ExplicitWidth = 667
      ExplicitHeight = 63
    end
    inherited sbItems: TScrollBox
      Width = 661
      Height = 393
      BorderStyle = bsNone
      ExplicitWidth = 661
      ExplicitHeight = 393
    end
  end
  inherited pSearch: TPanel
    Width = 257
    Height = 501
    Visible = True
    ExplicitWidth = 257
    ExplicitHeight = 501
    inherited btnApply: TJDFontButton
      Top = 457
      Width = 251
      Default = False
      ExplicitTop = 457
      ExplicitWidth = 251
    end
    object CategoryPanelGroup1: TCategoryPanelGroup
      Left = 0
      Top = 0
      Width = 257
      Height = 457
      VertScrollBar.Tracking = True
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      ChevronColor = clSkyBlue
      ChevronHotColor = clLime
      DoubleBuffered = False
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GradientBaseColor = clBlack
      GradientColor = 10485760
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWhite
      HeaderFont.Height = -13
      HeaderFont.Name = 'Tahoma'
      HeaderFont.Style = [fsBold]
      HeaderHeight = 22
      Images = Img16
      ParentBackground = True
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      object CategoryPanel7: TCategoryPanel
        Top = 908
        Height = 28
        Caption = 'Watch'
        Collapsed = True
        CollapsedImageIndex = 0
        ExpandedImageIndex = 1
        TabOrder = 0
        ExplicitWidth = 253
        ExpandedHeight = 146
        object Panel15: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 228
          Height = 55
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label16: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 169
            Height = 18
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Primary Release Year:'
          end
          object Edit11: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 222
            Height = 28
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 26
          end
        end
        object Panel16: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 55
          Width = 228
          Height = 55
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label17: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 41
            Height = 18
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Year:'
          end
          object Edit12: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 222
            Height = 28
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 26
          end
        end
      end
      object CategoryPanel5: TCategoryPanel
        Top = 880
        Height = 28
        Caption = 'Runtime'
        Collapsed = True
        CollapsedImageIndex = 0
        ExpandedImageIndex = 1
        TabOrder = 1
        ExplicitWidth = 253
        ExpandedHeight = 146
        object Panel7: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 228
          Height = 55
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label8: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 169
            Height = 18
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Primary Release Year:'
          end
          object Edit7: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 222
            Height = 28
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 26
          end
        end
        object Panel9: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 55
          Width = 228
          Height = 55
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label10: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 41
            Height = 18
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Year:'
          end
          object Edit8: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 222
            Height = 28
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 26
          end
        end
      end
      object CategoryPanel3: TCategoryPanel
        Top = 852
        Height = 28
        Caption = 'People'
        Collapsed = True
        CollapsedImageIndex = 0
        ExpandedImageIndex = 1
        TabOrder = 2
        ExplicitWidth = 253
        ExpandedHeight = 146
        object Panel3: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 228
          Height = 55
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label4: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 169
            Height = 18
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Primary Release Year:'
          end
          object Edit3: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 222
            Height = 28
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 26
          end
        end
        object Panel4: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 55
          Width = 228
          Height = 55
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label5: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 41
            Height = 18
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Year:'
          end
          object Edit4: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 222
            Height = 28
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 26
          end
        end
      end
      object CategoryPanel4: TCategoryPanel
        Top = 654
        Height = 198
        Caption = 'Companies'
        CollapsedImageIndex = 0
        ExpandedImageIndex = 1
        TabOrder = 3
        ExplicitWidth = 253
        object Panel5: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 228
          Height = 49
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label6: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 168
            Height = 18
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Search for Companies:'
          end
        end
      end
      object CategoryPanel2: TCategoryPanel
        Top = 626
        Height = 28
        Caption = 'Votes'
        Collapsed = True
        CollapsedImageIndex = 0
        ExpandedImageIndex = 1
        TabOrder = 4
        ExplicitWidth = 253
        ExpandedHeight = 146
        object Panel1: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 228
          Height = 55
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label2: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 169
            Height = 18
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Primary Release Year:'
          end
          object Edit1: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 222
            Height = 28
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 26
          end
        end
        object Panel2: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 55
          Width = 228
          Height = 55
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label3: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 41
            Height = 18
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Year:'
          end
          object Edit2: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 222
            Height = 28
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 26
          end
        end
      end
      object cpRelease: TCategoryPanel
        Top = 598
        Height = 28
        Caption = 'Release Date'
        Collapsed = True
        CollapsedImageIndex = 0
        ExpandedImageIndex = 1
        TabOrder = 5
        ExplicitWidth = 253
        ExpandedHeight = 280
        object Panel13: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 228
          Height = 55
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label14: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 169
            Height = 18
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Primary Release Year:'
          end
          object txtSearchMoviesPrimaryReleaseYear: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 222
            Height = 28
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 26
          end
        end
        object Panel14: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 55
          Width = 228
          Height = 55
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label15: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 41
            Height = 18
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Year:'
          end
          object txtSearchMoviesYear: TEdit
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 222
            Height = 28
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 26
          end
        end
      end
      object CategoryPanel6: TCategoryPanel
        Top = 388
        Height = 210
        Caption = 'Keywords'
        CollapsedImageIndex = 0
        ExpandedImageIndex = 1
        TabOrder = 6
        ExplicitWidth = 253
        object Panel11: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 228
          Height = 49
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label12: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 161
            Height = 18
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Search for Keywords:'
          end
          object txtSearchKeyword: TSearchBox
            Left = 0
            Top = 21
            Width = 228
            Height = 28
            Align = alClient
            TabOrder = 0
            OnInvokeSearch = txtSearchKeywordInvokeSearch
            ExplicitHeight = 26
          end
        end
        object JDChipList1: TJDChipList
          Left = 0
          Top = 49
          Width = 234
          Height = 104
          Align = alTop
          AllowExclude = True
          AutoSize = False
          ChipHeight = 24
          ChipPadding = 3
          Color = clBackground
          ExcludeToggle = ctButton
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Items = <
            item
              Caption = 'Science Fiction'
              Exclude = False
            end
            item
              Caption = 'Comedy'
              Exclude = False
            end
            item
              Caption = 'Horror'
              Exclude = True
            end>
          ParentBackground = False
          ParentColor = False
          UI.ChipColor = 12615680
          UI.ChipExcludeColor = clMaroon
          UI.DeleteButtonColor = clRed
          UI.ShowDeleteBtn = True
          UI.ChipNormal.Brush.Alpha = 255
          UI.ChipNormal.Brush.Color.StandardColor = fcNeutral
          UI.ChipNormal.Brush.Color.UseStandardColor = True
          UI.ChipNormal.Pen.Alpha = 255
          UI.ChipNormal.Pen.Color.StandardColor = fcNeutral
          UI.ChipNormal.Pen.Color.UseStandardColor = True
          UI.ChipNormal.Pen.Width = 1.000000000000000000
          OnResize = JDChipList1Resize
        end
      end
      object CategoryPanel1: TCategoryPanel
        Top = 207
        Height = 181
        Caption = 'Genres'
        CollapsedImageIndex = 0
        ExpandedImageIndex = 1
        TabOrder = 7
        ExplicitWidth = 253
        object Label7: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 135
          Height = 18
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Search for Genres'
        end
        object clGenres: TJDChipList
          Left = 0
          Top = 47
          Width = 234
          Height = 92
          Align = alTop
          AllowExclude = True
          AutoSize = False
          ChipHeight = 24
          ChipPadding = 3
          Color = clBackground
          ExcludeToggle = ctButton
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Items = <>
          ParentBackground = False
          ParentColor = False
          UI.ChipColor = 12615680
          UI.ChipExcludeColor = clMaroon
          UI.DeleteButtonColor = clRed
          UI.ShowDeleteBtn = True
          UI.ChipNormal.Brush.Alpha = 255
          UI.ChipNormal.Brush.Color.StandardColor = fcNeutral
          UI.ChipNormal.Brush.Color.UseStandardColor = True
          UI.ChipNormal.Pen.Alpha = 255
          UI.ChipNormal.Pen.Color.StandardColor = fcNeutral
          UI.ChipNormal.Pen.Color.UseStandardColor = True
          UI.ChipNormal.Pen.Width = 1.000000000000000000
          OnResize = JDChipList1Resize
        end
        object cboSearchGenres: TComboBox
          Left = 0
          Top = 21
          Width = 234
          Height = 26
          Align = alTop
          TabOrder = 1
          OnKeyDown = cboSearchGenresKeyDown
        end
      end
      object cpRegion: TCategoryPanel
        Top = 117
        Height = 90
        Caption = 'Region and Language'
        CollapsedImageIndex = 0
        ExpandedImageIndex = 1
        TabOrder = 8
        ExplicitWidth = 253
        object Panel10: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 228
          Height = 55
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label11: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 57
            Height = 18
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Region:'
          end
          object cboSearchMoviesRegion: TComboBox
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 222
            Height = 26
            Cursor = crHandPoint
            Align = alClient
            TabOrder = 0
            OnChange = cboSearchMoviesRegionChange
            OnClick = cboSearchMoviesRegionClick
            OnCloseUp = cboSearchMoviesRegionCloseUp
          end
        end
      end
      object cpCerts: TCategoryPanel
        Top = 89
        Height = 28
        Caption = 'Certification'
        Collapsed = True
        CollapsedImageIndex = 0
        ExpandedImageIndex = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        ExplicitWidth = 253
        ExpandedHeight = 257
        object Label1: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 228
          Height = 18
          Margins.Bottom = 0
          Align = alTop
          Caption = 'Country:'
          ExplicitWidth = 64
        end
        object cboCertCountry: TComboBox
          AlignWithMargins = True
          Left = 3
          Top = 24
          Width = 228
          Height = 26
          Cursor = crHandPoint
          Align = alTop
          Style = csDropDownList
          TabOrder = 0
          OnClick = cboCertCountryClick
        end
        object lstCerts: TCheckListBox
          AlignWithMargins = True
          Left = 3
          Top = 56
          Width = 228
          Height = 92
          OnClickCheck = lstCertsClickCheck
          Align = alTop
          ItemHeight = 18
          TabOrder = 1
        end
        object Panel8: TPanel
          AlignWithMargins = True
          Left = 3
          Top = -55
          Width = 228
          Height = 55
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object Label9: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 222
            Height = 18
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Include Adult:'
            ExplicitWidth = 104
          end
          object cboSearchMoviesAdult: TComboBox
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 222
            Height = 26
            Cursor = crHandPoint
            Align = alClient
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 0
            Text = 'Default'
            OnClick = cboSearchMoviesAdultClick
            Items.Strings = (
              'Default'
              'False'
              'True')
            ExplicitWidth = 239
          end
        end
      end
      object CategoryPanel8: TCategoryPanel
        Top = 0
        Height = 89
        Caption = 'Sort'
        TabOrder = 10
        ExplicitWidth = 253
        object Panel6: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 228
          Height = 55
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label13: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 222
            Height = 18
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Order By:'
            ExplicitWidth = 72
          end
          object cboSort: TComboBox
            AlignWithMargins = True
            Left = 3
            Top = 24
            Width = 222
            Height = 26
            Cursor = crHandPoint
            Align = alClient
            Style = csDropDownList
            ItemIndex = 3
            TabOrder = 0
            Text = 'popularity.desc'
            OnChange = cboSearchMoviesRegionChange
            OnClick = cboSearchMoviesRegionClick
            OnCloseUp = cboSearchMoviesRegionCloseUp
            Items.Strings = (
              'original_title.asc'
              'original_title.desc'
              'popularity.asc'
              'popularity.desc'
              'revenue.asc'
              'revenue.desc'
              'primary_release_date.asc'
              'title.asc'
              'title.desc'
              'primary_release_date.desc'
              'vote_average.asc'
              'vote_average.desc'
              'vote_count.asc'
              'vote_count.desc')
            ExplicitWidth = 239
          end
        end
      end
    end
  end
  object Img16: TImageList
    Left = 312
    Top = 248
    Bitmap = {
      494C010104000800040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004E4E
      4E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000004B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A9A9
      A900AFAFAF00000000008E8E8E00AFAFAF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000747474000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000A3
      000000A90000000000000089000000A900000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFAFAF00AFAFAF00000000009C9C9C00AFAFAF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007E7E7E00C0C0C000AFAFAF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000A9000000A90000000000000097000000A9000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000079000000B9000000A9000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AFAFAF00AFAFAF00000000009C9C9C00AFAFAF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007E7E7E00C0C0C0007E7E7E009C9C9C00AFAFAF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000A9000000A90000000000000097000000A90000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000079000000B90000007900000097000000A90000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AFAFAF00AFAFAF00000000009C9C9C00AFAFAF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007E7E7E00C0C0C0007E7E7E004E4E4E00000000009C9C9C00AFAFAF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000A9000000A90000000000000097000000A900000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000079000000B9000000790000004B0000000000000097000000A900000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005D5D5D00BABABA007E7E7E0000000000AFAFAF009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000005D5D
      5D00C0C0C0007E7E7E005D5D5D00BABABA00AFAFAF00000000009C9C9C00A9A9
      A900000000000000000000000000000000000000000000000000000000000000
      000000000000005A000000B30000007900000000000000A90000009700000000
      000000000000000000000000000000000000000000000000000000000000005A
      000000B9000000790000005A000000B3000000A90000000000000097000000A3
      0000000000000000000000000000000000000000000000000000000000000000
      00005D5D5D00BABABA007E7E7E0000000000AFAFAF009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005D5D5D005D5D5D00BABABA0086868600AFAFAF00AFAFAF00000000004E4E
      4E00000000000000000000000000000000000000000000000000000000000000
      0000005A000000B30000007900000000000000A9000000970000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000005A0000005A000000B300000081000000A9000000A9000000000000004B
      0000000000000000000000000000000000000000000000000000000000005D5D
      5D00BABABA007E7E7E0000000000AFAFAF009C9C9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005D5D5D00BABABA007E7E7E000000000000000000AFAFAF00AFAFAF000000
      000000000000000000000000000000000000000000000000000000000000005A
      000000B30000007900000000000000A900000097000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000005A000000B3000000790000000000000000000000A9000000A900000000
      000000000000000000000000000000000000000000000000000000000000A9A9
      A9007E7E7E00000000008E8E8E009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004E4E
      4E00BABABA007E7E7E0000000000000000000000000000000000AFAFAF00AFAF
      AF000000000000000000000000000000000000000000000000000000000000A3
      0000007900000000000000890000009700000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000004B
      000000B30000007900000000000000000000000000000000000000A9000000A9
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000747474000000000000000000000000000000000000000000000000007474
      7400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007000000000000000000000000000000000000000000000000000000070
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFEFFFFFFFEFFFFFFFE4FFFEFFE4FFFEFFF27FFC7FF27FFC7F
      F93FF83FF93FF83FFC9FF09FFC9FF09FF89FE04FF89FE04FF13FF02FF13FF02F
      E27FF19FE27FF19FE4FFE3CFE4FFE3CFFFFFF7EFFFFFF7EFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  end
  object Glyphs: TJDFontGlyphs
    ImageLists = <
      item
        ImageList = Img16
      end>
    Glyphs = <
      item
        Caption = 'Blue Collapsed'
        Glyph = #61697
        Color = fcGray
        Scale = 0.960000000000000000
        Ref.FontName = 'FontAwesome'
        Ref.Glyph = #61697
        Ref.Color = clBlue
        Ref.StandardColor = fcGray
        Ref.UseStandardColor = True
      end
      item
        Caption = 'Blue Expanded'
        Glyph = #61699
        Color = fcGray
        Scale = 0.960000000000000000
        Ref.FontName = 'FontAwesome'
        Ref.Glyph = #61699
        Ref.Color = clBlue
        Ref.StandardColor = fcGray
        Ref.UseStandardColor = True
      end
      item
        Caption = 'Green Collapsed'
        Glyph = #61697
        Color = fcGreen
        Scale = 0.960000000000000000
        Ref.FontName = 'FontAwesome'
        Ref.Glyph = #61697
        Ref.Color = clBlue
        Ref.StandardColor = fcGreen
        Ref.UseStandardColor = True
      end
      item
        Caption = 'Green Expanded'
        Glyph = #61699
        Color = fcGreen
        Scale = 0.960000000000000000
        Ref.FontName = 'FontAwesome'
        Ref.Glyph = #61699
        Ref.Color = clBlue
        Ref.StandardColor = fcGreen
        Ref.UseStandardColor = True
      end>
    Left = 312
    Top = 200
  end
end
