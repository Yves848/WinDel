object fMain: TfMain
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
  KeyPreview = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
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
      Caption = 'Esc : Quit'
      TabOrder = 0
      OnClick = btnQuitClick
      ExplicitLeft = 909
    end
    object btnSearch: TBitBtn
      Left = 0
      Top = 0
      Width = 100
      Height = 41
      Align = alLeft
      Caption = 'Search'
      ImageIndex = 0
      Images = il1
      TabOrder = 1
      OnClick = btnSearchClick
    end
    object btnUpgrade: TBitBtn
      Left = 200
      Top = 0
      Width = 100
      Height = 41
      Align = alLeft
      Caption = 'F3 : Upgrade'
      TabOrder = 3
      OnClick = btnUpgradeClick
    end
    object btnList: TBitBtn
      Left = 100
      Top = 0
      Width = 100
      Height = 41
      Align = alLeft
      Caption = 'F2 : List'
      TabOrder = 2
      OnClick = btnListClick
    end
    object AI1: TActivityIndicator
      Left = 306
      Top = 4
      IndicatorColor = aicWhite
      IndicatorType = aitRotatingSector
    end
    object btn1: TButton
      Left = 400
      Top = 16
      Width = 75
      Height = 25
      Caption = 'btn1'
      TabOrder = 5
      OnClick = btn1Click
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
    Width = 1002
    Height = 630
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlMain'
    ShowCaption = False
    TabOrder = 2
    ExplicitTop = 42
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
  object il1: TImageList
    Height = 24
    Width = 24
    Left = 496
    Top = 360
  end
end
