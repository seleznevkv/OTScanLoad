unit PolyTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxContainer, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxBar, cxLookAndFeels, cxNavigator;

type
  TfrmPolyTypes = class(TForm)
    grp1: TGroupBox;
    cxgrdDocTypes1: TcxGrid;
    cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView;
    cxgrdlvlGrid1Level1: TcxGridLevel;
    grp2: TGroupBox;
    lbl2: TLabel;
    lbl1: TLabel;
    cxtxtdtImportence: TcxTextEdit;
    cxtxtdtNewTypes: TcxTextEdit;
    btnAddType: TcxButton;
    cxgrdbclmnGrid1DBTableView1Type_Importence: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Type_Name: TcxGridDBColumn;
    dxbrpmnPolyTypesPopUp: TdxBarPopupMenu;
    procedure btnAddTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPolyTypes: TfrmPolyTypes;

implementation

uses DataModuleMain;

{$R *.dfm}

procedure TfrmPolyTypes.btnAddTypeClick(Sender: TObject);
begin
  dmMain.qryADOPolyTypeInsert.Parameters.ParamByName('Type_Importence').Value:=cxtxtdtImportence.Text;
  dmMain.qryADOPolyTypeInsert.Parameters.ParamByName('Type_Name').Value:=cxtxtdtNewTypes.Text;
  dmMain.qryADOPolyTypeInsert.ExecSQL;
  dmMain.tblModPolyTypes.Requery;
  dmMain.tblPolyTypes.Requery;
end;

end.
