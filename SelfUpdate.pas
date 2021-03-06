unit SelfUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DateUtils, DB, dxLayoutControl, cxContainer, cxEdit,
  cxProgressBar, cxDBProgressBar, cxControls, ExtCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters;

type
  TfrmSelfUpdate = class(TForm)
    tmrPBar: TTimer;
    tmrCheckUpdate: TTimer;
    cxdbprgrsbrProgStart: TcxDBProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure tmrPBarTimer(Sender: TObject);
    procedure tmrCheckUpdateTimer(Sender: TObject);
    procedure tmrAPPTerminateTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelfUpdate: TfrmSelfUpdate;

implementation

{$R *.dfm}

uses
  DataModuleMain, modMain;


function ExtractFileNameEx(FileName: string; ShowExtension: Boolean): string;
//??????? ?????????? ??? ?????, ??? ??? ? ??? ???????????.

//??????? ?????????
//FileName - ??? ?????, ??????? ???? ??????????
//ShowExtension - ???? TRUE, ?? ??????? ????????? ???????? ??? ?????
// (??? ??????? ???? ??????? ? ????), ? ??????????? ????? ?????, ?????, ?????????
  // ???????? ??? ?????, ??? ?????????? ????? ?????.
var
  I: Integer;
  S, S1: string;
