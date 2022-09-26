object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Winget Helper'
  ClientHeight = 712
  ClientWidth = 1002
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlToolbar: TPanel
    Left = 0
    Top = 0
    Width = 1002
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlToolbar'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 1000
    object btnQuit: TBitBtn
      Left = 911
      Top = 0
      Width = 91
      Height = 41
      Align = alRight
      Caption = 'Quit'
      TabOrder = 0
      OnClick = btnQuitClick
      ExplicitLeft = 909
    end
    object btnSearch: TBitBtn
      Left = 150
      Top = 0
      Width = 75
      Height = 41
      Align = alLeft
      Caption = 'Search'
      TabOrder = 1
    end
    object btn1: TBitBtn
      Left = 225
      Top = 0
      Width = 75
      Height = 41
      Align = alLeft
      Caption = 'btn1'
      TabOrder = 2
    end
    object btnUpgrade: TBitBtn
      Left = 75
      Top = 0
      Width = 75
      Height = 41
      Align = alLeft
      Caption = 'Upgrade'
      TabOrder = 3
      OnClick = btnUpgradeClick
      ExplicitLeft = 69
      ExplicitTop = -6
    end
    object btnList: TBitBtn
      Left = 0
      Top = 0
      Width = 75
      Height = 41
      Align = alLeft
      Caption = 'List'
      TabOrder = 4
    end
    object AI1: TActivityIndicator
      Left = 306
      Top = 4
      IndicatorColor = aicWhite
      IndicatorType = aitRotatingSector
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 671
    Width = 1002
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlFooter'
    ShowCaption = False
    TabOrder = 1
    ExplicitTop = 667
    ExplicitWidth = 1000
  end
  object pnlMain: TPanel
    Left = 0
    Top = 41
    Width = 705
    Height = 630
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'pnlMain'
    ShowCaption = False
    TabOrder = 2
    ExplicitTop = 42
  end
  object pnl1: TPanel
    Left = 705
    Top = 41
    Width = 297
    Height = 630
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnl1'
    ShowCaption = False
    TabOrder = 3
    ExplicitLeft = 912
    ExplicitTop = 304
    ExplicitWidth = 185
    ExplicitHeight = 41
    object mmo1: TMemo
      Left = 0
      Top = 0
      Width = 297
      Height = 630
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 80
      ExplicitTop = 152
      ExplicitWidth = 185
      ExplicitHeight = 89
    end
  end
  object DosCommand1: TDosCommand
    CommandLine = 'winget upgrade'
    InputToOutput = False
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 0
    OnCharDecoding = DosCommand1CharDecoding
    OnExecuteError = DosCommand1ExecuteError
    OnNewLine = DosCommand1NewLine
    Left = 908
    Top = 84
  end
end
