unit uRunWinget;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DosCommand, SynEdit, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.WinXCtrls, uconst;

type
  TfRunWinget = class(TForm)
    dcRun: TDosCommand;
    pb1: TProgressBar;
    pnltop: TPanel;
    AI1: TActivityIndicator;
    mmo1: TMemo;
    function dcRunCharDecoding(ASender: TObject; ABuf: TStream): string;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    Procedure addCommand(DosCommand : String);
  end;

var
  fRunWinget: TfRunWinget;

implementation

{$R *.dfm}

procedure TfRunWinget.addCommand(DosCommand: String);
begin
    mmo1.Lines.Add(DosCommand);
end;

function TfRunWinget.dcRunCharDecoding(ASender: TObject; ABuf: TStream): string;
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

end.