begin
  //?????????? ????? ??????? ????? ?????
  I := Length(FileName);
  //???? ????? FileName <> 0, ??
  if I <> 0 then
  begin
    //? ????? ????? ????????? FileName ???? ?????? "\"
    while (FileName[i] <> '\') and (i > 0) do
      i := i - 1;
    // ???????? ? ?????????? S ???????? FileName ??????? ????? ??????????
    // "\", ????? ??????? ?????????? S ???????? ??? ????? ? ???????????, ?? ???
    // ??????? ???? ??????? ? ????
    S := Copy(FileName, i + 1, Length(FileName) - i);
    i := Length(S);
    //???? ?????????? S = '' ?? ?????? ?????????? ''
    if i = 0 then
    begin
      Result := '';
      Exit;
    end;
    //?????, ???????? ??? ????? ??? ??????????
    while (S[i] <> '.') and (i > 0) do
      i := i - 1;
    //... ? ???????? ??? ??? ????? ? ?????????? s1
    S1 := Copy(S, 1, i - 1);
    //???? s1='' ?? , ?????????? s1=s
    if s1 = '' then
      s1 := s;
    //???? ???? ???????? ???????? ??????? ?????????? ??? ????? ? ???
    // ???????????, ?? Result = s,
    //???? ??? ??????????, ?? Result = s1
    if ShowExtension = TRUE then
      Result := s
    else
      Result := s1;
  end
    //????? ??????? ?????????? ''
  else
    Result := '';
end;

function GetFileVersion(const FileName: string): string;
type
  PDWORD = ^DWORD;
  PLangAndCodePage = ^TLangAndCodePage;
  TLangAndCodePage = packed record
    wLanguage: WORD;
    wCodePage: WORD;
  end;
  PLangAndCodePageArray = ^TLangAndCodePageArray;
  TLangAndCodePageArray = array[0..0] of TLangAndCodePage;
var
  loc_InfoBufSize: DWORD;
  loc_InfoBuf: PChar;
  loc_VerBufSize: DWORD;
  loc_VerBuf: PChar;
  cbTranslate: DWORD;
  lpTranslate: PDWORD;
  i: DWORD;
begin
  Result := '';
  if (Length(FileName) = 0) or (not Fileexists(FileName)) then
    Exit;
  loc_InfoBufSize := GetFileVersionInfoSize(PChar(FileName), loc_InfoBufSize);
  if loc_InfoBufSize > 0 then
  begin
    loc_VerBuf := nil;
    loc_InfoBuf := AllocMem(loc_InfoBufSize);
    try
      if not GetFileVersionInfo(PChar(FileName), 0, loc_InfoBufSize, loc_InfoBuf)
        then
        exit;
      if not VerQueryValue(loc_InfoBuf, '\\VarFileInfo\\Translation',
        Pointer(lpTranslate), DWORD(cbTranslate)) then
        exit;
      for i := 0 to (cbTranslate div SizeOf(TLangAndCodePage)) - 1 do
      begin
        if VerQueryValue(
          loc_InfoBuf,
          PChar(Format(
          'StringFileInfo\0%x0%x\FileVersion', [
          PLangAndCodePageArray(lpTranslate)[i].wLanguage,
            PLangAndCodePageArray(lpTranslate)[i].wCodePage])),
            Pointer(loc_VerBuf),
          DWORD(loc_VerBufSize)
          ) then
        begin
          Result := loc_VerBuf;
          Break;
        end;
      end;
    finally
      FreeMem(loc_InfoBuf, loc_InfoBufSize);
    end;
  end;
end;

procedure TfrmSelfUpdate.FormCreate(Sender: TObject);
begin
  tmrCheckUpdate.Enabled:=True;
  cxdbprgrsbrProgStart.Position:=0;
end;

procedure TfrmSelfUpdate.tmrPBarTimer(Sender: TObject);
begin
//  if (cxdbprgrsbr1.Position>=cxdbprgrsbr1.Properties.Max) then
//   begin
//     frmSelfUpdate.Destroy;
     //frmMain.Show;
//     cxdbprgrsbr1.Position:=cxdbprgrsbr1.Properties.Min;
//   end;
//  cxdbprgrsbr1.Position:=cxdbprgrsbr1.Position+20;
end;

procedure TfrmSelfUpdate.tmrCheckUpdateTimer(Sender: TObject);

var
   fileText:TStringList;
   Prog_Name, Prog_Ver: string;
begin
   tmrCheckUpdate.Enabled:=False;

   //Self.Visible:=False;

   //cxdbprgrsbr1.Position:=100;

   Prog_Name:= ExtractFileNameEx(Application.ExeName,false);
   Prog_Ver:= GetFileVersion(Application.ExeName);
   //Label4.Caption:='???????? ?????????? ?????????.';

   try
     dmMain.conADOUpdate.Connected:=True;
     dmMain.Prog_Update.Close;
     dmMain.Prog_Update.Parameters.ParamByName('Prog_Name').Value:= Prog_Name;
     dmMain.Prog_Update.Open;
     cxdbprgrsbrProgStart.Position:=10;
     Application.ProcessMessages;

    dmMain.conADOMain.Connected:=True;
    frmSelfUpdate.cxdbprgrsbrProgStart.Position:=30;
    Application.ProcessMessages;

    dmMain.qryADOScan.Active:=True;
    dmMain.tblTypes.Active:=True;
    frmSelfUpdate.cxdbprgrsbrProgStart.Position:=40;
    Application.ProcessMessages;

    dmMain.qryADOFindNbr.Active:=True;
    dmMain.qryADOFindDT.Active:=True;
    frmSelfUpdate.cxdbprgrsbrProgStart.Position:=50;
    Application.ProcessMessages;

    dmMain.qryADOMain.Active:=True;
    dmMain.qryADODocPageNo.Active:=True;
    frmSelfUpdate.cxdbprgrsbrProgStart.Position:=60;
    Application.ProcessMessages;

    dmMain.qwrModTypes.Active:=True;
    dmMain.qryADOFlurView.Active:=True;
    frmSelfUpdate.cxdbprgrsbrProgStart.Position:=70;
    Application.ProcessMessages;

    dmMain.qryADOFlurCheckExist.Active:=True;
    dmMain.qryADOPrevTabCheck.Active:=True;
    frmSelfUpdate.cxdbprgrsbrProgStart.Position:=80;
    Application.ProcessMessages;

    dmMain.tblPolyMonth.Active:=True;
    frmSelfUpdate.cxdbprgrsbrProgStart.Position:=85;
    Application.ProcessMessages;

    dmMain.tblPolyTypes.Active:=True;
    dmMain.tblModPolyTypes.Active:=True;
    frmSelfUpdate.cxdbprgrsbrProgStart.Position:=90;
    Application.ProcessMessages;


     if (dmMain.Prog_Update.RecordCount = 1) and (dmMain.Prog_Update.FieldByName('Prog_Name').Value = Prog_Name) and (dmMain.Prog_Update.FieldByName('Prog_ver').Value > Prog_Ver)  then
       begin
        //Label4.Caption:='?????????? ?????????';
        Application.ProcessMessages;
        TBlobField(dmMain.Prog_Update.FieldByName('Prog_Exe')).SaveToFile(extractfilepath(Application.ExeName)+Prog_Name+'_new.exe');
        dmMain.Prog_Update.Close;
        Application.ProcessMessages;
        fileText:=TStringList.Create;
        fileText.Add(':label1');
        fileText.Add('if Exist '+Prog_Name+'_new.exe del '+Prog_Name+'.exe else goto Label3');
        fileText.Add('if Exist '+Prog_Name+'.exe goto label1');
        fileText.Add(':label2');
        fileText.Add('ren '+Prog_Name+'_new.exe '+Prog_Name+'.exe');
        fileText.Add('if Exist '+Prog_Name+'_new.exe goto label2');
        fileText.Add(':label3');
        fileText.Add(Prog_Name+'.exe');
        fileText.Add('del update.bat');
        fileText.SaveToFile(extractfilepath(paramstr(0))+'update.bat');
        //Label4.Caption:='?????????? ?????????.';
        WinExec(PAnsiChar('update.bat'), SW_HIDE);
        Application.Terminate;

       end
     else
      begin
        DeleteFile('update.bat');
      end;

     dmMain.conADOUpdate.Connected:=False;
     cxdbprgrsbrProgStart.Position:=100;
     Application.ProcessMessages;
     Sleep(300);
     Close;
   except
     MessageDlg('?????? ??????????? ? ???????!',  mtError, [mbOK], 0);
     //dmMain.Destroy;
     //frmMain.Destroy;
     frmMain.tmrAPPTerminate.Enabled:=True;
     //Application.Terminate;
     Close;
   end;
end;

procedure TfrmSelfUpdate.tmrAPPTerminateTimer(Sender: TObject);
begin
  Application.Terminate;
end;

end.
