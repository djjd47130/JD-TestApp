inherited frmContentFileBrowser: TfrmContentFileBrowser
  Caption = 'File Browser'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Splitter1: TSplitter
    Left = 263
    Top = 41
    Height = 432
    ExplicitLeft = 266
    ExplicitTop = 47
  end
  object VirtualStringTree1: TVirtualStringTree
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 257
    Height = 426
    Align = alLeft
    BorderStyle = bsNone
    DefaultNodeHeight = 22
    Header.AutoSizeIndex = 0
    Header.Height = 18
    Header.MainColumn = -1
    TabOrder = 0
    Touch.InteractiveGestures = [igPan, igPressAndTap]
    Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
    Columns = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 41
    Align = alTop
    BevelEdges = [beBottom]
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 1
  end
  object pMain: TPanel
    Left = 266
    Top = 41
    Width = 377
    Height = 432
    Align = alLeft
    BevelEdges = [beLeft]
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 47
  end
end
