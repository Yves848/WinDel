unit uFrameConfig;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  uFrameBase,
  sFrameAdapter,
  Vcl.ComCtrls,
  sPageControl,
  Vcl.ExtCtrls,
  sPanel,
  Vcl.StdCtrls,
  sLabel,
  Vcl.Buttons,
  sSpeedButton,
  System.ImageList,
  Vcl.ImgList,
  acAlphaImageList,
  sTrackBar,
  sCheckBox,
  uConst;

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
    ckStartup: TsCheckBox;
    ckStarMinimized: TsCheckBox;
    ckAutoUpdCheck: TsCheckBox;
    pnlFrequency: TsPanel;
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    lblMin: TsLabel;
    tbInterval: TsTrackBar;
    procedure ckAutoUpdCheckMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ckStarMinimizedMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ckStartupMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbIntervalChange(Sender: TObject);
  private
    { Déclarations privées }
    procedure isChanged(bChanged : boolean);
  public
    { Déclarations publiques }
    procedure loadparams;
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

{ TfrmConfig }

procedure TfrmConfig.ckAutoUpdCheckMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  pnlFrequency.Visible := ckAutoUpdCheck.Checked;
  isChanged(ckAutoUpdCheck.Checked <> pParams.AutoCheckUpdates);
end;

procedure TfrmConfig.ckStarMinimizedMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  isChanged(ckStarMinimized.Checked <> pParams.StartMinimized);
end;

procedure TfrmConfig.ckStartupMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  isChanged(ckStartup.Checked <> pParams.RunOnStartup);
end;

procedure TfrmConfig.isChanged(bChanged: boolean);
begin
  if bChanged then
  begin
    btnUnInstallRun.ImageIndex := 0;
  end
  else
  begin
    btnUnInstallRun.ImageIndex := 1;
  end;

end;

procedure TfrmConfig.loadparams;
begin
  ckStartup.Checked := pPArams.RunOnStartup;
  ckStarMinimized.Checked := pParams.StartMinimized;
  tbInterval.Position := pParams.CheckUpdatesInterval;
  ckAutoUpdCheck.Checked := pParams.AutoCheckUpdates;
  tbInterval.Position := pParams.CheckUpdatesInterval
end;

procedure TfrmConfig.tbIntervalChange(Sender: TObject);
begin
  inherited;
  lblMin.Caption := inttostr(tbInterval.Position);
  isChanged((tbInterval.Position <> pParams.CheckUpdatesInterval));
end;

end.

