inherited frmHeritee: TfrmHeritee
  OnResize = FrameResize
  object pnlUpgMain: TPanel
    Left = 0
    Top = 24
    Width = 640
    Height = 456
    Align = alClient
    Caption = 'pnlUpgMain'
    ShowCaption = False
    TabOrder = 0
    object ListView1: TListView
      Left = 1
      Top = 1
      Width = 511
      Height = 454
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Checkboxes = True
      Columns = <
        item
          AutoSize = True
          Caption = 'Description'
          MinWidth = 200
        end
        item
          AutoSize = True
          Caption = 'ID'
        end
        item
          AutoSize = True
          Caption = 'Version'
        end
        item
          AutoSize = True
          Caption = 'Available'
        end
        item
          AutoSize = True
          Caption = 'Source'
        end>
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object pnlUpgSideBar: TPanel
      Left = 512
      Top = 1
      Width = 127
      Height = 454
      Align = alRight
      BevelOuter = bvNone
      Caption = 'pnlUpgSideBar'
      ShowCaption = False
      TabOrder = 1
      object pnlUpgTopSide: TPanel
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
        ExplicitTop = 41
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
  object pnlTitleToolBar: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 24
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'Upgradable Packages'
    Color = 12615680
    ParentBackground = False
    TabOrder = 1
    StyleElements = [seFont, seBorder]
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
end
