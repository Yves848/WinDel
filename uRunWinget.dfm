object fRunWinget: TfRunWinget
  Left = 0
  Top = 0
  Caption = 'fRunWinget'
  ClientHeight = 254
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pb1: TProgressBar
    Left = 0
    Top = 237
    Width = 697
    Height = 17
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 208
    ExplicitTop = 232
    ExplicitWidth = 150
  end
  object pnltop: TPanel
    Left = 0
    Top = 0
    Width = 697
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnltop'
    ShowCaption = False
    TabOrder = 1
    ExplicitLeft = 216
    ExplicitTop = 64
    ExplicitWidth = 185
    object AI1: TActivityIndicator
      Left = 665
      Top = 3
      IndicatorColor = aicWhite
      IndicatorType = aitSectorRing
    end
  end
  object mmo1: TMemo
    Left = 0
    Top = 41
    Width = 697
    Height = 196
    Align = alClient
    Color = clGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    StyleElements = [seClient, seBorder]
  end
  object dcRun: TDosCommand
    InputToOutput = False
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 0
    OnCharDecoding = dcRunCharDecoding
    Left = 496
    Top = 104
  end
end
