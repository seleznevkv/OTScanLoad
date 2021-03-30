unit DocTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Menus, cxLookAndFeelPainters, cxButtons,
  cxContainer, cxTextEdit, dxBar, cxLookAndFeels, cxDBLookupComboBox,
  cxMaskEdit, cxDropDownEdit;

type
  TfrmDocTypes = class(TForm)
    grp1: TGroupBox;
    cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView;
    cxgrdlvlGrid1Level1: TcxGridLevel;
    cxgrdDocTypes1: TcxGrid;
    grp2: TGroupBox;
    cxtxtdtNewTypes: TcxTextEdit;
    btnAddType: TcxButton;
    lbl2: TLabel;
    lbl1: TLabel;
    dxbrpmnDocTypesPopUp: TdxBarPopupMenu;
    cxcbxCategoryName: TcxComboBox;
    lbl3: TLabel;
    cxcbxGroupName: TcxComboBox;
    cxgrdbtblvwGrid1DBTableView1id: TcxGridDBColumn;
    cxgrdbtblvwGrid1DBTableView1d_type: TcxGridDBColumn;
    cxgrdbtblvwGrid1DBTableView1idCategory: TcxGridDBColumn;
    cxgrdbtblvwGrid1DBTableView1t_Importance: TcxGridDBColumn;
    cxgrdbtblvwGrid1DBTableView1CategoryName: TcxGridDBColumn;
    cxgrdbtblvwGrid1DBTableView1GroupName: TcxGridDBColumn;
    procedure btnAddTypeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxcbxGroupNamePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    function UpdateGroupCombo():Boolean;
    function UpdateCategoryCombo(): Boolean;
  public
    { Public declarations }
  end;

var
  frmDocTypes: TfrmDocTypes;

implementation

uses
  DataModuleMain;

{$R *.dfm}

procedure TfrmDocTypes.btnAddTypeClick(Sender: TObject);
begin
  dmMain.qryADOTypeInsert.Parameters.ParamByName('Importance').Value:=Integer(cxcbxCategoryName.Properties.Items.Objects[cxcbxCategoryName.ItemIndex]);
  dmMain.qryADOTypeInsert.Parameters.ParamByName('Type').Value:=cxtxtdtNewTypes.Text;
  dmMain.qryADOTypeInsert.ExecSQL;
  dmMain.qwrModTypes.Requery;
  dmMain.tblTypes.Requery;
end;

procedure TfrmDocTypes.cxcbxGroupNamePropertiesChange(Sender: TObject);
begin
  UpdateCategoryCombo();
end;

procedure TfrmDocTypes.FormShow(Sender: TObject);
begin
  //  Обновляем комбобоксы с группами и категориями документов
  UpdateGroupCombo();
end;

function TfrmDocTypes.UpdateCategoryCombo: Boolean;
begin
  if cxcbxGroupName.ItemIndex = -1 then begin
    Result := False;
    Exit;
  end;
  with dmMain.qryFrmDocTypesCombosFiller do begin
     Close;
     SQL.Clear;
     try
       SQL.Add('  select');
       SQL.Add('    IdCategory ''Id'',');
       SQL.Add('    CategoryName ''Name''');
       SQL.Add('  from');
       SQL.Add('    OT.dbo.OT_Prikaz_Categories');
       SQL.Add('  where');
       SQL.Add('    IdGroup = '+ IntToStr(Integer(cxcbxGroupName.Properties.Items.Objects[cxcbxGroupName.ItemIndex])));
       Open;
     except
       Close;
       Result := False;
       Exit;
     end;
     First;
     cxcbxCategoryName.Properties.Items.Clear;
     while not EOF do begin
       cxcbxCategoryName.Properties.Items.AddObject(FieldByName('Name').AsString,TObject(FieldByName('Id').AsInteger));
       Next;
     end;
  end;

  cxcbxCategoryName.ItemIndex := cxcbxCategoryName.Properties.Items.Count - 1;
  Result := True;

end;

function TfrmDocTypes.UpdateGroupCombo(): Boolean;
begin
  with dmMain.qryFrmDocTypesCombosFiller do begin
     Close;
     SQL.Clear;
     try
       SQL.Text := 'select IdGroup ''Id'',GroupName ''Name'' from	OT.dbo.OT_Prikaz_Groups where GroupName = ''Охрана Труда''';
       Open;
     except
       Close;
       Result := False;
       Exit;
     end;
     First;
     cxcbxGroupName.Properties.Items.Clear;
     while not EOF do begin
       cxcbxGroupName.Properties.Items.AddObject(FieldByName('Name').AsString,TObject(FieldByName('Id').AsInteger));
       Next;
     end;
  end;
  cxcbxGroupName.ItemIndex := cxcbxGroupName.Properties.Items.Count - 1;
  Result := True;
end;

end.
