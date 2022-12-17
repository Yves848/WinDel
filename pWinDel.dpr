program pWinDel;

uses
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
  Application.MainFormOnTaskbar := True;
  Application.ShowMainForm :=  not pParams.StartMinimized;
  Application.CreateForm(TfMain, fMain);
  Application.Run;

end.
