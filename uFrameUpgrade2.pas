unit uFrameUpgrade2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrameBase, Vcl.ComCtrls, Vcl.ExtCtrls, Winapi.CommCtrl, Vcl.StdCtrls, uConst, System.Actions, Vcl.ActnList,
  uRunWinget,sListView,sPanel, sSpeedButton, Vcl.Buttons, System.ImageList, Vcl.ImgList, acAlphaImageList;

const
  aColWidths : array of Integer = [42,29,13,13,8];

type
  TfrmHeritee = class(TfrmBase)
    ListView1: TsListView;
    pnlUpgMain: TsPanel;
    pnlUpgSideBar: TsPanel;
    pnlUpgTopSide: TsPanel;
    pnlTitleToolBar: TsPanel;
    actlstUpgrade: TActionList;
    actSelectAll: TAction;
    actUpgrade: TAction;
    sbUgRun: TsSpeedButton;
    sbSelectAll: TsSpeedButton;
    sCharImageList1: TsCharImageList;
    procedure FrameResize(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actUpgradeExecute(Sender: TObject);
    procedure sbSelectAllClick(Sender: TObject);
    procedure sbUgRunClick(Sender: TObject);
  private
    { Déclarations privées }
    procedure removeItem(sId : String);
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
  bSelected := sbSelectAll.Tag = 0;
  if (sbSelectAll.tag = 0) then
  begin
     sbSelectAll.Tag := 1;
     sbSelectAll.Caption := 'Unselect All'+chr(13)+'(F5)';
     sbSelectAll.ImageIndex := 1;
  end
  else
  begin
     sbSelectAll.Tag := 0;
     sbSelectAll.Caption := 'Select All'+Chr(13)+'(F5)';
     sbSelectAll.ImageIndex := 0;
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
  fRunWinget : TfRunWinget;
  i : Integer;
  aWingetPackage: tWingetPackage;
begin
  inherited;
  fRunWinget := TfRunWinget.Create(self);
  i := 0;
  while i <= ListView1.Items.Count -1 do
  begin
    if (ListView1.Items[i].Data <> Nil) and (ListView1.Items[i].Checked) then
    begin
       aWingetPackage := tWingetPackage(ListView1.Items[i].Data);
       fRunWinget.addId(aWingetPackage.getField('id'));
    end;
    inc(i);
  end;
  fRunWinget.typeRun := ptUpgrade;
  fRunWinget.removeItem := removeitem;
  if fRunWinget.showModal = mrOk then
  begin

  end;
  fRunWinget.Free;
end;

procedure TfrmHeritee.FrameResize(Sender: TObject);
var
  listeView: TsListView;
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

procedure TfrmHeritee.removeItem(sId: String);
var
  i : Integer;
  aWingetPackage: tWingetPackage;
begin
    i := 0;
  while i <= ListView1.Items.Count -1 do
  begin
    if (ListView1.Items[i].Data <> Nil) and (ListView1.Items[i].Checked) then
    begin
       aWingetPackage := tWingetPackage(ListView1.Items[i].Data);
       if trim(aWingetPackage.getField('id')) = sId then
          listView1.Items.Delete(i);
    end;
    inc(i);
  end;

end;

procedure TfrmHeritee.sbSelectAllClick(Sender: TObject);
begin
  inherited;
  actSelectAllExecute(Sender)
end;

procedure TfrmHeritee.sbUgRunClick(Sender: TObject);
begin
  inherited;
  actUpgradeExecute(Sender);
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
