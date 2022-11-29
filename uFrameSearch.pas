unit uFrameSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Winapi.CommCtrl, System.RegularExpressions,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrameBase, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, DosCommand, uConst, Vcl.WinXCtrls, uRunwinget,
  sListView,
  sEdit, sPanel, sFrameAdapter, Vcl.Buttons, sSpeedButton, System.ImageList, Vcl.ImgList, acAlphaImageList, System.Actions, Vcl.ActnList;

const
  aColWidths: array of Integer = [40, 31, 13, 13, 8];

type
  TfrmSearch = class(TfrmBase)
    pnlSearchMain: TsPanel;
    pnlSearchEdit: TsPanel;
    ListView1: TsListView;
    pnlUpgSideBar: TsPanel;
    dcSearch1: TDosCommand;
    pnlTitleToolBar: TsPanel;
    edtPackageName: TsEdit;
    sFrameAdapter1: TsFrameAdapter;
    sCharImageList1: TsCharImageList;
    ActionList1: TActionList;
    InstallSelected: TAction;
    sPanel1: TsPanel;
    lvInstall: TsListView;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    sbInstallRun: TsSpeedButton;
    sbAddtoSelection: TsSpeedButton;
    sbRemovefromSelection: TsSpeedButton;
    btnLaunch: TsSpeedButton;
    AddChecked: TAction;
    RemoveSelected: TAction;
    procedure FrameResize(Sender: TObject);
    procedure btnLaunchClick(Sender: TObject);
    function dcSearch1CharDecoding(ASender: TObject; ABuf: TStream): string;
    procedure dcSearch1NewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
    procedure edtPackageNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure InstallSelectedExecute(Sender: TObject);
    procedure btnInstallRunClick(Sender: TObject);
    procedure sbAddtoSelectionClick(Sender: TObject);
    procedure AddCheckedExecute(Sender: TObject);
    procedure RemoveSelectedExecute(Sender: TObject);
  private
    { Déclarations privées }
    function makeSearchList: tStrings;
  public
    { Déclarations publiques }
    lOutPut: tStrings;
    ActivitySet: tActivitySet;
    procedure init;
    procedure searchTerminated(Sender: TObject);
    procedure removeItem(sId : string);

  end;

var
  frmSearch: TfrmSearch;

implementation

{$R *.dfm}

procedure TfrmSearch.InstallSelectedExecute(Sender: TObject);
var
  fRunWinget: TfRunWinget;
  i: Integer;
  aWingetPackage: tWingetPackage;
begin
  inherited;
  fRunWinget := TfRunWinget.Create(self);
  i := 0;
  while i <= lvInstall.Items.Count - 1 do
  begin
    if (lvInstall.Items[i].Data <> Nil) and (lvInstall.Items[i].Checked) then
    begin
      aWingetPackage := tWingetPackage(lvInstall.Items[i].Data);
      fRunWinget.addId(aWingetPackage.getField('id'));
    end;
    inc(i);
  end;
  fRunWinget.typeRun := ptInstall;
  fRunWinget.removeItem := removeitem;
  if fRunWinget.showModal = mrOk then
  begin
    ListView1.Clear;
  end;
  fRunWinget.Free;

end;

procedure TfrmSearch.AddCheckedExecute(Sender: TObject);
var
  i, iCol: Integer;
  aWingetPackage: tWingetPackage;
  aInstallPackage: tWingetPackage;
  liste: TListItems;
  Item: TListItem;
begin
  inherited;
  i := 0;
  liste := lvInstall.Items;
  while i <= ListView1.Items.Count - 1 do
  begin
    if (ListView1.Items[i].Data <> Nil) and (ListView1.Items[i].Checked) then
    begin
      aWingetPackage := tWingetPackage(ListView1.Items[i].Data);
      aInstallPackage := tWingetPackage.Create(aWingetPackage);
      Item := liste.Add;
      Item.Data := aWingetPackage;
      iCol := 0;
      while iCol <= length(aUpgFields) - 1 do
      begin
        if (iCol = 0) then
        begin
          Item.Caption := aWingetPackage.getField(aSearchFields[iCol]);
        end
        else
        begin
          Item.SubItems.Add(aWingetPackage.getField(aSearchFields[iCol]));
        end;
        Item.Checked := true;
        inc(iCol);
      end;
    end;
    inc(i);
  end;
  edtPackageName.Text := '';
  edtPackageName.SetFocus;
end;

procedure TfrmSearch.btnInstallRunClick(Sender: TObject);
begin
  inherited;
  InstallSelectedExecute(Sender);
end;

