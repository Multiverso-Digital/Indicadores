object FormGrid: TFormGrid
  Left = 274
  Top = 172
  Width = 866
  Height = 570
  Caption = 'FormGrid'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object SVODataGrid1: TSVODataGrid
    Left = 0
    Top = 0
    Width = 858
    Height = 543
    Cursor = -26
    Align = alClient
    ColCount = 2
    Ctl3D = True
    DefaultRowHeight = 17
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowMoving, goColMoving, goThumbTracking]
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    AutoSizeColumns = True
    DefaultStrFieldSize = 0
    HeaderFormat = [cfCenterTitles, cfRightJustNumber]
    EditReturnDown = False
    Flat = False
    FixedColDisplay = fdFromFile
    FixedRowDisplay = fdNone
    DecimalDigits = 2
    FloatPrecision = 15
    LeftCol = 1
  end
  object PopupMenu1: TPopupMenu
    Left = 108
    Top = 90
    object BlinkShape1: TMenuItem
      Caption = 'Blink Shape'
      OnClick = BlinkShape1Click
    end
    object HighlightShape1: TMenuItem
      Caption = 'Highlight Shape'
      OnClick = HighlightShape1Click
    end
    object UnhighlightShape1: TMenuItem
      Caption = 'Unhighlight Shape'
      OnClick = UnhighlightShape1Click
    end
    object ZoomToSelection1: TMenuItem
      Caption = 'Zoom To Selection'
      OnClick = ZoomToSelection1Click
    end
  end
end
