unit Projeto1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmTriangulo = class(TForm)
    Label1: TLabel;
    lblLado1: TLabel;
    lblLado2: TLabel;
    lblLado3: TLabel;
    edtLado1: TEdit;
    edtLado2: TEdit;
    edtLado3: TEdit;
    btnObter: TButton;
    Label2: TLabel;
    imgTriangulo: TImage;
    lblResultado: TLabel;
    lblResultadoValor: TLabel;
    procedure btnObterClick(Sender: TObject);
  private
    function Analisar(Lado1, Lado2, Lado3 : Double): String;
    procedure exibirResultado;
    procedure AtualizarImagem(TipoTriangulo: String);
  public
    { Public declarations }
  end;

var
  frmTriangulo: TfrmTriangulo;

implementation

{$R *.dfm}

{ TForm1 }

function TfrmTriangulo.Analisar(Lado1, Lado2, Lado3 : Double): String;
begin
  if (Lado1 = Lado2) and (Lado2 = Lado3) and (Lado3 = Lado1) then
  begin
    lblResultadoValor.Caption := 'Tri�ngulo Equilatero, os 3 lados s�o iguais!';
    Result := 'Equilatero'
  end;

  if (Lado1 = Lado2) and (Lado2 <> Lado3) or (Lado2 = Lado3) and (Lado3<> Lado1) or (Lado3 = Lado1) and (Lado1<> Lado2) then
  begin
    lblResultadoValor.Caption := 'Tri�ngulo Is�sceles, possui 2 lados iguais!';
    Result := 'Isosceles'
  end;

  if (Lado1 <> Lado2) and (Lado2 <> Lado3) and (Lado3 <> Lado1)  then
  begin
    lblResultadoValor.Caption := 'Tri�ngulo Escaleno, os 3 Lados diferentes!';
    Result := 'Escaleno'
  end;
end;

procedure TfrmTriangulo.AtualizarImagem(TipoTriangulo: String);
var
  PNGImage: TPngImage;
  path : String;
begin
  PNGImage := TPngImage.Create;
  try
    try
       path := ExtractFilePath(ParamStr(0));
       if TipoTriangulo = 'Equilatero' then
          PNGImage.LoadFromFile(Format('%s%s', [path, 'img\TrianguloEquilatero.png']))
       else if TipoTriangulo = 'Isosceles' then
          PNGImage.LoadFromFile(Format('%s%s', [path, 'img\TrianguloIsosceles.png']))
       else if TipoTriangulo = 'Escaleno' then
          PNGImage.LoadFromFile(Format('%s%s', [path, 'img\TrianguloEscaleno.png']));

       imgTriangulo.Picture.Assign(PNGImage);
    except
      raise;
    end;
  finally
    PNGImage.Free;
  end;
end;

procedure TfrmTriangulo.btnObterClick(Sender: TObject);
begin
  exibirResultado;
end;

procedure TfrmTriangulo.exibirResultado;
var
  resultado: String;

begin
   resultado := Analisar(strToFloat(edtLado1.Text),strToFloat(edtLado2.Text), strToFloat(edtLado3.Text));
   AtualizarImagem(resultado);
end;

end.
