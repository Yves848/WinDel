unit CustomButton1;

interface

uses
  System.SysUtils, System.Classes, System.Types, Vcl.Controls, Vcl.StdCtrls, Vcl.Themes, Vcl.Graphics, WinApi.Messages, Vcl.GraphUtil;

type
  tYGTwinButton = class;
  tYGTwinButtonState = (bsLeave, bsEnter, bsDown);
  tYGTwinButtonStateChange = procedure(Sender: tYGTwinButton; State: tYGTwinButtonState) of object;

  tYGGradientColor = class
  private
    fStart: tColor;
    fEnd: tColor;
  public
    constructor create(cStart, cEnd: tColor);
  published
    property StartColor: tColor read fStart;
    property EndColor: tColor read fEnd;
  end;

  tYGTwinButtonColors = class(TPersistent)
  private
    fOwner: tComponent;
    fEnterStart, fLeaveStart, fDownStart: tColor;
    fEnterEnd, fLeaveEnd, fDownEnd: tColor;
    function Paint: Boolean;
  public
    constructor create(AOwner: tComponent); reintroduce;
    property Owner: tComponent read fOwner write fOwner;
  published

    property EnterStart: tColor read fEnterStart write fEnterStart stored Paint;
    property LeaveStart: tColor read fLeaveStart write fLeaveStart stored Paint;
    property DownStart: tColor read fDownStart write fDownStart stored Paint;
    property EnterEnd: tColor read fEnterEnd write fEnterEnd stored Paint;
    property LeaveEnd: tColor read fLeaveEnd write fLeaveEnd stored Paint;
    property DownEnd: tColor read fDownEnd write fDownEnd stored Paint;
  end;

  tYGTwinButtonPen = class(TPersistent)
  private
    fOwner: tComponent;
    fColor: tColor;
    fWidth: Integer;
    function Paint: Boolean;
  public
    constructor create(AOwner: tComponent); reintroduce;
    property Owner: tComponent read fOwner write fOwner;
  published
    property Color: tColor read fColor write fColor stored Paint;
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
    procedure MouseUp(Button: tMouseButton; Shift: TShiftState; X, Y: Integer); override;
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
    property OnMouseUp;
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
    EnterStart := clWhite;
    LeaveStart := clYellow;
    DownStart := clBlack;
    EnterEnd := clBlack;
    LeaveEnd := clBlue;
    DownEnd := clWhite;
  end;

  fTextColors := tYGTwinButtonColors.create(Self);
  with fTextColors do
  begin
    EnterStart := clWhite;
    LeaveStart := clWhite;
    DownStart := clBlack;
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
  fState := bsDown;
  Paint;
end;

procedure tYGTwinButton.MouseUp(Button: tMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  fState := bsEnter;
  Paint;
end;

procedure tYGTwinButton.Paint;
var
  keyrect: tREct;
  InnerHeight, InnerWidth: Integer;
  KeyWidth, keyHeight: Integer;
  GradientColor: tYGGradientColor;
begin
  inherited;
  with Canvas do
  begin
    Brush.Color := fPen.Color;
    Font.Assign(fFont);

    if fState = bsLeave then
    begin
      Brush.Color := fColors.fLeaveStart;
      Font.Color := fTextColors.fLeaveStart;
      GradientColor := tYGGradientColor.create(fColors.fLeaveStart, fColors.fLeaveEnd);
    end;

    if fState = bsEnter then
    begin
      Brush.Color := fColors.fEnterStart;
      Font.Color := fTextColors.fEnterStart;
      GradientColor := tYGGradientColor.create(fColors.fEnterStart, fColors.fEnterEnd);
    end;

    if fState = bsDown then
    begin
      Brush.Color := fColors.fDownStart;
      Font.Color := fTextColors.fDownStart;
      GradientColor := tYGGradientColor.create(fColors.fDownStart, fColors.fDownEnd);
    end;

    InnerHeight := Height - (fPen.Width * 2);
    GradientFillCanvas(Canvas, GradientColor.StartColor, GradientColor.EndColor, Rect(0, 0, Width, Height), gdVertical);
    Brush.Style := bsClear;
    if State = bsDown then
    begin
      // Draw frame
       pen.Width := fPen.Width;
       pen.Color := fPen.fColor;
       Rectangle(Rect(0, 0, Width, Height));
    end;
    TextOut((Width - TextWidth(fCaption) - (fPen.fWidth + 10)), (Height div 2) - (TextHeight(fCaption) div 2), fCaption);

    keyrect := tREct.create(ClipRect.Left + fPen.Width, ClipRect.Top + fPen.Width, ClipRect.Bottom - fPen.Width, ClipRect.Bottom - fPen.Width);
    InflateRect(keyrect, -4, -4);
    Pen.Color := fPen.fColor;
    Pen.Width := 2;
    Rectangle(keyrect);
    KeyWidth := (keyrect.Right - keyrect.Left) - 1;
    keyHeight := (keyrect.Bottom - keyrect.Top) - 1;
    TextOut(keyrect.Left + ((KeyWidth div 2) - (TextWidth(fKeyCaption) div 2)),
      keyrect.Top + ((keyHeight div 2) - (TextHeight(fKeyCaption) div 2)), fKeyCaption);
  end;
  FreeAndNil(GradientColor);
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

{ tYGGradientColor }

constructor tYGGradientColor.create(cStart, cEnd: tColor);
begin
  fStart := cStart;
  fEnd := cEnd;
end;

end.
