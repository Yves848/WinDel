unit uConst;

interface

uses
  System.Generics.Collections, System.Types, System.strUtils, System.SysUtils, System.Classes,   winapi.Windows, winapi.Messages;

const
  aUpgFields: TArray<String> = ['nom', 'id', 'version', 'disponible', 'source'];
  aLstFields: TArray<String> = ['nom', 'id', 'version', 'disponible', 'source'];
  aSearchFields: TArray<String> = ['nom', 'id', 'version', 'corresp.', 'source'];

  WM_GETWINGETVERSION = WM_USER + 2001;
  WM_STARTSEARCH = WM_GETWINGETVERSION + 1;

type
  tPackageType = (ptInstall, ptUpgrade, ptSearch, ptList);

  tWingetcommand = class
    class function Install(sId: String): String;
    class function Upgrade: String;
    class Function List: String;
    class function Search(sText: String): String;
    class function version : String;
  end;

  tColumnClass = class
  public
    sLabel: String;
    iPos: integer;
    iLen: integer;
    constructor create(aPos1, aLen: integer);
  end;

  tWingetPackage = Class
  private
    fFields : TArray<String>;
    fType: tPackageType;
    dFields: TDictionary<string, string>;
    procedure makeFields(sLine: String);
    procedure makeListFields(sLine: String);
  public
    property Fields : TArray<String> read fFields write fFields;
    constructor create(sLine: String; sType: tPackageType);
    function getField(sField: string): String;
    function getAllFields: TStrings;
  End;

var
  lListColumn: TStrings;
  dCommands: TDictionary<string, string>;

procedure makeUpgradeDictonary(sLine: String);
procedure removekey;

implementation

procedure removekey;
var
  Mgs: TMsg;
begin
  PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
end;

procedure makeUpgradeDictonary(sLine: String);
var
  iLen: integer;
  pColumn: tColumnClass;
  lHeaders: TStringDynArray;
  lsHeaders: tStringList;
  i: integer;
  iPos1, iPos2 : Integer;
  iPosCol, iLenCol : Integer;
  key : String;
begin
  lHeaders := SplitString(sLine, ' ');
  i := 0;
  lsHeaders := tStringList.create;
  lsHeaders.AddStrings(lHeaders);
  while i <= lsHeaders.Count - 1 do
  begin
    if trim(lsHeaders[i]) = '' then
    begin
      lsHeaders.Delete(i);
    end
    else
      inc(i);
  end;

  lListColumn := tStringList.create;
  i := 0;
  repeat
    if (trim(lsHeaders[i]) <> '') then
    begin
      key := lsHeaders[i];
      iPosCol := pos(key, sLine);
      iLenCol := 0;
      pColumn := tColumnClass.create(iPosCol, iLenCol);
      pColumn.sLabel := key;
      lListColumn.AddObject(key, pColumn)
    end;
    inc(i);
  until i > lsHeaders.Count - 1;

  i := 0;
  repeat
    if i < lListColumn.Count - 1 then
    begin
      iPos1 := tColumnClass(lListColumn.Objects[i]).iPos;
      iPos2 := tColumnClass(lListColumn.Objects[i + 1]).iPos;
      tColumnClass(lListColumn.Objects[i]).iLen := iPos2 - iPos1;
    end
    else
    begin
      iPos1 := tColumnClass(lListColumn.Objects[i]).iPos;
      tColumnClass(lListColumn.Objects[i]).iLen := (length(sLine) - iPos1) + 1
    end;
    inc(i);
  until i > lsHeaders.Count - 1;
end;

{ tColumnClass }

constructor tColumnClass.create(aPos1, aLen: integer);
begin
  iPos := aPos1;
  iLen := aLen;
end;

{ tWingetPackage }

constructor tWingetPackage.create(sLine: String; sType: tPackageType);
var
  aColumn: tColumnClass;
begin
  fType := sType;
  dFields := TDictionary<String, String>.create();
  case sType of
    ptInstall:
      begin
      end;
    ptUpgrade:
      begin
        Fields := aUpgFields;
      end;
    ptSearch:
      begin
        Fields := aSearchFields;
      end;
    ptList:
      begin
        Fields := aLstFields;
      end;
  end;
  makeFields(sLine);
end;

{ tCommandClass }

class function tWingetcommand.Install(sId: String): String;
begin
  dCommands.TryGetValue('install', result);
  result := format(result, [sId]);
end;

class function tWingetcommand.List: String;
begin
  dCommands.TryGetValue('list', result);
end;

class function tWingetcommand.Search(sText: String): String;
begin
  dCommands.TryGetValue('search', result);
  result := format(result, [sText]);
end;

class function tWingetcommand.Upgrade: String;
begin
  dCommands.TryGetValue('upgrade', result);
end;

class function tWingetcommand.version: String;
begin
  dCommands.TryGetValue('version', result);
end;

function tWingetPackage.getAllFields: TStrings;
var
  sField: String;
begin
  result := tStringList.create;
  for sField in aUpgFields do
  begin
    result.add(getField(sField));
  end;
end;

function tWingetPackage.getField(sField: string): String;
begin
  if not dFields.TryGetValue(sField, result) then
    result := 'N/A';

end;

procedure tWingetPackage.makeFields(sLine: String);
var
  aColumn: tColumnClass;
  iCol: integer;
begin
  iCol := 0;
  while iCol <= lListColumn.Count - 1 do
  begin
    aColumn := tColumnClass(lListColumn.Objects[iCol]);
    dFields.add(Fields[iCol], copy(sLine, aColumn.iPos, aColumn.iLen));
    inc(iCol);
  end;
end;

procedure tWingetPackage.makeListFields(sLine: String);
begin

end;

initialization

dCommands := TDictionary<string, string>.create();
dCommands.add('list', 'winget list');
dCommands.add('upgrade', 'winget upgrade --include-unknown');
dCommands.add('search', 'winget search "%s"');
dCommands.add('install', 'winget install --id "%s"');
dCommands.add('uninstall', 'winget uninstall --id "%s"');
dCommands.Add('version','winget --version');

Finalization

dCommands.Clear;
dCommands.Free;

end.
