inherited frmSearch: TfrmSearch
  Width = 948
  Height = 592
  OnResize = FrameResize
  ExplicitWidth = 948
  ExplicitHeight = 592
  object pnlSearchMain: TsPanel
    Left = 0
    Top = 24
    Width = 948
    Height = 568
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlSearchMain'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 435
    ExplicitHeight = 242
    object pnlSearchEdit: TsPanel
      Left = 0
      Top = 0
      Width = 948
      Height = 105
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pnlSearchEdit'
      Color = clBackground
      ShowCaption = False
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 435
      object btnLaunch: TsSpeedButton
        Left = 704
        Top = 16
        Width = 147
        Height = 49
        Caption = 'Search'#13#10'(Enter)'
        ImageIndex = 3
        Images = sCharImageList1
        Spacing = 15
        OnClick = btnLaunchClick
      end
      object edtPackageName: TsEdit
        Left = 25
        Top = 29
        Width = 673
        Height = 23
        TabOrder = 0
        TextHint = 'Package to search'
        OnKeyDown = edtPackageNameKeyDown
        BoundLabel.Active = True
        BoundLabel.Caption = 'Package to search'
        BoundLabel.Layout = sclTopLeft
        LabelFromTextHint = True
      end
    end
    object sPanel1: TsPanel
      Left = 0
      Top = 105
      Width = 948
      Height = 248
      Align = alTop
      Caption = 'sPanel1'
      TabOrder = 1
      ExplicitWidth = 435
      object ListView1: TsListView
        Left = 1
        Top = 1
        Width = 761
        Height = 246
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
        TabOrder = 0
        ViewStyle = vsReport
        ExplicitWidth = 248
      end
      object pnlUpgSideBar: TsPanel
        Left = 762
        Top = 1
        Width = 185
        Height = 246
        Align = alRight
        BevelOuter = bvNone
        Caption = 'pnlUpgSideBar'
        Padding.Left = 4
        Padding.Right = 4
        ShowCaption = False
        TabOrder = 1
        ExplicitLeft = 249
        object sbAddtoSelection: TsSpeedButton
          Left = 4
          Top = 0
          Width = 177
          Height = 48
          Align = alTop
          Caption = 'Add to Selection'#13#10'(Ctrl-A)'
          ImageIndex = 1
          Images = sCharImageList1
          OnClick = sbAddtoSelectionClick
          Reflected = True
          ExplicitLeft = 8
          ExplicitTop = 49
        end
      end
    end
    object sPanel2: TsPanel
      Left = 0
      Top = 394
      Width = 948
      Height = 174
      Align = alClient
      Caption = 'sPanel2'
      TabOrder = 2
      ExplicitWidth = 435
      ExplicitHeight = 228
      object lvInstall: TsListView
        Left = 1
        Top = 1
        Width = 761
        Height = 172
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
        TabOrder = 0
        ViewStyle = vsReport
        ExplicitWidth = 248
        ExplicitHeight = 226
      end
      object sPanel3: TsPanel
        Left = 762
        Top = 1
        Width = 185
        Height = 172
        Align = alRight
        BevelOuter = bvNone
        Caption = 'pnlUpgSideBar'
        Padding.Left = 4
        Padding.Right = 4
        ShowCaption = False
        TabOrder = 1
        ExplicitLeft = 249
        ExplicitHeight = 226
        object sbInstallRun: TsSpeedButton
          Left = 4
          Top = 48
          Width = 177
          Height = 48
          Align = alTop
          Caption = 'Install Selected'#13#10'(F8)'
          ImageIndex = 0
          Images = sCharImageList1
          Spacing = 15
          OnClick = btnInstallRunClick
          Reflected = True
          ExplicitLeft = 178
          ExplicitTop = 41
        end
        object sbRemovefromSelection: TsSpeedButton
          Left = 4
          Top = 0
          Width = 177
          Height = 48
          Align = alTop
          Caption = 'Remove Selected'#13#10'(Ctrl-R)'
          ImageIndex = 2
          Images = sCharImageList1
          OnClick = sbRemovefromSelectionClick
          Reflected = True
          ExplicitLeft = 8
          ExplicitTop = 8
        end
      end
    end
    object spnl1: TsPanel
      Left = 0
      Top = 353
      Width = 948
      Height = 41
      Align = alTop
      Caption = 'spnl1'
      ShowCaption = False
      TabOrder = 3
      ExplicitWidth = 435
      object spdbtn1: TsSpeedButton
        Left = 1
        Top = 1
        Width = 946
        Height = 39
        Align = alClient
        ImageIndex = 4
        Images = sCharImageList1
        OnClick = spdbtn1Click
        ExplicitLeft = 392
        ExplicitTop = 16
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
  end
  object pnlTitleToolBar: TsPanel
    Left = 0
    Top = 0
    Width = 948
    Height = 24
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'Search Packages'
    Color = 12615680
    StyleElements = [seFont, seBorder]
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 435
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
      end
      item
        Char = 61543
        Color = -14121702
      end
      item
        Char = 61544
        Color = -16777054
      end
      item
        Char = 61671
        Color = -16757684
      end
      item
        ScalingFactor = 1.160000000000000000
        AddedSize = 58
        Char = 61539
        AddedChar = 61538
        AddedFontName = 'FontAwesome'
        Color = 65344
        AddedColor = clRed
      end>
    Left = 513
    Top = 393
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
    object AddChecked: TAction
      Caption = 'AddChecked'
      ShortCut = 16449
      OnExecute = AddCheckedExecute
    end
    object RemoveSelected: TAction
      Caption = 'RemoveSelected'
      ShortCut = 16466
      OnExecute = RemoveSelectedExecute
    end
  end
end
