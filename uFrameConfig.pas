unit uFrameConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrameBase, sFrameAdapter, Vcl.ComCtrls,
  sPageControl, Vcl.ExtCtrls, sPanel, Vcl.StdCtrls, sLabel, Vcl.Buttons,
  sSpeedButton, System.ImageList, Vcl.ImgList, acAlphaImageList;

type
  TfrmConfig = class(TfrmBase)
    sFrameAdapter1: TsFrameAdapter;
    pnlTitleToolBar: TsPanel;
    pnlMain: TsPanel;
    pnlSideTB: TsPanel;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    Winget: TsTabSheet;
    sLabelFX1: TsLabelFX;
    btnUnInstallRun: TsSpeedButton;
    sCharImageList1: TsCharImageList;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

end.
