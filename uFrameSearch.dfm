inherited frmSearch: TfrmSearch
  OnResize = FrameResize
  object pnlSearchMain: TsPanel
    Left = 0
    Top = 24
    Width = 640
    Height = 456
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlSearchMain'
    ShowCaption = False
    TabOrder = 0
    object pnlSearchEdit: TsPanel
      Left = 0
      Top = 0
      Width = 640
      Height = 105
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pnlSearchEdit'
      Color = clBackground
      ShowCaption = False
      ParentBackground = False
      TabOrder = 0
      object btnLaunch: TButton
        Left = 520
        Top = 28
        Width = 75
        Height = 25
        Caption = 'Launch'
        TabOrder = 0
        OnClick = btnLaunchClick
      end
      object edtPackageName: TsEdit
        Left = 16
        Top = 29
        Width = 489
        Height = 23
        TabOrder = 1
        TextHint = 'Package to search'
        OnKeyDown = edtPackageNameKeyDown
        BoundLabel.Active = True
        BoundLabel.Caption = 'Package to search'
        BoundLabel.Layout = sclTopLeft
        LabelFromTextHint = True
      end
    end
    object ListView1: TsListView
      Left = 0
      Top = 105
      Width = 455
      Height = 351
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
          Width = 78
        end
        item
          Caption = 'Version'
          Width = 77
        end
        item
          Caption = 'Correspondance'
          Width = 77
        end
        item
          Caption = 'Source'
          Width = 77
        end>
      RowSelect = True
      TabOrder = 1
      ViewStyle = vsReport
      ExplicitWidth = 513
    end
    object pnlUpgSideBar: TsPanel
      Left = 455
      Top = 105
      Width = 185
      Height = 351
      Align = alRight
      BevelOuter = bvNone
      Caption = 'pnlUpgSideBar'
      Padding.Left = 4
      Padding.Right = 4
      ShowCaption = False
      TabOrder = 2
      ExplicitLeft = 447
      ExplicitTop = 111
      object btnInstallRun: TsSpeedButton
        Left = 4
        Top = 41
        Width = 177
        Height = 48
        Align = alTop
        Caption = 'Install Selected'#13#10'(F8)'
        ImageIndex = 0
        Images = sCharImageList1
        OnClick = btnInstallRunClick
        Reflected = True
        ExplicitWidth = 119
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
        ExplicitWidth = 119
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
    Caption = 'Search Packages'
    Color = 12615680
    StyleElements = [seFont, seBorder]
    ParentBackground = False
    TabOrder = 1
  end
  object dcSearch1: TDosCommand
    InputToOutput = False
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 0
    OnCharDecoding = dcSearch1CharDecoding
    OnNewLine = dcSearch1NewLine
    Left = 320
    Top = 272
  end
  object sFrameAdapter1: TsFrameAdapter
    Left = 577
    Top = 385
  end
  object sCharImageList1: TsCharImageList
    EmbeddedFonts = <
      item
        FontName = 'FontAwesome'
        FontData = {}
      end>
    Items = <
      item
        Char = 61465
        Color = -5344256
      end>
    Left = 553
    Top = 361
    Bitmap = {}
  end
  object ActionList1: TActionList
    Left = 551
    Top = 313
    object InstallSelected: TAction
      Caption = 'Install Selected'
      ShortCut = 119
      OnExecute = InstallSelectedExecute
    end
  end
end
