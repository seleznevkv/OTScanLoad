unit DataModuleMain;

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs, Forms, DateUtils;

type
  TdmMain = class(TDataModule)
    conADOMain: TADOConnection;
    dsMain: TDataSource;
    qryADOMain: TADOQuery;
    dsTypes: TDataSource;
    tblTypes: TADOTable;
    qryADOInsert: TADOQuery;
    qryADODel: TADOQuery;
    qryADOFindNbr: TADOQuery;
    dsFind: TDataSource;
    qryADOFindDT: TADOQuery;
    Prog_Update: TADOQuery;
    qryADOScan: TADOQuery;
    dsScan: TDataSource;
    conADOUpdate: TADOConnection;
    dsModTypes: TDataSource;
    qryADOTypeInsert: TADOQuery;
    qryADODelType: TADOQuery;
    qryADOInsertScan: TADOQuery;
    qryADODocPageNo: TADOQuery;
    qryADODcPageNoModyfi: TADOQuery;
    qryADOScanDelete: TADOQuery;
    qryADOPageCountUpdate: TADOQuery;
    qryADOFlurView: TADOQuery;
    dsFlurView: TDataSource;
    qryADOFlurAdd: TADOQuery;
    qryADOFlurCheckExist: TADOQuery;
    qryADOWrongTabNo: TADOQuery;
    dsWrongTabNo: TDataSource;
    qryADOPrevTabCheck: TADOQuery;
    qryADOFlurPrevUpdate: TADOQuery;
    qryADOFlurRecordDel: TADOQuery;
    tblPolyTypes: TADOTable;
    dsPolyTypes: TDataSource;
    tblModPolyTypes: TADOTable;
    dsModPolyTypes: TDataSource;
    qryADOPolyTypeInsert: TADOQuery;
    qryADODelPolyType: TADOQuery;
    tblCategories: TADOTable;
    dsCategories: TDataSource;
    qryFrmDocTypesCombosFiller: TADOQuery;
    tblGroups: TADOTable;
    dsGroups: TDataSource;
    qryFrmMainDocTypesCombosFiller: TADOQuery;
    qwrModtypes: TADOQuery;
    qwrModtypesid: TAutoIncField;
    qwrModtypesd_type: TStringField;
    qwrModtypesidCategory: TSmallintField;
    qwrModtypest_Importance: TSmallintField;
    qwrModtypesCategoryName: TWideStringField;
    qwrModtypesGroupName: TStringField;
    tblPolyMonth: TADOTable;
    dsPolyMonth: TDataSource;
    qryADOMain2: TADOQuery;
    dsMain2: TDataSource;
    qryADOFindNbr2: TADOQuery;
    dsFind2: TDataSource;
    qryADOFindDT2: TADOQuery;
    qryADOMainid: TAutoIncField;
    qryADOMainNumber: TStringField;
    qryADOMainPage_Number: TSmallintField;
    qryADOMainDT: TDateTimeField;
    qryADOMainImportance: TBooleanField;
    qryADOMainid_type: TSmallintField;
    qryADOMain2id: TAutoIncField;
    qryADOMain2Number: TStringField;
    qryADOMain2Page_Number: TSmallintField;
    qryADOMain2DT: TDateTimeField;
    qryADOMain2Importance: TBooleanField;
    qryADOMain2id_type: TSmallintField;
    qryADOScan2: TADOQuery;
    dsscan2: TDataSource;
    qryADOScanId: TADOQuery;
    qryADOUpdateScan: TADOQuery;
    procedure qryADOFlurViewBeforePost(DataSet: TDataSet);
    procedure tblModPolyTypesAfterPost(DataSet: TDataSet);
    procedure tblModTypesAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

{$R *.dfm}procedure TdmMain.qryADOFlurViewBeforePost(DataSet: TDataSet);
begin
  if (dmMain.qryADOFlurView.FieldByName('Status').Value=True) then
   begin
     dmMain.qryADOFlurView.FieldByName('DateOUT').Value:= '28.'+IntToStr(MonthOfTheYear(date))+'.'+IntToStr(YearOf(date));
     dmMain.qryADOFlurView.FieldByName('Deb').Value:= 0;
   end
  else
   begin
     dmMain.qryADOFlurView.FieldByName('DateOUT').Value:=0;
   end;  
end;

procedure TdmMain.tblModPolyTypesAfterPost(DataSet: TDataSet);
begin
  dmMain.tblPolyTypes.Requery;
end;

procedure TdmMain.tblModTypesAfterPost(DataSet: TDataSet);
begin
  dmMain.tblTypes.Requery;
end;

end.
