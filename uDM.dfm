object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 442
  Width = 574
  object imgFavicons16: TImageList
    Left = 96
    Top = 168
  end
  object Favicons: TJDFavicons
    ImageLists = <
      item
        ImageList = imgFavicons16
      end>
    Mode = fmGoogle
    OnLookupFavicon = FaviconsLookupFavicon
    Left = 96
    Top = 120
  end
  object AppEvents: TApplicationEvents
    Left = 96
    Top = 72
  end
end
