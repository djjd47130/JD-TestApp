object frmAppController: TfrmAppController
  Left = 0
  Top = 0
  Caption = 'App Controller'
  ClientHeight = 386
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
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
  object pmTray: TPopupMenu
    Left = 296
    Top = 264
    object mShow: TMenuItem
      Caption = 'Show'
      OnClick = mShowClick
    end
    object mNewWindow: TMenuItem
      Caption = 'New Window'
      OnClick = mNewWindowClick
    end
    object mExit: TMenuItem
      Caption = 'Exit'
      OnClick = mExitClick
    end
  end
  object TrayIcon1: TTrayIcon
    Hint = 'SPACEBALLS: The Tray Icon'
    PopupMenu = pmTray
    Visible = True
    OnDblClick = mShowClick
    Left = 232
    Top = 264
  end
end
