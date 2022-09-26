unit uConst;

interface

uses
  System.Generics.Collections, System.Types, System.strUtils, System.SysUtils, System.classes;

type

  tWingetcommand = class
    class function Install(sId : String) : String;
    class function Upgrade : String;
    class Function List : String;
    class function Search(sText : String) : String;
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
    dFields: TDictionary<string, string>;
  public


    constructor create(sLine: String);
  End;

var
  lListColumn: TStrings;
  dCommands: TDictionary<string, string>;

procedure makeUpgradeDictonary(sLine: String);

implementation

procedure makeUpgradeDictonary(sLine: String);
var
  iPosNom, iPosID, iPosVersion, iPosDispo, iPosSource: integer;
  iLen: integer;
  pColumn: tColumnClass;
  lHeaders: TStringDynArray;
  lsHeaders: tStringList;
  i: integer;
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
    var
    key := lsHeaders[i];
    var
    iPosCol := pos(key, sLine);
    var
    iLenCol := 0;
    pColumn := tColumnClass.create(iPosCol, iLenCol);
    pColumn.sLabel := key;
    inc(i);
    lListColumn.AddObject(key, pColumn)
  until i > lsHeaders.Count - 1;

  i := 0;
  repeat
    if i < lListColumn.Count - 1 then
    begin
      var
      iPos1 := tColumnClass(lListColumn.Objects[i]).iPos;
      var
      iPos2 := tColumnClass(lListColumn.Objects[i + 1]).iPos;
      tColumnClass(lListColumn.Objects[i]).iLen := iPos2 - iPos1;
    end
    else
    begin
      var
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

constructor tWingetPackage.create(sLine: String);
begin

end;

{ tCommandClass }

class function tWingetcommand.Install(sId : String): String;
begin
  dCommands.TryGetValue('install',result);
  result := format(result,[sId]);
end;

class function tWingetcommand.List: String;
begin
   dCommands.TryGetValue('list',result);
end;

class function tWingetcommand.Search(sText: String): String;
begin
   dCommands.TryGetValue('search',result);
   result := format(result,[sText]);
end;

class function tWingetcommand.Upgrade: String;
begin
   dCommands.TryGetValue('upgrade',result);
end;

initialization

dCommands := TDictionary<string, string>.create();
dCommands.Add('list', 'winget list');
dCommands.Add('upgrade', 'winget upgrade --include-unknown');
dCommands.Add('search', 'winget search "%s"');
dCommands.Add('install', 'winget install --id "%s"');
dCommands.Add('uninstall', 'winget uninstall --id "%s"');

Finalization

dCommands.Clear;
dCommands.Free;

end.
