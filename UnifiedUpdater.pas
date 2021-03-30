unit UnifiedUpdater;

interface

uses
  SysUtils, Windows, Classes, DB, ADODB, ComObj, FormLoader;

type

  TUpdateLoader = class
  private
    shortExeName, fullExeName: TFileName;
    currDir: TFileName;
    fileDescName: TFileName;
    fileVersion: String;
    fileProductName: String;
    frmVisualizer: TfrmLoader;
    qwrCommand: TAdoQuery;

    /// ��������� ���������� ���� ������������ �������� ��������
    procedure ProcessMessages(wnd: HWND = 0);

    /// �������� ��� ������������ ����� ���������� ���������, �������������� ����
    /// fullExeName ��������� ������� ����� ������������ �����
    /// � ����� ������������� � ���� shortExeName ������ ��� ����� ��� ����
    function GetFileName(): TFileName;

    /// ��������� �� ���������� � ����� �������� ProductName, OriginalFilename
    /// � ProductVersion � ���������� ��� �������� � ���� fileProductName,
    /// fileDescName � fileVersion
    function GetFileInfo(): Boolean;


    /// �� ������� ��� ������� ������ ���������� ����� ���� ����������
    /// ����� �������� ��������� ��� ����������� ���������� ��������������
    /// ��������
    function DoAdditionalJobs(): Boolean;

    /// ��������� ������ ����������� ������������ ����� ��������� (�� ������ ������)
    /// � � ������ ������������� ��������� � �������� ����������� ����
    /// ���������� False ���� ��������� ���������� � ��������� ���������� ���������
    /// (���������� ���������� �����) ��� ���� ��� ���������� ��������� ������ �
    /// ����� ���������� ���������
    /// ���������� True ���� ������ �� ��������� � ���������� � ����������
    /// ���������� ������ ���������
    function CheckMainFileVersion(): Boolean;

    /// ��������� ������ ��������� ������ ������� � ���� ������ ���������� ����
    /// ������, ������������� ���� MainVersion � ���� FileName �������� ��
    /// OriginalFilename �� ���������� � �����
    /// (���� ������� �� �����������)
    function CheckOtherProgramFiles(): Boolean;

    /// ��������� �� ���� ����������� ����� � ����� File_Version ������ null � �
    /// ������ ������������� ��������� � �������� ��
    function CheckOtherStuffFiles(): Boolean;

    /// ������������� ProgressBar �� ���� ������������ ���������� � ��������� Pos
    /// (�� 0 �� 100), ������� � Label �������� Caption, � ������, ���� IsWarning
    /// ����������� � True ���� ������ Label - �������, � ���������� �������� �
    /// Delay �����������
    procedure ShowProgressCaption(Pos: Integer; Caption: string;
      Delay: Integer; IsWarning: Boolean = false);

  protected
    /// �� ���� ��������� ��������� ������ ���������� ����� � ������ ����� � ��
    /// ���������� ������������� ���������� ���������� �����
    /// ���������� True ���� ���������� ����������
    class function NeedUpdate(ExeVersion, DbVersion: String): Boolean; overload;static;


    /// ��������� ������������� ���������� ����� �� �������� ���� ���������
    /// �����������, ���������� True ���� ���������� ����������
    class function NeedUpdate(FileName: string; DBDate: TDateTime): Boolean;overload;static;

  public

    /// ������� ���������� ��� ������ ���������� � ��������� ����������� ��������
    /// �� ����������.
    /// ������������ ����������:
    /// True - ���������� ���������� ������ ���������
    /// False - ���������� ��������� ���������
    function InitApplication(): Boolean;


    ///  ������� �� ����� ����� ��������� � �� �� ���� ���������� ���������
    ///  ������������� ���������� ����� � � ������ ������������� ��������
    ///  ���� �� �����. ���������� True � ������ ��������� ���������� � False
    ///  � ������ ������. ����� � ��������� ������� ������� ����� Exception
    ///  ������� ��� ��������� ������ ����� ������������ try ... except
    class function CheckFileUpdate(FileName: String): Boolean;static;

    constructor Create();
    destructor Destroy();
  end;




implementation

uses
  Graphics, ShellAPI, Variants;

