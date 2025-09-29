inherited frmContentClock: TfrmContentClock
  Caption = 'Clock'
  ClientHeight = 480
  ClientWidth = 817
  DoubleBuffered = True
  ExplicitWidth = 833
  ExplicitHeight = 519
  PixelsPerInch = 96
  TextHeight = 18
  object RzClockStatus1: TRzClockStatus
    Left = 0
    Top = 168
    Width = 817
    Height = 89
    FrameStyle = fsNone
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -85
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
    Format = 'h:nn:ss am/pm'
    Alignment = taCenter
  end
end
