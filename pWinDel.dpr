program pWinDel;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  Vcl.Themes,
  Vcl.Styles,
  uConst in 'uConst.pas',
  uOptions in 'uOptions.pas' {frmOptions},
  uFrameBase in 'uFrameBase.pas' {frmBase: TFrame},
  uFrameUpgrade in 'uFrameUpgrade.pas' {frameUpgrade: TFrame},
  uFrameUpgrade2 in 'uFrameUpgrade2.pas' {frmHeritee: TFrame},
  uFrameList in 'uFrameList.pas' {frmList: TFrame},
  uFrameSearch in 'uFrameSearch.pas' {frmSearch: TFrame},
  utestcomponents in 'utestcomponents.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glow');
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.Run;
end.
