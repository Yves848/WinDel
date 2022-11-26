object fMain: TfMain
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 235
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object pnlToolbar: TsPanel
    Left = 0
    Top = 0
    Width = 1074
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
    ExplicitWidth = 1070
    object sSpeedButton1: TsSpeedButton
      Left = 145
      Top = 2
      Width = 140
      Height = 50
      Align = alLeft
      Caption = 'List Packages'#13#10'(F2)'
      ImageIndex = 1
      Images = sCharImageList1
      Spacing = 15
      OnClick = sSpeedButton1Click
      Reflected = True
    end
    object sSpeedButton2: TsSpeedButton
      Left = 5
      Top = 2
      Width = 140
      Height = 50
      Align = alLeft
      Caption = 'Search Package'#13#10'(F1)'
      ImageIndex = 0
      Images = sCharImageList1
      Spacing = 15
      OnClick = sSpeedButton2Click
      ButtonStyle = tbsTextButton
      Reflected = True
    end
    object sSpeedButton3: TsSpeedButton
      Left = 929
      Top = 2
      Width = 140
      Height = 50
      Align = alRight
      Caption = 'Quit'#13#10'(Esc)'
      ImageIndex = 2
      Images = sCharImageList1
      Spacing = 15
      OnClick = sSpeedButton3Click
      Reflected = True
      ExplicitLeft = 936
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
    DesignSize = (
      1074
      41)
    object lblWingetVersion: TsLabelFX
      Left = 1068
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
    Width = 1074
    Height = 617
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlMain'
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    ShowCaption = False
    TabOrder = 2
    ExplicitWidth = 1070
    ExplicitHeight = 616
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
  end
  object sSkinManager1: TsSkinManager
    AnimEffects.BlendOnMoving.Active = True
    ButtonsOptions.OldGlyphsMode = True
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
    Left = 784
    Top = 409
  end
  object sSkinProvider1: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -12
    AddedTitle.Font.Name = 'Segoe UI'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 744
    Top = 513
  end
  object sCharImageList1: TsCharImageList
    EmbeddedFonts = <
      item
        FontName = 'FontAwesome'
        FontData = {}
      end>
    Items = <
      item
        AddedSize = 60
        Char = 61442
        Color = -5344256
        AddedColor = -6381825
      end
      item
        Char = 61451
        Color = -16740864
      end
      item
        Char = 61457
        Color = clRed
        SecondColor = clYellow
      end>
    Left = 880
    Top = 481
    Bitmap = {}
  end
end