const
  conn_str =
    'Provider=SQLOLEDB.1;Password=UpdateAdmin;Persist Security Info=True;User ID=UpdateAdmin;Initial Catalog=ProgramUpdate;Data Source=192.168.75.100;OLE DB Services=0';


  sql_select_project = 'select ' + '	 * ' + 'from ' +
    '	 ProgramUpdate.dbo.GetFileUpdateList(:prmProjectName) ' + 'order by ' +
    '	 DownloadPriority ';
  sql_select_all_other_files = 'select ' + '	 * ' + 'from ' +
    '	 ProgramUpdate.dbo.GetOtherFileUpdateListFull(:prmProjectName) ' + 'order by ' +
    '	 DownloadPriority ';

var
  mProgramDir: String;     // ���������� ���������� ��� �������
  mProjectName: String;    // ���������� �� ������


  { TUpdateLoader }

  /// ������� ���� � �������, ������������ �������� ������ � ������ �����,
  /// ��������������� ��������� OriginalFilename ���������� � �����
class function TUpdateLoader.CheckFileUpdate(FileName: String): Boolean;
var
  qwrCommandLocal: TAdoQuery;
  recordFound: Boolean;
begin
  Result := False;
  //  �������� ����� �������
  if mProjectName = '' then begin
    raise Exception.Create('�� ���������������� ���������� ���������� ����� �������, ��� ������������� ���������� ���� �� ���� ��� ������� ������ ������ TUpdateLoader');
    Exit;
  end;

  try
    qwrCommandLocal := TAdoQuery.Create(nil);
  except
    raise Exception.Create('�������� � ������� ������� CoInitialize, �������� � ������� ������� ��� ����������� ������');
    Exit;
  end;

  qwrCommandLocal.ConnectionString := conn_str;
  qwrCommandLocal.SQL.Text := sql_select_all_other_files;

  qwrCommandLocal.ParamCheck := True;
  qwrCommandLocal.Parameters.ParseSQL(qwrCommandLocal.SQL.Text,True);

  try
    qwrCommandLocal.Parameters.ParamByName('prmProjectName').Value := mProjectName;
    qwrCommandLocal.Open;
  except
    raise Exception.Create('���������� ��������� ������ � ������� TUpdateLoader.CheckFileUpdate');
    Exit;
  end;

  if qwrCommandLocal.RecordCount = 0 then begin
    Exit;
  end;

  qwrCommandLocal.First;
  recordFound := False;
  while (not qwrCommandLocal.Eof) and (not recordFound) do begin
    if (qwrCommandLocal.FieldByName('File_Name').AsString = FileName)and (qwrCommandLocal.FieldByName('FType').AsInteger = 1) then begin
      recordFound := True;
      if NeedUpdate(FileName,qwrCommandLocal.FieldByName('File_Date').AsDateTime) then begin
        ///  ���� ���������� �����
        try
          TBlobField(qwrCommandLocal.FieldByName('File_Data')).SaveToFile(mProgramDir+FileName+'.new');
          RenameFile(mProgramDir + FileName,mProgramDir + FileName + '.old');
          MoveFile(PChar(mProgramDir + FileName + '.new'),PChar(mProgramDir + FileName));
        except
          Exit;
        end;
      end;
    end;
    qwrCommandLocal.Next;
  end;

  if recordFound then Result := True;  
end;

function TUpdateLoader.CheckMainFileVersion: Boolean;
const
  B_CONTINUE = 0;
  B_ABORT = 1;
  B_NORMAL = 2;
  function CheckParamsExists(): Byte;
  begin
    Result := B_NORMAL;
    if fileDescName = '' then
    begin
      if MessageBox(0,
        '�� ����� �������� "OriginalFilename" � ���������� � �����, ������ ������ ���������� ��� ������� ��������� ����������, ���������� �������� ��� ���������� ���������?', 'Warning!', MB_YESNO or MB_ICONWARNING) = ID_NO then
      begin
        Result := B_ABORT;
      end
      else
      begin
        Result := B_CONTINUE;
      end;
      Exit;
    end;
    if fileProductName = '' then
    begin
      if MessageBox(0,
        '�� ����� �������� "ProductName" � ���������� � �����, ������ ������ ���������� ��� ������� ��������� ����������, ���������� �������� ��� ���������� ���������?', 'Warning!', MB_YESNO or MB_ICONWARNING) = ID_NO then
      begin
        Result := B_ABORT;
      end
      else
      begin
        Result := B_CONTINUE;
      end;
      Exit;
    end;
    if fileVersion = '' then
    begin
      if MessageBox(0,
        '�� ����� �������� "FileVersion" � ���������� � �����, ������ ������ ���������� ��� ������� ��������� ����������, ���������� �������� ��� ���������� ���������?', 'Warning!', MB_YESNO or MB_ICONWARNING) = ID_NO then
      begin
        Result := B_ABORT;
      end
      else
      begin
        Result := B_CONTINUE;
      end;
      Exit;
    end;
  end;

