object frmCloseDlg: TfrmCloseDlg
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmCloseDlg'
  ClientHeight = 127
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object sLabelFX1: TsLabelFX
    Left = 8
    Top = 24
    Width = 443
    Height = 23
    Caption = 'Do you want to minimize the application tu run in background ?'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    Angle = 0
    Shadow.OffsetKeeper.LeftTop = 0
    Shadow.OffsetKeeper.RightBottom = 2
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 86
    Width = 443
    Height = 41
    Align = alBottom
    Caption = 'sPanel1'
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    ShowCaption = False
    TabOrder = 0
    ExplicitTop = 192
    object sSpeedButton1: TsSpeedButton
      Left = 207
      Top = 4
      Width = 232
      Height = 33
      Align = alRight
      Caption = 'Yes'
      ImageIndex = 0
      Images = sCharImageList1
      Spacing = 25
      OnClick = sSpeedButton1Click
      ExplicitLeft = 256
      ExplicitTop = 1
      ExplicitHeight = 39
    end
    object sSpeedButton2: TsSpeedButton
      Left = 4
      Top = 4
      Width = 203
      Height = 33
      Align = alClient
      Caption = 'No'
      ImageIndex = 1
      Images = sCharImageList1
      Spacing = 25
      OnClick = sSpeedButton2Click
      ExplicitLeft = -5
      ExplicitTop = 1
      ExplicitWidth = 209
      ExplicitHeight = 39
    end
  end
  object sCharImageList1: TsCharImageList
    EmbeddedFonts = <
      item
        FontName = 'FontAwesome'
        FontData = {}
      end>
    Items = <
      item
        Char = 61533
        Color = clLime
      end
      item
        Char = 61532
        Color = clRed
      end>
    Left = 336
    Top = 56
    Bitmap = {}
  end
end
