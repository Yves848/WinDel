unit uFrameUpgrade2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrameBase, Vcl.ComCtrls;

type
  TfrmHeritee = class(TfrmBase)
    ListView1: TListView;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmHeritee: TfrmHeritee;

implementation

{$R *.dfm}

end.
