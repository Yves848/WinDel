unit uGlobalFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrameBase, sFrameAdapter, Vcl.StdCtrls, sGroupBox;

type
  TfGlobalFrame = class(TfrmBase)
    sFrameAdapter1: TsFrameAdapter;
    sGroupBox1: TsGroupBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGlobalFrame: TfGlobalFrame;

implementation

{$R *.dfm}

end.
