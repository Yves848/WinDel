unit CustomButton1;

interface

uses
  System.SysUtils, System.Classes, System.Types, Vcl.Controls, Vcl.StdCtrls, Vcl.Themes, Vcl.Graphics, WinApi.Messages, Vcl.GraphUtil;

type
  tYGTwinButton = class;
  tYGTwinButtonState = (bsLeave, bsEnter, bsDown);
  tYGTwinButtonStateChange = procedure(Sender: tYGTwinButton; State: tYGTwinButtonState) of object;

  tYGTwinButtonColors = class(TPersistent)
  private
    fOwner: tComponent;
    fEnter, fLeave, fDown: TColor;
    function Paint: Boolean;
  public
    constructor create(AOwner: tComponent); reintroduce;
    property Owner: tComponent read fOwner write fOwner;
  published

    property Enter: TColor read fEnter write fEnter stored Paint;
    property Leave: TColor read fLeave write fLeave stored Paint;
    property Down: TColor read fDown write fDown stored Paint;
  end;

  tYGTwinButtonPen = class(TPersistent)
  private
    fOwner: tComponent;
    fColor: TColor;
    fWidth: Integer;
    function Paint: Boolean;
  public
    constructor create(AOwner: tComponent); reintroduce;
    property Owner: tComponent read fOwner write fOwner;
  published
    property Color: TColor read fColor write fColor stored Paint;
    property Width: Integer read fWidth write fWidth stored Paint;
  end;

  tYGTwinButton = class(TCustomControl)

  private
    { Déclarations privées }
    fCaption: string;
    fKeyCaption: string;
    fPen: tYGTwinButtonPen;
    fFont: tFont;
    fColors: tYGTwinButtonColors;
    fState: tYGTwinButtonState;
    fTextColors: tYGTwinButtonColors;
    fOnstateChange: tYGTwinButtonStateChange;
    procedure setcaption(const Value: string);
    procedure setKeyCaption(const Value: string);
    procedure setFont(const Value: tFont);
    procedure setState(const Value: tYGTwinButtonState);
  protected
    { Déclarations protégées }
    procedure Paint; override;
    procedure CMMouseEnter(var message: tMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var message: tMessage); message CM_MOUSELEAVE;
    procedure MouseDown(Button: tMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    { Déclarations publiques }
    constructor create(AOwner: tComponent); override;
    destructor destroy; override;
  published
    { Déclarations publiées }
    property Caption: String read fCaption write setcaption;
    property KeyCaption: string read fKeyCaption write setKeyCaption;
    property Pen: tYGTwinButtonPen read fPen write fPen;
    property Colors: tYGTwinButtonColors read fColors write fColors;
    property TextColors: tYGTwinButtonColors read fTextColors write fTextColors;
    property Font: tFont read fFont write setFont;
    property State: tYGTwinButtonState read fState write setState;
    property onStateChange: tYGTwinButtonStateChange read fOnstateChange write fOnstateChange;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseDown;
    property onClick;
    property Align;
    property Anchors;
    property Constraints;
    property visible;
    property Enabled;
    property DoubleBuffered;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('YGComponents', [tYGTwinButton]);
end;

{ TYGTwinButton }

procedure tYGTwinButton.CMMouseEnter(var message: tMessage);
begin
  fState := bsEnter;
  Paint;
end;

procedure tYGTwinButton.CMMouseLeave(var message: tMessage);
begin
  fState := bsLeave;
  Paint;
end;

constructor tYGTwinButton.create(AOwner: tComponent);
begin
  inherited;
  fPen := tYGTwinButtonPen.create(Self);
  fPen.fColor := clBtnHighlight;
  fPen.fWidth := 2;
  fColors := tYGTwinButtonColors.create(Self);
  fCaption := 'Button';

  fFont := tFont.create;
  with fFont do
  begin
    Name := 'Segoe UI Light';
    Size := 12;
  end;

  with fColors do
  begin
    Enter := 4736495;
    Leave := 3881668;
    Down := clWhite;
  end;

  fTextColors := tYGTwinButtonColors.create(Self);
  with fTextColors do
  begin
    Enter := clWhite;
    Leave := clWhite;
    Down := clBlack;
  end;
end;

destructor tYGTwinButton.destroy;
begin
  FreeAndNil(fPen);
  FreeAndNil(fColors);
  FreeAndNil(fTextColors);
  FreeAndNil(fFont);
  inherited;
end;

procedure tYGTwinButton.MouseDown(Button: tMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

end;

procedure tYGTwinButton.Paint;
var
  keyrect: tREct;
  InnerHeight, InnerWidth: Integer;
  KeyWidth, keyHeight: Integer;
  GradientColor: TColor;
begin
  inherited;
  with Canvas do
  begin
    Brush.Color := fPen.Color;
    // FillRect(ClipRect);
    Font.Assign(fFont);

    if fState = bsLeave then
    begin
      Brush.Color := fColors.fLeave;
      Font.Color := fTextColors.fLeave;
      GradientColor := fColors.fLeave;
    end;

    if fState = bsEnter then
    begin
      Brush.Color := fColors.fEnter;
      Font.Color := fTextColors.fEnter;
      GradientColor := fColors.fEnter;
    end;

    if fState = bsDown then
    begin
      Brush.Color := fColors.fDown;
      Font.Color := fTextColors.fDown;
    end;

    InnerHeight := Height - (fPen.Width * 2);

    // FillRect(Rect(fPen.Width, fPen.Width, Width - fPen.Width, Height - fPen.Width));

    // GradientFillCanvas(Canvas, clWhite, fColors.Leave, Rect(fPen.Width, fPen.Width, Width - fPen.Width, Height - fPen.Width), gdVertical);
    GradientFillCanvas(Canvas, clWhite, GradientColor, Rect(0, 0, Width, Height), gdVertical);
    Brush.Style := bsClear;
    TextOut((Width - TextWidth(fCaption) - (fPen.fWidth + 10)), (Height div 2) - (TextHeight(fCaption) div 2), fCaption);

    keyrect := tREct.create(ClipRect.Left + fPen.Width, ClipRect.Top + fPen.Width, ClipRect.Bottom - fPen.Width, ClipRect.Bottom - fPen.Width);
    InflateRect(keyrect, -4, -4);
    Pen.Color := fPen.fColor;
    Pen.Width := 2;
    // RoundRect(keyrect, 14, 14);
    Rectangle(keyrect);
    KeyWidth := (keyrect.Right - keyrect.Left) - 1;
    keyHeight := (keyrect.Bottom - keyrect.Top) - 1;
    TextOut(keyrect.Left + ((KeyWidth div 2) - (TextWidth(fKeyCaption) div 2)),
      keyrect.Top + ((keyHeight div 2) - (TextHeight(fKeyCaption) div 2)), fKeyCaption);
  end;
end;

procedure tYGTwinButton.setcaption(const Value: string);
begin
  fCaption := Value;
  Paint;
end;

procedure tYGTwinButton.setFont(const Value: tFont);
begin
  fFont.Assign(Value);
  Paint;
end;

procedure tYGTwinButton.setKeyCaption(const Value: string);
begin
  fKeyCaption := Value;
  Paint;
end;

procedure tYGTwinButton.setState(const Value: tYGTwinButtonState);
begin
  fState := Value;
  Paint;
end;

{ tYGTwinButtonColors }

constructor tYGTwinButtonColors.create(AOwner: tComponent);
begin
  Self.Owner := AOwner;

end;

function tYGTwinButtonColors.Paint: Boolean;
begin
  if Self.Owner is tYGTwinButton then
  begin
    tYGTwinButton(Self.Owner).Paint;
    Result := true;
  end
  else
    Result := False;
end;

{ tYGTwinButtonPen }

constructor tYGTwinButtonPen.create(AOwner: tComponent);
begin
  Self.Owner := AOwner;
end;

function tYGTwinButtonPen.Paint: Boolean;
begin
  if Self.Owner is tYGTwinButton then
  begin
    tYGTwinButton(Self.Owner).Paint;
    Result := true;
  end
  else
    Result := False;
end;

end.
