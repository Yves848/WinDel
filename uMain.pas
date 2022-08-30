﻿unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Types, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.StrUtils, System.RegularExpressions, uConst, Vcl.CheckLst, SynEdit, DosCommand,
  Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls, uFrameUpgrade, uFrameBase;

type
  TArg<T> = reference to procedure(const Arg: T);

  TForm1 = class(TForm)
    ActivityIndicator1: TActivityIndicator;
    DosCommand1: TDosCommand;
    pnlToolbar: TPanel;
    pnlFooter: TPanel;
    pnlMain: TPanel;
    btnQuit: TBitBtn;
    btnSearch: TBitBtn;
    btn1: TBitBtn;
    btnUpgrade: TBitBtn;
    btnList: TBitBtn;
    procedure DosCommand1NewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
    procedure btnQuitClick(Sender: TObject);
    function DosCommand1CharDecoding(ASender: TObject; ABuf: TStream): string;
    procedure btn1Click(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btnUpgradeClick(Sender: TObject);
    procedure DosCommand1ExecuteError(ASender: TObject; AE: Exception; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    lOutPut: tStrings;
    lOutClean: tstrings;
    bClean: Boolean;
    aFrame : TfrmBase;
    procedure upgradeTerminated(Sender : tObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.btn1Click(Sender: TObject);
begin
  var i := 0;
  while i <= lListColumn.Count -1 do
  begin
    //Memo1.Lines.Add(tColumnClass(lListColumn.Objects[i]).sLabel);
    inc(i);
  end;

end;

procedure TForm1.btnOptionsClick(Sender: TObject);
begin
  bClean := False;
  lOutPut := tStringList.Create;
  //Memo1.Clear;
  ActivityIndicator1.Animate := True;
  DosCommand1.CommandLine := 'winget list';
  DosCommand1.Execute;
end;

procedure TForm1.btnQuitClick(Sender: TObject);
begin
  Close;
end;


procedure TForm1.btnUpgradeClick(Sender: TObject);
begin
  if aFrame <> Nil then
    aFrame.Free;

  aFrame := TframeUpgrade.Create(pnlMain);
  aFrame.Parent := pnlMain;
  aFrame.Align := alClient;

  bClean := False;
  lOutPut := tStringList.Create;
  lOutClean := tStringList.Create;
  //Memo1.Clear;
  //ActivityIndicator1.Animate := True;
  DosCommand1.OnTerminated := upgradeTerminated;
  DosCommand1.CommandLine := 'winget upgrade';
  DosCommand1.Execute;


end;

function TForm1.DosCommand1CharDecoding(ASender: TObject;  ABuf: TStream): string;
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

procedure TForm1.DosCommand1ExecuteError(ASender: TObject; AE: Exception; var AHandled: Boolean);
begin
  aHandled := True;
end;

procedure TForm1.DosCommand1NewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
var
  list: TStringDynArray;
  sHeaders: string;
begin

  lOutPut.Add(ANewLine);
  if TRegEx.IsMatch(ANewLine, '----') then
  begin
    bClean := True;
    sHeaders := lOutPut[lOutPut.Count - 2];
    makeUpgradeDictonary(sHeaders);
  end
  else
    if bClean then
      lOutClean.Add(ANewLine);

end;

procedure TForm1.upgradeTerminated(Sender: tObject);
var
  i : Integer;
  liste : TListItems;
  item : tListItem;
  sLine : String;
  sString : String;
  aColumn : tColumnClass;
begin
  i := 0;
  liste := TframeUpgrade(aFrame).ListView1.Items;
  while i <= lOutClean.Count -2 do
  begin
      sLine := lOutClean[i];
      item := liste.Add;
      aColumn := tcolumnClass(lListColumn.Objects[0]);
      item.Caption := copy(sLine, aColumn.iPos, aColumn.iLen);
      aColumn := tcolumnClass(lListColumn.Objects[1]);
      sString := copy(sLine, aColumn.iPos, aColumn.iLen);
      item.SubItems.Add(sString);
      aColumn := tcolumnClass(lListColumn.Objects[2]);
      sString := copy(sLine, aColumn.iPos, aColumn.iLen);
      item.SubItems.Add(sString);
      aColumn := tcolumnClass(lListColumn.Objects[3]);
      sString := copy(sLine, aColumn.iPos, aColumn.iLen);
      item.SubItems.Add(sString);
      aColumn := tcolumnClass(lListColumn.Objects[4]);
      sString := copy(sLine, aColumn.iPos, aColumn.iLen);
      item.SubItems.Add(sString);
      inc(i);
  end;
end;

end.
