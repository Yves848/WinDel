unit uMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Notification,
  System.SysUtils,
  System.Variants,
  System.IOUtils,
  System.Classes,
  System.Types,
  System.DateUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  System.StrUtils,
  System.RegularExpressions,
  uConst,
  Vcl.CheckLst,
  SynEdit,
  DosCommand,
  Vcl.WinXCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.ComCtrls,
  uFrameUpgrade2,
  uFrameBase,
  uFrameList,
  uFrameSearch,
  uFrameConfig,
  System.ImageList,
  Vcl.ImgList,
  System.Actions,
  Vcl.ActnList,
  sSkinProvider,
  sSkinManager,
  acAlphaImageList,
  sSpeedButton,
  sLabel,
  acFontStore,
  sPanel,
  Vcl.Menus,
  JvComponentBase,
  JvBalloonHint,
  JvTrayIcon,
  udlgClose, sPageControl, SynEditHighlighter, SynHighlighterBat;

type
  TArg<T> = reference to procedure(const Arg: T);

  TfMain = class(TForm)
    AI1: TActivityIndicator;
    DosCommand1: TDosCommand;
    pnlToolbar: TsPanel;
    pnlFooter: TPanel;
    pnlMain: TsPanel;
    actlst1: TActionList;
    actSearch: TAction;
    actList: TAction;
    actUpgrade: TAction;
    actQuit: TAction;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    sCharImageList1: TsCharImageList;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sbQuit: TsSpeedButton;
    lblWingetVersion: TsLabelFX;
    sbConfig: TsSpeedButton;
    actConfig: TAction;
    lblScoopVersion: TsLabelFX;
    pmTray: TPopupMenu;
    W1: TMenuItem;
    WingetHelper1: TMenuItem;
    S1: TMenuItem;
    SearchPackages1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    sbUpgrade: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    pmUpdatables: TMenuItem;
    dcupgradeSearch: TDosCommand;
    Timer1: TTimer;
    TrayIcon1: TTrayIcon;
    NotificationCenter1: TNotificationCenter;
    sPageControl1: TsPageControl;
    tsMainPage: TsTabSheet;
    tsScript: TsTabSheet;
    SynEdit1: TSynEdit;
    SynBatSyn1: TSynBatSyn;
    procedure DosCommand1NewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
    procedure btnQuitClick(Sender: TObject);
    function DosCommand1CharDecoding(ASender: TObject; ABuf: TStream): string;
    procedure DosCommand1ExecuteError(ASender: TObject; AE: Exception; var AHandled: Boolean);
    procedure btnSearchClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ygBtnSearchClick(Sender: TObject);
    procedure ygBtnQuitClick(Sender: TObject);
    procedure ygBtnListClick(Sender: TObject);
    procedure ygBtnUpgradeClick(Sender: TObject);
    procedure btnListClick(Sender: TObject);
    procedure btnUpgradeClick(Sender: TObject);
    procedure actQuitExecute(Sender: TObject);
    procedure actUpgradeExecute(Sender: TObject);
    procedure actListExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbQuitClick(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure actConfigExecute(Sender: TObject);
    procedure sbConfigClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure SearchPackages1Click(Sender: TObject);
    procedure sbUpgradeClick(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure W1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dcupgradeSearchNewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
    procedure pmUpdatablesClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    function makeUpgList(listIn: TStrings): tStrings;
    procedure GetVersion(var m: tMessage); message WM_GETWINGETVERSION;
    procedure StartSearch(var m: tMessage); message WM_STARTSEARCH;
    procedure StartList(var m: tMessage); message WM_STARTLIST;
    procedure taskSearch(Sender: TObject);
    procedure taskList(Sender: TObject);
    procedure taskUpgrade(Sender: TObject);
    procedure popup;
    procedure GetUpgradeList(var Msg : TMessage); message WM_GETUPGRADELIST;
    procedure ListUpgradeTerminated(Sender : TObject);
    procedure HideMain(var msg : TMessage); message WM_HIDEMAIN;
  public
    { Public declarations }
    lOutPut: tStrings;
    lOutPutUpg : tStrings;
    aFrame: TfrmBase;
    procedure upgradeTerminated(Sender: TObject);
    procedure upgradeAutoTerminated(Sender : TObject);
    procedure versionTerminated(Sender: TObject);
    procedure listTerminated(Sender: TObject);
    procedure LVSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure ActivitySet(bActive: Boolean);
    procedure Show2(Sender : TObject);
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.actConfigExecute(Sender: TObject);
begin
if aFrame <> Nil then
    aFrame.Free;

  aFrame := TfrmConfig.Create(pnlMain);

  aFrame.Parent := pnlMain;
  aFrame.Align := alClient;
  TfrmConfig(aFrame).loadparams;
end;

procedure TfMain.ActivitySet(bActive: Boolean);
begin
  AI1.Animate := bActive;
end;

procedure TfMain.actListExecute(Sender: TObject);
begin
  taskList(Sender);
end;

procedure TfMain.actQuitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfMain.actSearchExecute(Sender: TObject);
begin
  taskSearch(Sender);
end;

procedure TfMain.actUpgradeExecute(Sender: TObject);
begin
  taskUpgrade(Sender);
end;

procedure TfMain.btnListClick(Sender: TObject);
begin
  taskList(Sender);
end;

procedure TfMain.btnQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMain.btnSearchClick(Sender: TObject);
begin
  taskSearch(Sender);
end;

procedure TfMain.btnUpgradeClick(Sender: TObject);
begin
  taskUpgrade(Sender);
end;

procedure TfMain.dcupgradeSearchNewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
begin
  if ANewLine.IndexOf(Chr(08)) = -1 then
    lOutPutUpg.Add(ANewLine);
end;

function TfMain.DosCommand1CharDecoding(ASender: TObject; ABuf: TStream): string;
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
      result := tEncoding.UTF8.GetString(pBytes);
    except
      result := '';
    end;
  end
  else
    result := '';
end;

procedure TfMain.DosCommand1ExecuteError(ASender: TObject; AE: Exception; var AHandled: Boolean);
begin
  AHandled := True;
end;

procedure TfMain.DosCommand1NewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
begin
  if ANewLine.IndexOf(Chr(08)) = -1 then
    lOutPut.Add(ANewLine);
end;

procedure TfMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  frmCloseDlg : TfrmCloseDlg;
begin
  frmCloseDlg := TfrmCloseDlg.Create(Self);
  CanClose := (frmCloseDlg.showModal = mrNo);
  frmCloseDlg.Free;
  if not CanClose then
    Hide;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  lOutPut := tStringList.Create;
  lOutPutUpg := tStringList.Create;
  Timer1.Interval := pParams.CheckUpdatesInterval * 60 * 1000;
  Timer1.Enabled := pParams.AutoCheckUpdates;
end;

procedure TfMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  aComponent: TComponent;
begin
  //
  if ssAlt in Shift then
    if Key = 80 then
    begin
      removekey;
      if (aFrame <> Nil) then
      begin
        if aFrame is TfrmSearch then
        begin
          TfrmSearch(aFrame).edtPackageName.SetFocus;
        end;
      end;
    end;
end;

procedure TfMain.FormShow(Sender: TObject);
begin
     PostMessage(fMain.handle, WM_GETWINGETVERSION, 0, 0);
     PostMessage(fMain.handle, WM_GETUPGRADELIST, 0, 0);
end;

procedure TfMain.GetUpgradeList(var Msg: TMessage);
begin
  if not dcupgradeSearch.IsRunning then
  begin
      lOutPutUpg.clear;
      Timer1.Enabled := False;
      dcupgradeSearch.CommandLine := tWingetcommand.Upgrade;
      dcupgradeSearch.OnTerminated := upgradeAutoTerminated;
      dcupgradeSearch.Execute;
  end;

end;

procedure TfMain.GetVersion(var m: tMessage);
begin
  if not DosCommand1.IsRunning then
  begin
    DosCommand1.CommandLine := tWingetcommand.version;
    DosCommand1.OnTerminated := versionTerminated;
    DosCommand1.Execute;
  end;
end;

procedure TfMain.HideMain(var msg: TMessage);
begin
  if pParams.StartMinimized then
    Hide;
end;

procedure TfMain.listTerminated(Sender: TObject);
var
  i, iCol: Integer;
  liste: TListItems;
  Item: TListItem;
  sLine: string;
  sString: string;
  aColumn: tColumnClass;
  lOutClean: tStrings;
  aWingetPackage: tWingetPackage;
begin
  i := 0;
  aFrame := TfrmList.Create(pnlMain);
  aFrame.Parent := pnlMain;
  aFrame.Align := alClient;
  TfrmList(aFrame).Init;
  lOutClean := makeUpgList(lOutPut);
  while i <= lOutClean.Count - 1 do
  begin
    sLine := lOutClean[i];
    aWingetPackage := tWingetPackage.Create(sLine, ptList);
    TfrmList(aFrame).addItem(aWingetPackage);
    TfrmList(aFrame).AddFilterCB(aWingetPackage.getField('source'));
    inc(i);
  end;

  liste := TfrmList(aFrame).ListView1.Items;

  tGridConfig.MakeColumns(TfrmList(aFrame).ListView1);

  TfrmList(aFrame).setupColumnHeaders;
  tfrmList(aFrame).filterWinget;
  TfrmList(aFrame).ApplyFilter;
  TfrmList(aFrame).ListView1.OnSelectItem := LVSelectItem;
  PostMessage(aFrame.handle, WM_FRAMERESIZE, 0, 0);
  ActivitySet(False);
end;

procedure TfMain.ListUpgradeTerminated(Sender: TObject);
begin
  //
end;

procedure TfMain.LVSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  aWingetPackage: tWingetPackage;
begin
  if Selected then
    if (Item.Data <> Nil) then
    begin
      aWingetPackage := tWingetPackage(Item.Data);
    end;
end;

function TfMain.makeUpgList(listIn: TStrings): tStrings;
var
  sHeaders: string;
  ANewLine: string;
  iLine: Integer;
  bClean: Boolean;
begin
  result := tStringList.Create;
  iLine := 0;
  bClean := False;
  while iLine <= listIn.Count - 1 do
  begin
    ANewLine := listIn[iLine];
    if TRegEx.IsMatch(ANewLine, '----') then
    begin
      bClean := True;
      sHeaders := listIn[iLine - 1];
      makeUpgradeDictonary(sHeaders);
    end
    else if bClean then
      result.Add(ANewLine);
    inc(iLine);
  end;
end;

procedure TfMain.N2Click(Sender: TObject);
begin
  Close;
end;

procedure TfMain.popup;
var
   MyNotification: TNotification;
begin
MyNotification := NotificationCenter1.CreateNotification; //Creates the notification
  try
    MyNotification.Name := 'Winget Helper Notification'; //Defines the name of the notification.
    MyNotification.Title := 'Winget Helper'; //Defines the name that appears when the notification is presented.
    MyNotification.AlertBody := Format('New Upgrades availables (%d)',[lListUpdates.count]); //Defines the body of the notification that appears below the title.
    MyNotification.EnableSound := True;

    NotificationCenter1.PresentNotification(MyNotification); //Presents the notification on the screen.
  finally
    MyNotification.Free; //Frees the variable
  end;
  //JvTrayIcon1.BalloonHint('Winget Hepler', Format('New Upgrades availables (%d)',[lListUpdates.count]), btInfo, 5000, false);
  //TrayIcon1.BalloonHint := Format('New Upgrades availables (%d)',[lListUpdates.count]);
  //TrayIcon1.BalloonTitle  := 'Winget Helper';
  //TrayIcon1.ShowBalloonHint;
end;

procedure TfMain.S1Click(Sender: TObject);
begin
  show;
  taskSearch(Sender);
end;

procedure TfMain.sSpeedButton1Click(Sender: TObject);
begin
  taskList(Sender);
end;

procedure TfMain.sSpeedButton2Click(Sender: TObject);
begin
  taskSearch(Sender);
end;

procedure TfMain.sSpeedButton3Click(Sender: TObject);
begin
   Timer1Timer(Sender);
end;

procedure TfMain.sbConfigClick(Sender: TObject);
begin
  actConfigExecute(Sender);
end;

procedure TfMain.sbQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMain.sbUpgradeClick(Sender: TObject);
begin
  taskUpgrade(Sender);
end;

procedure TfMain.SearchPackages1Click(Sender: TObject);
begin
  taskList(Sender);
  Show;
end;

procedure TfMain.Show2(Sender: TObject);
begin
//
end;

procedure TfMain.StartList(var m: tMessage);
begin
  taskList(Nil);
end;

procedure TfMain.StartSearch(var m: tMessage);
begin
  btnSearchClick(Nil);
end;

procedure TfMain.taskList(Sender: TObject);
begin
  ActivitySet(True);
  if aFrame <> Nil then
    aFrame.Free;
  lOutPut.clear;

  DosCommand1.OnTerminated := listTerminated;
  DosCommand1.CommandLine := tWingetcommand.List;
  DosCommand1.Execute;
end;

procedure TfMain.taskSearch(Sender: TObject);
begin
  if aFrame <> Nil then
    aFrame.Free;

  aFrame := TfrmSearch.Create(pnlMain);

  aFrame.Parent := pnlMain;
  aFrame.Align := alClient;
  TfrmSearch(aFrame).Init;
  TfrmSearch(aFrame).activityset := ActivitySet;
end;

procedure TfMain.taskUpgrade(Sender: TObject);
begin
  ActivitySet(True);
  if aFrame <> Nil then
    aFrame.Free;

  lOutPut.clear;

  aFrame := TfrmHeritee.Create(pnlMain);
  aFrame.Parent := pnlMain;
  aFrame.Align := alClient;
  TfrmHeritee(aFrame).ListView1.OnSelectItem := LVSelectItem;

  DosCommand1.OnTerminated := upgradeTerminated;
  DosCommand1.CommandLine := tWingetcommand.Upgrade;
  DosCommand1.Execute;
end;

procedure TfMain.Timer1Timer(Sender: TObject);
begin
  //Memo1.Lines.Add('Timer');
  PostMessage(handle, WM_GETUPGRADELIST, 0, 0);
end;

procedure TfMain.TrayIcon1DblClick(Sender: TObject);
begin
  Show;
end;

procedure TfMain.pmUpdatablesClick(Sender: TObject);
begin
  taskUpgrade(Sender);
  Show;
end;

procedure TfMain.upgradeAutoTerminated(Sender: TObject);
var
  i, iCol: Integer;
  liste: TListItems;
  Item: TListItem;
  sLine: string;
  sString: string;
  aColumn: tColumnClass;
  lOutClean: tStrings;
  aWingetPackage: tWingetPackage;
  bNewPack : Boolean;
begin
  i := 0;
  bNewPack := false;
  lOutClean := makeUpgList(lOutPutUpg);
  //Memo1.Lines.Add('#### Updates ####');
  while i < lOutClean.Count - 1 do
  begin
    sLine := lOutClean[i];
    aWingetPackage := tWingetPackage.Create(sLine, ptUpgrade);
    //Memo1.Lines.Add(sLine) ;
    if lListUpdates.IndexOf(aWingetPackage.getField('id')) = -1 then
    begin

      lListUpdates.AddObject(aWingetPackage.getField('id'),aWingetPackage);
      bNewPack := True;
    end;
    inc(i);
  end;
  ActivitySet(False);
  if bNewPack then popup;
  pmUpdatables.Caption := Format('Updatables Packages (%d)',[lListUpdates.Count]);
  Timer1.Enabled := pParams.AutoCheckUpdates;
end;

procedure TfMain.upgradeTerminated(Sender: TObject);
var
  i, iCol: Integer;
  liste: TListItems;
  Item: TListItem;
  sLine: string;
  sString: string;
  aColumn: tColumnClass;
  lOutClean: tStrings;
  aWingetPackage: tWingetPackage;
begin
  i := 0;
  lOutClean := makeUpgList(loutput);
  TfrmHeritee(aFrame).setupColumnHeaders;
  liste := TfrmHeritee(aFrame).ListView1.Items;
  while i < lOutClean.Count - 1 do
  begin
    sLine := lOutClean[i];
    aWingetPackage := tWingetPackage.Create(sLine, ptUpgrade);
    Item := liste.Add;
    Item.Data := aWingetPackage;
    iCol := 0;
    while iCol <= length(aUpgFields) - 1 do
    begin
      if (iCol = 0) then
      begin
        Item.Caption := aWingetPackage.getField(aUpgFields[iCol]);
      end
      else
      begin
        Item.SubItems.Add(aWingetPackage.getField(aUpgFields[iCol]));
      end;
      inc(iCol);
    end;
    inc(i);
  end;
  ActivitySet(False);
end;

procedure TfMain.versionTerminated(Sender: TObject);
begin
  lblWingetVersion.Caption := Format('Winget version %s', [lOutPut[0]]);
  // Chack if scoop is installed
  if TDirectory.Exists(Format('c:\users\%s\scoop', [CurrentUserName])) then
  begin
    lblScoopVersion.Caption := 'Scoop Installed     ' + '💈';
  end
  else
  begin
    lblScoopVersion.Caption := 'Scoop not installed    ' + '💈';
  end;
  OnShow := nil;
end;

procedure TfMain.W1Click(Sender: TObject);
begin
  Show;
end;

procedure TfMain.WMSysCommand(var Msg: TWMSysCommand);
begin
  if Msg.CmdType = SC_MINIMIZE then
    Hide
  else
    inherited;
end;

procedure TfMain.ygBtnListClick(Sender: TObject);
begin
  taskList(Sender);
end;

procedure TfMain.ygBtnQuitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMain.ygBtnSearchClick(Sender: TObject);
begin
  taskSearch(Sender);
end;

procedure TfMain.ygBtnUpgradeClick(Sender: TObject);
begin
  taskUpgrade(Sender);
end;

end.