var
  paramsExists: Byte;
  bRecordFound: Boolean;
begin
  Result := false;
  paramsExists := CheckParamsExists();

  if (paramsExists <> B_NORMAL) then
  begin
    if (paramsExists = B_CONTINUE) then
      Result := True;
    Exit;
  end;

  try
    qwrCommand.ParamCheck := True;
    qwrCommand.Parameters.ParseSQL(qwrCommand.SQL.Text, True);
    qwrCommand.Parameters.ParamByName('prmProjectName').Value :=
      fileProductName;
  except
    ShowProgressCaption(100,
      '���������� ������ �������� ��� ������� (���������� ������)', 5000, True);
    Exit;
  end;

  if (not qwrCommand.Active) then
  begin
    try
      qwrCommand.Open();
    except
      // ���������� ������������ � ��
      // ����� �� ������� ��� ��������� �� �����
      ShowProgressCaption(100,
        '���������� ������������ � �� ��� ����������, ���������� ����� �������'
          , 2000, True);
      Exit;
    end;
  end;

  qwrCommand.First;
  bRecordFound := false;
  while (not qwrCommand.Eof) and (not bRecordFound) do
  begin
    if (qwrCommand.FieldByName('File_Name').AsString = fileDescName) and
      (qwrCommand.FieldByName('FType').AsInteger = 0) then
    begin
      bRecordFound := True;
      Break;
    end;
    qwrCommand.Next;
  end;

  if (not bRecordFound) then
  begin
    if MessageBox(0,
      '� ���� ������ �� ������ ��������������� ���� ����������, ��������� ������� ������ ���������?', 'Warning!!', MB_YESNO or MB_ICONWARNING) = ID_YES then
    begin
      Result := True;
    end;
    Exit;
  end;
  ShowProgressCaption(10, '�������� ������� ����������', 150);
  if FileExists(fullExeName + '.old') then
  begin
    // ������� ������ ���� ����������
    DeleteFile(PChar(fullExeName + '.old'));
  end;

  if (NeedUpdate(fileVersion, qwrCommand.FieldByName('File_Version').AsString))
    then
  begin
    // �������� ����������
    ShowProgressCaption(25, '���������� �������, ���������', 150);
    try
      TBlobField(qwrCommand.FieldByName('File_Data')).SaveToFile
        (fullExeName + '.new');
    except
      // �� ������� ��������� ��� ������� ���� �� ��
      if (MessageBox(0,
          '�� ������� ������� ���� ����������, ���������� ������ �� ������ �������?'
            , 'Warning!!', MB_YESNO or MB_ICONWARNING) = ID_YES) then
      begin
        Result := True;
      end;
      Exit;
    end;
    try
      ShowProgressCaption(50, '��������� ����������� ����', 150);
      RenameFile(fullExeName, fullExeName + '.old');
      MoveFile(PChar(fullExeName + '.new'), PChar(fullExeName));
    except
      // ���������� �������� �����
      ShowProgressCaption(100,
        '���������� �������� ����� �� ����������, ��������� ����� �������',
        2000, True);
      Exit;
    end;
    ShowProgressCaption(100, '������������� ���������', 150);
    ShellExecute(0, 'open', PChar(fullExeName), nil, nil, SW_SHOWNORMAL);
  end
  else
  begin
    ShowProgressCaption(25, '���������� ������������ ����� �� ���������', 150);
    Result := True;
  end;

end;

function TUpdateLoader.CheckOtherProgramFiles: Boolean;
begin
  Result := True;
end;

function TUpdateLoader.CheckOtherStuffFiles: Boolean;
const
  B_CONTINUE = 0;
  B_NORMAL = 2;
  function CheckParamsExists(): Byte;
  begin
    Result := B_NORMAL;
    if fileDescName = '' then begin
      Result := B_CONTINUE;
      Exit;
    end;
    if fileProductName = '' then begin
      Result := B_CONTINUE;
      Exit;
    end;
    if fileVersion = '' then begin
      Result := B_CONTINUE;
      Exit;
    end;
  end;


