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
    ExplicitWidth = 1072
    DesignSize = (
      1074
      41)
    object AI1: TActivityIndicator
      Left = 338
      Top = 4
      Anchors = [akLeft, akRight]
      IndicatorColor = aicWhite
      IndicatorType = aitRotatingSector
    end
    object btn1: TButton
      Left = 712
      Top = 0
      Width = 75
      Height = 25
      Caption = 'btn1'
      TabOrder = 1
      OnClick = btn1Click
    end
    object ygBtnSearch: tYGTwinButton
      Left = 5
      Top = 2
      Width = 109
      Height = 37
      Caption = 'Search'
      KeyCaption = 'F1'
      Pen.Color = clBlack
      Pen.Width = 2
      Colors.EnterStart = 2434341
      Colors.LeaveStart = 8487297
      Colors.DownStart = clBlack
      Colors.EnterEnd = 8487297
      Colors.LeaveEnd = 2434341
      Colors.DownEnd = clWhite
      TextColors.EnterStart = clWhite
      TextColors.LeaveStart = clWhite
      TextColors.DownStart = clBlack
      TextColors.EnterEnd = clBlack
      TextColors.LeaveEnd = clBlack
      TextColors.DownEnd = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Light'
      Font.Style = []
      State = bsLeave
      onClick = ygBtnSearchClick
      Align = alLeft
    end
    object ygBtnQuit: tYGTwinButton
      Left = 960
      Top = 2
      Width = 109
      Height = 37
      Caption = 'Quit'
      KeyCaption = 'Esc'
      Pen.Color = clBlack
      Pen.Width = 2
      Colors.EnterStart = 2434341
      Colors.LeaveStart = 8487297
      Colors.DownStart = clBlack
      Colors.EnterEnd = 8487297
      Colors.LeaveEnd = 2434341
      Colors.DownEnd = clWhite
      TextColors.EnterStart = clWhite
      TextColors.LeaveStart = clWhite
      TextColors.DownStart = clBlack
      TextColors.EnterEnd = clBlack
      TextColors.LeaveEnd = clBlack
      TextColors.DownEnd = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Light'
      Font.Style = []
      State = bsLeave
      onClick = ygBtnQuitClick
      Align = alRight
      ExplicitLeft = 958
    end
    object ygBtnList: tYGTwinButton
      Left = 114
      Top = 2
      Width = 109
      Height = 37
      Caption = 'List'
      KeyCaption = 'F2'
      Pen.Color = clBlack
      Pen.Width = 2
      Colors.EnterStart = 2434341
      Colors.LeaveStart = 8487297
      Colors.DownStart = clBlack
      Colors.EnterEnd = 8487297
      Colors.LeaveEnd = 2434341
      Colors.DownEnd = clWhite
      TextColors.EnterStart = clWhite
      TextColors.LeaveStart = clWhite
      TextColors.DownStart = clBlack
      TextColors.EnterEnd = clBlack
      TextColors.LeaveEnd = clBlack
      TextColors.DownEnd = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Light'
      Font.Style = []
      State = bsLeave
      onClick = ygBtnListClick
      Align = alLeft
    end
    object ygBtnUpgrade: tYGTwinButton
      Left = 223
      Top = 2
      Width = 109
      Height = 37
      Caption = 'Upgrade'
      KeyCaption = 'F3'
      Pen.Color = clBlack
      Pen.Width = 2
      Colors.EnterStart = 2434341
      Colors.LeaveStart = 8487297
      Colors.DownStart = clBlack
      Colors.EnterEnd = 8487297
      Colors.LeaveEnd = 2434341
      Colors.DownEnd = clWhite
      TextColors.EnterStart = clWhite
      TextColors.LeaveStart = clWhite
      TextColors.DownStart = clBlack
      TextColors.EnterEnd = clBlack
      TextColors.LeaveEnd = clBlack
      TextColors.DownEnd = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Light'
      Font.Style = []
      State = bsLeave
      onClick = ygBtnUpgradeClick
      Align = alLeft
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
    ExplicitTop = 667
    ExplicitWidth = 1072
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
    ExplicitWidth = 1072
    ExplicitHeight = 626
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
