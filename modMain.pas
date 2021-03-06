unit modMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxContainer, cxImage, cxDBEdit, StdCtrls,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Menus, cxLookAndFeelPainters, cxButtons, ExtDlgs,
  cxCheckBox, cxCalendar, dxBar, ExtCtrls, cxLabel,
  cxNavigator, cxDBNavigator, DateUtils, cxLookAndFeels, dxCore, cxDateUtils,
  dxLayoutContainer, cxGridCustomLayoutView, cxGridLayoutView,
  cxGridDBLayoutView;
                                                          //GIFImage,
type
  TfrmMain = class(TForm)
    dlgOpenPicScan: TOpenPictureDialog;
    dxbrmngrMain: TdxBarManager;
    dxbrmngrMainBar1: TdxBar;
    dxbrpmnPopUp: TdxBarPopupMenu;
    dxbrbtnEdit: TdxBarButton;
    dxbrbtnDel: TdxBarButton;
    tmrDataLoad: TTimer;
    tmrClose: TTimer;
    dxbrbtnDocTypes: TdxBarButton;
    dxbrsbtmSpravochnik: TdxBarSubItem;
    dxbrbtnEditTypes: TdxBarButton;
    dxbrbtnDelType: TdxBarButton;
    cxstylrpstry1: TcxStyleRepository;
    cxstyl1: TcxStyle;
    cxstyl2: TcxStyle;
    cxstyl3: TcxStyle;
    dxbrbtnFlurPopUpEdit: TdxBarButton;
    dxbrbtnBarFlurPopUpDel: TdxBarButton;
    dxbrpmnFlurPopUp: TdxBarPopupMenu;
    dxbrbtnPoly: TdxBarButton;
    dxbrbtnPolyTypesEdit: TdxBarButton;
    dxbrbtnPolyTypesDel: TdxBarButton;
    tmrAPPTerminate: TTimer;
    pgcMain: TPageControl;
    tsPrikaz: TTabSheet;
    imgSmall: TcxDBImage;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lblGroupName: TLabel;
    lblCategoryName: TLabel;
    cxtxtdtNumber: TcxTextEdit;
    cxdtdDate: TcxDateEdit;
    btnAddDoc: TcxButton;
    cbDocType: TcxComboBox;
    cxchckbxImporten: TcxCheckBox;
    cbGroupName: TcxComboBox;
    cbCategoryName: TcxComboBox;
    grp2: TGroupBox;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    cxtxtdtFindNo: TcxTextEdit;
    cxdtdtFindDT1: TcxDateEdit;
    btnFind: TcxButton;
    cxdtdtFindDT2: TcxDateEdit;
    cxchckbxFind: TcxCheckBox;
    lblDataLoad: TcxLabel;
    cxdbnvgtrScan1: TcxDBNavigator;
    btnAddScan: TcxButton;
    cxlblDocPageNo: TcxLabel;
    btnScanPrev: TcxButton;
    btnScanNext: TcxButton;
    btnScanDel: TcxButton;
    btnModyfiNo: TcxButton;
    tPoly: TTabSheet;
    grp3: TGroupBox;
    cxgrdDocTypes1: TcxGrid;
    cxgrdbtblvwGrid2DBTableView1: TcxGridDBTableView;
    cxgrdbclmnGrid2DBTableView1TabNo: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1Status: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1Deb: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1FIO: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DateIN: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1DEPARTMENT: TcxGridDBColumn;
    cxgrdlvlGrid2Level1: TcxGridLevel;
    grp4: TGroupBox;
    lbl9: TLabel;
    lbl10: TLabel;
    Label1: TLabel;
    cxtxtdtAddTabNo: TcxTextEdit;
    btnFlurAdd: TcxButton;
    cbbPolyType: TcxLookupComboBox;
    btnUpdateFlurList: TcxButton;
    cbbPolyMonth: TcxLookupComboBox;
    cxlblLoading: TcxLabel;
    tspdf: TTabSheet;
    changepdf: TcxButton;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cxtxtdtFindNo2: TcxTextEdit;
    cxdtdtFindDT12: TcxDateEdit;
    cxdtdtFindDT22: TcxDateEdit;
    cxchckbxFind2: TcxCheckBox;
    btnFind2: TcxButton;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    cxtxtdtNumber2: TcxTextEdit;
    cxdtdDate2: TcxDateEdit;
    btnAddDoc2: TcxButton;
    cbDocType2: TcxComboBox;
    cxchckbxImporten2: TcxCheckBox;
    cbGroupName2: TcxComboBox;
    cbCategoryName2: TcxComboBox;
    btnaddscan2: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxgrdbclmnGrid1DBTableView1type: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Number: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTablePageNumber: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Date: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Importance: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1Number: TcxGridDBColumn;
    cxGridDBTableView1DT: TcxGridDBColumn;
    cxGridDBTableView1Importance: TcxGridDBColumn;
    cxGridDBTableView1id_type: TcxGridDBColumn;
    tmrDataLoad2: TTimer;
    lblscanex: TLabel;
    flpdfdialog: TOpenDialog;
    PDFEditMenu: TPopupMenu;
    dxpdfedit: TMenuItem;
    dxpdfdel: TMenuItem;
    procedure btnAddDocClick(Sender: TObject);
    procedure dxbrbtnEditClick(Sender: TObject);
    procedure dxbrbtnDelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxchckbxFindClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure cxtxtdtFindNoClick(Sender: TObject);
    procedure cxdtdtFindDT1Click(Sender: TObject);
    procedure cxdtdtFindDT2Click(Sender: TObject);
    procedure cxtxtdtFindNoKeyPress(Sender: TObject; var Key: Char);
    procedure cxdtdtFindDT1KeyPress(Sender: TObject; var Key: Char);
    procedure cxdtdtFindDT2KeyPress(Sender: TObject; var Key: Char);
    procedure cbbTypePropertiesChange(Sender: TObject);
    procedure imgSmallClick(Sender: TObject);
    procedure tmrDataLoadTimer(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure tmrCloseTimer(Sender: TObject);
    procedure dxbrbtnDocTypesClick(Sender: TObject);
    procedure dxbrbtnEditTypesClick(Sender: TObject);
    procedure dxbrbtnDelTypeClick(Sender: TObject);
    procedure btnAddScanClick(Sender: TObject);
    procedure btnScanNextClick(Sender: TObject);
    procedure btnScanPrevClick(Sender: TObject);
    procedure btnScanDelClick(Sender: TObject);
    procedure btnModyfiNoClick(Sender: TObject);
    procedure cxtxtdtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnFlurAddClick(Sender: TObject);
    procedure cxtxtdtAddTabNoKeyPress(Sender: TObject; var Key: Char);
    procedure cxgrdbtblvwGrid2DBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure dxbrbtnFlurPopUpEditClick(Sender: TObject);
    procedure dxbrbtnBarFlurPopUpDelClick(Sender: TObject);
    procedure cxGrid1DBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cbbPolyTypePropertiesChange(Sender: TObject);
    procedure dxbrbtnPolyClick(Sender: TObject);
    procedure dxbrbtnPolyTypesEditClick(Sender: TObject);
    procedure dxbrbtnPolyTypesDelClick(Sender: TObject);
    procedure tmrAPPTerminateTimer(Sender: TObject);
    procedure btnUpdateFlurListClick(Sender: TObject);
    procedure cbGroupNamePropertiesChange(Sender: TObject);
    procedure cbCategoryNamePropertiesChange(Sender: TObject);
    procedure tsPrikazShow(Sender: TObject);
    procedure cbGroupName2PropertiesChange(Sender: TObject);
    procedure cbCategoryName2PropertiesChange(Sender: TObject);
    procedure tspdfShow(Sender: TObject);
    procedure btnFind2Click(Sender: TObject);
    procedure btnAddDoc2Click(Sender: TObject);
    procedure tmrDataLoad2Timer(Sender: TObject);
    procedure btnaddscan2Click(Sender: TObject);
    procedure changepdfClick(Sender: TObject);
    procedure cxchckbxFind2Click(Sender: TObject);
    procedure dxpdfeditClick(Sender: TObject);
    procedure dxpdfdelClick(Sender: TObject);
    procedure scanexist();
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    function UpdateGroupCombo():Boolean;
    function UpdateCategoryCombo(): Boolean;
    function UpdateDocTypeCombo(): Boolean;
        function UpdateGroupCombo2():Boolean;
    function UpdateCategoryCombo2(): Boolean;
    function UpdateDocTypeCombo2(): Boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  TableLastID,pg: Integer;

implementation

uses
  DataModuleMain, DataModulePoly, frmDocView, SelfUpdate, DocTypes, PolyTypes, DocPageNo, DocPageModyfi, ADODB;
{$R *.dfm}


procedure TfrmMain.scanexist();
begin
  dmmain.qryADOScanId.Close;
dmmain.qryADOScanId.Parameters.ParamByName('id').Value:=dmmain.qryADOMain2.FieldByName('id').Value;
dmmain.qryADOScanId.open;
if dmmain.qryADOScanId.FieldByName('docscan').Value<>null then
begin
lblscanex.Font.Color:=clgreen;
lblscanex.Caption:='PDF ????????!';
end
else
begin
lblscanex.Font.Color:=clred;
lblscanex.Caption:='PDF ?? ????????!';
end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  try
    frmSelfUpdate:=TfrmSelfUpdate.Create(frmSelfUpdate);
    frmSelfUpdate.ShowModal;
    FreeAndNil(frmSelfUpdate);

//   Application.ProcessMessages;
    //frmSelfUpdate.Destroy;
       cxdtdDate2.Date:=Date;
    frmMain.Cursor:=crSQLWait;
    tsPrikaz.Cursor:=crSQLWait;
    cxGrid1.Cursor:=crSQLWait;
    imgSmall.Cursor:=crSQLWait;

    cxdtdDate.Date:=Date;

    lblDataLoad.Visible:=True;
    Application.ProcessMessages;
    tmrDataLoad.Enabled:=True;
    tmrDataLoad2.Enabled:=True;
    imgSmall.ShowHint:=True;

   //  dmMain.tblTypes.Active;
    //cbbType.Text:=dmMain.tblTypes.FieldValues['d_type'];

    dmMain.qryADOScan.Close;
    dmMain.qryADOScan.Parameters.ParamByName('pID').Value:= dmMain.qryADOMain.FieldValues['id'];
    dmMain.qryADOScan.Open;




//    Application.ProcessMessages;
//    Sleep(300);
//    frmSelfUpdate.Destroy;

  except
    //MessageDlg('?????? ??????????? ? ???????!',  mtError, [mbOK], 0);
    //Application.Terminate;
    Close;
  end;


end;

//--- ???????, ???????????? -----------------------------------------------------------------------

procedure TfrmMain.cbbTypePropertiesChange(Sender: TObject);
begin
  //dmMain.qryADOInsert.Parameters.ParamByName('id_type').Value:= cbbType.Properties.DataController.Values[cbbType.ItemIndex,1];
end;

procedure TfrmMain.cbCategoryName2PropertiesChange(Sender: TObject);
begin
UpdateDocTypeCombo2();
end;

procedure TfrmMain.cbCategoryNamePropertiesChange(Sender: TObject);
begin
  UpdateDocTypeCombo();
end;

procedure TfrmMain.cbGroupName2PropertiesChange(Sender: TObject);
begin
UpdateCategoryCombo2();
end;

procedure TfrmMain.cbGroupNamePropertiesChange(Sender: TObject);
begin
  UpdateCategoryCombo();
end;

procedure TfrmMain.changepdfClick(Sender: TObject);
var CursorLocation:integer;
begin

dmMain.qryADOscanid.close;
try

    if (cxGridDBTableView1.DataController.DataSource=dmMain.dsMain2) then
        dmMain.qryADOscanid.Parameters.ParamByName('id').Value:= dmMain.qryADOMain2.FieldValues['id']
    else begin
    if (dmMain.dsFind2.DataSet=dmMain.qryADOFindNbr2) then
          dmMain.qryADOscanid.Parameters.ParamByName('id').Value:= dmMain.qryADOFindNbr2.FieldValues['id'];
    if (dmMain.dsFind2.DataSet=dmMain.qryADOFindDT2) then
           dmMain.qryADOscanid.Parameters.ParamByName('id').Value:= dmMain.qryADOFindDT2.FieldValues['id'];
     end;
      dmMain.qryADOscanid.open;

    

    if (flpdfdialog.Execute) then
     begin
      dmMain.qryADOupdateScan.Parameters.ParamByName('dscan').LoadFromFile(flpdfdialog.FileName, ftBytes);
      dmMain.qryADOupdateScan.Parameters.ParamByName('id').value:= dmMain.qryADOscanid.FieldValues['scanid'];
    dmMain.qryADOupdateScan.ExecSQL;

      CursorLocation:=dmMain.qryADOMain.FieldValues['id'];
      dmMain.qryADOMain2.Requery;
      dmMain.qryADOMain2.Locate('id',CursorLocation,[]);
     end;

  except
       showmessage('???????? ?????? ??? ????????? PDF ?????!');
  end;
end;

procedure TfrmMain.btnAddScanClick(Sender: TObject);
begin
  dmMain.qryADODocPageNo.Close;

   if (cxGrid1DBTableView1.DataController.DataSource=dmMain.dsMain) then
    begin
      dmMain.qryADODocPageNo.Parameters.ParamByName('pID').Value:= dmMain.qryADOMain.FieldValues['id'];
    end
   else
    begin
      if (dmMain.dsFind.DataSet=dmMain.qryADOFindNbr) then
       begin
         dmMain.qryADODocPageNo.Parameters.ParamByName('pID').Value:= dmMain.qryADOFindNbr.FieldValues['id'];
       end
      else
       begin
         dmMain.qryADODocPageNo.Parameters.ParamByName('pID').Value:= dmMain.qryADOFindDT.FieldValues['id'];
       end;
    end;

//  dmMain.qryADODocPageNo.Parameters.ParamByName('pID').Value:= dmMain.qryADOMain.FieldValues['id'];
  dmMain.qryADODocPageNo.Open;
  frmPageNo.cxtxtdtDocPageNo.Text:=IntToStr(dmMain.qryADODocPageNo.FieldValues['CountPageNo']+1);

  //frmPageNo.Visible:=True;
  frmPageNo.btnOkClick(Self);
end;

procedure TfrmMain.btnAddDoc2Click(Sender: TObject);
begin

    if (Length(cxtxtdtNumber2.Text)<1) then
     begin
       if MessageDlg('??????? ????? ?????????!',  mtWarning, mbOKCancel, 0) =
         mrOk then
       begin
         cxtxtdtNumber2.SetFocus;
       end;
       Exit;
     end;

    dmMain.qryADOInsert.Parameters.ParamByName('Number').Value:=cxtxtdtNumber2.Text;
    dmMain.qryADOInsert.Parameters.ParamByName('Page_Number').Value:=999;//cxtxtdtPageNo.Text;
    dmMain.qryADOInsert.Parameters.ParamByName('DT').Value:=cxdtdDate2.Date+Time;
    dmMain.qryADOInsert.Parameters.ParamByName('Importance').Value:=cxchckbxImporten2.Checked;
    //dmMain.qryADOInsert.Parameters.ParamByName('Scan').LoadFromFile(dlgOpenPicScan.FileName, ftBytes);

    try
      if (Length(cbDocType2.Text)<1) then
        begin
          MessageDlg('??????? ??? ???????????? ?????????!',  mtWarning,
            [mbOK], 0);
        end
      else
        begin
          dmMain.qryADOInsert.Parameters.ParamByName('id_type').Value:= Integer(cbDocType2.Properties.Items.Objects[cbDocType2.ItemIndex]);

          Application.ProcessMessages;
          dmMain.qryADOInsert.ExecSQL;

          //dmMain.qryADOInsertScan.Parameters.ParamByName('id_doc'):=;
          //dmMain.qryADOInsertScan.Parameters.ParamByName('DocScan').LoadFromFile(dlgOpenPicScan.FileName, ftBytes);

          //cxtxtdtNumber.Text:='';
          //cxtxtdtPageNo.Text:=IntToStr(StrToInt(cxtxtdtPageNo.Text)+1);
          //cxchckbxImproten.Checked:=False;
          dmMain.qryADOMain2.Requery;
                    btnaddscan2.enabled:=true;
                    btnadddoc2.enabled:=false;

                    changepdf.Enabled:=false;

                    cxgrid2.Enabled:=false;
                    cxchckbxFind2.Enabled:=false;
     end;
    except
      MessageDlg('?????? ?????????? ????????? ? ???? ??????!',  mtError,
        [mbOK], 0);

    end;
 // end
 //else
 // begin

 // end;
             lblscanex.Font.Color:=clred;
             lblscanex.Caption:='???????? PDF!';
end;

procedure TfrmMain.btnAddDocClick(Sender: TObject);
begin
// if (dlgOpenPicScan.Execute) then
//  begin

    if (Length(cxtxtdtNumber.Text)<1) then
     begin
       if MessageDlg('??????? ????? ?????????!',  mtWarning, mbOKCancel, 0) =
         mrOk then
       begin
         cxtxtdtNumber.SetFocus;
       end;
       Exit;
     end;  

    dmMain.qryADOInsert.Parameters.ParamByName('Number').Value:=cxtxtdtNumber.Text;
    dmMain.qryADOInsert.Parameters.ParamByName('Page_Number').Value:=0;//cxtxtdtPageNo.Text;
    dmMain.qryADOInsert.Parameters.ParamByName('DT').Value:=cxdtdDate.Date+Time;
    dmMain.qryADOInsert.Parameters.ParamByName('Importance').Value:=cxchckbxImporten.Checked;
    //dmMain.qryADOInsert.Parameters.ParamByName('Scan').LoadFromFile(dlgOpenPicScan.FileName, ftBytes);

    try
      if (Length(cbDocType.Text)<1) then
        begin
          MessageDlg('??????? ??? ???????????? ?????????!',  mtWarning,
            [mbOK], 0);
        end
      else
        begin
          dmMain.qryADOInsert.Parameters.ParamByName('id_type').Value:= Integer(cbDocType.Properties.Items.Objects[cbDocType.ItemIndex]);
          lblDataLoad.Visible:=True;
          Application.ProcessMessages;
          dmMain.qryADOInsert.ExecSQL;

          //dmMain.qryADOInsertScan.Parameters.ParamByName('id_doc'):=;
          //dmMain.qryADOInsertScan.Parameters.ParamByName('DocScan').LoadFromFile(dlgOpenPicScan.FileName, ftBytes);

          //cxtxtdtNumber.Text:='';
          //cxtxtdtPageNo.Text:=IntToStr(StrToInt(cxtxtdtPageNo.Text)+1);
          //cxchckbxImproten.Checked:=False;
          dmMain.qryADOMain.Requery;
          lblDataLoad.Visible:=False;

        end;
    except
      MessageDlg('?????? ?????????? ????????? ? ???? ??????!',  mtError,
        [mbOK], 0);

    end;
 // end
 //else
 // begin

 // end;

end;

procedure TfrmMain.btnaddscan2Click(Sender: TObject);
var CursorLocation:integer;
begin

try
    if (flpdfdialog.Execute) then
     begin
      dmMain.qryADOInsertScan.Parameters.ParamByName('id_doc').Value:=dmMain.qryADOMain2.FieldValues['id'];
      dmMain.qryADOInsertScan.Parameters.ParamByName('DocPageNo').Value:=1;
      dmMain.qryADOInsertScan.Parameters.ParamByName('DocScan').LoadFromFile(flpdfdialog.FileName, ftBytes);
      dmMain.qryADOInsertScan.ExecSQL;
      dmMain.qryADOScan.Requery;



      CursorLocation:=dmMain.qryADOMain2.FieldValues['id'];
      dmMain.qryADOMain2.Requery;
      dmMain.qryADOMain2.Locate('id',CursorLocation,[]);

     btnaddscan2.enabled:=false;
     btnadddoc2.enabled:=true;

     dxbrbtnEdit.Enabled:=true;

     cxgrid2.Enabled:=true;
     cxchckbxFind2.Enabled:=true;
 scanexist();

     end;

  except
        MessageDlg('?????? ?????????? ????????? ? ???? ??????!',  mtError,
        [mbOK], 0);
  end;
  if dxpdfedit.Checked then
  changepdf.enabled:=true
  else    changepdf.enabled:=false;

end;

procedure TfrmMain.dxbrbtnEditClick(Sender: TObject);
begin
  if (dxbrbtnEdit.Down) then
   begin
    cxGrid1DBTableView1.OptionsData.Editing:=True;
    dxbrbtnEdit.Down:=True;
   end
  else
   begin
    cxGrid1DBTableView1.OptionsData.Editing:=False;
    dxbrbtnEdit.Down:=False;
   end;
end;

procedure TfrmMain.dxbrbtnDelClick(Sender: TObject);
begin
   if MessageDlg('?? ????????????? ?????? ??????? ?????????',  mtWarning,
      mbOKCancel, 0) = mrOk then
   begin

     if (cxGrid1DBTableView1.DataController.DataSource=dmMain.dsMain) then
      begin
        dmMain.qryADODel.Parameters.ParamByName('id').Value:= dmMain.qryADOMain.FieldValues['id'];
      end
     else
      begin
        if (dmMain.dsFind.DataSet=dmMain.qryADOFindNbr) then
         begin
           dmMain.qryADODel.Parameters.ParamByName('id').Value:= dmMain.qryADOFindNbr.FieldValues['id'];
         end
        else
         begin
           dmMain.qryADODel.Parameters.ParamByName('id').Value:= dmMain.qryADOFindDT.FieldValues['id'];
         end;
      end;

     lblDataLoad.Visible:=True;
     Application.ProcessMessages;
     dmMain.qryADODel.ExecSQL;
     dmMain.qryADOMain.Requery;
     dmMain.qryADOFindNbr.Requery;
     dmMain.qryADOFindDT.Requery;
     lblDataLoad.Visible:=False;
   end;
end;

procedure TfrmMain.cxchckbxFind2Click(Sender: TObject);
begin
  if (cxchckbxFind2.Checked) then
    begin
      cxGridDBTableView1.DataController.DataSource:=dmMain.dsFind2;

      cxtxtdtFindNo2.Enabled:=True;
      cxdtdtFindDT12.Enabled:=True;
      cxdtdtFindDT22.Enabled:=True;
      btnFind2.Enabled:=True;
      btnAddDoc2.Enabled:=False;
      cxdtdtFindDT12.Date:=Date;
      cxdtdtFindDT22.Date:=Date;
    end
  else
    begin
      cxGridDBTableView1.DataController.DataSource:=dmMain.dsMain2;
      dmMain.qryADOMain2.Requery;

      cxtxtdtFindNo2.Enabled:=False;
      cxdtdtFindDT12.Enabled:=False;
      cxdtdtFindDT22.Enabled:=False;
      btnFind2.Enabled:=False;
      btnAddDoc2.Enabled:=True;
    end;
end;

procedure TfrmMain.cxchckbxFindClick(Sender: TObject);
begin
  if (cxchckbxFind.Checked) then
    begin
      cxGrid1DBTableView1.DataController.DataSource:=dmMain.dsFind;

      cxtxtdtFindNo.Enabled:=True;
      cxdtdtFindDT1.Enabled:=True;
      cxdtdtFindDT2.Enabled:=True;
      btnFind.Enabled:=True;
      btnAddDoc.Enabled:=False;
      cxdtdtFindDT1.Date:=Date;
      cxdtdtFindDT2.Date:=Date;
    end
  else
    begin
      cxGrid1DBTableView1.DataController.DataSource:=dmMain.dsMain;
      dmMain.qryADOMain.Requery;

      cxtxtdtFindNo.Enabled:=False;
      cxdtdtFindDT1.Enabled:=False;
      cxdtdtFindDT2.Enabled:=False;
      btnFind.Enabled:=False;
      btnAddDoc.Enabled:=True;
    end;
end;

procedure TfrmMain.btnFind2Click(Sender: TObject);
begin
if ((cxtxtdtFindNo2.Enabled) and  (Length(cxtxtdtFindNo2.Text)>0) ) then
    begin
      dmMain.dsFind2.DataSet:=dmMain.qryADOFindNbr2;
      dmMain.qryADOFindNbr2.Parameters.ParamByName('pNumber').Value:= cxtxtdtFindNo2.Text;

      try
        lblDataLoad.Visible:=True;
        Application.ProcessMessages;
        dmMain.qryADOFindNbr2.Active:=True;
        dmMain.qryADOFindNbr2.Requery;
        dmMain.qryADOScan.Requery;
        lblDataLoad.Visible:=False;
      except
        MessageDlg('??????? ????? ?????????!',  mtWarning,
        [mbOK], 0);
      end;

      cxdtdtFindDT12.Enabled:=False;
      cxdtdtFindDT22.Enabled:=False;
    end
  else
    begin
      dmMain.dsFind2.DataSet:=dmMain.qryADOFindDT2;
      dmMain.qryADOFindDT2.Parameters.ParamByName('pDT1').Value:= cxdtdtFindDT12.Date;
      dmMain.qryADOFindDT2.Parameters.ParamByName('pDT2').Value:= StrToDateTime(DateToStr(cxdtdtFindDT22.Date)+' 23:59:59');
      try
        lblDataLoad.Visible:=True;
        Application.ProcessMessages;
        dmMain.qryADOFindDT2.Active:=True;

        dmMain.qryADOFindDT2.Requery;
        dmMain.qryADOScan.Requery;
        lblDataLoad.Visible:=False;
      except
        MessageDlg('??????? ????????? ? ???????? ???? ??????!',  mtWarning,
        [mbOK], 0);
      end;

      cxtxtdtFindNo2.Enabled:=False;
    end;
    cxtxtdtFindNo2.Enabled:=True;
    cxdtdtFindDT12.Enabled:=True;
    cxdtdtFindDT22.Enabled:=True;
end;

procedure TfrmMain.btnFindClick(Sender: TObject);
begin
  if ((cxtxtdtFindNo.Enabled) and  (Length(cxtxtdtFindNo.Text)>0) ) then
    begin
      dmMain.dsFind.DataSet:=dmMain.qryADOFindNbr;
      dmMain.qryADOFindNbr.Parameters.ParamByName('pNumber').Value:= cxtxtdtFindNo.Text;

      try
        lblDataLoad.Visible:=True;
        Application.ProcessMessages;
        dmMain.qryADOFindNbr.Active:=True;
        dmMain.qryADOFindNbr.Requery;
        dmMain.qryADOScan.Requery;
        lblDataLoad.Visible:=False;
      except
        MessageDlg('??????? ????? ?????????!',  mtWarning,
        [mbOK], 0);
      end;

      cxdtdtFindDT1.Enabled:=False;
      cxdtdtFindDT2.Enabled:=False;
    end
  else
    begin
      dmMain.dsFind.DataSet:=dmMain.qryADOFindDT;
      dmMain.qryADOFindDT.Parameters.ParamByName('pDT1').Value:= cxdtdtFindDT1.Date;
      dmMain.qryADOFindDT.Parameters.ParamByName('pDT2').Value:= StrToDateTime(DateToStr(cxdtdtFindDT2.Date)+' 23:59:59');
      try
        lblDataLoad.Visible:=True;
        Application.ProcessMessages;
        dmMain.qryADOFindDT.Active:=True;

        dmMain.qryADOFindDT.Requery;
        dmMain.qryADOScan.Requery;
        lblDataLoad.Visible:=False;
      except
        MessageDlg('??????? ????????? ? ???????? ???? ??????!',  mtWarning,
        [mbOK], 0);
      end;

      cxtxtdtFindNo.Enabled:=False;
    end;
    cxtxtdtFindNo.Enabled:=True;
    cxdtdtFindDT1.Enabled:=True;
    cxdtdtFindDT2.Enabled:=True;
end;

procedure TfrmMain.cxtxtdtFindNoClick(Sender: TObject);
begin
    cxtxtdtFindNo.Enabled:=True;
    cxdtdtFindDT1.Enabled:=False;
    cxdtdtFindDT2.Enabled:=False;
end;

procedure TfrmMain.cxdtdtFindDT1Click(Sender: TObject);
begin
    cxtxtdtFindNo.Enabled:=False;
    cxdtdtFindDT1.Enabled:=True;
    cxdtdtFindDT2.Enabled:=True;
end;

procedure TfrmMain.cxdtdtFindDT2Click(Sender: TObject);
begin
    cxtxtdtFindNo.Enabled:=False;
    cxdtdtFindDT1.Enabled:=True;
    cxdtdtFindDT2.Enabled:=True;
end;

procedure TfrmMain.cxtxtdtFindNoKeyPress(Sender: TObject; var Key: Char);
begin
  if key  =  chr(VK_RETURN) then btnFindClick(Self);
end;

procedure TfrmMain.cxdtdtFindDT1KeyPress(Sender: TObject; var Key: Char);
begin
  if key  =  chr(VK_RETURN) then btnFindClick(Self);
end;

procedure TfrmMain.cxdtdtFindDT2KeyPress(Sender: TObject; var Key: Char);
begin
  if key  =  chr(VK_RETURN) then btnFindClick(Self);
end;

procedure TfrmMain.imgSmallClick(Sender: TObject);
begin
  lblDataLoad.Visible:=True;
  Application.ProcessMessages;
  frmDocShow.Show;
  lblDataLoad.Visible:=False;
end;

procedure TfrmMain.tmrDataLoad2Timer(Sender: TObject);
begin
  tmrDataLoad2.Enabled:=False;

  dmMain.qryADOMain2.Open;

  dmMain.qryADOScan2.Close;
  dmMain.qryADOScan2.Parameters.ParamByName('pID').Value:= dmMain.qryADOMain2.FieldValues['id'];
  dmMain.qryADOScan2.Open;


    scanexist();
  lblDataLoad.Visible:=False;
  frmMain.Cursor:=crDefault;
  tspdf.Cursor:=crDefault;
  cxGrid2.Cursor:=crDefault;

end;

procedure TfrmMain.tmrDataLoadTimer(Sender: TObject);
begin
  tmrDataLoad.Enabled:=False;

  dmMain.qryADOMain.Open;
  dmMain.qryADOScan.Close;
  dmMain.qryADOScan.Parameters.ParamByName('pID').Value:= dmMain.qryADOMain.FieldValues['id'];
  dmMain.qryADOScan.Open;



  lblDataLoad.Visible:=False;
  frmMain.Cursor:=crDefault;
  tsPrikaz.Cursor:=crDefault;
  cxGrid1.Cursor:=crDefault;
  imgSmall.Cursor:=crHandPoint;
end;

procedure TfrmMain.tspdfShow(Sender: TObject);
begin
  UpdateGroupCombo2();
end;

procedure TfrmMain.tsPrikazShow(Sender: TObject);
begin
  UpdateGroupCombo();
end;

function TfrmMain.UpdateCategoryCombo: Boolean;
begin
  if cbGroupName.ItemIndex = -1 then begin
    Result := False;
    Exit;
  end;
  with dmMain.qryFrmMainDocTypesCombosFiller do begin
     Close;
     SQL.Clear;
     try
       SQL.Add('  select');
       SQL.Add('    IdCategory ''Id'',');
       SQL.Add('    CategoryName ''Name''');
       SQL.Add('  from');
       SQL.Add('    OT.dbo.OT_Prikaz_Categories');
       SQL.Add('  where');
       SQL.Add('    IdGroup = '+ IntToStr(Integer(cbGroupName.Properties.Items.Objects[cbGroupName.ItemIndex])));
       Open;
     except
       Close;
       Result := False;
       Exit;
     end;
     First;
     cbCategoryName.Properties.Items.Clear;
     while not EOF do begin
       cbCategoryName.Properties.Items.AddObject(FieldByName('Name').AsString,TObject(FieldByName('Id').AsInteger));
       Next;
     end;
  end;

  cbCategoryName.ItemIndex := 0;
  Result := True;
end;

function TfrmMain.UpdateCategoryCombo2: Boolean;
begin
  if cbGroupName2.ItemIndex = -1 then begin
    Result := False;
    Exit;
  end;
  with dmMain.qryFrmMainDocTypesCombosFiller do begin
     Close;
     SQL.Clear;
     try
       SQL.Add('  select');
       SQL.Add('    IdCategory ''Id'',');
       SQL.Add('    CategoryName ''Name''');
       SQL.Add('  from');
       SQL.Add('    OT.dbo.OT_Prikaz_Categories');
       SQL.Add('  where');
       SQL.Add('    IdGroup = '+ IntToStr(Integer(cbGroupName2.Properties.Items.Objects[cbGroupName2.ItemIndex])));
       Open;
     except
       Close;
       Result := False;
       Exit;
     end;
     First;
     cbCategoryName2.Properties.Items.Clear;
     while not EOF do begin
       cbCategoryName2.Properties.Items.AddObject(FieldByName('Name').AsString,TObject(FieldByName('Id').AsInteger));
       Next;
     end;
  end;

  cbCategoryName2.ItemIndex := 0;
  Result := True;
end;



function TfrmMain.UpdateDocTypeCombo: Boolean;
begin
  if cbCategoryName.ItemIndex = -1 then begin
    Result := False;
    Exit;
  end;
  with dmMain.qryFrmMainDocTypesCombosFiller do begin
     Close;
     SQL.Clear;
     try
       SQL.Add('select');
       SQL.Add('	Id ''Id'',');
       SQL.Add('  d_type ''Name''');
       SQL.Add('from');
       SQL.Add('	OT.dbo.OT_Prikaz_Types');
       SQL.Add('where');
       SQL.Add('	IdCategory ='+IntToStr(Integer(cbCategoryName.Properties.Items.Objects[cbCategoryName.ItemIndex])));

       Open;
     except
       Close;
       Result := False;
       Exit;
     end;
     First;
     cbDocType.Properties.Items.Clear;
     while not EOF do begin
       cbDocType.Properties.Items.AddObject(FieldByName('Name').AsString,TObject(FieldByName('Id').AsInteger));
       Next;
     end;
  end;

  cbDocType.ItemIndex := 0;
  Result := True;

end;

function TfrmMain.UpdateDocTypeCombo2: Boolean;
begin
  if cbCategoryName2.ItemIndex = -1 then begin
    Result := False;
    Exit;
  end;
  with dmMain.qryFrmMainDocTypesCombosFiller do begin
     Close;
     SQL.Clear;
     try
       SQL.Add('select');
       SQL.Add('	Id ''Id'',');
       SQL.Add('  d_type ''Name''');
       SQL.Add('from');
       SQL.Add('	OT.dbo.OT_Prikaz_Types');
       SQL.Add('where');
       SQL.Add('	IdCategory ='+IntToStr(Integer(cbCategoryName2.Properties.Items.Objects[cbCategoryName2.ItemIndex])));

       Open;
     except
       Close;
       Result := False;
       Exit;
     end;
     First;
     cbDocType2.Properties.Items.Clear;
     while not EOF do begin
       cbDocType2.Properties.Items.AddObject(FieldByName('Name').AsString,TObject(FieldByName('Id').AsInteger));
       Next;
     end;

  end;

  cbDocType2.ItemIndex := 0;
  Result := True;

end;

function TfrmMain.UpdateGroupCombo: Boolean;
begin
  with dmMain.qryFrmMainDocTypesCombosFiller do begin
     Close;
     SQL.Clear;
     try
       SQL.Text := 'select IdGroup ''Id'',GroupName ''Name'' from	OT.dbo.OT_Prikaz_Groups where GroupName = ''?????? ?????''';
       Open;
     except
       Close;
       Result := False;
       Exit;
     end;
     First;
     cbGroupName.Properties.Items.Clear;
     while not EOF do begin
       cbGroupName.Properties.Items.AddObject(FieldByName('Name').AsString,TObject(FieldByName('Id').AsInteger));
       Next;
     end;
  end;
  cbGroupName.ItemIndex := cbGroupName.Properties.Items.Count - 1;
  Result := True;
end;

function TfrmMain.UpdateGroupCombo2: Boolean;
begin
  with dmMain.qryFrmMainDocTypesCombosFiller do begin
     Close;
     SQL.Clear;
     try
       SQL.Text := 'select IdGroup ''Id'',GroupName ''Name'' from	OT.dbo.OT_Prikaz_Groups where GroupName = ''?????? ?????''';
       Open;
     except
       Close;
       Result := False;
       Exit;
     end;
     First;
     cbGroupName2.Properties.Items.Clear;
     while not EOF do begin
       cbGroupName2.Properties.Items.AddObject(FieldByName('Name').AsString,TObject(FieldByName('Id').AsInteger));
       Next;
     end;
  end;
  cbGroupName2.ItemIndex := cbGroupName2.Properties.Items.Count - 1;
  Result := True;
end;

procedure TfrmMain.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if (cxchckbxFind.Checked) then
    begin
      if ((cxtxtdtFindNo.Enabled) and (Length(cxtxtdtFindNo.Text)>0) ) then
        begin
          dmMain.qryADOScan.Parameters.ParamByName('pID').Value:= dmMain.qryADOFindNbr.FieldValues['id'];
        end
      else
        begin
          dmMain.qryADOScan.Parameters.ParamByName('pID').Value:= dmMain.qryADOFindDT.FieldValues['id'];
        end;
    end
  else
  begin
    dmMain.qryADOScan.Parameters.ParamByName('pID').Value:= dmMain.qryADOMain.FieldValues['id'];
  end;

  lblDataLoad.Visible:=True;
  Application.ProcessMessages;
  dmMain.qryADOScan.Requery;
  lblDataLoad.Visible:=False;

  dmMain.qryADODocPageNo.Close;
  dmMain.qryADODocPageNo.Parameters.ParamByName('pID').Value:= dmMain.qryADOMain.FieldValues['id'];
  dmMain.qryADODocPageNo.Open;
  if (dmMain.qryADOScan.RecordCount>0) then
   begin
     cxlblDocPageNo.Caption:=IntToStr(dmMain.qryADOScan.FieldValues['DocPageNo']);
   End
  else
   begin
     cxlblDocPageNo.Caption:='0';
   end;
end;

procedure TfrmMain.tmrCloseTimer(Sender: TObject);
begin
  tmrClose.Enabled:=False;
  frmDocShow.Visible:=False;
end;

procedure TfrmMain.dxbrbtnDocTypesClick(Sender: TObject);
begin
  frmDocTypes.Show;
end;

procedure TfrmMain.dxbrbtnEditTypesClick(Sender: TObject);
begin
  if (dxbrbtnEditTypes.Down) then
   begin
    frmDocTypes.cxgrdbtblvwGrid1DBTableView1.OptionsData.Editing:=True;
    dxbrbtnEditTypes.Down:=True;
   end
  else
   begin
    frmDocTypes.cxgrdbtblvwGrid1DBTableView1.OptionsData.Editing:=False;
    dxbrbtnEditTypes.Down:=False;
   end;
end;

procedure TfrmMain.dxbrbtnDelTypeClick(Sender: TObject);
begin
   if MessageDlg('?? ????????????? ?????? ??????? ??? ??????????',  mtWarning,
      mbOKCancel, 0) = mrOk then
   begin
     dmMain.qryADODelType.Parameters.ParamByName('id').Value:= dmMain.qwrModTypes.FieldValues['id'];
     dmMain.qryADODelType.ExecSQL;
     dmMain.qwrModTypes.Requery;
     dmMain.tblTypes.Requery;
   end;
end;


procedure TfrmMain.btnScanNextClick(Sender: TObject);
begin
  lblDataLoad.Visible:=True;
  Application.ProcessMessages;
  dmMain.qryADOScan.Next;
  lblDataLoad.Visible:=False;
  if (dmMain.qryADOScan.RecordCount>0) then
   begin
     cxlblDocPageNo.Caption:=IntToStr(dmMain.qryADOScan.FieldValues['DocPageNo']);
   End
  else
   begin
     cxlblDocPageNo.Caption:='0';
   end;
end;

procedure TfrmMain.btnScanPrevClick(Sender: TObject);
begin
  lblDataLoad.Visible:=True;
  Application.ProcessMessages;
  dmMain.qryADOScan.Prior;
  lblDataLoad.Visible:=False;
  if (dmMain.qryADOScan.RecordCount>0) then
   begin
     cxlblDocPageNo.Caption:=IntToStr(dmMain.qryADOScan.FieldValues['DocPageNo']);
   End
  else
   begin
     cxlblDocPageNo.Caption:='0';
   end;
end;

procedure TfrmMain.btnScanDelClick(Sender: TObject);
var
  CursorLocation: Integer;

begin

  if (dmMain.qryADOScan.RecordCount<1) then
   begin
     MessageDlg('??? ??????? ??? ????????!',  mtWarning, [mbOK], 0);
     Exit;
   end;

  if MessageDlg('?? ????????????? ?????? ??????? ???????? ??????????',
    mtWarning, mbOKCancel, 0) = mrOk then
  begin
    try
      dmMain.qryADOScanDelete.Parameters.ParamByName('id').Value:=dmMain.qryADOScan.FieldValues['id'];
      dmMain.qryADOScanDelete.ExecSQL;
      lblDataLoad.Visible:=True;
      Application.ProcessMessages;
      dmMain.qryADOScan.Requery;
      lblDataLoad.Visible:=False;

      if (dmMain.qryADOScan.RecordCount>0) then
       begin
         cxlblDocPageNo.Caption:=IntToStr(dmMain.qryADOScan.FieldValues['DocPageNo']);
       pg:=dmMain.qryADOMain.FieldValues['Page_Number'];
       End
      else
       begin
         cxlblDocPageNo.Caption:='0';
       end;


      dmMain.qryADOPageCountUpdate.Parameters.ParamByName('Page_Count').Value:=pg-1;
      dmMain.qryADOPageCountUpdate.Parameters.ParamByName('id').Value:=dmMain.qryADOScan.FieldValues['id_doc'];
      dmMain.qryADOPageCountUpdate.ExecSQL;
      CursorLocation:=dmMain.qryADOMain.FieldValues['id'];
      lblDataLoad.Visible:=True;
      Application.ProcessMessages;
      dmMain.qryADOMain.Requery;

      lblDataLoad.Visible:=False;
      dmMain.qryADOMain.Locate('id',CursorLocation,[]);
    except

    end;
  end;

end;

procedure TfrmMain.btnModyfiNoClick(Sender: TObject);
begin
  if (dmMain.qryADOScan.RecordCount>0) then
   Begin
     frmDocPageModyfi.cxtxtdtDocPageNo.Text:=dmMain.qryADOScan.FieldValues['DocPageNo'];
     frmDocPageModyfi.Visible:=True;
   end
  else
   begin
     MessageDlg('?????????? ???????? ????? ?????????????? ????????!',  
       mtWarning, [mbOK], 0);
   end;

end;

procedure TfrmMain.cxtxtdtNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if key  =  chr(VK_RETURN) then btnAddDoc.Click;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //if (FileExists('Connection.udl')) then
  // begin
   //  MessageDlg('OK',  mtWarning, [mbOK], 0);
  // end
  //else
  // begin
   //  MessageDlg('?????????? ????? ???? Connection.udl',  mtError, [mbOK], 0);
   //  dmMain.conADOMain.ConnectionString:='Provider=SQLOLEDB.1;Persist Security Info=False;User ID=Operator;Initial Catalog=OT;Data Source=192.168.75.100';
 //  end;
end;
//===  ???????, ???????????? ======================================================================


//--- ??????????? ---------------------------------------------------------------------------------

procedure Sound(Frequency, Duration: Integer);
asm
   push edx
   push eax
   mov eax, Win32Platform
   cmp eax, VER_PLATFORM_WIN32_NT
   jne @@9X
   call Windows.Beep
   ret
@@9X:
   pop eax
   pop edx
   push ebx
   push edx
   mov bx, ax
   mov ax, 34DDh
   mov dx, 0012h
   cmp dx, bx
   jnc @@2
   div bx
   mov bx, ax
   in al, 61h
   test al, 3
   jnz @@1
   or al, 3
   out 61h, al
   mov al, 0B6h
   out 43h, al
@@1:
   mov al, bl
   out 42h, al
   mov al, bh
   out 42h, al
   call Windows.Sleep
   in al, 61h
   and al, 0FCh
   out 61h, al
   jmp @@3
@@2:
   pop edx 
@@3:
   pop ebx
end;


procedure TfrmMain.btnFlurAddClick(Sender: TObject);
begin
  if (Length(cbbPolyType.Text)>0) then
   begin
      dmMain.qryADOFlurAdd.Parameters.ParamByName('TabNo').Value:= cxtxtdtAddTabNo.Text;
      dmMain.qryADOFlurAdd.Parameters.ParamByName('id_type').Value:= cbbPolyType.Properties.DataController.Values[cbbPolyType.ItemIndex,1];

      dmMain.qryADOFlurCheckExist.Parameters.ParamByName('TabNo').Value:= cxtxtdtAddTabNo.Text;
      dmMain.qryADOFlurCheckExist.Parameters.ParamByName('id_type').Value:= cbbPolyType.Properties.DataController.Values[cbbPolyType.ItemIndex,1];

      dmMain.qryADOPrevTabCheck.Parameters.ParamByName('TabNo').Value:= cxtxtdtAddTabNo.Text;
      dmMain.qryADOPrevTabCheck.Parameters.ParamByName('id_type').Value:= cbbPolyType.Properties.DataController.Values[cbbPolyType.ItemIndex,1];



          if (cbbPolyMonth.Text = ' ') or (cbbPolyMonth.Text = '???????')  then
           begin
                dmMain.qryADOFlurAdd.Parameters.ParamByName('DateIN').Value:= '01.'+IntToStr(MonthOfTheYear(date))+'.'+IntToStr(YearOf(date));
                dmMain.qryADOFlurCheckExist.Parameters.ParamByName('DateIN').Value:= '01.'+IntToStr(MonthOfTheYear(date))+'.'+IntToStr(YearOf(date));
                dmMain.qryADOPrevTabCheck.Parameters.ParamByName('DateIN').Value:= '01.'+IntToStr(MonthOfTheYear(date))+'.'+IntToStr(YearOf(date));// +1-1
                dmMain.qryADOFlurPrevUpdate.Parameters.ParamByName('DateIN').Value:= '01.'+IntToStr(MonthOfTheYear(date))+'.'+IntToStr(YearOf(date));
              end

               else
                if  (cbbPolyMonth.Text = '??????')    then
                  begin
                dmMain.qryADOFlurAdd.Parameters.ParamByName('DateIN').Value:= '01.'+'01.'+IntToStr(YearOf(date));
                dmMain.qryADOFlurCheckExist.Parameters.ParamByName('DateIN').Value:= '01.'+'01.'+IntToStr(YearOf(date));
                dmMain.qryADOPrevTabCheck.Parameters.ParamByName('DateIN').Value:= '01.'+'01.'+IntToStr(YearOf(date));// +1-1
                dmMain.qryADOFlurPrevUpdate.Parameters.ParamByName('DateIN').Value:= '01.'+'01.'+IntToStr(YearOf(date));
              end

               else
                if  (cbbPolyMonth.Text = '???????')    then
                  begin
                dmMain.qryADOFlurAdd.Parameters.ParamByName('DateIN').Value:= '01.'+'02.'+IntToStr(YearOf(date));
                dmMain.qryADOFlurCheckExist.Parameters.ParamByName('DateIN').Value:= '01.'+'02.'+IntToStr(YearOf(date));
                dmMain.qryADOPrevTabCheck.Parameters.ParamByName('DateIN').Value:= '01.'+'02.'+IntToStr(YearOf(date));// +1-1
                dmMain.qryADOFlurPrevUpdate.Parameters.ParamByName('DateIN').Value:= '01.'+'02.'+IntToStr(YearOf(date));
              end

              else
                if  (cbbPolyMonth.Text = '????')    then
                  begin
                dmMain.qryADOFlurAdd.Parameters.ParamByName('DateIN').Value:= '01.'+'03.'+IntToStr(YearOf(date));
                dmMain.qryADOFlurCheckExist.Parameters.ParamByName('DateIN').Value:= '01.'+'03.'+IntToStr(YearOf(date));
                dmMain.qryADOPrevTabCheck.Parameters.ParamByName('DateIN').Value:= '01.'+'03.'+IntToStr(YearOf(date));// +1-1
                dmMain.qryADOFlurPrevUpdate.Parameters.ParamByName('DateIN').Value:= '01.'+'03.'+IntToStr(YearOf(date));
              end

              else
                if  (cbbPolyMonth.Text = '??????')    then
                  begin
                dmMain.qryADOFlurAdd.Parameters.ParamByName('DateIN').Value:= '01.'+'04.'+IntToStr(YearOf(date));
                dmMain.qryADOFlurCheckExist.Parameters.ParamByName('DateIN').Value:= '01.'+'04.'+IntToStr(YearOf(date));
                dmMain.qryADOPrevTabCheck.Parameters.ParamByName('DateIN').Value:= '01.'+'04.'+IntToStr(YearOf(date));// +1-1
                dmMain.qryADOFlurPrevUpdate.Parameters.ParamByName('DateIN').Value:= '01.'+'04.'+IntToStr(YearOf(date));
              end

              else
                if  (cbbPolyMonth.Text = '???')    then
                  begin
                dmMain.qryADOFlurAdd.Parameters.ParamByName('DateIN').Value:= '01.'+'05.'+IntToStr(YearOf(date));
                dmMain.qryADOFlurCheckExist.Parameters.ParamByName('DateIN').Value:= '01.'+'05.'+IntToStr(YearOf(date));
                dmMain.qryADOPrevTabCheck.Parameters.ParamByName('DateIN').Value:= '01.'+'05.'+IntToStr(YearOf(date));// +1-1
                dmMain.qryADOFlurPrevUpdate.Parameters.ParamByName('DateIN').Value:= '01.'+'05.'+IntToStr(YearOf(date));
              end

              else
                if  (cbbPolyMonth.Text = '????')    then
                  begin
                dmMain.qryADOFlurAdd.Parameters.ParamByName('DateIN').Value:= '01.'+'06.'+IntToStr(YearOf(date));
                dmMain.qryADOFlurCheckExist.Parameters.ParamByName('DateIN').Value:= '01.'+'06.'+IntToStr(YearOf(date));
                dmMain.qryADOPrevTabCheck.Parameters.ParamByName('DateIN').Value:= '01.'+'06.'+IntToStr(YearOf(date));// +1-1
                dmMain.qryADOFlurPrevUpdate.Parameters.ParamByName('DateIN').Value:= '01.'+'06.'+IntToStr(YearOf(date));
              end

              else
                if  (cbbPolyMonth.Text = '????')    then
                  begin
                dmMain.qryADOFlurAdd.Parameters.ParamByName('DateIN').Value:= '01.'+'07.'+IntToStr(YearOf(date));
                dmMain.qryADOFlurCheckExist.Parameters.ParamByName('DateIN').Value:= '01.'+'07.'+IntToStr(YearOf(date));
                dmMain.qryADOPrevTabCheck.Parameters.ParamByName('DateIN').Value:= '01.'+'07.'+IntToStr(YearOf(date));// +1-1
                dmMain.qryADOFlurPrevUpdate.Parameters.ParamByName('DateIN').Value:= '01.'+'07.'+IntToStr(YearOf(date));
              end

              else
                if  (cbbPolyMonth.Text = '??????')    then
                  begin
                dmMain.qryADOFlurAdd.Parameters.ParamByName('DateIN').Value:= '01.'+'08.'+IntToStr(YearOf(date));
                dmMain.qryADOFlurCheckExist.Parameters.ParamByName('DateIN').Value:= '01.'+'08.'+IntToStr(YearOf(date));
                dmMain.qryADOPrevTabCheck.Parameters.ParamByName('DateIN').Value:= '01.'+'08.'+IntToStr(YearOf(date));// +1-1
                dmMain.qryADOFlurPrevUpdate.Parameters.ParamByName('DateIN').Value:= '01.'+'08.'+IntToStr(YearOf(date));
              end

              else
                if  (cbbPolyMonth.Text = '????????')    then
                  begin
                dmMain.qryADOFlurAdd.Parameters.ParamByName('DateIN').Value:= '01.'+'09.'+IntToStr(YearOf(date));
                dmMain.qryADOFlurCheckExist.Parameters.ParamByName('DateIN').Value:= '01.'+'09.'+IntToStr(YearOf(date));
                dmMain.qryADOPrevTabCheck.Parameters.ParamByName('DateIN').Value:= '01.'+'09.'+IntToStr(YearOf(date));// +1-1
                dmMain.qryADOFlurPrevUpdate.Parameters.ParamByName('DateIN').Value:= '01.'+'09.'+IntToStr(YearOf(date));
              end

              else
                if  (cbbPolyMonth.Text = '???????')    then
                  begin
                dmMain.qryADOFlurAdd.Parameters.ParamByName('DateIN').Value:= '01.'+'10.'+IntToStr(YearOf(date));
                dmMain.qryADOFlurCheckExist.Parameters.ParamByName('DateIN').Value:= '01.'+'10.'+IntToStr(YearOf(date));
                dmMain.qryADOPrevTabCheck.Parameters.ParamByName('DateIN').Value:= '01.'+'10.'+IntToStr(YearOf(date));// +1-1
                dmMain.qryADOFlurPrevUpdate.Parameters.ParamByName('DateIN').Value:= '01.'+'10.'+IntToStr(YearOf(date));
              end

              else
                if  (cbbPolyMonth.Text = '??????')    then
                  begin
                dmMain.qryADOFlurAdd.Parameters.ParamByName('DateIN').Value:= '01.'+'11.'+IntToStr(YearOf(date));
                dmMain.qryADOFlurCheckExist.Parameters.ParamByName('DateIN').Value:= '01.'+'11.'+IntToStr(YearOf(date));
                dmMain.qryADOPrevTabCheck.Parameters.ParamByName('DateIN').Value:= '01.'+'11.'+IntToStr(YearOf(date));// +1-1
                dmMain.qryADOFlurPrevUpdate.Parameters.ParamByName('DateIN').Value:= '01.'+'11.'+IntToStr(YearOf(date));
              end

              else
                if  (cbbPolyMonth.Text = '???????')    then
                  begin
                dmMain.qryADOFlurAdd.Parameters.ParamByName('DateIN').Value:= '01.'+'12.'+IntToStr(YearOf(date));
                dmMain.qryADOFlurCheckExist.Parameters.ParamByName('DateIN').Value:= '01.'+'12.'+IntToStr(YearOf(date));
                dmMain.qryADOPrevTabCheck.Parameters.ParamByName('DateIN').Value:= '01.'+'12.'+IntToStr(YearOf(date));// +1-1
                dmMain.qryADOFlurPrevUpdate.Parameters.ParamByName('DateIN').Value:= '01.'+'12.'+IntToStr(YearOf(date));
              end;

       dmMain.qryADOPrevTabCheck.Requery;
       if (dmMain.qryADOPrevTabCheck.RecordCount<1) then
        begin //???? ??? ? ???? ?? ??????? ?????, ????? ?????????
          dmMain.qryADOFlurCheckExist.Requery;
          if (dmMain.qryADOFlurCheckExist.FieldValues['TabExist']>0) then
           begin
             Sound(5000,200);
           end
          else
           begin
             dmMain.qryADOFlurAdd.ExecSQL;
             ///dmMain.qryADOFlurView.Requery;
             Sound(3000,50);
           end;
         end
        else
         begin //???? ???? ? ????
           if (dmMain.qryADOPrevTabCheck.FieldValues['Status']=True) then
            begin //???? ?????? ???????? ?? ????

            end
           else
            begin //???? ?? ??????, ????? ?????? ???? IN ?? ???????
              dmMain.qryADOFlurPrevUpdate.Parameters.ParamByName('id').Value:= dmMain.qryADOPrevTabCheck.FieldValues['id'];
              dmMain.qryADOFlurPrevUpdate.Parameters.ParamByName('Deb').Value:= dmMain.qryADOFlurView.FieldValues['Deb']+1;
              dmMain.qryADOFlurPrevUpdate.ExecSQL;
              ///dmMain.qryADOFlurView.Requery;
              Sound(5000,500);
              Sleep(100);
              Sound(5000,500);
            end;
         end;
   end
  else
   begin
     if MessageDlg('?????????? ??????? ??? ??????!',  mtWarning, mbOKCancel, 
       0) = mrOk then
     begin
       cbbPolyType.SetFocus;
     end;

   end;  


end;

procedure TfrmMain.cxtxtdtAddTabNoKeyPress(Sender: TObject; var Key: Char);
begin

  if (key  =  chr(VK_RETURN)) then
   begin
     btnFlurAdd.SetFocus;
     btnFlurAdd.Click;
     cxtxtdtAddTabNo.SetFocus;
   end;

end;

procedure TfrmMain.cxgrdbtblvwGrid2DBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if (ARecord is TcxGridDataRow) and  ARecord.Values[1] = 0
  then
    AStyle := cxStyl3;

  if (ARecord is TcxGridDataRow) and  ARecord.Values[2] > 0
  then
    AStyle := cxStyl1;

  if (ARecord is TcxGridDataRow) and  ARecord.Values[2] > 1
  then
    AStyle := cxStyl2;
end;

procedure TfrmMain.dxbrbtnFlurPopUpEditClick(Sender: TObject);
begin
  if (dxbrbtnFlurPopUpEdit.Down) then
   begin
    cxgrdbtblvwGrid2DBTableView1.OptionsData.Editing:=True;
    dxbrbtnFlurPopUpEdit.Down:=True;
   end
  else
   begin
    cxgrdbtblvwGrid2DBTableView1.OptionsData.Editing:=False;
    dxbrbtnFlurPopUpEdit.Down:=False;
   end;
end;



procedure TfrmMain.dxbrbtnBarFlurPopUpDelClick(Sender: TObject);
var
  CursorLocation: Integer;
begin
  if MessageDlg('?? ????????????? ?????? ??????? ???????',  mtWarning,
    mbOKCancel, 0) = mrOk then
  begin
    dmMain.qryADOFlurRecordDel.Parameters.ParamByName('id').Value:= dmMain.qryADOFlurView.FieldValues['id'];
    dmMain.qryADOFlurRecordDel.ExecSQL;

    dmMain.qryADOFlurView.Next;
    CursorLocation:=dmMain.qryADOFlurView.FieldValues['id'];
    dmMain.qryADOFlurView.Requery;
    dmMain.qryADOFlurView.Locate('id',CursorLocation,[]);

  end;

end;

procedure TfrmMain.cxGrid1DBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  //if (ARecord is TcxGridDataRow) and  ARecord.Values[1] = 0
  //then
    AStyle := cxStyl3;
end;

procedure TfrmMain.cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
scanexist();
end;

procedure TfrmMain.cbbPolyTypePropertiesChange(Sender: TObject);
begin
  cxlblLoading.Visible:=True;
  Application.ProcessMessages;
  dmMain.qryADOFlurView.Parameters.ParamByName('id_type').Value:= cbbPolyType.Properties.DataController.Values[cbbPolyType.ItemIndex,1];
  dmMain.qryADOFlurView.Requery;
  cxlblLoading.Visible:=False;
end;


procedure TfrmMain.dxbrbtnPolyClick(Sender: TObject);
begin
  frmPolyTypes.Show;
end;

procedure TfrmMain.dxbrbtnPolyTypesEditClick(Sender: TObject);
begin
  if (dxbrbtnPolyTypesEdit.Down) then
   begin
    frmPolyTypes.cxgrdbtblvwGrid1DBTableView1.OptionsData.Editing:=True;
    dxbrbtnPolyTypesEdit.Down:=True;
   end
  else
   begin
    frmPolyTypes.cxgrdbtblvwGrid1DBTableView1.OptionsData.Editing:=False;
    dxbrbtnPolyTypesEdit.Down:=False;
   end;
end;

procedure TfrmMain.dxpdfdelClick(Sender: TObject);
begin
   if MessageDlg('?? ????????????? ?????? ??????? ?????????',  mtWarning,
      mbOKCancel, 0) = mrOk then
   begin

     if (cxGridDBTableView1.DataController.DataSource=dmMain.dsMain2) then
      begin
        dmMain.qryADODel.Parameters.ParamByName('id').Value:= dmMain.qryADOMain2id.Value;
      end
     else
      begin
        if (dmMain.dsFind2.DataSet=dmMain.qryADOFindNbr2) then
         begin
           dmMain.qryADODel.Parameters.ParamByName('id').Value:= dmMain.qryADOFindNbr2.FieldValues['id'];
         end
        else
         begin
           dmMain.qryADODel.Parameters.ParamByName('id').Value:= dmMain.qryADOFindDT2.FieldValues['id'];
         end;
      end;

          lblDataLoad.Visible:=True;
     Application.ProcessMessages;
     dmMain.qryADODel.ExecSQL;
     dmMain.qryADOMain2.Requery;
           dmMain.qryADOFindNbr2.close;
            dmMain.qryADOFindNbr2.Open;

           dmMain.qryADOFindDT2.close;
     dmMain.qryADOFindDT2.open;

         lblDataLoad.Visible:=false;
   end;
end;

procedure TfrmMain.dxpdfeditClick(Sender: TObject);
begin
 if (dxpdfedit.checked) then
   begin
    cxGridDBTableView1.OptionsData.Editing:=True;
    dxpdfedit.checked:=True;
    changepdf.Enabled:=true;
   end
  else
   begin
    cxGridDBTableView1.OptionsData.Editing:=False;
    dxpdfedit.checked:=False;
    changepdf.Enabled:=false;
   end;
end;

procedure TfrmMain.dxbrbtnPolyTypesDelClick(Sender: TObject);
begin
   if MessageDlg('?? ????????????? ?????? ??????? ??? ???????',  mtWarning,
      mbOKCancel, 0) = mrOk then
   begin
     dmMain.qryADODelPolyType.Parameters.ParamByName('id').Value:= dmMain.tblModPolyTypes.FieldValues['id'];
     dmMain.qryADODelPolyType.ExecSQL;
     dmMain.tblModPolyTypes.Requery;
     dmMain.tblPolyTypes.Requery;
   end;
end;

procedure TfrmMain.tmrAPPTerminateTimer(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnUpdateFlurListClick(Sender: TObject);
begin
  cxlblLoading.Visible:=True;
  btnUpdateFlurList.Enabled:=False;
  Application.ProcessMessages;
  dmMain.qryADOFlurView.Requery;
  cxlblLoading.Visible:=False;
  btnUpdateFlurList.Enabled:=True;
end;

//=== ??????????? =================================================================================


end.
