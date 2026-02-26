unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, uCalc;

type
  TForm1 = class(TForm)
    EdtValor1: TLabeledEdit;
    EdtResultado: TLabeledEdit;
    EdtValor2: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Calculadora: TCalculadora;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Calculadora := TCalculadora.Create;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Calculadora.Valor1 := EdtValor1.Text;
  Calculadora.Valor2 := EdtValor2.Text;
  Calculadora.ExecutaOperacao(opDividir);
  EdtResultado.Text := Calculadora.Resultado;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  Calculadora.Valor1 := EdtValor1.Text;
  Calculadora.Valor2 := EdtValor2.Text;
  Calculadora.ExecutaOperacao(opMultiplicar);
  EdtResultado.Text := Calculadora.Resultado;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  Calculadora.Valor1 := EdtValor1.Text;
  Calculadora.Valor2 := EdtValor2.Text;
  Calculadora.ExecutaOperacao(opSubtrair);
  EdtResultado.Text := Calculadora.Resultado;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  Calculadora.Valor1 := EdtValor1.Text;
  Calculadora.Valor2 := EdtValor2.Text;
  Calculadora.ExecutaOperacao(opSomar);
  EdtResultado.Text := Calculadora.Resultado;
end;

end.
