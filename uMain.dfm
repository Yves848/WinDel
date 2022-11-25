object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'Winget Helper'
  ClientHeight = 712
  ClientWidth = 1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object pnlToolbar: TPanel
    Left = 0
    Top = 0
    Width = 1074
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlToolbar'
    Padding.Left = 5
    Padding.Top = 2
    Padding.Right = 5
    Padding.Bottom = 2
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      1074
      41)
    object AI1: TActivityIndicator
      Left = 412
      Top = 4
      Anchors = [akLeft, akRight]
      IndicatorColor = aicWhite
      IndicatorType = aitRotatingSector
    end
    object btn1: TButton
      Left = 680
      Top = 10
      Width = 75
      Height = 25
      Caption = 'btn1'
      TabOrder = 1
      OnClick = btn1Click
    end
    object pnlF1: TPanel
      Left = 5
      Top = 2
      Width = 41
      Height = 37
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'F1  :'
      TabOrder = 2
    end
    object btnSearch: TButton
      Left = 46
      Top = 2
      Width = 91
      Height = 37
      Align = alLeft
      Caption = 'Search'
      TabOrder = 3
      OnClick = btnSearchClick
    end
    object pnlf2: TPanel
      Left = 137
      Top = 2
      Width = 41
      Height = 37
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'F2  :'
      TabOrder = 4
    end
    object btnList: TButton
      Left = 178
      Top = 2
      Width = 91
      Height = 37
      Align = alLeft
      Caption = 'List'
      TabOrder = 5
      OnClick = btnListClick
    end
    object pnlF3: TPanel
      Left = 269
      Top = 2
      Width = 41
      Height = 37
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'F3  :'
      TabOrder = 6
    end
    object btnUpgrade: TButton
      Left = 310
      Top = 2
      Width = 91
      Height = 37
      Align = alLeft
      Caption = 'Upgrade'
      TabOrder = 7
      OnClick = btnUpgradeClick
    end
    object btnQuit: TButton
      Left = 978
      Top = 2
      Width = 91
      Height = 37
      Align = alRight
      Caption = 'Quit'
      TabOrder = 8
      OnClick = btnQuitClick
      ExplicitLeft = 974
    end
    object pnlEsc: TPanel
      Left = 937
      Top = 2
      Width = 41
      Height = 37
      Align = alRight
      BevelOuter = bvNone
      Caption = 'Esc  :'
      TabOrder = 9
      ExplicitLeft = 933
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 671
    Width = 1074
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlFooter'
    ShowCaption = False
    TabOrder = 1
    ExplicitTop = 670
    ExplicitWidth = 1070
    object lblWingetVersion: TLabel
      Left = 1070
      Top = 0
      Width = 4
      Height = 41
      Align = alRight
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 21
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 41
    Width = 1074
    Height = 630
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlMain'
    ShowCaption = False
    TabOrder = 2
    ExplicitWidth = 1070
    ExplicitHeight = 629
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
  object actlst1: TActionList
    Left = 752
    Top = 313
    object actSearch: TAction
      Caption = 'actSearch'
      ShortCut = 112
      OnExecute = actSearchExecute
    end
    object actList: TAction
      Caption = 'actList'
      ShortCut = 113
      OnExecute = actListExecute
    end
    object actUpgrade: TAction
      Caption = 'actUpgrade'
      ShortCut = 114
      OnExecute = actUpgradeExecute
    end
    object actQuit: TAction
      Caption = 'actQuit'
      OnExecute = actQuitExecute
    end
  end
end
