program CalculadorTriangulo;

uses
  Vcl.Forms,
  Projeto1 in 'Projeto1.pas' {frmTriangulo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTriangulo, frmTriangulo);
  Application.Run;
end.