procedure TfrmSearch.btnLaunchClick(Sender: TObject);
begin
  // Launch Search
  ActivitySet(True);
  lOutPut.Clear;
  dcSearch1.CommandLine := tWingetcommand.Search(edtPackageName.Text);
  dcSearch1.OnTerminated := searchTerminated;
  dcSearch1.Execute;
end;

function TfrmSearch.dcSearch1CharDecoding(ASender: TObject; ABuf: TStream): string;
var
  pBytes: TBytes;
  iLength: Integer;
begin
  iLength := ABuf.Size;
  if iLength > 0 then
  begin
    SetLength(pBytes, iLength);
    ABuf.Read(pBytes, iLength);
    try
      result := tEncoding.UTF8.GetString(pBytes)
    except
      result := '';
    end;
  end
  else
    result := '';

end;

procedure TfrmSearch.dcSearch1NewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
begin
  lOutPut.Add(ANewLine);
end;

procedure TfrmSearch.edtPackageNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

begin
  if Key = VK_RETURN then
  begin
    removekey;
    btnLaunchClick(Sender);

  end;

end;

procedure TfrmSearch.FrameResize(Sender: TObject);
var
  listeView: TsListView;
  columns: TListColumns;
  column: TListColumn;
  i: Integer;

  h: THandle;
  r: TRect;
begin
  listeView := ListView1;
  h := ListView_GetHeader(listeView.Handle);
  GetWindowRect(h, r);
  // pnlUpgTopSide.Height := (r.Bottom - r.Top);
  for i := 0 to listeView.columns.Count - 1 do
  begin
    column := listeView.columns[i];
    column.Width := listeView.Width div 100 * aColWidths[i];
  end;
  for i := 0 to lvInstall.columns.Count - 1 do
  begin
    column := lvInstall.columns[i];
    column.Width := lvInstall.Width div 100 * aColWidths[i];
  end;

end;

procedure TfrmSearch.init;
begin
  lOutPut := tStringList.Create;
  edtPackageName.SetFocus;
end;

procedure TfrmSearch.sbAddtoSelectionClick(Sender: TObject);
begin
  inherited;
  // Add checked items to selection
  AddCheckedExecute(Sender);
end;

procedure TfrmSearch.searchTerminated(Sender: TObject);
var
  i, iCol: Integer;
  liste: TListItems;
  Item: TListItem;
  sLine: string;
  sString: string;
  aColumn: tColumnClass;
  lOutClean: tStrings;
  aWingetPackage: tWingetPackage;
begin
  i := 0;
  lOutClean := makeSearchList;
  liste := ListView1.Items;
  liste.BeginUpdate;
  liste.Clear;
  while i <= lOutClean.Count - 1 do
  begin
    sLine := lOutClean[i];
    aWingetPackage := tWingetPackage.Create(sLine, ptSearch);
    Item := liste.Add;
    Item.Data := aWingetPackage;
    iCol := 0;
    while iCol <= length(aUpgFields) - 1 do
    begin
      if (iCol = 0) then
      begin
        Item.Caption := aWingetPackage.getField(aSearchFields[iCol]);
      end
      else
      begin
        Item.SubItems.Add(aWingetPackage.getField(aSearchFields[iCol]));
      end;
      inc(iCol);
    end;
    inc(i);
  end;
  liste.EndUpdate;
  ActivitySet(False);
  ListView1.ItemIndex := 0;
  ListView1.SetFocus;
end;

function TfrmSearch.makeSearchList: tStrings;
var
  sHeaders: string;
  ANewLine: string;
  iLine: Integer;
  bClean: Boolean;
begin
  result := tStringList.Create;
  iLine := 0;
  bClean := False;
  while iLine <= lOutPut.Count - 1 do
  begin
    ANewLine := lOutPut[iLine];
    if not bClean then
    begin
      if TRegEx.IsMatch(ANewLine, '----') then
      begin
        bClean := True;
        sHeaders := lOutPut[iLine - 1];
        makeUpgradeDictonary(sHeaders);
      end
    end
    else
      result.Add(ANewLine);
    inc(iLine);
  end;
end;

procedure TfrmSearch.removeItem(sId: string);
var
  i : Integer;
  aWingetPackage: tWingetPackage;
begin
    i := 0;
  while i <= Lvinstall.Items.Count -1 do
  begin
    if (Lvinstall.Items[i].Data <> Nil) and (Lvinstall.Items[i].Checked) then
    begin
       aWingetPackage := tWingetPackage(Lvinstall.Items[i].Data);
       if trim(aWingetPackage.getField('id')) = sId then
          lvinstall.Items.Delete(i);
    end;
    inc(i);
  end;
end;

procedure TfrmSearch.RemoveSelectedExecute(Sender: TObject);
begin
  inherited;
  if lvInstall.Focused then
  begin
    lvInstall.DeleteSelected; 
  end;
end;

end.
