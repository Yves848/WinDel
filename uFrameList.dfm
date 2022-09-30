inherited frmList: TfrmList
  OnResize = FrameResize
  object pnlListMain: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    Caption = 'pnlListMain'
    TabOrder = 0
    object listView1: TListView
      Left = 1
      Top = 25
      Width = 453
      Height = 454
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelKind = bkFlat
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
          Caption = 'Disponible'
        end
        item
          AutoSize = True
          Caption = 'Source'
        end>
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object pnlSideTB: TPanel
      Left = 454
      Top = 25
      Width = 185
      Height = 454
      Align = alRight
      BevelOuter = bvNone
      Caption = 'pnlSideTB'
      ShowCaption = False
      TabOrder = 1
      object pnlUpgTopSide: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnlUpgTopSide'
        ShowCaption = False
        TabOrder = 0
      end
      object pnlFilterGroup: TPanel
        Left = 0
        Top = 41
        Width = 185
        Height = 72
        Align = alTop
        BevelKind = bkFlat
        BevelOuter = bvNone
        Caption = 'pnlFilterGroup'
        ShowCaption = False
        TabOrder = 1
        object lblFilter: TLabel
          Left = 0
          Top = 0
          Width = 181
          Height = 20
          Align = alTop
          Alignment = taCenter
          Caption = 'Filter'
          Color = 13031935
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          StyleElements = [seClient, seBorder]
          ExplicitWidth = 36
        end
        object lblfltSource: TLabel
          Left = 0
          Top = 20
          Width = 181
          Height = 15
          Align = alTop
          Alignment = taCenter
          Caption = 'Source'
          ExplicitWidth = 36
        end
        object cbbSourceFilter: TComboBox
          Left = 0
          Top = 35
          Width = 181
          Height = 23
          Align = alTop
          Style = csDropDownList
          TabOrder = 0
          OnChange = cbbSourceFilterChange
        end
      end
    end
    object pnlTitleToolBar: TPanel
      Left = 1
      Top = 1
      Width = 638
      Height = 24
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Installed Packages'
      Color = 12615680
      ParentBackground = False
      TabOrder = 2
      StyleElements = [seFont, seBorder]
    end
  end
end
