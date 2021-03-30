program OT;

uses
  Forms,
  modMain in '..\OTPDFNEW\modMain.pas' {frmMain},
  DataModuleMain in '..\OTPDFNEW\DataModuleMain.pas' {dmMain: TDataModule},
  frmDocView in '..\OTPDFNEW\frmDocView.pas' {Form1},
  SelfUpdate in '..\OTPDFNEW\SelfUpdate.pas' {frmSelfUpdate},
  DocTypes in '..\OTPDFNEW\DocTypes.pas' {frmDocTypes},
  DocPageNo in '..\OTPDFNEW\DocPageNo.pas' {frmPageNo},
  DocPageModyfi in '..\OTPDFNEW\DocPageModyfi.pas' {frmDocPageModyfi},
  PolyTypes in '..\OTPDFNEW\PolyTypes.pas' {frmPolyTypes};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Документооборот';
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmDocShow, frmDocShow);
  Application.CreateForm(TfrmDocTypes, frmDocTypes);
  Application.CreateForm(TfrmPageNo, frmPageNo);
  Application.CreateForm(TfrmDocPageModyfi, frmDocPageModyfi);
  Application.CreateForm(TfrmPolyTypes, frmPolyTypes);
  Application.Run;

end.
