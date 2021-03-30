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

    /// Обновляет содержимое окна визуализации процесса загрузки
    procedure ProcessMessages(wnd: HWND = 0);

    /// Получает имя исполняемого файла запущенной программы, инициализирует поле
    /// fullExeName значением полного имени исполняемого файла
    /// а также устанавливает в поле shortExeName только имя файла без пути
    function GetFileName(): TFileName;

    /// Считывает из информации о файле значения ProductName, OriginalFilename
    /// и ProductVersion и записывает эти значения в поля fileProductName,
    /// fileDescName и fileVersion
    function GetFileInfo(): Boolean;


    /// По замыслу эта функция должна вызываться после всех обновлений
    /// перед запуском программы для возможности выполнения дополнительных
    /// действий
    function DoAdditionalJobs(): Boolean;

    /// Проверяет версию запущенного исполняемого файла программы (по номеру версии)
    /// и в случае необходимости загружает и заменяет необходимый файл
    /// Возвращает False если произошло обновление и необходим перезапуск программы
    /// (завершение запущенной копии) или если при обновлении произошла ошибка и
    /// нужно завершение программы
    /// Возвращает True если версия не нуждается в обновлении и необходимо
    /// продолжить запуск программы
    function CheckMainFileVersion(): Boolean;

    /// Проверяет версии остальных файлов имеющих в базе данных ненулловое поле
    /// версии, установленный флаг MainVersion и поле FileName отличное от
    /// OriginalFilename из информации о файле
    /// (пока функция не реализована)
    function CheckOtherProgramFiles(): Boolean;

    /// Проверяет по дате модификации файлы с полем File_Version равным null и в
    /// случае необходимости скачивает и заменяет их
    function CheckOtherStuffFiles(): Boolean;

    /// Устанавливает ProgressBar на окне визуализации загрузчика в положение Pos
    /// (от 0 до 100), выводит в Label значение Caption, в случае, если IsWarning
    /// установлено в True цвет текста Label - красный, и производит задержку в
    /// Delay миллисекунд
    procedure ShowProgressCaption(Pos: Integer; Caption: string;
      Delay: Integer; IsWarning: Boolean = false);

  protected
    /// По двум строковым значениям версии локального файла и версии файла в БД
    /// определяет необходимость обновления локального файла
    /// Возвращает True если обновление необходимо
    class function NeedUpdate(ExeVersion, DbVersion: String): Boolean; overload;static;


    /// Проверяет необходимость обновления файла по значению даты последней
    /// модификации, возвращает True если обновление необходимо
    class function NeedUpdate(FileName: string; DBDate: TDateTime): Boolean;overload;static;

  public

    /// Функция вызывается при старте приложения и выполняет необходимые действия
    /// по обновлению.
    /// Возвращаемые результаты:
    /// True - необходимо продолжить запуск программы
    /// False - необходимо завершить программу
    function InitApplication(): Boolean;


    ///  Функция по имени файла проверяет в БД по дате последнего изменения
    ///  необходимость обновления файла и в случае необходимости заменяет
    ///  файл на новый. Возвращает True в случае успешного обновления и False
    ///  в случае ошибок. Также в некоторых случаях функция выдаёт Exception
    ///  поэтому для выявления ошибок можно использовать try ... except
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
  mProgramDir: String;     // Глобальные переменные для функций
  mProjectName: String;    // отвязанных от класса


  { TUpdateLoader }

  /// Функция ищет в записях, возвращённых запросом запись с именем файла,
  /// соответствующим параметру OriginalFilename информации о файле
class function TUpdateLoader.CheckFileUpdate(FileName: String): Boolean;
var
  qwrCommandLocal: TAdoQuery;
  recordFound: Boolean;
