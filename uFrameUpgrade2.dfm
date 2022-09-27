inherited frmHeritee: TfrmHeritee
  OnResize = FrameResize
  object pnlUpgMain: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    Caption = 'pnlUpgMain'
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 88
    ExplicitTop = 136
    ExplicitWidth = 185
    ExplicitHeight = 41
    object ListView1: TListView
      Left = 1
      Top = 1
      Width = 511
      Height = 478
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
      ExplicitLeft = 0
      ExplicitTop = 47
      ExplicitWidth = 640
      ExplicitHeight = 439
    end
    object pnlUpgSideBar: TPanel
      Left = 512
      Top = 1
      Width = 127
      Height = 478
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
        ExplicitLeft = 56
        ExplicitTop = 248
        ExplicitWidth = 185
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
end
