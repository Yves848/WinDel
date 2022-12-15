unit uOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.IOUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, sPanel, acNoteBook,
  Vcl.ComCtrls, sTabControl, Vcl.StdCtrls, Vcl.Buttons, sBitBtn,
  System.ImageList, Vcl.ImgList, acAlphaImageList, sCheckBox, sGroupBox, uConst,
  sTrackBar, sLabel;

type
  TfrmOptions = class(TForm)
    sPanel1: TsPanel;
    sTabControl1: TsTabControl;
    sCharImageList1: TsCharImageList;
    btnClose: TsBitBtn;
    ckStarMinimized: TsCheckBox;
    ckAutoUpdCheck: TsCheckBox;
    tbInterval: TsTrackBar;
    ckStartup: TsCheckBox;
    sLabel1: TsLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckStartupMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure loadParams;
    procedure saveParams;
  public
    { Public declarations }
  end;

var
  frmOptions: TfrmOptions;

implementation

{$R *.dfm}

procedure TfrmOptions.btnCloseClick(Sender: TObject);
begin
  saveParams;
  ModalResult := mrOk;
end;

procedure TfrmOptions.ckStartupMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  sPath: String;
begin
  if ckStartup.Checked then
  begin
    sPath := IncludeTrailingBackslash(TPath.GetDirectoryName(ParamStr(0)));
    RunOnStartup('Winget Helper', TPath.Combine(sPath,
      'wingethelper.exe'), False);
  end
  else
  begin
    RemoveOnStartup('Winget Helper');
  end;

end;

procedure TfrmOptions.FormShow(Sender: TObject);
begin
  //
  loadParams;
end;

procedure TfrmOptions.loadParams;
begin
  ckStartup.Checked := pPArams.getParamb('RunOnStartUp');
  ckStarMinimized.Checked := pPArams.getParamb('StartMinimized');
end;

procedure TfrmOptions.saveParams;
begin
  pPArams.SetParamb('RunOnStartUp', ckStartup.Checked);
  pPArams.SetParamb('StartMinimized', ckStarMinimized.Checked);
  pPArams.saveParams;
end;

end.