begin
  Result := False;
  //  Проверка имени проекта
  if mProjectName = '' then begin
    raise Exception.Create('Не инициализирована глобальная переменная имени проекта, для инициализации необходимо хотя бы один раз создать объект класса TUpdateLoader');
    Exit;
  end;

  try
    qwrCommandLocal := TAdoQuery.Create(nil);
  except
    raise Exception.Create('Проблемы с вызовом функции CoInitialize, возможно её следует вызвать для конкретного потока');
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
    raise Exception.Create('Невозможно выполнить запрос в функции TUpdateLoader.CheckFileUpdate');
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
        ///  Пиши обновление файла
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
        'Не задан параметр "OriginalFilename" в информации о файле, работа модуля обновления без данного параметра невозможна, продолжить загрузку без обновления программы?', 'Warning!', MB_YESNO or MB_ICONWARNING) = ID_NO then
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
        'Не задан параметр "ProductName" в информации о файле, работа модуля обновления без данного параметра невозможна, продолжить загрузку без обновления программы?', 'Warning!', MB_YESNO or MB_ICONWARNING) = ID_NO then
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
        'Не задан параметр "FileVersion" в информации о файле, работа модуля обновления без данного параметра невозможна, продолжить загрузку без обновления программы?', 'Warning!', MB_YESNO or MB_ICONWARNING) = ID_NO then
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
      'Невозможно задать параметр для запроса (отладочная ошибка)', 5000, True);
    Exit;
  end;

  if (not qwrCommand.Active) then
  begin
    try
      qwrCommand.Open();
    except
      // невозможно подключиться к БД
      // Нужно бы вывести это сообщение на форму
      ShowProgressCaption(100,
        'Невозможно подключиться к БД для обновления, приложение будет закрыто'
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
      'В базе данных не найден соответствующий файл обновления, запустить текущую версию программы?', 'Warning!!', MB_YESNO or MB_ICONWARNING) = ID_YES then
    begin
      Result := True;
    end;
    Exit;
  end;
  ShowProgressCaption(10, 'Проверка наличия обновлений', 150);
  if FileExists(fullExeName + '.old') then
  begin
    // Удаляем лишний файл обновления
    DeleteFile(PChar(fullExeName + '.old'));
  end;

  if (NeedUpdate(fileVersion, qwrCommand.FieldByName('File_Version').AsString))
    then
  begin
    // Пытаемся обновиться
    ShowProgressCaption(25, 'Обновление найдено, скачиваем', 150);
    try
      TBlobField(qwrCommand.FieldByName('File_Data')).SaveToFile
        (fullExeName + '.new');
    except
      // не удалось сохранить или скачать файл из БД
      if (MessageBox(0,
          'Не удалось скачать файл обновления, продолжить работу со старой версией?'
            , 'Warning!!', MB_YESNO or MB_ICONWARNING) = ID_YES) then
      begin
        Result := True;
      end;
      Exit;
    end;
    try
      ShowProgressCaption(50, 'Обновляем исполняемый файл', 150);
      RenameFile(fullExeName, fullExeName + '.old');
      MoveFile(PChar(fullExeName + '.new'), PChar(fullExeName));
    except
      // Невозможно заменить файло
      ShowProgressCaption(100,
        'Невозможно заменить файло на обновлённый, программа будет закрыта',
        2000, True);
      Exit;
    end;
    ShowProgressCaption(100, 'Перезапускаем программу', 150);
    ShellExecute(0, 'open', PChar(fullExeName), nil, nil, SW_SHOWNORMAL);
  end
  else
  begin
    ShowProgressCaption(25, 'Обновление исполняемого файла не требуется', 150);
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
  // По умолчанию программа возвращает положительный результат, так как
  // проверку остальных файлов я считаю не важной

  if CheckParamsExists()<> B_NORMAL then Exit;

  try
    if qwrCommand.Parameters.ParamByName('prmProjectName').Value = Null() then begin
      //  Не заданы параметры запроса, значит проблемы
      qwrCommand.Parameters.ParamByName('prmProjectName').Value := fileProductName;
    end;

  except
    // Не созданы объекты параметров или другая проблема
    ShowProgressCaption(50,'Невозможно скачать из базы дополнительные файлы',1000,True);
    Exit;
  end;

  if (not qwrCommand.Active) then begin
    try
      qwrCommand.Open();
    except
      // невозможно подключиться к БД
      // ????????
      ShowProgressCaption(100,'Невозможно подключиться к БД для обновления дополнительных файлов', 2000, True);
      Exit;
    end;
  end;

  qwrCommand.First;

  while (not qwrCommand.Eof) do begin
    if (qwrCommand.FieldByName('FType').AsInteger = 1) then begin
      if (NeedUpdate(qwrCommand.FieldByName('File_Name').AsString,qwrCommand.FieldByName('File_Date').AsDateTime)) then begin
        //  Обновление нужно
        try
          TBlobField(qwrCommand.FieldByName('File_Data')).SaveToFile(currDir+qwrCommand.FieldByName('File_Name').AsString+'.new');
          RenameFile(currDir + qwrCommand.FieldByName('File_Name').AsString,currDir + qwrCommand.FieldByName('File_Name').AsString+'.old');
          MoveFile(PChar(currDir + qwrCommand.FieldByName('File_Name').AsString+'.new'),PChar(currDir + qwrCommand.FieldByName('File_Name').AsString));
        except
          //  Ощибка при скачивании или переименовани файла
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
  // Если результат функции True то программа инициализируется и стартует
  // а если False то завершается (в случае удачного обновления с перезапуском)
  try
    mainFileCheck := CheckMainFileVersion();
    otherProgFilesCheck := CheckOtherProgramFiles();
    if not (mainFileCheck and otherProgFilesCheck) then begin
      // Необходимо завершить программу  по причине обновления или
      // неудачи в процессе обновления с решением пользователя не продолжать запуск
      // или в связи с невозможностью запуска
      Exit;
    end;
  except
    // Произошёл эксепшен в функциях поиска обновлений, вывести пользователю информацию
  end;

  Result := True;
  if not CheckOtherStuffFiles() then begin
    // Не удалось загрузить дополнительные файлы
    // Можно уведомить пользователя но нужно продолжить запуск программы

  end;
  ShowProgressCaption(100, 'Старт программы', 500);
  frmVisualizer.Free;
end;

class function TUpdateLoader.NeedUpdate(FileName: string; DBDate: TDateTime): Boolean;
begin
  Result := False;
  FileName := mProgramDir + FileName;

  if (not FileExists(FileName)) then begin
    //  такого файла не существует, нужно кочать
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
    raise Exception.Create('Неправильный формат строки версии программы');
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
