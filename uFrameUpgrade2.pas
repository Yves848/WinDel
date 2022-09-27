unit uFrameUpgrade2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrameBase, Vcl.ComCtrls;

const
  aColWidths : array of Integer = [42,29,13,13,8];

type
  TfrmHeritee = class(TfrmBase)
    ListView1: TListView;
    procedure FrameResize(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmHeritee: TfrmHeritee;

implementation

{$R *.dfm}

procedure TfrmHeritee.FrameResize(Sender: TObject);
var
  listeView: TListView;
  columns: TListColumns;
  column: TListColumn;
  i: Integer;
begin
  listeView := ListView1;
  for i := 0 to listeView.columns.Count - 1 do
  begin
    column := listeView.columns[i];
    column.Width := listeView.Width div 100 * aColWidths[i];
  end;
end;

end.
