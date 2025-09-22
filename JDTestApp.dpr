program JDTestApp;

{$WARN DUPLICATE_CTOR_DTOR OFF}

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles,
  uContentBase in 'uContentBase.pas' {frmContentBase},
  uContentPageBase in 'uContentPageBase.pas' {frmContentPageBase},
  uContentListBase in 'uContentListBase.pas' {frmContentBase1},
  uTMDBCommonFormBase in 'Common Forms\uTMDBCommonFormBase.pas' {frmTMDBCommonFormBase},
  uCommonImages in 'Common Forms\uCommonImages.pas' {frmCommonImages},
  uCommonCredits in 'Common Forms\uCommonCredits.pas' {frmCommonCredits},
  uCommonReviews in 'Common Forms\uCommonReviews.pas' {frmCommonReviews},
  JD.TabController in 'JD.TabController.pas',
  uMainMenu in 'uMainMenu.pas' {frmMainMenu},
  uAppSetup in 'uAppSetup.pas' {frmAppSetup},
  uContentBrowser in 'uContentBrowser.pas' {frmContentBrowser},
  uCommonDblCheckList in 'Common Forms\uCommonDblCheckList.pas' {frmCommonDblCheckList: TFrame},
  uCommonPersonCredits in 'Common Forms\uCommonPersonCredits.pas' {frmCommonPersonCredits},
  uCommonListItem in 'Common Forms\uCommonListItem.pas' {frmCommonListItem: TFrame},
  uCommonMovieListItem in 'Common Forms\uCommonMovieListItem.pas' {frmCommonMovieListItem: TFrame},
  uContentCertsMovies in 'TMDB\Certifications\uContentCertsMovies.pas' {frmContentCertsMovies},
  uContentCertsTV in 'TMDB\Certifications\uContentCertsTV.pas' {frmContentCertsTV},
  uContentChangesMovies in 'TMDB\Changes\uContentChangesMovies.pas' {frmContentChangesMovies},
  uContentConfigCountries in 'TMDB\Configuration\uContentConfigCountries.pas' {frmContentConfigCountries},
  uContentConfigJobs in 'TMDB\Configuration\uContentConfigJobs.pas' {frmContentConfigJobs},
  uContentConfigLanguages in 'TMDB\Configuration\uContentConfigLanguages.pas' {frmContentConfigLanguages},
  uContentConfigTimezones in 'TMDB\Configuration\uContentConfigTimezones.pas' {frmContentConfigTimezones},
  uContentDiscoverMovies in 'TMDB\Discover\uContentDiscoverMovies.pas',
  uContentMovieDetail in 'TMDB\Movies\uContentMovieDetail.pas' {frmContentMovieDetail},
  uContentMoviePage in 'TMDB\Movies\uContentMoviePage.pas' {frmContentMoviePage},
  uContentGenresMovie in 'TMDB\Genres\uContentGenresMovie.pas' {frmContentGenresMovie},
  uContentGenresTV in 'TMDB\Genres\uContentGenresTV.pas' {frmContentGenresTV},
  uContentPersonDetail in 'TMDB\People\uContentPersonDetail.pas' {frmContentPersonDetail},
  uContentSearchCollections in 'TMDB\Search\uContentSearchCollections.pas' {frmContentSearchCollections},
  uContentSearchCompanies in 'TMDB\Search\uContentSearchCompanies.pas' {frmContentSearchCompanies},
  uContentSearchKeywords in 'TMDB\Search\uContentSearchKeywords.pas' {frmContentSearchKeywords},
  uContentSearchMovies in 'TMDB\Search\uContentSearchMovies.pas' {frmContentSearchMovies},
  uContentSearchMulti in 'TMDB\Search\uContentSearchMulti.pas' {frmContentSearchMulti},
  uContentSearchPeople in 'TMDB\Search\uContentSearchPeople.pas' {frmContentSearchPeople},
  uContentSearchTV in 'TMDB\Search\uContentSearchTV.pas' {frmContentSearchTV},
  uContentTVPage in 'TMDB\TVSeries\uContentTVPage.pas' {frmContentTVPage},
  uContentTVSerieDetail in 'TMDB\TVSeries\uContentTVSerieDetail.pas' {frmContentTVSerieDetail},
  uTMDB in 'TMDB\uTMDB.pas' {dmTMDB: TDataModule},
  uCommonVideos in 'Common Forms\uCommonVideos.pas' {frmCommonVideos},
  uCommonAlternativeTitles in 'Common Forms\uCommonAlternativeTitles.pas' {frmCommonAlternativeTitles},
  uCommonChanges in 'Common Forms\uCommonChanges.pas' {frmContentChanges},
  uTMDBSetup in 'TMDB\uTMDBSetup.pas' {frmTMDBSetup},
  uCommonCollapsePanel in 'Common Forms\uCommonCollapsePanel.pas' {frmCommonCollapsePanel: TFrame},
  uTMDBHome in 'TMDB\uTMDBHome.pas' {frmTMDBHome},
  uTMDBContentBase in 'TMDB\uTMDBContentBase.pas' {frmTMDBContentBase},
  uTMDBLoginBrowser in 'TMDB\uTMDBLoginBrowser.pas' {frmTMDBLoginBrowser};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'SPACEBALLS: The Web Browser';
  Application.CreateForm(TdmTMDB, dmTMDB);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
