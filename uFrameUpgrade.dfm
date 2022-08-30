object frameUpgrade: TframeUpgrade
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    BevelInner = bvNone
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
    GridLines = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    ExplicitWidth = 480
    ExplicitHeight = 441
  end
end
