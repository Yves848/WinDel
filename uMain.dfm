object fMain: TfMain
  Left = 0
  Top = 0
  AlphaBlend = True
  ClientHeight = 710
  ClientWidth = 1066
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object pnlToolbar: TsPanel
    Left = 0
    Top = 0
    Width = 1066
    Height = 54
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlToolbar'
    Padding.Left = 5
    Padding.Top = 2
    Padding.Right = 5
    Padding.Bottom = 2
    ShowCaption = False
    TabOrder = 0
    Visible = False
    ExplicitWidth = 1062
    object sSpeedButton1: TsSpeedButton
      Left = 285
      Top = 2
      Width = 140
      Height = 50
      Align = alLeft
      Caption = 'List Packages'#13#10'(F2)'
      ImageIndex = 1
      Spacing = 15
      OnClick = sSpeedButton1Click
      Reflected = True
      ExplicitLeft = 145
      ExplicitTop = -2
    end
    object sSpeedButton2: TsSpeedButton
      Left = 145
      Top = 2
      Width = 140
      Height = 50
      Align = alLeft
      Caption = 'Search Package'#13#10'(F1)'
      ImageIndex = 0
      Spacing = 15
      OnClick = sSpeedButton2Click
      ButtonStyle = tbsTextButton
      Reflected = True
      ExplicitLeft = 5
      ExplicitTop = -2
    end
    object sbQuit: TsSpeedButton
      Left = 921
      Top = 2
      Width = 140
      Height = 50
      Align = alRight
      Caption = 'Quit'#13#10'(Esc)'
      ImageIndex = 2
      Spacing = 15
      OnClick = sbQuitClick
      Reflected = True
      ExplicitLeft = 936
    end
    object sbConfig: TsSpeedButton
      Left = 781
      Top = 2
      Width = 140
      Height = 50
      Align = alRight
      Caption = 'Config'#13#10'(Ctrl+,)'
      ImageIndex = 3
      Spacing = 15
      OnClick = sbConfigClick
      Reflected = True
      ExplicitLeft = 936
    end
    object sbUpgrade: TsSpeedButton
      Left = 425
      Top = 2
      Width = 140
      Height = 50
      Align = alLeft
      Caption = 'Update Packages'#13#10'(F3)'
      ImageIndex = 4
      Spacing = 15
      Visible = False
      OnClick = sbUpgradeClick
      Reflected = True
      ExplicitLeft = 377
      ExplicitTop = -2
    end
    object sSpeedButton3: TsSpeedButton
      Left = 565
      Top = 2
      Width = 112
      Height = 50
      Align = alLeft
      Caption = 'Test'
      ExplicitLeft = 431
      ExplicitTop = -2
    end
    object Button1: TButton
      Left = 5
      Top = 2
      Width = 140
      Height = 50
      Align = alLeft
      Caption = 'DashBoard'#13#10'(F1)'
      TabOrder = 0
      Visible = False
      OnClick = Button1Click
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 669
    Width = 1066
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlFooter'
    ShowCaption = False
    TabOrder = 1
    ExplicitTop = 668
    ExplicitWidth = 1062
    DesignSize = (
      1066
      41)
    object lblWingetVersion: TsLabelFX
      Left = 1060
      Top = 0
      Width = 6
      Height = 41
      Align = alRight
      Alignment = taCenter
      ParentFont = False
      Layout = tlCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      Angle = 0
      Shadow.OffsetKeeper.LeftTop = 0
      Shadow.OffsetKeeper.RightBottom = 2
      ExplicitHeight = 23
    end
    object lblScoopVersion: TsLabelFX
      Left = 1054
      Top = 0
      Width = 6
      Height = 41
      Margins.Right = 15
      Align = alRight
      Alignment = taCenter
      ParentFont = False
      Layout = tlCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      Angle = 0
      Shadow.OffsetKeeper.LeftTop = 0
      Shadow.OffsetKeeper.RightBottom = 2
      ExplicitHeight = 23
    end
    object AI1: TActivityIndicator
      Left = 5
      Top = 6
      Anchors = [akLeft, akRight]
      IndicatorColor = aicWhite
      IndicatorType = aitRotatingSector
    end
  end
  object pnlMain: TsPanel
    Left = 0
    Top = 54
    Width = 1066
    Height = 615
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlMain'
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    ShowCaption = False
    TabOrder = 2
    ExplicitWidth = 1062
    ExplicitHeight = 614
  end
  object DosCommand1: TDosCommand
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
      ImageIndex = 0
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
      ShortCut = 32795
      OnExecute = actQuitExecute
    end
    object actConfig: TAction
      Caption = 'actConfig'
      SecondaryShortCuts.Strings = (
        'Ctrl+,')
      OnExecute = actConfigExecute
    end
  end
  object pmTray: TPopupMenu
    Left = 448
    Top = 454
    object W1: TMenuItem
      Caption = 'Winget Helper'
      OnClick = W1Click
    end
    object WingetHelper1: TMenuItem
      Caption = '-'
    end
    object S1: TMenuItem
      Caption = 'Search Packages'
      OnClick = S1Click
    end
    object SearchPackages1: TMenuItem
      Caption = 'List Installed Packages'
      OnClick = SearchPackages1Click
    end
    object pmUpdatables: TMenuItem
      Caption = 'Updatables Packages'
      OnClick = pmUpdatablesClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = 'Quit'
      OnClick = N2Click
    end
  end
  object dcupgradeSearch: TDosCommand
    InputToOutput = False
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 0
    OnCharDecoding = DosCommand1CharDecoding
    OnNewLine = dcupgradeSearchNewLine
    Left = 912
    Top = 158
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 448
    Top = 384
  end
  object TrayIcon1: TTrayIcon
    Animate = True
    PopupMenu = pmTray
    Visible = True
    Left = 352
    Top = 454
  end
  object NotificationCenter1: TNotificationCenter
    Left = 352
    Top = 382
  end
  object sTitleBar1: TsTitleBar
    Items = <
      item
        Caption = 'Winget GUI'
        DropdownMenu = pmTray
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -12
        FontData.Font.Name = 'Segoe UI'
        FontData.Font.Style = []
        Index = 0
        Name = 'TacTitleBarItem'
      end
      item
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -12
        FontData.Font.Name = 'Segoe UI'
        FontData.Font.Style = []
        Spacing = 10
        Index = 1
        Name = 'TacTitleBarItem'
        Style = bsSpacing
      end
      item
        Caption = 'Sources'
        DropdownMenu = popupSources
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -12
        FontData.Font.Name = 'Segoe UI'
        FontData.Font.Style = []
        Index = 2
        Name = 'TacTitleBarItem'
        Style = bsMenu
      end>
    ShowCaption = True
    Left = 632
    Top = 558
  end
  object sSkinManager1: TsSkinManager
    ButtonsOptions.OldGlyphsMode = False
    InternalSkins = <>
    MenuSupport.Font.Charset = DEFAULT_CHARSET
    MenuSupport.Font.Color = clWindowText
    MenuSupport.Font.Height = -11
    MenuSupport.Font.Name = 'Segoe UI'
    MenuSupport.Font.Style = []
    SkinDirectory = 'C:\skins\Skins'
    SkinName = 'Windows 11 dark'
    SkinInfo = '16.13'
    ThirdParty.ThirdEdits = ' '
    ThirdParty.ThirdButtons = 'TButton'
    ThirdParty.ThirdBitBtns = ' '
    ThirdParty.ThirdCheckBoxes = ' '
    ThirdParty.ThirdGroupBoxes = ' '
    ThirdParty.ThirdListViews = ' '
    ThirdParty.ThirdPanels = ' '
    ThirdParty.ThirdGrids = ' '
    ThirdParty.ThirdTreeViews = ' '
    ThirdParty.ThirdComboBoxes = ' '
    ThirdParty.ThirdWWEdits = ' '
    ThirdParty.ThirdVirtualTrees = ' '
    ThirdParty.ThirdGridEh = ' '
    ThirdParty.ThirdPageControl = ' '
    ThirdParty.ThirdTabControl = ' '
    ThirdParty.ThirdToolBar = ' '
    ThirdParty.ThirdStatusBar = ' '
    ThirdParty.ThirdSpeedButton = ' '
    ThirdParty.ThirdScrollControl = ' '
    ThirdParty.ThirdUpDown = ' '
    ThirdParty.ThirdScrollBar = ' '
    ThirdParty.ThirdStaticText = ' '
    ThirdParty.ThirdNativePaint = ' '
    Left = 768
    Top = 430
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -12
    AddedTitle.Font.Name = 'Segoe UI'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleBar = sTitleBar1
    TitleButtons = <>
    Left = 984
    Top = 398
  end
  object popupSources: TPopupMenu
    Left = 248
    Top = 550
    object W2: TMenuItem
      Caption = 'winget'
    end
    object winget1: TMenuItem
      Caption = 'all'
    end
  end
end
