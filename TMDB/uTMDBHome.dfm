inherited frmTMDBHome: TfrmTMDBHome
  Caption = 'The Movie Database - Home'
  ClientHeight = 554
  ClientWidth = 904
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  ExplicitWidth = 920
  ExplicitHeight = 593
  PixelsPerInch = 96
  TextHeight = 18
  object SB: TScrollBox
    Left = 0
    Top = 48
    Width = 904
    Height = 506
    VertScrollBar.Range = 2500
    VertScrollBar.Smooth = True
    VertScrollBar.Style = ssHotTrack
    VertScrollBar.Tracking = True
    Align = alClient
    AutoScroll = False
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnMouseWheelDown = SBMouseWheelDown
    OnMouseWheelUp = SBMouseWheelUp
    object pMovies: TPanel
      Left = 0
      Top = 700
      Width = 887
      Height = 530
      Align = alTop
      BevelEdges = [beBottom]
      BevelKind = bkSoft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 3
        Width = 871
        Height = 32
        Margins.Left = 8
        Margins.Right = 8
        Align = alTop
        AutoSize = False
        Caption = 'Movies'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 757
      end
      object btnMovieCertifications: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 413
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        Color = clBlack
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61603
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcGray
        Overlay.Text = #61448
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -12
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foBottomLeft
        Overlay.Margin = 2
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 0
        Text = 'Movie Certifications'
        OnClick = btnMovieCertificationsClick
      end
      object btnMovieGenres: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 447
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        Color = clBlack
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61451
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcGray
        Overlay.Text = #61448
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -12
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foBottomLeft
        Overlay.Margin = 2
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 1
        Text = 'Movie Genres'
        OnClick = btnMovieGenresClick
      end
      object btnMyMovieWatchlist: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 345
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61550
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcGray
        Overlay.Text = #61448
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -12
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foBottomLeft
        Overlay.Margin = 2
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 2
        Text = 'My Movie Watchlist'
        OnClick = btnMyMovieWatchlistClick
      end
      object btnMyFavoriteMovies: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 311
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61444
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcGray
        Overlay.Text = #61448
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -12
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foBottomLeft
        Overlay.Margin = 2
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 3
        Text = 'My Favorite Movies'
        OnClick = btnMyFavoriteMoviesClick
      end
      object btnMyRatedMovies: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 379
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61508
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcGray
        Overlay.Text = #61448
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -12
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foBottomLeft
        Overlay.Margin = 2
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 4
        Text = 'My Rated Movies'
      end
      object btnTopRatedMovies: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 243
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61538
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcGray
        Overlay.Text = #61448
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -12
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foBottomLeft
        Overlay.Margin = 2
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 5
        Text = 'Top Rated Movies'
        OnClick = btnTopRatedMoviesClick
      end
      object btnUpcomingMovies: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 209
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61463
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcGray
        Overlay.Text = #61448
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -12
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foBottomLeft
        Overlay.Margin = 2
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 6
        Text = 'Upcoming Movies'
        OnClick = btnUpcomingMoviesClick
      end
      object btnPopularMovies: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 175
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61445
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcGray
        Overlay.Text = #61448
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -12
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foBottomLeft
        Overlay.Margin = 2
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 7
        Text = 'Popular Movies'
        OnClick = btnPopularMoviesClick
      end
      object btnNowPlayingMovies: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 141
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61765
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcGray
        Overlay.Text = #61448
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -12
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foBottomLeft
        Overlay.Margin = 2
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 8
        Text = 'Now Playing Movies'
        OnClick = btnNowPlayingMoviesClick
      end
      object btnDiscoverMovies: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 107
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61546
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcGray
        Overlay.Text = #61448
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -12
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foBottomLeft
        Overlay.Margin = 2
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 9
        Text = 'Discover Movies'
        OnClick = btnDiscoverMoviesClick
      end
      object btnSearchCollections: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 73
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        Color = clBlack
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61442
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcGray
        Overlay.Text = #61448
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -12
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foBottomLeft
        Overlay.Margin = 2
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 10
        Text = 'Search Collections'
        OnClick = btnSearchCollectionsClick
      end
      object btnSearchMovies: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 39
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        Color = clBlack
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61442
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcGray
        Overlay.Text = #61448
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -12
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foBottomLeft
        Overlay.Margin = 2
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 11
        Text = 'Search Movies'
        OnClick = btnSearchMoviesClick
      end
      object JDFontButton23: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 277
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        Color = clBlack
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61953
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcGray
        Overlay.Text = #61448
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -12
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foBottomLeft
        Overlay.Margin = 2
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 12
        Text = 'Trending Movies'
        OnClick = JDFontButton23Click
      end
      object btnMovieChanges: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 481
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        Color = clBlack
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61556
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcGray
        Overlay.Text = #61448
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -12
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foBottomLeft
        Overlay.Margin = 2
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 13
        Text = 'Movie Changes'
        OnClick = btnMovieChangesClick
      end
    end
    object pTV: TPanel
      Left = 0
      Top = 1230
      Width = 887
      Height = 532
      Align = alTop
      BevelEdges = [beBottom]
      BevelKind = bkSoft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object Label2: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 3
        Width = 871
        Height = 32
        Margins.Left = 8
        Margins.Right = 8
        Align = alTop
        AutoSize = False
        Caption = 'Television'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 757
      end
      object btnSearchTV: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 39
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61704
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61442
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcOrange
        Overlay.Position = foCenter
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 0
        Text = 'Search TV'
        OnClick = btnSearchTVClick
      end
      object btnDiscoverTV: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 73
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61704
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 1
        Text = 'Discover TV'
      end
      object JDFontButton4: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 107
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61704
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61444
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foCenter
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 2
        Text = 'My Favorite TV'
      end
      object JDFontButton31: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 141
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61704
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61444
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foCenter
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 3
        Text = 'My Favorite TV Episodes'
      end
      object JDFontButton7: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 175
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61704
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61738
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foCenter
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 4
        Text = 'My Rated TV'
      end
      object JDFontButton8: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 209
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61704
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61738
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcGreen
        Overlay.Position = foCenter
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 5
        Text = 'My Rated TV Episodes'
      end
      object JDFontButton10: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 243
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61704
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcOrange
        Overlay.Position = foCenter
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 6
        Text = 'My TV Watchlist'
      end
      object JDFontButton28: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 277
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61704
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 7
        Text = 'TV Genres'
        OnClick = JDFontButton28Click
      end
      object JDFontButton13: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 311
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61704
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 8
        Text = 'TV Certifications'
        OnClick = JDFontButton13Click
      end
      object JDFontButton2: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 345
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61704
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 9
        Text = 'TV Airing Today'
      end
      object JDFontButton9: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 379
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61704
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 10
        Text = 'TV On the Air'
      end
      object JDFontButton12: TJDFontButton
        Tag = 1
        AlignWithMargins = True
        Left = 20
        Top = 413
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61704
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 11
        Text = 'Popular TV'
        OnClick = JDFontButton12Click
      end
      object JDFontButton14: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 447
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61704
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 12
        Text = 'Top Rated TV'
      end
      object JDFontButton15: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 481
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61704
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 13
        Text = 'Trending TV'
      end
    end
    object pMisc: TPanel
      Left = 0
      Top = 1954
      Width = 887
      Height = 262
      Align = alTop
      BevelEdges = [beBottom]
      BevelKind = bkSoft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      object Label3: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 3
        Width = 871
        Height = 32
        Margins.Left = 8
        Margins.Right = 8
        Align = alTop
        AutoSize = False
        Caption = 'Miscellaneous'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 757
      end
      object JDFontButton26: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 39
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61483
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 0
        Text = 'Find By External ID'
      end
      object JDFontButton45: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 73
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61483
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61442
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcOrange
        Overlay.Position = foCenter
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 1
        Text = 'Search Keywords'
        OnClick = JDFontButton45Click
      end
      object JDFontButton47: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 107
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61486
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61442
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcOrange
        Overlay.Position = foCenter
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 2
        Text = 'Search Multi'
        OnClick = JDFontButton47Click
      end
      object JDFontButton44: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 141
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61687
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61442
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcOrange
        Overlay.Position = foCenter
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 3
        Text = 'Search Companies'
        OnClick = JDFontButton44Click
      end
      object JDFontButton5: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 175
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61643
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61444
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 4
        Text = 'My Lists'
      end
      object JDFontButton1: TJDFontButton
        Tag = 1
        AlignWithMargins = True
        Left = 20
        Top = 209
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61612
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61444
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 5
        Text = 'TMDB Website'
        OnClick = JDFontButton1Click
      end
    end
    object pConfig: TPanel
      Left = 0
      Top = 2216
      Width = 887
      Height = 324
      Align = alTop
      BevelEdges = [beBottom]
      BevelKind = bkSoft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 3
      object Label4: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 3
        Width = 871
        Height = 32
        Margins.Left = 8
        Margins.Right = 8
        Align = alTop
        AutoSize = False
        Caption = 'Configuration'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 0
        ExplicitTop = -13
        ExplicitWidth = 721
      end
      object JDFontButton3: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 277
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61476
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #57715
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = []
        Overlay.Font.Quality = fqAntialiased
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 0
        Text = 'TEST'
        Visible = False
      end
      object JDFontButton22: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 107
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61463
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 1
        Text = 'Timezones'
        OnClick = JDFontButton22Click
      end
      object JDFontButton21: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 209
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61612
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 2
        Text = 'Primary Translations'
      end
      object JDFontButton20: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 175
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61557
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 3
        Text = 'Languages'
        OnClick = JDFontButton20Click
      end
      object JDFontButton19: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 243
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61617
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 4
        Text = 'Jobs'
        OnClick = JDFontButton19Click
      end
      object JDFontButton18: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 141
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61476
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 5
        Text = 'Countries'
        OnClick = JDFontButton18Click
      end
      object JDFontButton17: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 73
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61573
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 6
        Text = 'TMDB Config Details'
      end
      object JDFontButton49: TJDFontButton
        Tag = 1
        AlignWithMargins = True
        Left = 20
        Top = 39
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61459
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #57715
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = []
        Overlay.Font.Quality = fqAntialiased
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 7
        Text = 'TMDB Setup'
        OnClick = JDFontButton49Click
      end
    end
    object pPeople: TPanel
      Left = 0
      Top = 1762
      Width = 887
      Height = 192
      Align = alTop
      BevelEdges = [beBottom]
      BevelKind = bkSoft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 4
      object Label5: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 3
        Width = 871
        Height = 32
        Margins.Left = 8
        Margins.Right = 8
        Align = alTop
        AutoSize = False
        Caption = 'People'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 757
      end
      object JDFontButton48: TJDFontButton
        AlignWithMargins = True
        Left = 20
        Top = 39
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61447
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61442
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcOrange
        Overlay.Position = foCenter
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 0
        Text = 'Search People'
        OnClick = JDFontButton48Click
      end
      object JDFontButton6: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 73
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61447
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 1
        Text = 'Popular People'
      end
      object JDFontButton11: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 107
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61447
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 2
        Text = 'Latest Person'
      end
      object JDFontButton16: TJDFontButton
        Tag = 2
        AlignWithMargins = True
        Left = 20
        Top = 141
        Width = 847
        Height = 32
        Cursor = crHandPoint
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alTop
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        Image.AutoSize = False
        Image.Text = #61447
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #61550
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = [fsBold]
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 3
        Text = 'Trending People'
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 887
      Height = 350
      Align = alTop
      BevelEdges = [beBottom]
      BevelKind = bkSoft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 5
      object Label9: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 3
        Width = 871
        Height = 32
        Margins.Left = 8
        Margins.Right = 8
        Align = alTop
        AutoSize = False
        Caption = 'Top Rated Movies'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitTop = 1
        ExplicitWidth = 872
      end
      object sbTopRatedMovies: TScrollBox
        AlignWithMargins = True
        Left = 3
        Top = 41
        Width = 881
        Height = 304
        HorzScrollBar.Smooth = True
        HorzScrollBar.Tracking = True
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = bsNone
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 350
      Width = 887
      Height = 350
      Align = alTop
      BevelEdges = [beBottom]
      BevelKind = bkSoft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 6
      object Label10: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 3
        Width = 871
        Height = 32
        Margins.Left = 8
        Margins.Right = 8
        Align = alTop
        AutoSize = False
        Caption = 'Popular Movies'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitTop = 1
        ExplicitWidth = 872
      end
      object sbPopularMovies: TScrollBox
        AlignWithMargins = True
        Left = 3
        Top = 41
        Width = 881
        Height = 304
        HorzScrollBar.Smooth = True
        HorzScrollBar.Tracking = True
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = bsNone
        TabOrder = 0
      end
    end
  end
  object pTop: TPanel
    Left = 0
    Top = 0
    Width = 904
    Height = 48
    Align = alTop
    BevelEdges = [beBottom]
    BevelKind = bkSoft
    BevelOuter = bvNone
    DoubleBuffered = True
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 1
    object Image1: TImage
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 267
      Height = 40
      Align = alLeft
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000002430000
        005908060000003DEB204F000000017352474200AECE1CE90000000467414D41
        0000B18F0BFC6105000000097048597300000EC100000EC101B8916BED000001
        8769545874584D4C3A636F6D2E61646F62652E786D7000000000003C3F787061
        636B657420626567696E3D27EFBBBF272069643D2757354D304D704365686948
        7A7265537A4E54637A6B633964273F3E0D0A3C783A786D706D65746120786D6C
        6E733A783D2261646F62653A6E733A6D6574612F223E3C7264663A5244462078
        6D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F31393939
        2F30322F32322D7264662D73796E7461782D6E7323223E3C7264663A44657363
        72697074696F6E207264663A61626F75743D22757569643A6661663562646435
        2D626133642D313164612D616433312D6433336437353138326631622220786D
        6C6E733A746966663D22687474703A2F2F6E732E61646F62652E636F6D2F7469
        66662F312E302F223E3C746966663A4F7269656E746174696F6E3E313C2F7469
        66663A4F7269656E746174696F6E3E3C2F7264663A4465736372697074696F6E
        3E3C2F7264663A5244463E3C2F783A786D706D6574613E0D0A3C3F787061636B
        657420656E643D2777273F3E2C94980B000029EC4944415478DAED5D6B9415D5
        95DEFD271A0DE461774394494C7484F068D04C3459F1412342E28CA0CE12A320
        A08082BAE248C223CB0CA8332AA06262D02868D028F230D180C6AC84E6218859
        E363146894EEAC891114E9076B012AC4E05ACCDD756FDD7BEAD43E8FAA3A756F
        DDEEFD6591F6DEAA5B756A57D5395F7D7B9FAF6ABEF4A52F1D050683C1603018
        8C6E8A1A26430C0683C16030BA33980C31180C0683C1E8D66032C46030180C06
        A35B83C91083C16030188C6E0D26430C0683C16030BA35980C31180C0683C1E8
        D66032C46030180C06A35B8324435F1B7CAACD4FE1281CF5FEC6851B1656136B
        3BBBB6B63AD9BB883E0D7D13FDDE8FA6EA78DEDFD6E2BCCD51D1A3572D7C2EF7
        2F0CBFE5E1EBE128F5450D9007FC517B277CD4D651E9C3643018051C53D7BBF8
        DF9FA9EF9D604B791CCDDDEF3535F9BFC27F54ECF882DD90BA1FAB0CF4FDAA6E
        BC20FB59ED0FA2B5E748E71EEF9B231D7B2A1D242720C9D07F35FD2CF0B97491
        889FA9E5F9201D9582EF5DFC91B6232D17B693BF792CDBA15A9EDBD08291D73B
        0D64CF5E27C0A4C7EFF4DA7754BAB983ED509348B17DF9ED04E3F8ECCCBB2B4E
        887EB0F49E0219128E23707EFC03091FA71C07EA3CFD71F69DB077FBDBCEDBFD
        F5E1E7C259374D253A03D575A2591E382FF9E3FFB8BD44E03E46325753F89BC3
        A1DC325CEEFD6D6BF7FE76559CFBF012F86C7D3D19473A7EE1FBBAB89EEAF785
        BF7F6F6FF3BE3FECFDC5CFEDDEDFC31DED8565B9EF72FFBDBF795BA5C3521540
        D2533B74A417DF1EFD07438F014384A5EA7E15A4FBE1A896DC981FA2F34B6B42
        FDBF693C516F47DA1FD1DE1AB9BF25DBADE312C1F1AFA6D48DE7B74BAC471F9E
        85C8506C37B57DAA5D9AD365111F38AA6B6FFEEFA71D1FC03F72E4E8D31C313A
        B4F3F51C41FA000EBDFD1A54134832F4DFEB7E06405C8C36835DF862310F26F2
        4568FCBD6A7984762E1831CD69203D32F4EBBB8876129D88A1F35091B8579E5C
        93FBB7DA69BBA3E0B40BCE86F36E9E129D848A37957FBE43C89FA73FFE244786
        B6A54186CE836FFFC77564FBC2ED84D275441E27F5BD781CC2829AF0F5EE1322
        244B9DCD3BBCFFEED8BEC3F9315702E72D5E02C7D6D56BE3188A13194F35792A
        DDD796BF873C71DADFBC1DF6EFD80E7B37ACAD749832839E39C273C27923A0AE
        F17BD2751BBC5F7524402F3498065B9FDCE8CFA70D49C837B74671BD68DA43B4
        D76F4F0DA8AF3FB1BFD393A4F0F1049617598DBABD351671A6DA136E7F0DE837
        441CBF6A7F54BB851FA07274E8ADD7E1C0E6E7AA8218455086C46005112637D1
        9491D072C5C561ADFC28C8873828A7A60C01DD195BB533D05E290E391C6CEB84
        5F4F9CEDB4DD5170EECD933D42449159EAA6B18E83D0E9FEE927292B4364FBA2
        5D8F4789CE4AABF45990618F10E5885167F35BB06BDD46E7C75F2EE894215949
        D43DFCD85C4F2AB2A9BB1E6B0A4AD2FE1DDBA06DC33AEF6F7783AF009D78D978
        62A905B9B118BC4D8A8D36FD6318BC550AB3B89C4C7B5124AC783FDBA6A388E3
        8AA88CE9FB1B62BD98CA98BC1D9558A12763E276A87810EB11DB43627460F3F3
        7070F39ACCA6D5686508C9902C5F5B3C291B077DE2A45A0D468E07ABF22A4310
        E8A47583800DC9AB64AA2C9F22AB0BB48B5402A9F36C993E4B2F4D262A43D2FE
        15B27064125B3CFE64E4E9505BBB408C36388F459A282A4381E30D1FA7366D4E
        29C7517E1F805A29F014A38E7668F9C5C26E418A90049D3466BC478474FD721C
        25454B22A471842637B635876192605B83642435FE7A1419535C3F66C52A8AD2
        146E67F45A2633598D4DFAC806EAD368F2FE9008A14A7430836A51C49A21CB41
        82243DC55D5A3FF9E9949D388395A84464B766088A1719459E5E5DF65C455265
        A70D3F1BCE9D3EB9D4BC9824348CAE5133441D9F0BE50915A3CEED3B60E78AA7
        73FFDDEE3C2EAE11BB66C86A10A4BE570FB6D6BFCFFD7B77D553F0EECA272B1D
        BE548024E8EB37CC801EFD8710CA021D9F4869B188CA884DBA2B587403A1EBC5
        8AD48082AC10EDAD51A6EF83C7AD8E8BB05E809C41A8BFD12959D1D28176EDD6
        9E2E95626B497674D7912ADEFEF63A9F7D38534A91A16628CCC06D9FF04B31B0
        AC19927E2706D73858655A19D2A7ED6A88C1404712BD54D984594EDB6E83F372
        440809512C122A756EAA9B17BFAE48CD50886C8BC7A53ECEE0F73E14D7A3A2D6
        C01447FFD3A1B60ED8B57E03EC5CBECA796C5C22AB3543A115883434D6156D9D
        3BAB587CDD15D067CC0438A9900EB3263FC4FD1A891C8596EBC8889A0C0757D7
        9004EA6159915EB3221B208D5B4A2587BE8FE5E357C6D95F6E485319959AE272
        A9DFA0489971F69E45CD908EAC86C2A58F0F165A1FC811A27DCF3C049546666B
        866A9469A5688349B89D692B43D1C80D19674567ED2FFFDDACF2A7CA26BFF098
        1447106E0ABBE3542B75A5EDFDB14A6B866A625C8FA6F32C6EDF6F1FAA43BBD6
        6F84968C922253CD508D523936D736281555ABC1DB749EF2C01969DBBA00212A
        AA41030687D23D89C98DB39A21C57245FF12FC7D697F3AA5855A1E8F8C590CEE
        94D21451190AAEA76EAF553A4BDA5F5C3226B747AF9099E25D888FD49E4F3BF7
        C0EE3BA614A7EB57021A65282C3FABC989F819A4CF7A654425C389C1ED3E3543
        76717CFB4F5B60DDC25F396DBF0EF9596493CD24AEB09C3ECF521C14BFE79A21
        F5FD227626983E7BE3E78BBCD9685942A966C8224EAAFBDAA02486073BE9F7F2
        7EC8277BF5608205D6AF4C9B58E950C646DDD0913922345311AF525C8AE74711
        9F62FCB47B8B92F6221BA2262D81E562BBC3DB775A330405D263982D65A37CA8
        141B3A1D656AAF3ECEC5F3412942447B94C76DDA4F84765B6DAFD02E4C9761DA
        ACB3422A11FB0C3942397C86FC41E160DB3E786262F95265FF3A6F367CB9A19F
        F42DFB0C4555C694DB579C675D9CFCEDB4AC781A5A96AF741EAFB828A7CF50F0
        332DD7DBFCDE5F2E5EAF6D1BD642CBA285950E6764A01A54E715481B0675437C
        B4E449DE2941D6D5831FFB0CE994A16AF519D292356A7B52BF5952882A973663
        9F21472887CF90F8F9773317942D5536C54B91C55000FDE586277D28FCBEBBF8
        0C45519EC8FB491ADC76356D8037EE5FE43C6671505D354364808B1FB7CD9955
        55B3CCFADF7AAFE71B64AB3C06C2218681B85F13A5D5B483AD4F6ED86748D7DE
        6AF4190A915A43BBC5006171F5BE677E09E544666B86D867485F4B8244086B87
        D286388BACD83C82CC52378D751CD86708A2DC2FD47ABBD76DCC0421AA069F21
        D3C395BF263A5763FD5035E01B1E111A9C3F1E5131B0503083609F21AABD5A25
        CA703FCBF1D3F737C47A2479342B63F276540F57E5F0190A297116646BDFB30F
        955521629F21472897CF901FC70FDBCB33ABECDFE6CF862F0FEA27B543382CA0
        CE0784CFB365FA8C6B86E29327AC1F7AF99639CE631705D5E633A423995844DD
        BA28FB1E44FD0B4428DC9F50F11297D3FD721C25454B22A4718426377A3242B5
        9B2435EC3394699F21F5F6E8F3B9AF8C0A11FB0C3942B97C86C4EDFC6E56FAA9
        324C91299FB0D96748FBC4ED4A79B2BDEF1038DBAC698A5BA21F05D5EA33A41A
        D4F0D51DAD19AE1D3AE58619503B7484267EE12775F6190AB7977D86D44A4E5A
        3E43B6A4AF5C0A1149867EB44C7CBAB4C8CD5305BF023EDFFB84E0EF2C9EFCC4
        FDEFDFBB8F5418E8F5CD8319E2A1AB7EEA3490E5F2191297BFBFB5C5234469C1
        9B458629B262FB629250A973639F21FB38066E2771B0D14CC5CF13A2A9500924
        AD19FABF95CB0D7B281DBFAF40E1DFCFD6F7826373FF8271A4E2A38E23B53E4E
        B57F65DA848AC4D284BAC6911E19B2552AACC90F71BF462247A1E53A32A226C3
        C1D5D967480FA2DFA04859C67C8648E5488A37CE32DBBB784EEA8ED52419728D
        2123CE825133C606826D1A4CC442B8CD4FBC009B7EFD42DACD4C8472FA0CF971
        4203C6346795FD60E9DDD0A3579D0365C4B05CD85E567D863E6EEF0C6D5335B8
        1C575F476EDF76508EA624D29D60EBCA5515996596C46708A7B46F993A39E21E
        4B4032F4E5C6E1F0F90103E18B031AD4FB27E3585A4FBE1E36FDFBF7CB1E4713
        8EA9EB05431E7C52AB7CA8D23DEC3304E4F5A76BAFD5E04E294D1195A1E07AEA
        F65AA5B3A4FDC52563727B4CCAA13EDEF63543229010BD33FD424813E5214323
        CF82D133C691CA888DCFD0268F0CFD3EED662642397D86C4EDA0DFD0CEB55B9C
        1FCF890DFDBC29F5743BA8F6958E833ECF521C14BFCF6ACDD08EE5BF81E6A77E
        13699FC7174851EDA001707C8E54D60EE80F758306462237621C556908EA7A39
        DCDEE1D50F95FB151E497D869A2EB9C8493BBE76F95838F9F22B41BE5FC2F79F
        F97A4665286B268C7E9D107D3CB6836DB83FA1C98D0EEC3364AB7C880F2B743A
        CAD45E7D9C8BE783528488F6288FDBB49F08ED8EE23344654CC4CCC9C1CDAB3D
        85282D944D191A3D63ACBD52202DAF2E65287D9FA1D27600F66C4B2755567AFD
        06980733A17D1FB577C2E7EA6BC9E35476C6C2B759AD194232B4232219520195
        A3AF9E3F14BE326C688E24D527F2192207BFC2477CA7D99F7F5ADE82EAA43E43
        4D97BA214388DE8DC3A1DF8D3787F74FAEADBE2FB7CE990507325444DD67CC78
        E873D955C6766B0775D09C1F206E13A3C209C5C1917D86A8C13CBC1E7D78DDDB
        67C844FAF62E9EEB91A234505665A8181B4A29D0DCA4D5AD0CD93DE9BFB7ADD5
        5BD4A7A16FE474531A9E43573C764F9ED40472E4F4FEC5E3FC4BD34B70EAF073
        82CBA59BA01A7D86762CFF2D343FF5B4D3362129423284A408C91175BD508352
        9482EB37EF5F04BBD7AD771E4F1592D60CAD75A40CF9F8C2C0061872FBBCE097
        8A7E475C2CB673EB9C99992143C7D4F786D31F789250167C92609F560D84433C
        6EE27E4D9456B34853B1CF903EEDD8DD7C865464155FDBF1D79BD3495B67B666
        480C7255294360262FD4A08764E6FD1C213A73DC45C1272C8B5A925797AD8157
        1DBEC91E15A1F3A64F12F623B59F20B3F8B1B569B3B7E09F038A924DCD50A9D3
        CDAACFD08E15BF75A60C51C054DA377F787D8E20D5475412C57642A8F7C2D776
        A03A54AE7459529FA1A64B47396D0FD6110DB9ED2EEFAFAA735629203ED0891A
        1DA9B380FEB7DE53F2132A1E4F5819649F21623F14090BD40CE914368D121551
        19D3F737C47A319531793B4AC52FA33E43AAF37160D31A685BE25EF12E6FCD10
        258F5B0C46D5AD0C81701100A8060154869AEE5D0A131F9F67264F521C0FEE75
        5B488D44A8EFF073AC142AF1627E61F65D70EAF9E7E4C8D039441AC45FB13A7D
        86E2D40C45453E7DD608FDAEB82CB87F43676BBA5E50197AB34C868C497D865C
        D50C89C05459EF61172848989964B62CBA3713640849D080DBEEB59A05671EBC
        A2D40C9995142D89901457BADD516A868224817D86A4FD75219F216A3B473ADF
        87F7EE98ECFCA5AE1552866846A85212AA4A198A5933F4DEB6167866E63D70E9
        821970D2A0D38CE4491E64563BF41C9AF2C252102F3E7A300BDF748F5E3801CE
        B9794A4119EA5A3E432E6B864C40523462C983C5FDEBCE03F93021F5A687DA3A
        60DDB5E5996A9FD467C865CD908F93B1987ACCD8E267E5F5ACE8B4B3523324AA
        4225D8D720D2CA42693BC17844488B455446D867484D1ED867C88EF4E10B5D5D
        175367A766488A9DD0C42A578688C18C60C0A80C3D33F36E38EBAA5170E6D851
        8AED50F1C9FFDE55AAAC6FE10DF594A2A31B94B15668D3C22570EEF429316B86
        F2DBC9AACF501A35433A60BA6CC4230F063B1B71B0D1A44FA9F3D4BA626559A6
        DA67AD6608E191A1CB4B6448154771B1D8CE2CCC26C35AA1331E7C02744A8E69
        30B5263FC4FD9A76CD502C52236D8F7D8624924191B22AF419A26ACAD2A81DCA
        6CCD5077F319F29521DCCE84C7E6590D7A621C3F74E4398429327F1659693F52
        FB0919F9859FDC051F6CDB2928431624CE5F2E6C2FAB3E4369D70C514085E8EC
        3B6E83CF7A53F4354FFE442728774E38D5BE1CEA50129F21FCC275CD10C24B93
        355E00D5EC33748AF736FA11A176B3CF905E69B11D6CCDE4C86270A794A688CA
        50703D757BADD259D2FEE29231B93D26E5501FEF783E43D40941650815225760
        9F214770513384CA10C24B9535F495B6A3CEF1FB37733E55B633D1715CFB87C7
        944FF4AA9B0FBFC71419C22343179C231C773425B03BD70C51F8CAF98D70C60F
        6FD0A621A8C19DEAB4D177685F7373AAEDCD8ACF90886F3FB434EF4E4DDE7F7A
        05A56D4393573354697CE7376B69458B3C1EDBC196EE4FC2E44607F619B2553E
        C8871503E98B57330491D274A1E336ED2742BB5DFA0CC9EDC69AA1771CAA43EC
        33E408AE6A8610678D1B0567E6FED9F80C8940F3C5F50B7F15FB18F0F51B436F
        9E643C4FF271B4AEDD0C9BEF7BC4FBD6BE66881E2CB966288CB3EFB8156A070E
        D4DC2F7A72E75F8F982AC37F69224B3E438892D790FDF52C220BF542A80879AF
        DD88D06EFF38D967887D86B4A7CB223E59F219928F6BF79D93E0B0A3D77464A7
        6648739356B732A4AE19126F465119EAD9AB16263C3E8FD80E159FD260F2A137
        AB6C66EC63B808DF50DFD08F567434FB5F71F58FE0A3B6FCEB2AE2D70C753F9F
        215BF8F543C53845F01912D1B9BD397513C62CD50CA11AF49D87962A066FB3CF
        10D609BD326D62AAF1B20112A1FA463F45A6507202B5153A85C5423922EED7B4
        6B86D867489F76649F21FA3ACCBFC4D5CD5BED335B33D41D7D867C650871C97C
        4C959D06B63543FE724C95ED8939ABEC5A6F1619AD8C04DA2F5DAC7E8A0C11AF
        66A8D4E976579F2113305D763AA6CB42ED17DB0964EFE51F277A0DAD4FB96E28
        2B3E434884BEFDCBA04AAAEA9C550A48165421C4E90F3CE11550CB509104F619
        52280D1409D3A461D4DBD3ACC03E437A92E4C067488CC3E19DAFC17B77C67F9F
        61608FEC33E4062E6B86107EAAACB49EB96608BF889B2ACBCF229BA4ED342972
        E3CF22F3912743EC33E41A9E3A84D3ED63F80C89DFFF39E5BAA14AFB0CF92F6B
        CDBF97ACB07FCD93AB6AF043128464280BF8CED36B8531C67E169CF87DB29A21
        B392A2251192E2AA22EB3A3242B59B2435EC33D4E57D8644B8AC1B629F214770
        593394DF5E2D8CF7669581D4798BDB09E360DB3E783246AAEC0AEF0DF5B5C27E
        D4E9966227903BCE95D7FCB8982243B0CF507AF8EE1DB741EDC001523B09D2A3
        24CBF836FB95D09AE214FBA43E435BA64E52FE8E02EEEBD8BA5E1E094212D67B
        D870E5FD128C1B043E8B831AA6C7B6CD9D55F1E9F488BAC61170CAF533346BB0
        CF90723BA0202B9452C13E434A25278B3E43E272577543D9A9199262271E7475
        2B4304A92018B0AC0C212E593043785799A633979835BEAB6C4F845965F8867A
        AC17A2DA177C72091E074EA5FFFDECE031B3CF507AC057769C7DC7EDB17C86FC
        F5DE5BB701DEBCFF17A9B53169CD50E978D4E4A9A4305AFE9E5A41A1B0FCBDA3
        0DFE67EAC4D4E21315A7E294FA46714A3DFB0C2956609F21391D4691B22EE233
        24C255DD50666B86BAABCF908833FD54995219A2E3883543AB23BCC97EA8E42D
        6452A0FCF3B269E1235E9A4C04FB0CA5074C955D5074A6A6C976488687E079C0
        14599A45D4497D86D44FE09A41DE6AF05617A2FA9F0F346F87AD73B3911AF391
        779D6EA08F1BF4CA07FB0CD1CBE391318BC19D529A222A43C1F5D4EDB54A6749
        FB8B4BC6E4F69894437DBCDDF90CF90AD9BE677264E8D96A2143EC3304516B86
        F2DBCCCF2A0B0D7A86C1E4605B67A454D9958FE55364BAD954A5F696CE93388B
        CC07FB0CA50B34613CC14B95D9A47DC2DF7BE68B53AE4BAD7D497D864A07A056
        12C3831D1D87E27E344A8AFFFBBD1BD67A2F64CD1ACE78F04938063D9284B8B0
        CF5078FBEC33249C0F4A1122DAA33C6ED37E22B43B4D9F211F87DEC622EA4990
        14EC33E408AE6B867C5CE2BDABAC2F414EF469820D0B7FE515539B502C9C967E
        6F1A64F229B279A1EFD967285D887543CAC18F781213973F7FF1A5A9B52FA9CF
        9008E5EF815A4F450EF4BFC7BAA077573DE591A12C028BA7E39211EDA06E888F
        963CD13B525E6FB6ED0DB59BDCBEBD326252CEEC941CB1DD768A08FB0CE97618
        4E63C6257D3E8E74EC8177A6272FA2CE4ECD90E626AD6E6588E844889B915286
        10678D1B0DDF1A771168070342D1C19A219B5419A6C8901051EDD3F90C6DBAEF
        11CF6C5106FB0CA58B336EBA11FE69D8508D82A71EB4FCCEEFB9D197A4D6BE6A
        A919FA5B810065A1485A07CF795A8E1BA92CF824817D86D867486AAE41C9311E
        BF6A7F19F01942B89A5196D99AA1EEEE3354DA6E61561915276D1CED3C87AE5C
        7A377CAE308B8CDE0E5D3324CF22F3C13E43E9A2DF1563A0EF0FC628DA09646F
        211F67A594211B9F21DDE012520228D2AEE934FDCE79E7A2853912D40EFB33E0
        21A4C33175BDBC349951F9219441F61922F64391308B344C787B9A15D867484F
        921CFB0C21493AD2F13EBC33FD42480AF6197284346A867C78A9327486166458
        5D1CFDEDBEB66CB5F64DF6A808A132A44A57A80623548436155EBF21837D86D2
        45BF2B2ECF91A1CB40D7999A48DEFA29533D03C63490D46728B482C56C53551C
        8AFB573CB91E6E6F83033BB6E748D1F64CA6C9B05608C990DCF9B3CF509024B0
        CF90B4BF6EE433E4A3F5AAC19014EC33E40869D50C21BC5965634719151B398E
        5848BD4C5348EDA5C8869F6DA55C8978919845E6837D86D245581922488F922C
        E7816FAF3F9C12194AEA3324C296F4A8065BEBDFE7FE7D928BC7DE8D4DF0EECA
        2753894B1C9494211DD86748B91D5090154AA9609F21A59293759F21DCDC5FC6
        570B19629F210874220403D629435EAAECF1F98AF8840703319EF95419ED3974
        DD1F9606E24CB52FF8E492FF0267917D48A4C810EC33942E4235434075463489
        2DAB3294F19A219DCF50CB2F16662285565486E4B8C5542AACC90F71BF462247
        A1E53A32A226C3C1D5D967480F221D4691B22EE83384A86265C8A09CB0CF5008
        F8AEB2131BFA06E3648A63EE7FAF2D5B03AF11A9322F4576F33560AB8CF8685D
        FB92324586609FA17481EF27C3F79451ED276578089F874AD60C65D967C85F0F
        BFC11966955689E2D60C910F33EC3304E40AD664CC6270A794A688CA50703D75
        7BADD259D2FEE29231B93D26E5501F6FF73E43D55933441C0CFB0CE5A1538610
        678E1B9DFB979F55665B3384F850E139346AFEACFC1BEAC5F66A1426BFBD9BEE
        7B949C45E6837D86D245529F21C4F3A3D32343D5EA3344C5E9DD55CB2A4E8802
        B3C928458B3C1EDBC1F6A8363EC5F8695BC83E43B6CA07F9B062207D71D247EC
        33140FEC33E40869D60C214E6AE80B17CF9F216D87861C472A55E6A5C8085246
        FD5E5CBEF2EA1F2B536408F6194A17E8407D5C407921063FE2492C0BCA10DDBE
        707AB2B89EEAF740ADA72207E6DFFBCBA9FB120BAB5B2B68C638E0D67BA0C700
        5D0A807D86CCDBB1502AD86748199FACFB0C1DD8B41ADA962477D5CF4ECD90E6
        26AD6E6588E844889BD1A40C21FC5965A1C1805074C49B16CD17372C7CB4B83E
        A6C81AA7875F88492B77FE866AA0B569B3573CAD03FB0CA58B8BD7FC3634B845
        F119DAD7BC03FE7CCB7FA6D6BEEAAA1902A04637F9BE6859742FB45568B6D980
        DBF0751C2219629F2115D86728DC9E70FB6B40BFA1EAF319EAF2EF26639FA130
        7056D9B7C68EB28C63693F1FEEED84655797526517CD9BE9BD9CB5B41DEA7710
        5A8EEF226B55CC22F3C13E43E9016B85B06648DD4E207B0BF13877AFDF005BEF
        5F945A1B93FA0CFD75D50A6FCA7BE800346996630B6FAEC7AF71DF9F1FD04076
        9AAACE59A580F8C0F66CAFD05BECFB8C190F7D2E1B07AA41957D8622D40C5124
        CC220D13DE9E6605F619D293A4147C86F62E9E030737AB2D646CC13E438E9076
        CD10025365972C9819A966C8DFCF1A215536B5308B8C5682D49DE60A438A0CC1
        3E43E9E18C9BB0787A98210DAB2779AD2B5641EBF215A9B531A9CFD096EB2687
        C950441C5BDFCBFBD77BE8F9F0C5810D5E21B2EAC9D5EAC93DF7CDDE0D4DD0BA
        E8DED4E2A602AA42982A133B7FF6190A9204F61992F6D7CD7C86D07D1A5DA893
        827D861C21ED9A211F5837749237AB2C5A9AA0A5902A136791D1EDA395ABBFAC
        7D095EBC4F9F2243B0CF507A18BD3AB87F25E9519265F054A1DDEBD7A7D6C6A4
        3E435BA64E72EA81E491A2C6E170F298B1C5EFD48A915AA9F804A7DC2F5A0807
        CA3CE51EA7D79FFE80AE889B7D8694DB01C579A5940AF619522A3959F7197231
        ADDEDB62666A86A4D889075DDDCA10A1D8100CD84619429CE9BDAB6C54703F04
        B39671B06D1F2C9B3803C616DE504FC599568AF29F5FF4DE45A64F9121D86728
        1D608AEC0C4C9111CA80F2899F38CC3467922192D60CBDE44019A280A468C8ED
        F3BCBF81413B82C2922FA62EBF3A84CA50CF817E87CF3E438A15D867484E8751
        A4AC8BF90C1DDCBC06F62E76530399D99A21F619A2519A5566E73324327E7C3D
        C7BF8C1D1D2AB8B551461EB970A2551CD867281D94A6D4ABDB4FCAF0C27AA808
        A5592F8448EA33B465EAE4D4DCB1BF30A0C12344A6EB5DA5B461CDD0ABD326A6
        1A3F0AF9BAA1AB42DF9B940FF619A297C7236316833BA53445548682EBA9DB6B
        95CE92F617978CC9ED312987FA78BBF5196A5B32D749BD90B747F619728372D4
        0CF9F0526583FB9183899ADC98067DB5C28445D3A659643ED867C83D3C55E8A6
        1B946908EA7C539DF69B3F4F37458648EA33E4A266488721B7CFCF91A24142DC
        EC6B54F0FFB7CD9959915459E91D65EC33446D9F7D8684F3412942447B94C76D
        DA4F8476A7ED33E42A45E6ED817D86DCA05C354388FCACB2D1CA9B5019E71009
        A5DA17FEFD8B16B3C87CB0CF907B5CBCFA694D3B4D3543A5EB71FDB5E9BD86C3
        47529F21D7354332BE30B00106DF368F5862975EDA552123C6FEB7CA53ECEDDA
        CD3E43EC33A43D5D16F1C9AACF902B7FA1E216335333A4B949AB5B1952D70C89
        37631465C84B952D284D9537F90CF971B419F4C5F6F9E765C9F7275AC7817D86
        DC02D363B583C4F4587870B3F119427FA19753F417F291D59A211F4886862019
        8AE0332422EF4AFD44EA719451D738124EBDE1C7A0547202B5153A5267A11C11
        F76BDA3543EC33A44F3BB2CF50F83A44D769749F7685CCD60CB1CF901A58003D
        FEB1F960EB3344753E25E84952EBDA2D56B3C87CB0CF903B9C51780F996D41AC
        6E70CFCF22DB907A9B93FA0CA5593384C002EAB37EB9541B479DD2D6B6B1328E
        D4680F70BAF4D2561549609F2185D2409130431A86DE9E6605F619D29324473E
        433895DEC5FBC8027B649F21372867CD10E2FC1F5D03FD867F978CA34901A2DB
        47A7CF6C6791F9609F2137C87B0A359602A4E96C4D641BF15CCAB3C87C24F519
        6ABAE4A254DB575486403D98A8065BFC7FAC17C2BAA14AE0941B66407DE348F6
        19924802FB0C49FBEB063E43AE8C160391619F21372867CD10025365A3E7D39D
        B25291099150AA7DC18B6FC98557478A03FB0C25874784860D2DEE5F4F72F54A
        06FECD174EA7AF0A2192FA0C355D9A2E1942CFA1BE374E0FC5D1E4335452862A
        63BE88A0D4211319A19ED4D96728DC5EF619522B3959F3193AD2E15E15F2F69C
        999A2129764213AB5C192206338201475586BC54D9E3F3857846AFD138AA5A5E
        D84ECB5AFB59643ED867283EB036E89B3922745C7D1D909DAF38D858FA0CED6B
        6E86976F7157646842D29AA1B5292B43C5D964317C861095F21AF2919F663F3E
        9652614D7E88FB3512390A2DD79191F0C319D56EF6198A910EA3485917F01972
        5D2B546C49566B86D867C88C61D3AF817E177C571D4705E3B7AD197A71E1A3D6
        B3C87CB0CF507420F94112545BF011B25112A9F65332FCCB3F9DEB11A27221A9
        CF50D3A5A3A2ED300292FA0CE1D7BB9EAECC6C321FA80EE1CCB263EA7B1B950F
        F619A297C7236316833BA53445548682EBA9DB6B95CE92F617978CC9ED312987
        FA7827F3194212F4DE9D93210DB0CF902394BB6608E1CF2A4BCB676871845964
        3ED867C80E4880BE7A7E638E00F587BA412209522B89AA340475BEB1B36959B1
        125A96AF741E4B1D92FA0CA55533549A4506D2FD675FA382FFDF5AC137D8FBA8
        1B3A124EB97106F9441E6DB02D1C9736EFC13E43AABC5054E5837A583191BE78
        354310294D173A6ED37E22B4DBB5CF1012A13454216F0FEC33E406E5AE194260
        AAECAAC7E687BE57C6394442A9F6E53FB7366D899C2243B0CF5018F9B41778A4
        C72341C386C271BDEA4ADB37287791496EEE23FA09ADBB769AF3389A90D46728
        8D9A215F110AC64D865D7A096792559A0C21B098BA6EE80863BBD967887D86B4
        A7CB223E59F119DAF7EC43B0EF9987202D64A76648739356B73264F7A41F4719
        42E0ACB2BEDEAC32930C1EAD66E8F9D9F38A6FB98F82AEEA33D4BEFD2D686F7E
        0BCC4F3839F25397273A48789000D9284F85B0837CBD90E7D1C26768CB2DE54D
        8FF9C852CD104EA33FF9F22BA177E305C1058A7E475C2CB653C42BD32678AFE5
        A834304DE6A7CB82F73DFB0CB1CF90D45C8392633C7ED5FECAE83374F8EDD760
        774AE9B1624BB25A33C43E437610679529F763501EA8DF459D45E6A3ABFA0CE9
        C847949A9EE202EBB4977D41ACBF9972CE1E9391D467E8F539B758EF4BBE9E8E
        ADEB95DB772FEFFBDE8DE77B9FE5F56BC0FC5040296DF8B16DFD5A687DA0FC1E
        432AE467972D03F619D2913BB1E383503FC83E4329D40C39F6194A6BF658688F
        EC33E40695A81942945265A6748A0F73FAAC65ED66AF783A0EBAAACF50A99D16
        B53015244F6FA0B9E2BACA102144529F21FA78A93895B64F7F2FEC5FF3E46AF5
        E45EF8E1D60ABC97CC0474A63EE5FA19C6B868D35E0E94142D899014579ADCE8
        C908D56E92D4B0CF5097F319DA9D629D502032EC33E40695A819F2311A5FDCDA
        D04FDA9F81F4680691E766CF870F62A4C8105DD56728B0DCF289DB95F2A427B9
        A5E56F545011F291D467287C7CC4EFE5F51483ADF5EF413FA8E1F63DB3C5B9B3
        2A1A5B15B0A0FAEB37CC50C42FFCA4CE3E43E1F6B2CF905AC9A9A4CF509A05D3
        A14865A666488A9DD0C42A5786D44FFA497C864478A9B205B3148369298EB683
        7E9C59643EBAAACF50E9734C72A3A835D06D3FD4D988838DD4CE37EF5F04BB2A
        A808F9485A33148C43E1B3E249DAFAF7D40A117D865A32308B4C873E6326C049
        975D05EC332491A828DB09AD47B7D7741FCBC7AF8CB3BF9C7D8680BA3E76DF51
        3E22E4B524AB3543EC33640F3F55A654A0C8CE475CAF8496A69762A7C8105DD5
        67C894F652D7A2683A4D0DB991B7AF1EDCB2A108F948EA33A47E023739449B06
        6FD3792AAD275F0FFB9BB3AB0A894043C693D0909122E1EC3304E40AD664CC62
        70A794A688CA50703D757BADD259D2FEE29231B93D26E5501F6FBB9AA1F7EE9C
        525622E4B59C7D86DCA05235433E2E9E3F134E6CE80B368A43A87DFEE7A3388B
        6C7EAC59643EBAAACF101547E56052A69A219C3E8F35429DDB77388F575C24F5
        192A1DAF5A490C0F76D2EFE5FD904FF6EAC144DCCE811DDBBD5AA16A41CF0183
        E11BB7DE0B7683ED516D7C8AF1D3EE917D866C950F51B1A1D351A6F6EAE35C3C
        1F942244B44779DCA6FD446877549F217C012BBE77ACDC44C86B01FB0CB94125
        6B8610E15965AA41469F0E5A1C7316998FAEEA331458AEE80C6C144072FB06E5
        8E8A5367F30E6FFA7CD690D467481727FA7B5A618CF27B7FB97CBDE214FA57A6
        4DAC744823E398BADE1E21FA4C7D2F609F21F619D29E2E8BF894CB67E890377D
        7E0A540AD9A919D2DCA4D5AD0CD93DE9275586F2A9B2051A19DC3CE8E32CB28D
        09526488AEEA33548A9705B911176872F636CA937C1E0FB575C0FF664C0D1251
        5D3543408E6EF8F1938E36D83A6756263C85E2000911CE34F3D266A1B8A80737
        313EEC33A451728CE9A7D2F6A8E3092C679F21D8F7CCC3D099A2A1A20D325B33
        C43E43D131BA982A93F663501EFC8F49536408F619526F5F47866D94442C907E
        E3FE079CC7C62592FA0CE90697101955904DD5E0ADEA9CE5FDE75FC69A1D3FA1
        244052F4B5EB6740CF8143940A6610EC3344B557AB444554C6F4FD0DB15E4C65
        4CDE8E52F1ABA0CF109A29EE5D3CD74B8F551AEC33E40895AE1942E0F47A2444
        A6CE9E6E1FC0C3DF4F962243B0CF907BF2B473F9AA1C11DAE8D508651DD5EC33
        842AD0BBAB967964A82B0109516DE348A83D6F44DEB1BA78DC47B5F129C6CF42
        49D192084971A5C94D949AA12049609F21697F55E03384468A48822A511BA48C
        1CFB0CB941A56B8610C15965869A216939BE9D3E698A0CC13E43F276E2294F87
        DA3B60D7FA8D1E11AA2654A3CF1092A0BD1BD755F46DF4E50092A21E03067BA9
        33FC6F5D7C22A5C5222A23EC33A4260F5DDD67E848E7077060F373A9BE632C2E
        B2533324A06B2943EA34892B9F2111A317CC841307F52396E807FDA726CE800F
        DB3A13EF9F7D8692F90C21097A7BF9D399F00C8A836AAA193A9C23416D1B9AE0
        6F5D9C04C9F04951CFFE83A1B6F17BE1418DB85FD3AE198A456AA4EDB1CF50A9
        3DBE0295059FA17F74EC818339027460F31A4F11CA2A325B33C43E43F1706271
        5659349FA1A4B3C87CB0CF907AFB54A7F2714101EA687E2BB345D15190759FA1
        4FDADB61EFC626D8DFBC1DF667ECD51A95804F8C7AE488D16772FFDD73C0100B
        E5439F86619F21F6193AD29157803E452568D31AA806B0CF902364A1660881A9
        B27138AB2CD40EF5A0DFB2D64D8A0CC13E43E1C1E2E3B6F6E2FE90FC74E4484F
        678EFC747401F223232B3E437FCF911E547ED02708BFDF9FFB8BE6890C3DF2E4
        6888F7DF4890B0C608E35FAA35529F277AB096614E9BEB1F4E4022076A2537DA
        7E89FD93FD97BF8118354E0A04A7E2DBA4BDDCA5AD4AE7CB3E0D28EEDF577A0E
        ED7CDDFBFAD0DBAF67AA0E280ACA4286188C4AE3F85E75707C7D9D936DD9DC30
        38051E894F7783AF0A2581B13357A05AA7C133188CCA83C91083C16030188C6E
        0D26430C0683C16030BA35980C31180C0683C1E8D66032C46030180C06A35B83
        C91083C16030188C6E0D26430C0683C16030BA35980C31180C0683C1E8D6F87F
        9416ABD39A4306350000000049454E44AE426082}
      Proportional = True
      Stretch = True
      Transparent = True
    end
    object btnUser: TJDFontButton
      AlignWithMargins = True
      Left = 859
      Top = 3
      Width = 42
      Height = 40
      Cursor = crHandPoint
      Hint = 'TMDB User Menu'
      Align = alRight
      DrawStyle = fdTransparent
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Image.AutoSize = False
      Image.Text = #61447
      Image.Font.Charset = DEFAULT_CHARSET
      Image.Font.Color = clWindowText
      Image.Font.Height = -27
      Image.Font.Name = 'FontAwesome'
      Image.Font.Style = []
      Image.Font.Quality = fqAntialiased
      Image.StandardColor = fcBlue
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
      Text = 'User Login'
      OnClick = btnUserClick
      ExplicitHeight = 38
    end
    object btnMenu: TJDFontButton
      AlignWithMargins = True
      Left = 811
      Top = 3
      Width = 42
      Height = 40
      Cursor = crHandPoint
      Hint = 'TMDB Configuration'
      Align = alRight
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
      TabOrder = 1
      TabStop = False
      Text = 'User Login'
      OnClick = JDFontButton49Click
      ExplicitHeight = 38
    end
    object JDFontButton25: TJDFontButton
      AlignWithMargins = True
      Left = 763
      Top = 3
      Width = 42
      Height = 40
      Cursor = crHandPoint
      Hint = 'Search TMDB'
      Align = alRight
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
      TabOrder = 2
      Text = 'User Login'
      OnClick = JDFontButton25Click
      ExplicitHeight = 38
    end
    object StaticText1: TStaticText
      AlignWithMargins = True
      Left = 285
      Top = 12
      Width = 57
      Height = 22
      Cursor = crHandPoint
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 12
      Margins.Bottom = 12
      Align = alLeft
      Caption = 'Movies'
      TabOrder = 3
      ExplicitLeft = 266
      ExplicitHeight = 20
    end
    object StaticText2: TStaticText
      AlignWithMargins = True
      Left = 366
      Top = 12
      Width = 81
      Height = 22
      Cursor = crHandPoint
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 12
      Margins.Bottom = 12
      Align = alLeft
      Caption = 'Television'
      TabOrder = 4
      ExplicitLeft = 347
      ExplicitHeight = 20
    end
    object StaticText3: TStaticText
      AlignWithMargins = True
      Left = 471
      Top = 12
      Width = 55
      Height = 22
      Cursor = crHandPoint
      Margins.Left = 12
      Margins.Top = 12
      Margins.Right = 12
      Margins.Bottom = 12
      Align = alLeft
      Caption = 'People'
      TabOrder = 5
      ExplicitLeft = 452
      ExplicitHeight = 20
    end
  end
  object pUser: TPanel
    Left = 732
    Top = 524
    Width = 553
    Height = 239
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
    object gbUserLogin: TGroupBox
      AlignWithMargins = True
      Left = 24
      Top = 4
      Width = 269
      Height = 231
      Align = alRight
      Caption = 'User Authentication'
      TabOrder = 0
      object Panel3: TPanel
        Left = 2
        Top = 20
        Width = 265
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object RadioButton3: TRadioButton
          Tag = 1
          AlignWithMargins = True
          Left = 111
          Top = 3
          Width = 82
          Height = 18
          Hint = 'Login via TMDB in embedded browser'
          Align = alLeft
          Caption = 'Normal'
          TabOrder = 0
          OnClick = rbCredsClick
        end
        object RadioButton4: TRadioButton
          AlignWithMargins = True
          Left = 199
          Top = 3
          Width = 70
          Height = 18
          Hint = 'Login to TMDB using guest account'
          Align = alLeft
          Caption = 'Guest'
          TabOrder = 1
          OnClick = rbCredsClick
        end
        object rbCreds: TRadioButton
          Tag = 2
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 102
          Height = 18
          Hint = 'Login using TMDB credentials directly'
          Align = alLeft
          Caption = 'Credentials'
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = rbCredsClick
        end
      end
      object pAuthUser: TPanel
        Left = 2
        Top = 44
        Width = 265
        Height = 55
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label6: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 259
          Height = 17
          Align = alClient
          Caption = 'Username:'
          Layout = tlCenter
          ExplicitWidth = 80
          ExplicitHeight = 18
        end
        object txtAuthUser: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 26
          Width = 259
          Height = 26
          Hint = 'My Username'
          Align = alBottom
          TabOrder = 0
        end
      end
      object pAuthPass: TPanel
        Left = 2
        Top = 99
        Width = 265
        Height = 54
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label7: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 247
          Height = 16
          Margins.Right = 15
          Align = alClient
          Caption = 'Password:'
          Layout = tlCenter
          ExplicitWidth = 78
          ExplicitHeight = 18
        end
        object txtAuthPass: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 25
          Width = 259
          Height = 26
          Hint = 'My Password'
          Align = alBottom
          PasswordChar = '*'
          TabOrder = 0
          OnKeyUp = txtAuthPassKeyUp
        end
      end
      object btnLogin: TJDFontButton
        AlignWithMargins = True
        Left = 22
        Top = 186
        Width = 225
        Height = 42
        Cursor = crHandPoint
        Hint = 'Login to TMDB'
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alBottom
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Image.AutoSize = False
        Image.Text = #61537
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
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = []
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 3
        Text = 'Login'
        OnClick = btnLoginClick
      end
    end
    object gbUserInfo: TGroupBox
      AlignWithMargins = True
      Left = 299
      Top = 4
      Width = 250
      Height = 231
      Align = alRight
      Caption = 'User Info'
      TabOrder = 1
      Visible = False
      object pUserDetail: TPanel
        AlignWithMargins = True
        Left = 143
        Top = 23
        Width = 102
        Height = 115
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object lblUserName: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 96
          Height = 18
          Align = alTop
          AutoSize = False
          Caption = 'Username'
          ExplicitLeft = 0
          ExplicitTop = 4
          ExplicitWidth = 164
        end
        object lblUserFullName: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 27
          Width = 96
          Height = 18
          Align = alTop
          AutoSize = False
          Caption = 'Full Name'
          ExplicitLeft = 0
          ExplicitWidth = 154
        end
      end
      object Panel5: TPanel
        AlignWithMargins = True
        Left = 5
        Top = 23
        Width = 132
        Height = 115
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object imgUserAvatar: TImage
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 126
          Height = 109
          Align = alClient
          ExplicitWidth = 113
          ExplicitHeight = 128
        end
      end
      object JDFontButton24: TJDFontButton
        AlignWithMargins = True
        Left = 22
        Top = 142
        Width = 206
        Height = 42
        Cursor = crHandPoint
        Hint = 'View My TMDB Account'
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alBottom
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Image.AutoSize = False
        Image.Text = #61447
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcBlue
        Overlay.Text = #57715
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = []
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 2
        Text = 'My Account'
      end
      object btnLogout: TJDFontButton
        AlignWithMargins = True
        Left = 22
        Top = 186
        Width = 206
        Height = 42
        Cursor = crHandPoint
        Hint = 'Log Out User'
        Margins.Left = 20
        Margins.Top = 1
        Margins.Right = 20
        Margins.Bottom = 1
        Align = alBottom
        DrawStyle = fdTransparent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Image.AutoSize = False
        Image.Text = #61582
        Image.Font.Charset = DEFAULT_CHARSET
        Image.Font.Color = clWindowText
        Image.Font.Height = -27
        Image.Font.Name = 'FontAwesome'
        Image.Font.Style = []
        Image.Font.Quality = fqAntialiased
        Image.StandardColor = fcRed
        Overlay.Text = #57715
        Overlay.Font.Charset = DEFAULT_CHARSET
        Overlay.Font.Color = clWindowText
        Overlay.Font.Height = -16
        Overlay.Font.Name = 'FontAwesome'
        Overlay.Font.Style = []
        Overlay.Font.Quality = fqAntialiased
        Overlay.StandardColor = fcRed
        Overlay.Position = foNone
        Overlay.Margin = 3
        Margin = 6
        Spacing = 10
        SubTextFont.Charset = DEFAULT_CHARSET
        SubTextFont.Color = clGray
        SubTextFont.Height = -11
        SubTextFont.Name = 'Tahoma'
        SubTextFont.Style = []
        TabOrder = 3
        Text = 'Logout'
        OnClick = btnLogoutClick
      end
    end
  end
  object tmrLoadDelay: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrLoadDelayTimer
    Left = 648
    Top = 184
  end
  object lstTopRatedMovies: TJDListController
    Container = sbTopRatedMovies
    Orientation = loHorizontal
    Left = 299
    Top = 200
  end
end
