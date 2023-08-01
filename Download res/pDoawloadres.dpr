program pDoawloadres;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Windows;

procedure Test_VerLanguageName;
var
  wLang : LangID;
  szLang: Array [0..254] of Char;
begin
  wLang := GetSystemDefaultLCID;
  VerLanguageName(wLang, szLang, SizeOf(szLang));
  Writeln(szLang);
end;

procedure Test_GetLocaleInfo;
var
  Buffer : PChar;
  Size : integer;
begin
  Size := GetLocaleInfo (LOCALE_USER_DEFAULT, LOCALE_SENGLANGUAGE, nil, 0);
  GetMem(Buffer, Size);
  try
    GetLocaleInfo (LOCALE_USER_DEFAULT, LOCALE_SENGLANGUAGE, Buffer, Size);
    Writeln(Buffer);
  finally
    FreeMem(Buffer);
  end;
end;

begin
  try
       Test_VerLanguageName;
       Test_GetLocaleInfo;
       Sleep(5000);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
