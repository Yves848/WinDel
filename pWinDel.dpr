program pWinDel;

uses
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  uConst in 'uConst.pas',
  uOptions in 'uOptions.pas' {frmOptions},
  uFrameBase in 'uFrameBase.pas' {frmBase: TFrame},
  uFrameUpgrade2 in 'uFrameUpgrade2.pas' {frmHeritee: TFrame},
  uFrameList in 'uFrameList.pas' {frmList: TFrame},
  uFrameSearch in 'uFrameSearch.pas' {frmSearch: TFrame},
  uRunWinget in 'uRunWinget.pas' {fRunWinget},
  uFrameConfig in 'uFrameConfig.pas' {frmConfig: TFrame};

{$R *.res}

begin

  Application.Initialize;
  pPArams.loadParams;
  Application.MainFormOnTaskbar := not pParams.StartMinimized;
  Application.ShowMainForm :=  not pParams.StartMinimized;
  Application.CreateForm(TfMain, fMain);
  PostMessage(fMain.handle, WM_GETWINGETVERSION, 0, 0);
  PostMessage(fMain.handle, WM_GETUPGRADELIST, 0, 0);
  Application.Run;

end.
