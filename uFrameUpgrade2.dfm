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
      object btnUgRun: TButton
        Left = 0
        Top = 81
        Width = 127
        Height = 40
        Align = alTop
        Caption = '&Upgrade Selected'
        TabOrder = 1
        OnClick = actUpgradeExecute
      end
      object btnSelectAll: TButton
        Left = 0
        Top = 41
        Width = 127
        Height = 40
        Align = alTop
        Caption = 'Select &All'
        TabOrder = 2
        OnClick = actSelectAllExecute
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
    Top = 233
    object actSelectAll: TAction
      Caption = 'actSelectAll'
      OnExecute = actSelectAllExecute
    end
    object actUpgrade: TAction
      Caption = 'actUpgrade'
      OnExecute = actUpgradeExecute
    end
  end
  object sFrameAdapter1: TsFrameAdapter
    Left = 552
    Top = 377
  end
end
