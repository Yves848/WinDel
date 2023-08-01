unit testString;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.StrUtils,
  System.AnsiStrings, uConst, Vcl.AppEvnts, IdBaseComponent, IdComponent,XMLIntf, XMLDoc,
  IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL;

const
  sVersion = 'v1.5.1881';

type
  TForm1 = class(TForm)
    Button1: TButton;
    memo1: TMemo;
    IdHTTP1: TIdHTTP;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Déclarations privées }

  public
    { Déclarations publiques }
  end;

function GetKeyboardLanguageCodeStr: string;
function GetWindowsLanguage: string;

var
  Form1: TForm1;

implementation

{$R *.dfm}
// function GetWindowsLanguage: string;
// var
// langId: word;
// buffer: array [0..4] of Char;
// begin
// langId := GetUserDefaultUILanguage;
//
// // The primary language ID is in the low-order 10 bits,
// // and the sublanguage ID is in the high-order 6 bits.
// // Combine them to get the language ID in the format "LANG-SUBLANG".
// StrFmt(buffer, '%x-%x', [langId and $3FF, langId shr 10]);
//
// Result := buffer;
// end;

function GetWindowsLanguage: string;
var
  localeName: array [0 .. LOCALE_NAME_MAX_LENGTH] of Char;
begin
  if GetUserDefaultLocaleName(localeName, LOCALE_NAME_MAX_LENGTH) > 0 then
    Result := localeName
  else
    Result := '';
end;

function GetKeyboardLanguageCodeStr: string;
var
  tid: word;
  lid: word;
  ndxLocale: integer;
begin
  try

    tid := getCurrentThreadID;
    lid := getKeyboardLayout(tid);
    ndxLocale := languages.IndexOf(lid);
    Result := languages.localeName[ndxLocale];
  except
    Result := 'xx'; // Error
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  l1, l2: integer;
  slocale: string;
  Stream: TMemoryStream;
  Url, FileName: String;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  slocale := languages.localeName[languages.IndexOf(SysLocale.DefaultLCID)];
  Url := Format('https://raw.githubusercontent.com/microsoft/winget-cli/release-%s/Localization/Resources/%s/winget.resw',[sVersion,'fr-FR']);
  FileName := 'config.xml';
  IdSSL := TIdSSLIOHandlerSocketOpenSSL.create(nil);
  IdSSL.SSLOptions.Method := sslvTLSv1_2;
  IdSSL.SSLOptions.Mode := sslmUnassigned;
  IdHTTP1.IOHandler := IdSSL;
  Stream := TMemoryStream.Create;
  try

    IdHTTP1.Get(Url, Stream);
    Stream.SaveToFile(FileName);
  finally
    Stream.Free;
    //IdHTTP1.Free;
    IdSSL.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   LDocument: IXMLDocument;
   LNodeElement, LNode: IXMLNode;
   i : integer;
begin
//
  if FileExists('d:\params.xml') then
  begin
    LDocument := TXMLDocument.Create(nil);
    LDocument.LoadFromFile('d:\params.xml'); { File should exist. }

    { Find a specific node. }
    LNodeElement := LDocument.ChildNodes.FindNode('root');
    if (LNodeElement <> nil) then
    begin
      for I := 0 to LNodeElement.ChildNodes.Count - 1 do
      begin
        LNode := LNodeElement.ChildNodes.Get(I);
        { Display node name. }
        Writeln(sLineBreak + 'Node name: ' + LNode.NodeName);
        { Check whether the node type is Text. }
        if LNode.NodeType = ntText then
        begin
          memo1.lines.add('This is a node of type Text. The text is: ' + LNode.Text);
        end;
        { Check whether the node is text element. }
        if LNode.IsTextElement then
        begin
          memo1.lines.add('This is a text element. The text is: ' + LNode.Text);
        end;
      end;
    end;
  end
  else
  begin
    memo1.Lines.Add('nope');
  end;
end;

end.
