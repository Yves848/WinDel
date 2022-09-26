inherited frmHeritee: TfrmHeritee
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    BevelInner = bvNone
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
    GridLines = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
end
