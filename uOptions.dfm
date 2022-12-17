object frmOptions: TfrmOptions
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 235
  BorderStyle = bsSingle
  Caption = 'Options'
  ClientHeight = 423
  ClientWidth = 614
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
    Top = 382
    Width = 614
    Height = 41
    Align = alBottom
    Caption = 'sPanel1'
    ShowCaption = False
    TabOrder = 0
    object btnClose: TsBitBtn
      Left = 500
      Top = 1
      Width = 113
      Height = 39
      Align = alRight
      Caption = 'Accept'
      ImageIndex = 0
      Images = sCharImageList1
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object sButton1: TsButton
      Left = 387
      Top = 1
      Width = 113
      Height = 39
      Align = alRight
      Caption = 'Cancel'
      ImageIndex = 1
      Images = sCharImageList1
      TabOrder = 1
      OnClick = sButton1Click
    end
  end
  object sTabControl1: TsTabControl
    Left = 0
    Top = 0
    Width = 614
    Height = 382
    Align = alClient
    TabOrder = 1
    Tabs.Strings = (
      'General'
      'Winget')
    TabIndex = 0
    object ckStarMinimized: TsCheckBox
      Left = 16
      Top = 71
      Width = 110
      Height = 19
      Caption = 'Start Minimized'
      TabOrder = 0
    end
    object ckAutoUpdCheck: TsCheckBox
      Left = 16
      Top = 96
      Width = 186
      Height = 19
      Caption = 'Automatic Update verification'
      TabOrder = 1
      OnMouseUp = ckAutoUpdCheckMouseUp
    end
    object ckStartup: TsCheckBox
      Left = 16
      Top = 46
      Width = 102
      Height = 19
      Caption = 'Run on Sartup'
      TabOrder = 2
      OnMouseUp = ckStartupMouseUp
    end
    object pnlFrequency: TsPanel
      Left = 32
      Top = 121
      Width = 296
      Height = 32
      Caption = 'pnlFrequency'
      ShowCaption = False
      TabOrder = 3
      object sLabel2: TsLabel
        Left = 12
        Top = 7
        Width = 28
        Height = 15
        Caption = 'Every'
      end
      object sLabel1: TsLabel
        Left = 237
        Top = 7
        Width = 43
        Height = 15
        Caption = 'minutes'
      end
      object lblMin: TsLabel
        Left = 202
        Top = 8
        Width = 23
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0'
      end
      object tbInterval: TsTrackBar
        Left = 46
        Top = 0
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
        TabOrder = 0
        TickStyle = tsNone
        OnChange = tbIntervalChange
        ShowProgress = True
      end
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
      end
      item
        Char = 61453
        Color = clRed
      end>
    Left = 408
    Top = 224
    Bitmap = {}
  end
end
