unit uFrameSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Winapi.CommCtrl, System.RegularExpressions,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrameBase, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, DosCommand, uConst, Vcl.WinXCtrls, uRunwinget, sListView,
  sEdit, sPanel, sFrameAdapter, Vcl.Buttons, sSpeedButton, System.ImageList, Vcl.ImgList, acAlphaImageList, System.Actions, Vcl.ActnList;

const
  aColWidths: array of Integer = [40, 31, 13, 13, 8];

type
  TfrmSearch = class(TfrmBase)
    pnlSearchMain: TsPanel;
    pnlSearchEdit: TsPanel;
    ListView1: TsListView;
    pnlUpgSideBar: TsPanel;
    pnlUpgTopSide: TsPanel;
    btnLaunch: TButton;
    dcSearch1: TDosCommand;
    pnlTitleToolBar: TsPanel;
    edtPackageName: TsEdit;
    sFrameAdapter1: TsFrameAdapter;
    btnInstallRun: TsSpeedButton;
    sCharImageList1: TsCharImageList;
    ActionList1: TActionList;
    InstallSelected: TAction;
    procedure FrameResize(Sender: TObject);
    procedure btnLaunchClick(Sender: TObject);
    function dcSearch1CharDecoding(ASender: TObject; ABuf: TStream): string;
    procedure dcSearch1NewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
    procedure edtPackageNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure InstallSelectedExecute(Sender: TObject);
    procedure btnInstallRunClick(Sender: TObject);
  private
    { Déclarations privées }
    function makeSearchList: tStrings;
  public
    { Déclarations publiques }
    lOutPut: tStrings;
    ActivitySet : tActivitySet;
    procedure init;
    procedure searchTerminated(Sender: TObject);

  end;

var
  frmSearch: TfrmSearch;

implementation

{$R *.dfm}

procedure TfrmSearch.InstallSelectedExecute(Sender: TObject);
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
  fRunWinget.typeRun := ptInstall;
  fRunWinget.showModal;
  fRunWinget.Free;

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
  dcSearch1.CommandLine := tWingetcommand.Search(edtPackageName.text);
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
  if key = VK_RETURN then
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
  pnlUpgTopSide.Height := (r.Bottom - r.Top);
  for i := 0 to listeView.columns.Count - 1 do
  begin
    column := listeView.columns[i];
    column.Width := listeView.Width div 100 * aColWidths[i];
  end;

end;

procedure TfrmSearch.init;
begin
  lOutPut := tStringList.Create;
  edtPackageName.SetFocus;
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

end.
