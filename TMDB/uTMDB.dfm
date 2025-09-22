object dmTMDB: TdmTMDB
  OldCreateOrder = False
  Height = 256
  Width = 378
  object TMDB: TTMDB
    AuthMethod = amAccessToken
    AppUserAgent = 
      'JD TMDB API Wrapper for Delphi (https://github.com/djjd47130/JD-' +
      'TMDB)'
    RateLimiting = True
    RateLimitMsec = 100
    AgreedToWatchProviderAttribution = True
    OnUserAuthRequest = TMDBUserAuthRequest
    Left = 66
    Top = 31
  end
end
