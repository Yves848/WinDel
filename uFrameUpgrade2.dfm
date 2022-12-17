inherited frmHeritee: TfrmHeritee
  OnResize = FrameResize
  object pnlUpgMain: TsPanel
    Left = 0
    Top = 24
    Width = 640
    Height = 456
    Align = alClient
    Caption = 'pnlUpgMain'
    ShowCaption = False
    TabOrder = 0
    object ListView1: TsListView
      Left = 1
      Top = 1
      Width = 511
      Height = 454
      BevelInner = bvNone
      BevelOuter = bvNone
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = 'Description'
          MinWidth = 200
          Width = 200
        end
        item
          Caption = 'ID'
          Width = 79
        end
        item
          Caption = 'Version'
          Width = 76
        end
        item
          Caption = 'Available'
          Width = 76
        end
        item
          Caption = 'Source'
          Width = 76
        end>
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object pnlUpgSideBar: TsPanel
      Left = 512
      Top = 1
      Width = 127
      Height = 454
      Align = alRight
      BevelOuter = bvNone
      Caption = 'pnlUpgSideBar'
      ShowCaption = False
      TabOrder = 1
      object sbUgRun: TsSpeedButton
        Left = 0
        Top = 398
        Width = 127
        Height = 56
        Align = alBottom
        Caption = 'Upgrade Selected'#13#10'(F8)'
        ImageIndex = 2
        Images = sCharImageList1
        OnClick = sbUgRunClick
        ExplicitLeft = 356
        ExplicitTop = 113
        ExplicitWidth = 177
      end
      object sbSelectAll: TsSpeedButton
        Left = 0
        Top = 41
        Width = 127
        Height = 56
        Align = alTop
        Caption = 'Select All'#13#10'(F5)'
        ImageIndex = 0
        Images = sCharImageList1
        OnClick = sbSelectAllClick
        ExplicitLeft = 356
        ExplicitTop = 113
        ExplicitWidth = 177
      end
      object pnlUpgTopSide: TsPanel
        Left = 0
        Top = 0
        Width = 127
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnlUpgTopSide'
        ShowCaption = False
        TabOrder = 0
      end
    end
  end
  object pnlTitleToolBar: TsPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 24
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'Upgradable Packages'
    Color = 12615680
    StyleElements = [seFont, seBorder]
    ParentBackground = False
    TabOrder = 1
  end
  object actlstUpgrade: TActionList
    Left = 568
    Top = 305
    object actSelectAll: TAction
      Caption = 'actSelectAll'
      ShortCut = 116
      OnExecute = actSelectAllExecute
    end
    object actUpgrade: TAction
      Caption = 'actUpgrade'
      ShortCut = 119
      OnExecute = actUpgradeExecute
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
        Char = 61510
        Color = clLime
      end
      item
        Char = 61590
        Color = clRed
      end
      item
        Char = 61573
        Color = clLime
      end>
    Left = 520
    Top = 353
    Bitmap = {}
  end
end
