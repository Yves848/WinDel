unit uFrameUpgrade2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrameBase, Vcl.ComCtrls, Vcl.ExtCtrls, Winapi.CommCtrl, Vcl.StdCtrls, uConst, System.Actions, Vcl.ActnList,
  uRunWinget;

const
  aColWidths : array of Integer = [42,29,13,13,8];

type
  TfrmHeritee = class(TfrmBase)
    ListView1: TListView;
    pnlUpgMain: TPanel;
    pnlUpgSideBar: TPanel;
    pnlUpgTopSide: TPanel;
    btnUgRun: TButton;
    pnlTitleToolBar: TPanel;
    btnSelectAll: TButton;
    actlstUpgrade: TActionList;
    actSelectAll: TAction;
    actUpgrade: TAction;
    procedure FrameResize(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actUpgradeExecute(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure setupColumnHeaders;
  end;

var
  frmHeritee: TfrmHeritee;

implementation

{$R *.dfm}

procedure TfrmHeritee.actSelectAllExecute(Sender: TObject);
var
  bSelected : boolean;
  i : Integer;
begin
  inherited;
  bSelected := btnSelectAll.Tag = 0;
  if (btnSelectAll.tag = 0) then
  begin
     btnSelectAll.Tag := 1;
     btnSelectAll.Caption := 'Unselect &All';
  end
  else
  begin
     btnSelectAll.Tag := 0;
     btnSelectAll.Caption := 'Select &All';
  end;

  i := 0;

  while i <= ListView1.Items.Count -1 do
  begin
      ListView1.Items[i].Checked := bSelected;
      inc(i);
  end;

end;

procedure TfrmHeritee.actUpgradeExecute(Sender: TObject);
var
  frunWinget : TfRunWinget;
begin
  inherited;
  fRunWinget := TfRunWinget.Create(self);
  fRunWinget.showModal;
  fRunWinget.Free;
end;

procedure TfrmHeritee.FrameResize(Sender: TObject);
var
  listeView: TListView;
  columns: TListColumns;
  column: TListColumn;
  i: Integer;

  h: THandle;
  r: TRect;
begin

  listeView := ListView1;
  h := ListView_GetHeader(ListeView.Handle);
  GetWindowRect(h, r);
  pnlUpgTopSide.Height :=  (r.Bottom - r.Top);
  for i := 0 to listeView.columns.Count - 1 do
  begin
    column := listeView.columns[i];
    column.Width := listeView.Width div 100 * aColWidths[i];
  end;

end;

procedure TfrmHeritee.setupColumnHeaders;
var
  i: Integer;
  pColumn: tColumnClass;
begin
  if lListColumn <> Nil then
  begin
    i := 0;
    while i <= lListColumn.Count - 1 do
    begin
      pColumn := tColumnClass(lListColumn.objects[i]);
      listView1.Columns[i].Caption := pColumn.sLabel;
      inc(i);
    end;
  end;

end;

end.
