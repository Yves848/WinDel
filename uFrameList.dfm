inherited frmList: TfrmList
  OnResize = FrameResize
  object pnlListMain: TsPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    Caption = 'pnlListMain'
    TabOrder = 0
    object listView1: TsListView
      Left = 1
      Top = 25
      Width = 453
      Height = 454
      BevelInner = bvNone
      BevelKind = bkFlat
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
          Width = 67
        end
        item
          Caption = 'Version'
          Width = 66
        end
        item
          Caption = 'Disponible'
          Width = 58
        end
        item
          Caption = 'Source'
          Width = 58
        end>
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object pnlSideTB: TsPanel
      Left = 454
      Top = 25
      Width = 185
      Height = 454
      Align = alRight
      BevelOuter = bvNone
      Caption = 'pnlSideTB'
      Padding.Left = 4
      Padding.Right = 4
      Padding.Bottom = 4
      ShowCaption = False
      TabOrder = 1
      object btnUnInstallRun: TsSpeedButton
        Left = 4
        Top = 113
        Width = 177
        Height = 56
        Align = alTop
        Caption = 'Uninstall Selected'#13#10'(F8)'
        ImageIndex = 0
        Images = sCharImageList1
        OnClick = btnUnInstallRunClick
      end
      object pnlUpgTopSide: TsPanel
        Left = 4
        Top = 0
        Width = 177
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnlUpgTopSide'
        ShowCaption = False
        TabOrder = 0
      end
      object pnlFilterGroup: TsPanel
        Left = 4
        Top = 41
        Width = 177
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        Caption = 'pnlFilterGroup'
        ShowCaption = False
        TabOrder = 1
        object lblfltSource: TLabel
          Left = 0
          Top = 0
          Width = 177
          Height = 15
          Align = alTop
          Alignment = taCenter
          Caption = 'Source'
          ExplicitWidth = 36
        end
        object cbbSourceFilter: TComboBox
          Left = 0
          Top = 15
          Width = 177
          Height = 23
          Align = alTop
          Style = csDropDownList
          TabOrder = 0
          OnChange = cbbSourceFilterChange
        end
      end
    end
    object pnlTitleToolBar: TsPanel
      Left = 1
      Top = 1
      Width = 638
      Height = 24
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Installed Packages'
      StyleElements = [seFont]
      ParentBackground = False
      ParentColor = True
      TabOrder = 2
    end
  end
  object sFrameAdapter1: TsFrameAdapter
    Left = 502
    Top = 297
  end
  object sCharImageList1: TsCharImageList
    EmbeddedFonts = <
      item
        FontName = 'FontAwesome'
        FontData = {}
      end>
    Items = <
      item
        Char = 61809
        Color = clRed
      end>
    Left = 534
    Top = 401
    Bitmap = {}
  end
  object ActionList1: TActionList
    Left = 526
    Top = 249
    object UninstallSelected: TAction
      Caption = 'Uninstall Selected'
      ShortCut = 119
      OnExecute = UninstallSelectedExecute
    end
  end
end
