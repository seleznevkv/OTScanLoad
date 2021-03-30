unit DocPageNo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, StdCtrls, cxButtons, ExtDlgs, DB;

type
  TfrmPageNo = class(TForm)
    grp1: TGroupBox;
    btnOk: TcxButton;
    cxtxtdtDocPageNo: TcxTextEdit;
    cxlbl1: TcxLabel;
    dlgOpenPicScan: TOpenPictureDialog;
    btnCancel: TcxButton;
    procedure btnOkClick(Sender: TObject);
    procedure cxtxtdtDocPageNoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPageNo: TfrmPageNo;

implementation

uses DataModuleMain, modMain;

{$R *.dfm}

procedure TfrmPageNo.btnOkClick(Sender: TObject);
var
  CursorLocation: Integer;
begin
  frmPageNo.Visible:=False;

  try
    if (dlgOpenPicScan.Execute) then
     begin
      dmMain.qryADOInsertScan.Parameters.ParamByName('id_doc').Value:=dmMain.qryADOMain.FieldValues['id'];
      dmMain.qryADOInsertScan.Parameters.ParamByName('DocPageNo').Value:=frmPageNo.cxtxtdtDocPageNo.Text;
      dmMain.qryADOInsertScan.Parameters.ParamByName('DocScan').LoadFromFile(dlgOpenPicScan.FileName, ftBytes);
      dmMain.qryADOInsertScan.ExecSQL;
      dmMain.qryADOScan.Requery;

      if (dmMain.qryADOScan.RecordCount>0) then
       begin
         frmMain.cxlblDocPageNo.Caption:=IntToStr(dmMain.qryADOScan.FieldValues['DocPageNo']);
       End
      else
       begin
         frmMain.cxlblDocPageNo.Caption:='0';
       end;

      dmMain.qryADOPageCountUpdate.Parameters.ParamByName('Page_Count').Value:=dmMain.qryADOMain.FieldValues['Page_Number']+1;
      dmMain.qryADOPageCountUpdate.Parameters.ParamByName('id').Value:=dmMain.qryADOScan.FieldValues['id_doc'];
      dmMain.qryADOPageCountUpdate.ExecSQL;

      CursorLocation:=dmMain.qryADOMain.FieldValues['id'];
      dmMain.qryADOMain.Requery;
      dmMain.qryADOMain.Locate('id',CursorLocation,[]);
     end;

  except

  end;


end;

procedure TfrmPageNo.cxtxtdtDocPageNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key  =  chr(VK_RETURN) then btnOkClick(Self);
end;

procedure TfrmPageNo.FormShow(Sender: TObject);
begin
  cxtxtdtDocPageNo.SetFocus;
end;

procedure TfrmPageNo.btnCancelClick(Sender: TObject);
begin
  frmPageNo.Visible:=False;
end;

end.
