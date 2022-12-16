unit uConst;

interface

uses
  System.Generics.Collections,
  System.JSON,
  System.Types,
  System.strUtils,
  System.SysUtils,
  System.Classes,
  System.IOUtils,
  System.Win.Registry,
  winapi.Windows,
  winapi.Messages,
  vcl.ComCtrls,
  sListView;

const

  aLstWidths: TArray<Integer> = [46, 38, 13, 8];
  aLstFields: TArray<String> = ['nom', 'id', 'version', 'source'];
  aUpdWidths: TArray<Integer> = [40, 31, 13, 13, 8];
  aUpgFields: TArray<String> = ['nom', 'id', 'version', 'disponible', 'source'];
  aSearchFields: TArray<String> = ['nom', 'id', 'version', 'corresp.', 'source'];

  aColListLibs: TArray<string> = ['Description', 'Id', 'Version', 'Source'];
  aColUpdLibs: TArray<string> = ['Description', 'Id', 'Version', 'Available', 'Source'];

  // sRunUpdate = 'winget upgrade --id %s';
  // sRunInstall = 'winget install --id %s --force';

  WM_GETWINGETVERSION = WM_USER + 2001;
  WM_STARTSEARCH = WM_GETWINGETVERSION + 1;
  WM_STARTLIST = WM_STARTSEARCH + 1;
  WM_RUNNEXT = WM_STARTLIST + 1;
  WM_CLOSERUNEXT = WM_RUNNEXT + 1;
  WM_FRAMERESIZE = WM_CLOSERUNEXT + 1;

type
  tPackageType = (ptInstall, ptUpgrade, ptSearch, ptList, ptUninstall);
  tActivitySet = procedure(bActive: Boolean) of object;
  tRemoveItem = procedure(sID: string) of object;

  tGridConfig = class
    class procedure MakeColumns(psLV: tsListView);
  end;

  tWingetcommand = class
    class function Install(sID: String): String;
    class function Upgrade: String;
    class function upgradePKG(sID: String): String;
    class Function List: String;
    class function Search(sText: String): String;
    class function version: String;
    class function UnInstall(sID: String): String;
  end;

  tColumnClass = class
  public
    sLabel: String;
    iPos: Integer;
    iLen: Integer;
    constructor create(aPos1, aLen: Integer);
  end;

  tParams = class
  private
    fJSON: TJSONObject;
    fConfigPath: string;
    fStartMinimized : Boolean;
    fAutoCheckUpdates : Boolean;
    fCheckUpateInterval : Integer;
    procedure initParams;
    procedure makeConfigPath;
    function ConfigExists: Boolean;
  public
    procedure loadParams;
    procedure saveParams;

    function getParamb(sParam: string): Boolean;
    function getParams(sParam: string): String;
    function getParamI(sParam: Integer): Integer;
    procedure SetParamb(sParam: string; bValue: Boolean);
    procedure SetParams(sParam: string; sValue: String);
    procedure setParamI(sParam : string; iVaue : Integer);
    property StartMinimized: Boolean  read fStartMinimized;
    Property AutoCheckUpdatees : Boolean read fAutoCheckupdates;
    Property CheckUpdatesInterval : Integer read fCheckUpateInterval;
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
    property PackageType: tPackageType read fType;
  public
    property Fields: TArray<String> read fFields write fFields;
    constructor create(sLine: String; sType: tPackageType); overload;
    constructor create(pWingetPackage: tWingetPackage); overload;
    function getField(sField: string): String;
    function getAllFields: TStrings;
  End;

var
  lListColumn: TStrings;
  lListUpdates:  TObjectList<tWingetPackage>;
  wgCommands: TDictionary<string, string>;
  pParams: tParams;

procedure makeUpgradeDictonary(sLine: String);
procedure removekey;
function CurrentUserName: String;
procedure RunOnStartup(sProgTitle, sCmdLine: string; bRunOnce: Boolean);
procedure RemoveOnStartup(sProgTitle: string);

implementation

procedure RunOnStartup(sProgTitle, sCmdLine: string; bRunOnce: Boolean);
var
  sKey: string;
  reg: TRegIniFile;
begin
  if (bRunOnce) then
    sKey := 'Once'
  else
    sKey := '';

  reg := TRegIniFile.create('');
  reg.RootKey := HKEY_CURRENT_USER;
  reg.WriteString('\Software\Microsoft\Windows\CurrentVersion\Run' + sKey + #0, sProgTitle, sCmdLine);
  reg.Free;
end;

procedure RemoveOnStartup(sProgTitle: string);
var
  sKey: string;
  reg: TRegIniFile;
begin
  reg := TRegIniFile.create('');
  reg.RootKey := HKEY_CURRENT_USER;
  reg.DeleteKey('\Software\Microsoft\Windows\CurrentVersion\Run', sProgTitle);
  reg.Free;
end;

function CurrentUserName: String;
var
  u: array [0 .. 127] of Char;
  sz: DWord;
begin
  sz := SizeOf(u);
  GetUserName(u, sz);
  Result := u;
end;

procedure removekey;
var
  Mgs: TMsg;
begin
  PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE);
end;

procedure makeUpgradeDictonary(sLine: String);
var
  iLen: Integer;
  pColumn: tColumnClass;
  lHeaders: TStringDynArray;
  lsHeaders: tStringList;
  i: Integer;
  iPos1, iPos2: Integer;
  iPosCol, iLenCol: Integer;
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

constructor tColumnClass.create(aPos1, aLen: Integer);
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
  wgCommands.TryGetValue('install', Result);
  Result := format(Result, [sID]);
