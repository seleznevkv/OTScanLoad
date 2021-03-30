unit DocPageModyfi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, StdCtrls, cxButtons;

type
  TfrmDocPageModyfi = class(TForm)
    btnOk: TcxButton;
    grp1: TGroupBox;
    cxtxtdtDocPageNo: TcxTextEdit;
    cxlbl1: TcxLabel;
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
  frmDocPageModyfi: TfrmDocPageModyfi;

implementation

uses DataModuleMain, modMain, ADODB, DB;

{$R *.dfm}

procedure TfrmDocPageModyfi.btnOkClick(Sender: TObject);
var
  CursorLocation: Integer;
begin
  dmMain.qryADODcPageNoModyfi.Parameters.ParamByName('NewPageNo').Value:=cxtxtdtDocPageNo.Text;
  dmMain.qryADODcPageNoModyfi.Parameters.ParamByName('id').Value:=dmMain.qryADOScan.FieldValues['id'];
  dmMain.qryADODcPageNoModyfi.ExecSQL;

  CursorLocation:=dmMain.qryADOScan.FieldValues['id'];
  dmMain.qryADOScan.Requery;
  dmMain.qryADOScan.Locate('id',CursorLocation,[]);

  if (dmMain.qryADOScan.RecordCount>0) then
   begin
     frmMain.cxlblDocPageNo.Caption:=IntToStr(dmMain.qryADOScan.FieldValues['DocPageNo']);
   End
  else
   begin
     frmMain.cxlblDocPageNo.Caption:='0';
   end;

  frmDocPageModyfi.Visible:=False;
end;

procedure TfrmDocPageModyfi.cxtxtdtDocPageNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key  =  chr(VK_RETURN) then btnOkClick(Self);
end;

procedure TfrmDocPageModyfi.FormShow(Sender: TObject);
begin
  cxtxtdtDocPageNo.SetFocus;
end;

procedure TfrmDocPageModyfi.btnCancelClick(Sender: TObject);
begin
  frmDocPageModyfi.Visible:=False;
end;

end.
