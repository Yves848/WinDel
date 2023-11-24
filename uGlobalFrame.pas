unit uGlobalFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,  System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrameBase, sFrameAdapter, Vcl.StdCtrls,  uConst, Vcl.ExtCtrls, Vcl.Grids, sLabel, Vcl.Mask, sMaskEdit,
  sCustomComboEdit, sCurrEdit, sPanel, AdvObj, BaseGrid, AdvGrid,  Vcl.CheckLst;

type
  TfGlobalFrame = class(TfrmBase)
    sPanel1: TsPanel;
    sgPackages: TAdvStringGrid;
    sFrameAdapter1: TsFrameAdapter;
    sLabel1: TsLabel;
    sPanel2: TsPanel;
    procedure sgPackagesGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure sgPackagesCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
  private
    { Private declarations }
    procedure clearGrid;
  public
    { Public declarations }
    procedure init;
    procedure addItem(aItem: tWingetPackage);
  end;

var
  fGlobalFrame: TfGlobalFrame;
  aFilterItems: tList;
  aItems: tObjectList<tWingetPackage>;

implementation

{$R *.dfm}

{ TfGlobalFrame }

procedure TfGlobalFrame.addItem(aItem: tWingetPackage);
begin
  var i : integer := sgPackages.RowCount -1;
  if sgPackages.Objects[1,i] <> nil then
  begin
     inc(i);
     sgPackages.RowCount := sgPackages.RowCount + 1;
  end;
  sgPackages.Objects[1,i] := aItem;
  sgPackages.AddCheckBox(0,i,false,false);
  sgPackages.Cells[1,i] := aItem.getField('nom');
  sgPackages.Cells[2,i] := aItem.getField('id');
  sgPackages.Cells[3,i] := aItem.getField('version');
  sgPackages.Cells[4,i] := aItem.getField('disponible');
  sgPackages.Cells[5,i] := aItem.getField('source');
end;

procedure TfGlobalFrame.clearGrid;
begin
  var i : Integer := 1;
  while i <= sgPackages.RowCount -1 do
  begin
    if sgPackages.Objects[1,i] <> Nil then
      tWingetPackage(sgPackages.Objects[1,i]).Free;
    inc(i);
  end;
  sgPackages.RowCount := 2;

end;

procedure TfGlobalFrame.init;
begin
  clearGrid;
end;

procedure TfGlobalFrame.sgPackagesCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  CanEdit := (aCol = 0);
end;

procedure TfGlobalFrame.sgPackagesGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  inherited;
  if ACol=0 then
  begin
    AEditor := edCheckBox;
  end;

end;

initialization
  aItems := tObjectList<tWingetPackage>.Create();
  aFilterItems := tList.Create;

finalization
  aFilterItems.Clear;
  aFilterItems.Free;

end.

