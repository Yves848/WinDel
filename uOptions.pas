unit uOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, sPanel, acNoteBook, Vcl.ComCtrls, sTabControl, Vcl.StdCtrls, Vcl.Buttons, sBitBtn,
  System.ImageList, Vcl.ImgList, acAlphaImageList, sCheckBox, sGroupBox,
  sTrackBar;

type
  TfrmOptions = class(TForm)
    sPanel1: TsPanel;
    sTabControl1: TsTabControl;
    sCharImageList1: TsCharImageList;
    btnClose: TsBitBtn;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sTrackBar1: TsTrackBar;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOptions: TfrmOptions;

implementation

{$R *.dfm}

procedure TfrmOptions.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
