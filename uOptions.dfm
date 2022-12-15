object frmOptions: TfrmOptions
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 235
  BorderStyle = bsSingle
  Caption = 'Options'
  ClientHeight = 424
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Enabled = True
  GlassFrame.SheetOfGlass = True
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object sPanel1: TsPanel
    Left = 0
    Top = 383
    Width = 618
    Height = 41
    Align = alBottom
    Caption = 'sPanel1'
    ShowCaption = False
    TabOrder = 0
    ExplicitTop = 382
    ExplicitWidth = 614
    object btnClose: TsBitBtn
      Left = 504
      Top = 1
      Width = 113
      Height = 39
      Align = alRight
      Caption = 'Close'
      ImageIndex = 0
      Images = sCharImageList1
      TabOrder = 0
      OnClick = btnCloseClick
      ExplicitLeft = 500
    end
  end
  object sTabControl1: TsTabControl
    Left = 0
    Top = 0
    Width = 618
    Height = 383
    Align = alClient
    TabOrder = 1
    Tabs.Strings = (
      'General'
      'Winget')
    TabIndex = 0
    ExplicitWidth = 614
    ExplicitHeight = 382
    object ckStarMinimized: TsCheckBox
      Left = 16
      Top = 71
      Width = 110
      Height = 19
      Caption = 'Start Minimized'
      TabOrder = 0
    end
    object sCheckBox2: TsCheckBox
      Left = 16
      Top = 96
      Width = 186
      Height = 19
      Caption = 'Automatic Update verification'
      TabOrder = 1
    end
    object sTrackBar1: TsTrackBar
      Left = 52
      Top = 121
      Width = 150
      Height = 45
      Max = 60
      Min = 5
      ParentShowHint = False
      Frequency = 5
      Position = 5
      PositionToolTip = ptTop
      ShowHint = True
      ShowSelRange = False
      TabOrder = 2
      ShowProgress = True
    end
    object ckStartup: TsCheckBox
      Left = 16
      Top = 46
      Width = 102
      Height = 19
      Caption = 'Run on Sartup'
      TabOrder = 3
      OnMouseUp = ckStartupMouseUp
    end
  end
  object sCharImageList1: TsCharImageList
    EmbeddedFonts = <
      item
        FontName = 'FontAwesome'
        FontData = {}
      end>
    Items = <
      item
        Char = 61452
        Color = -7249920
      end>
    Left = 408
    Top = 224
    Bitmap = {}
  end
end