begin
  Result := True;
  // �� ��������� ��������� ���������� ������������� ���������, ��� ���
  // �������� ��������� ������ � ������ �� ������

  if CheckParamsExists()<> B_NORMAL then Exit;

  try
    if qwrCommand.Parameters.ParamByName('prmProjectName').Value = Null() then begin
      //  �� ������ ��������� �������, ������ ��������
      qwrCommand.Parameters.ParamByName('prmProjectName').Value := fileProductName;
    end;

  except
    // �� ������� ������� ���������� ��� ������ ��������
    ShowProgressCaption(50,'���������� ������� �� ���� �������������� �����',1000,True);
    Exit;
  end;

  if (not qwrCommand.Active) then begin
    try
      qwrCommand.Open();
    except
      // ���������� ������������ � ��
      // ????????
      ShowProgressCaption(100,'���������� ������������ � �� ��� ���������� �������������� ������', 2000, True);
      Exit;
    end;
  end;

  qwrCommand.First;

  while (not qwrCommand.Eof) do begin
    if (qwrCommand.FieldByName('FType').AsInteger = 1) then begin
      if (NeedUpdate(qwrCommand.FieldByName('File_Name').AsString,qwrCommand.FieldByName('File_Date').AsDateTime)) then begin
        //  ���������� �����
        try
          TBlobField(qwrCommand.FieldByName('File_Data')).SaveToFile(currDir+qwrCommand.FieldByName('File_Name').AsString+'.new');
          RenameFile(currDir + qwrCommand.FieldByName('File_Name').AsString,currDir + qwrCommand.FieldByName('File_Name').AsString+'.old');
          MoveFile(PChar(currDir + qwrCommand.FieldByName('File_Name').AsString+'.new'),PChar(currDir + qwrCommand.FieldByName('File_Name').AsString));
        except
          //  ������ ��� ���������� ��� ������������� �����
          Result := False;
        end;
      end;
    end;
    qwrCommand.Next;
  end;
end;

constructor TUpdateLoader.Create;
begin
  inherited Create();
  frmVisualizer := TfrmLoader.Create(nil);
  frmVisualizer.Show;
  ProcessMessages();
  qwrCommand := TAdoQuery.Create(nil);
  qwrCommand.ConnectionString := conn_str;
  qwrCommand.SQL.Text := sql_select_project;
  GetFileName();
  GetFileInfo();
end;

destructor TUpdateLoader.Destroy;
begin
  qwrCommand.Close;
  qwrCommand.Free;
  frmVisualizer.Free;
  inherited Destroy();
end;

function TUpdateLoader.DoAdditionalJobs: Boolean;
begin
  Result := True;
end;

function TUpdateLoader.GetFileInfo: Boolean;
var
  exeName: array [0 .. 255] of WideChar;
  dwSize, dwReserved1: DWORD;
  pBuffer, pDtLang: PWord;
  strLang: String;
  pFileDescString: PChar;
