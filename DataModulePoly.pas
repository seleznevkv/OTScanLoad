unit DataModulePoly;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmPoly = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPoly: TdmPoly;

implementation

uses
  DataModuleMain;

{$R *.dfm}

end.
