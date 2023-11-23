program WGHelp;

uses
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  uConst in 'uConst.pas',
  uFrameBase in 'uFrameBase.pas' {frmBase: TFrame},
  uFrameUpgrade2 in 'uFrameUpgrade2.pas' {frmHeritee: TFrame},
  uFrameList in 'uFrameList.pas' {frmList: TFrame},
  uFrameSearch in 'uFrameSearch.pas' {frmSearch: TFrame},
  uRunWinget in 'uRunWinget.pas' {fRunWinget},
  uFrameConfig in 'uFrameConfig.pas' {frmConfig: TFrame},
  udlgClose in 'udlgClose.pas' {frmCloseDlg},
  uGlobalFrame in 'uGlobalFrame.pas' {fGlobalFrame: TFrame},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin

  Application.Initialize;
  pPArams.loadParams;
  Application.MainFormOnTaskbar := True;
  Application.ShowMainForm :=  not pParams.StartMinimized;
  Application.CreateForm(TfMain, fMain);
  if pParams.StartMinimized then
  begin
     fMain.Onshow := Nil;
     PostMessage(fMain.handle, WM_GETWINGETVERSION, 0, 0);
     PostMessage(fMain.handle, WM_GETUPGRADELIST, 0, 0);
  end;
  Application.Run;

end.