begin
  if fullExeName = '' then
    GetFileName();
  Result := false;
  StrCopy(@exeName, PWideChar(fullExeName));
  dwSize := GetFileVersionInfoSize(@exeName, dwReserved1);
  if dwSize = 0 then
  begin
    raise Exception.Create('Could not retreive info size for file');
    Exit;
  end;

  try
    GetMem(pBuffer, dwSize);
    GetFileVersionInfo(@exeName, 0, dwSize, pBuffer);
    VerQueryValue(pBuffer, '\VarFileInfo\Translation', Pointer(pDtLang),
      dwReserved1);
    strLang := IntToHex(pDtLang^, 4);
    Inc(pDtLang, 1);
    strLang := strLang + IntToHex(pDtLang^, 4);
    VerQueryValue(pBuffer,
      PChar('\StringFileInfo\' + strLang + '\OriginalFilename'),
      Pointer(pFileDescString), dwReserved1);
    SetString(fileDescName, pFileDescString, Length(pFileDescString));
    VerQueryValue(pBuffer,
      PChar('\StringFileInfo\' + strLang + '\ProductName'),
      Pointer(pFileDescString), dwReserved1);
    SetString(fileProductName, pFileDescString, Length(pFileDescString));
    VerQueryValue(pBuffer,
      PChar('\StringFileInfo\' + strLang + '\FileVersion'),
      Pointer(pFileDescString), dwReserved1);
    SetString(fileVersion, pFileDescString, Length(pFileDescString));

    mProjectName := fileProductName;
    Result := True;
  finally
    FreeMem(pBuffer, dwSize);
  end;
end;

function TUpdateLoader.GetFileName: TFileName;
var
  buff: array [0 .. 254] of WideChar;
  lng: Integer;
begin
  lng := GetModuleFileName(0, @buff, 255);
  if lng <= 0 then
  begin
    raise Exception.Create('Could not retreive file executable name');
    Exit;
  end;
  SetString(fullExeName, PWideChar(@buff), lng);
  shortExeName := ExtractFileName(fullExeName);
  currDir := ExtractFilePath(fullExeName);
  mProgramDir := currDir;
  Result := fullExeName;
end;

function TUpdateLoader.InitApplication: Boolean;
var
  mainFileCheck, otherProgFilesCheck: Boolean;
begin
  Result := false;
  // ���� ��������� ������� True �� ��������� ���������������� � ��������
  // � ���� False �� ����������� (� ������ �������� ���������� � ������������)
  try
    mainFileCheck := CheckMainFileVersion();
    otherProgFilesCheck := CheckOtherProgramFiles();
    if not (mainFileCheck and otherProgFilesCheck) then begin
      // ���������� ��������� ���������  �� ������� ���������� ���
      // ������� � �������� ���������� � �������� ������������ �� ���������� ������
      // ��� � ����� � �������������� �������
      Exit;
    end;
  except
    // ��������� �������� � �������� ������ ����������, ������� ������������ ����������
  end;

  Result := True;
  if not CheckOtherStuffFiles() then begin
    // �� ������� ��������� �������������� �����
    // ����� ��������� ������������ �� ����� ���������� ������ ���������

  end;
  ShowProgressCaption(100, '����� ���������', 500);
  frmVisualizer.Free;
end;

class function TUpdateLoader.NeedUpdate(FileName: string; DBDate: TDateTime): Boolean;
begin
  Result := False;
  FileName := mProgramDir + FileName;

  if (not FileExists(FileName)) then begin
    //  ������ ����� �� ����������, ����� ������
    Result := True;
    Exit;
  end else begin
    if FileDateToDateTime(FileAge(FileName)) < DBDate then begin
      Result := True;
    end;
  end;
end;

class function TUpdateLoader.NeedUpdate(ExeVersion, DbVersion: String): Boolean;
var
  verListOld, verListNew: TStringList;
  verOld, verNew: DWORD;
  i: Integer;
  bContinue: Boolean;
begin
  Result := false;
  verListOld := TStringList.Create;
  verListNew := TStringList.Create;

  verListOld.Delimiter := '.';
  verListNew.Delimiter := '.';

  verListOld.DelimitedText := ExeVersion;
  verListNew.DelimitedText := DbVersion;

  if verListOld.Count <> verListNew.Count then
  begin
    raise Exception.Create('������������ ������ ������ ������ ���������');
    Exit;
  end;

  i := 0;
  bContinue := True;
  while bContinue and (i < verListOld.Count) do
  begin
    verOld := StrToInt(verListOld.Strings[i]);
    verNew := StrToInt(verListNew.Strings[i]);
    i := i + 1;
    if verNew <> verOld then
    begin
      if verNew > verOld then
        Result := True;
      bContinue := false;
    end;
  end;
  verListOld.Free;
  verListNew.Free;
end;

procedure TUpdateLoader.ProcessMessages(wnd: HWND = 0);
var
  msg: TMsg;
begin
  if wnd = 0 then
    wnd := frmVisualizer.Handle;
  while PeekMessage(msg, wnd, 0, 0, PM_REMOVE) do
  begin
    TranslateMessage(msg);
    DispatchMessage(msg);
  end;
end;

procedure TUpdateLoader.ShowProgressCaption(Pos: Integer; Caption: string;
  Delay: Integer; IsWarning: Boolean = false);
begin
  frmVisualizer.pbProgress.Position := Pos;
  frmVisualizer.lblStasusMessage.Caption := Caption;
  if IsWarning then
  begin
    frmVisualizer.lblStasusMessage.Font.Color := clRed;
  end
  else
  begin
    frmVisualizer.lblStasusMessage.Font.Color := clBlack;
  end;
  ProcessMessages();
  Sleep(Delay);
end;

initialization

 CoInitializeEx(nil, 0);
 mProgramDir := GetCurrentDir();
end.
