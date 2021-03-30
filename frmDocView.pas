unit frmDocView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxLayoutControl, cxContainer, cxEdit, cxImage,
  cxDBEdit, cxControls, ExtCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxLayoutContainer;

type
  TfrmDocShow = class(TForm)

    frmDocShow: TdxLayoutControl;
    ScrollBox1: TScrollBox;

    img1: TcxDBImage;
    tmrClose: TTimer;
    procedure img1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDocShow: TfrmDocShow;

implementation

{$R *.dfm}

uses
  modMain;

procedure TfrmDocShow.img1Click(Sender: TObject);
begin
  frmMain.tmrClose.Enabled:=True;
end;

procedure TfrmDocShow.FormCreate(Sender: TObject);
begin
  Self.ShowHint:=True;
end;

end.
