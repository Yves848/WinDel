inherited frmConfig: TfrmConfig
  object pnlMain: TsPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    Caption = 'pnlMain'
    ShowCaption = False
    TabOrder = 0
    object pnlTitleToolBar: TsPanel
      Left = 1
      Top = 1
      Width = 638
      Height = 24
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Configuration'
      StyleElements = [seFont]
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
    end
    object pnlSideTB: TsPanel
      Left = 454
      Top = 25
      Width = 185
      Height = 454
      Align = alRight
      Caption = 'pnlSideTB'
      ShowCaption = False
      TabOrder = 1
      object btnUnInstallRun: TsSpeedButton
        Left = 1
        Top = 397
        Width = 183
        Height = 56
        Align = alBottom
        Caption = 'Save Params'#13#10'(F8)'
        ImageIndex = 1
        Images = sCharImageList1
        OnClick = btnUnInstallRunClick
        TextOffset = 10
        ExplicitLeft = 2
        ExplicitTop = 9
      end
    end
    object sPageControl1: TsPageControl
      Left = 1
      Top = 25
      Width = 453
      Height = 454
      ActivePage = sTabSheet1
      Align = alClient
      TabOrder = 2
      object sTabSheet1: TsTabSheet
        Caption = 'General'
        object ckStartup: TsCheckBox
          Left = 16
          Top = 46
          Width = 102
          Height = 19
          Caption = 'Run on Sartup'
          TabOrder = 0
          OnMouseUp = ckStartupMouseUp
        end
        object ckStarMinimized: TsCheckBox
          Left = 16
          Top = 71
          Width = 110
          Height = 19
          Caption = 'Start Minimized'
          TabOrder = 1
          OnMouseUp = ckStarMinimizedMouseUp
        end
        object ckAutoUpdCheck: TsCheckBox
          Left = 16
          Top = 96
          Width = 186
          Height = 19
          Caption = 'Automatic Update verification'
          TabOrder = 2
          OnMouseUp = ckAutoUpdCheckMouseUp
        end
        object pnlFrequency: TsPanel
          Left = 32
          Top = 121
          Width = 296
          Height = 32
          Caption = 'pnlFrequency'
          ShowCaption = False
          TabOrder = 3
          Visible = False
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
      object Winget: TsTabSheet
        Caption = 'Winget'
        object sLabelFX1: TsLabelFX
          Left = 16
          Top = 16
          Width = 47
          Height = 17
          Caption = 'Soon .....'
          Angle = 0
          Shadow.OffsetKeeper.LeftTop = 0
          Shadow.OffsetKeeper.RightBottom = 2
        end
      end
    end
  end
  object sFrameAdapter1: TsFrameAdapter
    Left = 536
    Top = 384
  end
  object sCharImageList1: TsCharImageList
    EmbeddedFonts = <
      item
        FontName = 'FontAwesome'
        FontData = {}
      end>
    Items = <
      item
        Char = 61465
        Color = clLime
      end
      item
        DrawContour = True
        Char = 61465
      end>
    Left = 502
    Top = 369
    Bitmap = {}
  end
end
