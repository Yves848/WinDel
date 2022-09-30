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
    ExplicitTop = 0
    ExplicitHeight = 480
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
      ExplicitHeight = 478
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
      ExplicitHeight = 478
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
        Top = 41
        Width = 127
        Height = 40
        Align = alTop
        Caption = 'Upgrade Selected'
        TabOrder = 1
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
    ExplicitLeft = 2
    ExplicitTop = 9
    ExplicitWidth = 638
  end
end
