inherited frmSearch: TfrmSearch
  OnResize = FrameResize
  object pnlSearchMain: TPanel
    Left = 0
    Top = 24
    Width = 640
    Height = 456
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlSearchMain'
    ShowCaption = False
    TabOrder = 0
    ExplicitTop = 0
    ExplicitHeight = 480
    object pnlSearchEdit: TPanel
      Left = 0
      Top = 0
      Width = 640
      Height = 105
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pnlSearchEdit'
      ShowCaption = False
      TabOrder = 0
      object lblSearch: TLabel
        Left = 16
        Top = 16
        Width = 85
        Height = 15
        Caption = '&Package Name :'
      end
      object edtPackageName: TEdit
        Left = 120
        Top = 13
        Width = 393
        Height = 23
        TabOrder = 0
        OnKeyDown = edtPackageNameKeyDown
      end
      object btnLaunch: TButton
        Left = 519
        Top = 12
        Width = 75
        Height = 25
        Caption = 'Launch'
        TabOrder = 1
        OnClick = btnLaunchClick
      end
      object AI1: TActivityIndicator
        Left = 601
        Top = 12
        IndicatorColor = aicWhite
        IndicatorSize = aisSmall
        IndicatorType = aitSectorRing
      end
    end
    object ListView1: TListView
      Left = 0
      Top = 105
      Width = 513
      Height = 351
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
      TabOrder = 1
      ViewStyle = vsReport
      ExplicitHeight = 375
    end
    object pnlUpgSideBar: TPanel
      Left = 513
      Top = 105
      Width = 127
      Height = 351
      Align = alRight
      BevelOuter = bvNone
      Caption = 'pnlUpgSideBar'
      ShowCaption = False
      TabOrder = 2
      ExplicitHeight = 375
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
      object btnInstallRun: TButton
        Left = 0
        Top = 41
        Width = 127
        Height = 40
        Align = alTop
        Caption = 'Install Selected'
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
    Caption = 'Search Packages'
    Color = 12615680
    ParentBackground = False
    TabOrder = 1
    StyleElements = [seFont, seBorder]
    ExplicitLeft = 1
    ExplicitTop = 1
    ExplicitWidth = 638
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
end
