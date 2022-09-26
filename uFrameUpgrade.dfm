inherited frameUpgrade: TframeUpgrade
  Left = 0
  Top = 0
  ClientHeight = 445
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 626
    Height = 445
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
    ExplicitWidth = 624
    ExplicitHeight = 441
  end
end
