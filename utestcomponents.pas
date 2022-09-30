unit utestcomponents;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, vcl.Themes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CustomButton1, JvExControls, JvButton, JvTransparentButton, JvComponentBase, JvCaptionButton, Vcl.StdCtrls,
  Vcl.Buttons, JvExButtons, JvButtons;

type
  TForm1 = class(TForm)
    ygtwnbtnYGTwinButton1: tYGTwinButton;
    jvhtbtn1: TJvHTButton;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
