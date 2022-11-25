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
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnltop: TPanel
    Left = 0
    Top = 0
    Width = 697
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnltop'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 693
    object AI1: TActivityIndicator
      Left = 665
      Top = 3
      IndicatorColor = aicWhite
      IndicatorType = aitSectorRing
    end
  end
  object mmo1: TsMemo
    Left = 0
    Top = 41
    Width = 697
    Height = 213
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 144
    ExplicitTop = 144
    ExplicitWidth = 185
    ExplicitHeight = 89
  end
  object dcRun: TDosCommand
    InputToOutput = False
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 0
    OnCharDecoding = dcRunCharDecoding
    OnNewLine = dcRunNewLine
    OnTerminated = dcRunTerminated
    Left = 496
    Top = 104
  end
end
