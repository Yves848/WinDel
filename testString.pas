unit testString;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, system.StrUtils, system.AnsiStrings, uConst;

const
  aUpdWidths: TArray<Integer> = [19, 19, 13, 6];
  aUpgFields: TArray<String> = ['nom', 'id', 'version', 'source'];

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
    function splitCols(aWidth : tArray<Integer>; aCols : tArray<String>; line : string) : tStrings;
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  l : String;
  h : string;
  s : string;
begin
  h := 'Nom                ID                     Version      Source';
  //l := 'QQ小程序开发者工具 Tencent.qq-devtool 0.70.2209190 winget';
  l := 'Presenter          WorshipTools.Presenter 2023.1.4     winget';
  s := l[1];
  memo1.Lines.AddStrings(splitCols(aUpdWidths,aUpgFields,l));
end;

function TForm1.splitCols(aWidth: tArray<Integer>; aCols: tArray<String>; line : string): tStrings;
var
  i : integer;
  c,l, cl : integer;
  s : String;
  fName : String;
begin
  result := tStringlist.Create;
  i := 0;
  c := 0;
  l := 0;
  cl := 0;
  fName := '';
  while i < length(aWidth) do
  begin
    s := line[c+1];
    cl := TEncoding.UTF8.GetByteCount(s);
    if cl > 1 then dec(cl);
    l := l + cl;
    fName := fName + s;
    if l >= aWidth[i] then
    begin
      l := 0;
      result.Add(fName);
      fName := '';
      inc(i);
    end;
    inc(c);
  end;
end;

end.
