unit uRunWinget;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, system.StrUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DosCommand, SynEdit, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.WinXCtrls, uconst;

type
  TfRunWinget = class(TForm)
    dcRun: TDosCommand;
    pb1: TProgressBar;
    pnltop: TPanel;
    AI1: TActivityIndicator;
    mmo1: TMemo;
    function dcRunCharDecoding(ASender: TObject; ABuf: TStream): string;
    procedure dcRunNewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
    procedure dcRunTerminated(Sender: TObject);
  private
    { Déclarations privées }
    lIDs : TStrings;
  public
    { Déclarations publiques }
    Procedure addCommand(sID : String);
  end;

var
  fRunWinget: TfRunWinget;

implementation

{$R *.dfm}

procedure TfRunWinget.addCommand(sID: String);
begin
    //mmo1.Lines.Add(DosCommand);
    dcRun.CommandLine := Format(sRunInstall,[sId]);
    dcRun.Execute;
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

procedure TfRunWinget.dcRunNewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
begin
  if ANewLine.IndexOf(Chr(08)) = -1 then

  mmo1.Lines.Add(aNewLine);
end;

procedure TfRunWinget.dcRunTerminated(Sender: TObject);
begin
  if dcRun.ExitCode = 0 then
  begin
    mmo1.Lines.Add('réussi');
  end
  else
  begin
    mmo1.Lines.Add('raté');
  end;
end;

end.
