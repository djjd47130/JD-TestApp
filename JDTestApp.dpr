program JDTestApp;

{$WARN DUPLICATE_CTOR_DTOR OFF}

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles,
  uContentBase in 'uContentBase.pas' {frmContentBase},
  uContentPageBase in 'uContentPageBase.pas' {frmContentPageBase},
  uContentListBase in 'uContentListBase.pas' {frmContentListBase},
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
  uTMDBListItem in 'Common Forms\uTMDBListItem.pas' {frmTMDBListItem: TFrame},
  uTMDBMovieListItem in 'Common Forms\uTMDBMovieListItem.pas' {frmTMDBMovieListItem: TFrame},
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
  uTMDBLoginBrowser in 'TMDB\uTMDBLoginBrowser.pas' {frmTMDBLoginBrowser},
  uContentClock in 'General\uContentClock.pas' {frmContentClock},
  uContentFileBrowser in 'System\uContentFileBrowser.pas' {frmContentFileBrowser},
  uListItemBase in 'Common Forms\uListItemBase.pas' {ListItemBase: TFrame},
  uSwitchListItem in 'Common Forms\uSwitchListItem.pas' {ListSwitchItem: TFrame},
  uComboListItem in 'Common Forms\uComboListItem.pas' {ComboListItem: TFrame},
  uTMDBVertMovieListItem in 'TMDB\Movies\uTMDBVertMovieListItem.pas' {frmTMDBVertMovieListItem: TFrame},
  uTMDBSearch in 'TMDB\Search\uTMDBSearch.pas' {frmTMDBSearch},
  uTMDBSearchListItem in 'TMDB\Search\uTMDBSearchListItem.pas' {frmTMDBSearchListItem: TFrame},
  uJDSysMonGaugesTest in 'JDSysMon\uJDSysMonGaugesTest.pas' {frmJDSSysMonGaugesTest},
  uTMDBContentCollectionDetail in 'TMDB\Collections\uTMDBContentCollectionDetail.pas' {frmTMDBContentCollectionDetail},
  JD.ListController in 'JD.ListController.pas',
  JD.Plugins.Intf in 'Plugins\JD.Plugins.Intf.pas',
  JD.PluginManager in 'JD.PluginManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'JD Testing Grounds';
  Application.CreateForm(TdmTMDB, dmTMDB);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmTMDBContentCollectionDetail, frmTMDBContentCollectionDetail);
  Application.Run;
end.
