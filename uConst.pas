unit uConst;

interface

uses
  System.Generics.Collections,
  System.Types,
  System.strUtils,
  System.SysUtils,
  System.Classes,
  winapi.Windows,
  winapi.Messages,
  vcl.ComCtrls,
  sListView;

const

  aLstWidths: TArray<Integer> = [46, 38, 13, 8];
  aLstFields: TArray<String> = ['nom', 'id', 'version', 'source'];
  aUpdWidths : TArray<Integer> = [40, 31, 13, 13, 8] ;
  aUpgFields: TArray<String> = ['nom', 'id', 'version', 'disponible', 'source'];
  aSearchFields: TArray<String> = ['nom', 'id', 'version', 'corresp.', 'source'];

  aColListLibs : TArray<string> = ['Description', 'Id', 'Version', 'Source'];
  aColUpdLibs : TArray<string> = ['Description', 'Id', 'Version', 'Available','Source'];

  sRunUpdate = 'winget upgrade --id %s';
  sRunInstall = 'winget install --id %s --force';

  WM_GETWINGETVERSION = WM_USER + 2001;
  WM_STARTSEARCH = WM_GETWINGETVERSION + 1;
  WM_STARTLIST = WM_STARTSEARCH + 1;
  WM_RUNNEXT = WM_STARTLIST + 1;
  WM_CLOSERUNEXT = WM_RUNNEXT + 1;
  WM_FRAMERESIZE = WM_CLOSERUNEXT +1;

type
  tPackageType = (ptInstall, ptUpgrade, ptSearch, ptList, ptUninstall);
  tActivitySet = procedure(bActive: Boolean) of object;
  tRemoveItem = procedure(sID: string) of object;

  tGridConfig = class
    class procedure MakeColumns(psLV : tsListView);
  end;

  tWingetcommand = class
    class function Install(sID: String): String;
    class function Upgrade: String;
    class Function List: String;
    class function Search(sText: String): String;
    class function version: String;
    class function UnInstall(sID: String): String;
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
    fFields: TArray<String>;
    fType: tPackageType;
    fLine: string;
    dFields: TDictionary<string, string>;
    procedure makeFields(sLine: String);
    procedure makeListFields(sLine: String);
  published
    property Line: String read fLine;
    property PackageType : tPackageType read fType;
  public
    property Fields: TArray<String> read fFields write fFields;
    constructor create(sLine: String; sType: tPackageType); overload;
    constructor create(pWingetPackage: tWingetPackage); overload;
    function getField(sField: string): String;
    function getAllFields: TStrings;

  End;

var
  lListColumn: TStrings;
  wgCommands: TDictionary<string, string>;

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
  iPos1, iPos2: integer;
  iPosCol, iLenCol: integer;
  key: String;
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

  if lListColumn <> Nil then
    FreeAndNil(lListColumn);

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
      lListColumn.AddObject(key, pColumn);
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
  fLine := sLine;
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
        if lListColumn.Count = 4 then
           Fields := aLstFields
        else
           Fields := aUpgFields;
      end;
  end;
  makeFields(sLine);
  case sType of
    ptInstall:
      ;
    ptUpgrade:
      ;
    ptSearch:
      begin
        dFields.Remove('source');
        dFields.Add('source', 'Winget');
      end;

    ptList:
      begin

      end;
  end;
end;

{ tCommandClass }

class function tWingetcommand.Install(sID: String): String;
begin
  wgCommands.TryGetValue('install', result);
  result := format(result, [sID]);
end;

class function tWingetcommand.List: String;
begin
  wgCommands.TryGetValue('list', result);
end;

class function tWingetcommand.Search(sText: String): String;
begin
  wgCommands.TryGetValue('search', result);
  result := format(result, [sText]);
end;

class function tWingetcommand.UnInstall(sID: String): String;
begin
  wgCommands.TryGetValue('uninstall', result);
  result := format(result, [sID]);
end;

class function tWingetcommand.Upgrade: String;
begin
  wgCommands.TryGetValue('upgrade', result);
end;

class function tWingetcommand.version: String;
begin
  wgCommands.TryGetValue('version', result);
end;

constructor tWingetPackage.create(pWingetPackage: tWingetPackage);
begin
  //
  create(pWingetPackage.Line, pWingetPackage.PackageType);
end;

function tWingetPackage.getAllFields: TStrings;
var
  sField: String;
begin
  result := tStringList.create;
  for sField in aUpgFields do
  begin
    result.Add(getField(sField));
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
    dFields.Add(Fields[iCol], copy(sLine, aColumn.iPos, aColumn.iLen));
    inc(iCol);
  end;
end;

procedure tWingetPackage.makeListFields(sLine: String);
begin

end;

{ tGridConfig }

class procedure tGridConfig.MakeColumns(psLV : tsListView);
var
  aColumn : TListColumn;
  i : Integer;
  aTitles : TArray<String>;
  Procedure cc(sTitle : String; iWidth : Integer);
  begin
      aColumn := psLV.Columns.Add;
      aColumn.Caption := sTitle;
      aColumn.Width := iWidth;
      aColumn.AutoSize := False;
  end;
begin
   psLV.Columns.Clear;
   if lListColumn.Count = 4 then
   begin
      for I := 0 to length(aLstWidths) -1 do
      begin
          cc(aColListLibs[i], aLstWidths[i]);
      end;

   end
   else
   begin
      for I := 0 to length(aUpdWidths) -1 do
      begin
          cc(aColUpdLibs[i],aUpdWidths[i]);
      end;
   end;
end;

initialization

wgCommands := TDictionary<string, string>.create();
wgCommands.Add('list', 'winget list --accept-source-agreements');
wgCommands.Add('upgrade', 'winget upgrade --include-unknown');
wgCommands.Add('search', 'winget search "%s" --source winget');
wgCommands.Add('install', 'winget install --id "%s"');
wgCommands.Add('uninstall', 'winget uninstall --id "%s"');
wgCommands.Add('version', 'winget --version');

Finalization

wgCommands.Clear;
wgCommands.Free;

end.
