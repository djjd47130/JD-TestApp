inherited ListSwitchItem: TListSwitchItem
  inherited pData: TPanel
    Width = 362
    ExplicitWidth = 362
    inherited lblCaption: TLabel
      Height = 41
      Hint = ''
    end
  end
  inherited pImage: TPanel
    Left = 3
    Hint = ''
    ExplicitLeft = 3
    inherited imgPicture: TImage
      Hint = ''
    end
  end
  inherited btnLeft: TJDFontButton
    Left = 71
    Hint = ''
    ExplicitLeft = 71
  end
  inherited btnRight: TJDFontButton
    Left = 647
    Hint = 'Configure Plugin'
    TabOrder = 4
    ExplicitLeft = 647
  end
  object ToggleSwitch2: TToggleSwitch
    AlignWithMargins = True
    Left = 703
    Top = 15
    Width = 70
    Height = 23
    Cursor = crHandPoint
    Hint = 'Toggle Plugin On or Off'
    Margins.Top = 15
    Margins.Right = 15
    Margins.Bottom = 15
    Align = alRight
    Alignment = taLeftJustify
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    FrameColor = clSilver
    ParentFont = False
    ShowStateCaption = False
    State = tssOn
    StateCaptions.CaptionOn = ' '
    StateCaptions.CaptionOff = ' '
    StyleElements = []
    SwitchWidth = 70
    TabOrder = 3
    TabStop = False
    ThumbColor = clSkyBlue
    ThumbWidth = 25
    ExplicitHeight = 20
  end
end
