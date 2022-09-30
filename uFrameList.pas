unit uFrameList;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.CommCtrl, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrameBase, Vcl.ComCtrls, Vcl.ExtCtrls, uConst, Vcl.StdCtrls;

const
  aColWidths: array of Integer = [40, 31, 13, 13, 8];

type
  TfrmList = class(TfrmBase)
    listView1: TListView;
    pnlListMain: TPanel;
    pnlSideTB: TPanel;
    pnlUpgTopSide: TPanel;
    pnlFilterGroup: TPanel;
    lblFilter: TLabel;
    lblfltSource: TLabel;
    cbbSourceFilter: TComboBox;
    pnlTitleToolBar: TPanel;
    procedure FrameResize(Sender: TObject);
    procedure cbbSourceFilterChange(Sender: TObject);
  private
    procedure BuildFilter;
    { Déclarations privées }
  public
    { Déclarations publiques }
    aItems: tObjectList<tWingetPackage>;
    aFilterItems: tList;
    procedure init;
    procedure addItem(aItem: tWingetPackage);
    procedure ApplyFilter;
    procedure AddFilterCB(sFilter: string);
    Procedure InitFilterCB;
  end;

var
  frmList: TfrmList;

implementation

{$R *.dfm}

procedure TfrmList.AddFilterCB(sFilter: string);
begin
  if (cbbSourceFilter.Items.IndexOf(sFilter) = -1) then
    cbbSourceFilter.Items.Add(sFilter);
end;

procedure TfrmList.addItem(aItem: tWingetPackage);
begin
  aItems.Add(aItem);
end;

procedure TfrmList.ApplyFilter;
var
  aPack: tWingetPackage;
  aItem: TListItem;
  iCol: Integer;
  bAdd: boolean;
begin
  listView1.Items.BeginUpdate;

  listView1.Clear;
  aFilterItems.Clear;

  for aPack in aItems do
  begin
    bAdd := (cbbSourceFilter.ItemIndex = 0);
    if (cbbSourceFilter.ItemIndex > 0) then
    begin
      bAdd := (Trim(cbbSourceFilter.Text) = Trim(aPack.getField('source')));
    end;

    if bAdd then
    begin
      aItem := listView1.Items.Add;
      iCol := 0;
      while iCol <= length(aLstFields) - 1 do
      begin
        if (iCol = 0) then
        begin
          aItem.Caption := aPack.getField(aLstFields[iCol]);
        end
        else
        begin
          aItem.SubItems.Add(aPack.getField(aLstFields[iCol]));
        end;
        inc(iCol);
      end;
    end;
  end;

  listView1.Items.EndUpdate;
end;

procedure TfrmList.BuildFilter;
begin

end;

procedure TfrmList.cbbSourceFilterChange(Sender: TObject);
begin
  inherited;
  ApplyFilter;
end;

procedure TfrmList.FrameResize(Sender: TObject);
var
  listeView: TListView;
  columns: TListColumns;
  column: TListColumn;
  i: Integer;

  h: THandle;
  r: TRect;
begin

  listeView := listView1;
  h := ListView_GetHeader(listeView.Handle);
  GetWindowRect(h, r);
  pnlUpgTopSide.Height := (r.Bottom - r.Top);
  for i := 0 to listeView.columns.Count - 1 do
  begin
    column := listeView.columns[i];
    column.Width := listeView.Width div 100 * aColWidths[i];
  end;

end;

procedure TfrmList.init;
begin
  aItems := tObjectList<tWingetPackage>.Create();
  aFilterItems := tList.Create;
  InitFilterCB;
end;

procedure TfrmList.InitFilterCB;
begin
  cbbSourceFilter.Clear;
  cbbSourceFilter.Items.Add('All');
  cbbSourceFilter.ItemIndex := 0;
end;

end.
