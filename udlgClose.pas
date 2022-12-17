unit udlgClose;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sLabel, Vcl.ExtCtrls, sPanel, Vcl.Buttons, sSpeedButton, System.ImageList, Vcl.ImgList,
  acAlphaImageList;

type
  TfrmCloseDlg = class(TForm)
    sLabelFX1: TsLabelFX;
    sPanel1: TsPanel;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sCharImageList1: TsCharImageList;
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmCloseDlg: TfrmCloseDlg;

implementation

{$R *.dfm}

procedure TfrmCloseDlg.sSpeedButton1Click(Sender: TObject);
begin
  ModalResult := mrYes;
end;

procedure TfrmCloseDlg.sSpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrNo;
end;

end.