end;

class function tWingetcommand.List: String;
begin
  wgCommands.TryGetValue('list', Result);
end;

class function tWingetcommand.Search(sText: String): String;
begin
  wgCommands.TryGetValue('search', Result);
  Result := format(Result, [sText]);
end;

class function tWingetcommand.UnInstall(sID: String): String;
begin
  wgCommands.TryGetValue('uninstall', Result);
  Result := format(Result, [sID]);
end;

class function tWingetcommand.Upgrade: String;
begin
  wgCommands.TryGetValue('upgrade', Result);
end;

class function tWingetcommand.upgradePKG(sID: String): String;
begin
  wgCommands.TryGetValue('upgradePKG', Result);
  Result := format(Result, [sID]);
end;

class function tWingetcommand.version: String;
begin
  wgCommands.TryGetValue('version', Result);
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
  Result := tStringList.create;
  for sField in aUpgFields do
  begin
    Result.Add(getField(sField));
  end;
end;

function tWingetPackage.getField(sField: string): String;
begin
  if not dFields.TryGetValue(sField, Result) then
    Result := 'N/A';

end;

procedure tWingetPackage.makeFields(sLine: String);
var
  aColumn: tColumnClass;
  iCol: Integer;
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

class procedure tGridConfig.MakeColumns(psLV: tsListView);
var
  aColumn: TListColumn;
  i: Integer;
  aTitles: TArray<String>;
  Procedure cc(sTitle: String; iWidth: Integer);
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
    for i := 0 to length(aLstWidths) - 1 do
    begin
      cc(aColListLibs[i], aLstWidths[i]);
    end;

  end
  else
  begin
    for i := 0 to length(aUpdWidths) - 1 do
    begin
      cc(aColUpdLibs[i], aUpdWidths[i]);
    end;
  end;
end;

{ tParams }

function tParams.ConfigExists: Boolean;
var
  sConfigFile: String;
begin
  makeConfigPath;
  sConfigFile := TPath.Combine(fConfigPath, 'params.json');
  Result := FileExists(sConfigFile);
end;

function tParams.getParamb(sParam: string): Boolean;
var
  bValue : Boolean;
begin
  Result := False;
  if fJSON.TryGetValue<Boolean>(sParam, bValue) then
  result := bValue;
end;

function tParams.getParamI(sParam: Integer): Integer;
begin

end;

function tParams.getParams(sParam: string): String;
begin

end;

procedure tParams.initParams;
var
  sConfigFile: String;
  jAutoUpd : TJSONObject;
begin
  sConfigFile := TPath.Combine(fConfigPath, 'params.json');
  fJSON := TJSONObject.create;
  fJSON.AddPair('StartMinimized', tJSONBool.Create(False));
  fJSON.AddPair('RunOnStartUp', TJSONBool.Create(False));
  jAutoUpd := TJSONObject.Create;
  jAutoUpd.AddPair('RunAutoUpdCheck',TJSONBool.Create(False));
  jAutoUpd.AddPair('Interval',TJSONNumber.Create(30));
  fJSON.addpair('CheckUpdates',jAutoUpd);
  TFile.WriteAllText(sConfigFile, fJSON.ToJSON);
end;

procedure tParams.loadParams;
var
  sConfigFile: String;
begin
  if ConfigExists then
  begin
    sConfigFile := TPath.Combine(fConfigPath, 'params.json');
    fJSON := TJSONObject.create;
    fJSON := TJSONObject(fJSON.ParseJSONValue(TFile.ReadAllText(sConfigFile, TEncoding.UTF8)));
  end
  else
    initParams;

  // Load param variables.
end;

procedure tParams.makeConfigPath;
var
  sUser: string;
  sPAth: String;
begin
  sUser := CurrentUserName;
  sPAth := TPath.Combine('c:\users\', sUser);
  sPAth := TPath.Combine(sPAth, '.config\WingetHelper');
  if not tDirectory.Exists(sPAth) then
    ForceDirectories(sPAth);
  fConfigPath := sPAth;
end;

procedure tParams.saveParams;
var
  sConfigFile: String;
begin
  sConfigFile := TPath.Combine(fConfigPath, 'params.json');
  TFile.WriteAllText(sConfigFile, fJSON.ToJSON);

end;

procedure tParams.SetParamb(sParam: string; bValue: Boolean);
var
  jsPair: tJSONPair;
begin
  jspair := fJSON.Get(sParam);
  if assigned(jsPair) then begin
    fJSON.RemovePair(sParam)
  end;
  fJSON.AddPair(sPAram, TJSONBool.Create(bValue));
end;

procedure tParams.setParamI(sParam: string; iVaue: Integer);
begin

end;

procedure tParams.SetParams(sParam, sValue: String);
begin

end;

initialization

wgCommands := TDictionary<string, string>.create();
wgCommands.Add('list', 'winget list --accept-source-agreements');
wgCommands.Add('upgrade', 'winget upgrade --include-unknown');
wgCommands.Add('upgradePKG', 'winget upgrade  --id "%s"');
wgCommands.Add('search', 'winget search "%s" --source winget');
wgCommands.Add('install', 'winget install --id "%s"');
wgCommands.Add('uninstall', 'winget uninstall --id "%s"');
wgCommands.Add('version', 'winget --version');
pParams := tParams.create;
lListUpdates := TObjectList<tWingetPackage>.create;

Finalization

wgCommands.Clear;
wgCommands.Free;
pParams.Free;
lListUpdates.Free;

end.
