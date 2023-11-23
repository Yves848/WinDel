unit uGlobalFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,  System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrameBase, sFrameAdapter, Vcl.StdCtrls,  uConst, Vcl.ExtCtrls, Vcl.Grids, sLabel, Vcl.Mask, sMaskEdit,
  sCustomComboEdit, sCurrEdit, sPanel, AdvObj, BaseGrid, AdvGrid;

type
  TfGlobalFrame = class(TfrmBase)
    sPanel1: TsPanel;
    AdvStringGrid1: TAdvStringGrid;
    sPanel2: TsPanel;
  private
    { Private declarations }
  public
    { Public declarations }

    procedure addItem(aItem: tWingetPackage);
  end;

var
  fGlobalFrame: TfGlobalFrame;
  aFilterItems: tList;
  aItems: tObjectList<tWingetPackage>;

implementation

{$R *.dfm}

{ TfGlobalFrame }

procedure TfGlobalFrame.addItem(aItem: tWingetPackage);
begin
       //
end;

initialization
  aItems := tObjectList<tWingetPackage>.Create();
  aFilterItems := tList.Create;

finalization
  aFilterItems.Clear;
  aFilterItems.Free;

end.
