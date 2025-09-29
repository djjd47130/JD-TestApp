inherited frmTMDBSearchListItem: TfrmTMDBSearchListItem
  Height = 84
  ExplicitHeight = 84
  inherited Bevel1: TBevel
    Top = 82
    ExplicitTop = 82
  end
  inherited pDetail: TPanel
    Left = 128
    Top = 2
    Width = 397
    Height = 78
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ExplicitLeft = 128
    ExplicitTop = 2
    ExplicitWidth = 397
    ExplicitHeight = 78
    inherited lblCaption: TLabel
      Top = 0
      Width = 391
      Height = 19
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Layout = tlTop
      ExplicitTop = 0
    end
    object pData: TPanel
      Left = 0
      Top = 19
      Width = 397
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblData2: TLabel
        AlignWithMargins = True
        Left = 351
        Top = 3
        Width = 43
        Height = 19
        Hint = 'Item ID'
        Align = alRight
        Caption = 'Data 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ShowAccelChar = False
        Layout = tlCenter
        StyleElements = [seClient, seBorder]
        ExplicitHeight = 16
      end
      object lblData1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 43
        Height = 19
        Hint = 'Item ID'
        Align = alLeft
        Caption = 'Data 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ShowAccelChar = False
        Layout = tlCenter
        StyleElements = [seClient, seBorder]
        ExplicitHeight = 16
      end
    end
  end
  inherited pImage: TPanel
    Width = 86
    Height = 76
    Visible = True
    ExplicitWidth = 86
    ExplicitHeight = 76
    inherited imgPicture: TImage
      Width = 46
      Height = 70
      Cursor = crHandPoint
      ExplicitWidth = 46
      ExplicitHeight = 55
    end
  end
  inherited btnDetail: TJDFontButton
    Height = 76
    Visible = True
    ExplicitHeight = 76
  end
end
