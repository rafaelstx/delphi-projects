unit uDadosPessoa;

interface

uses
  System.SysUtils;

  type
    TipoDadosPessoa = record
      Altura: Double;
      Peso: Double;
      Sexo: String;
      IMC: String;
    end;

    function CalcularIMC(PessoaPeso, PessoaAltura: Double; PessoaSexo: String): String;

    var
      Pessoa : TipoDadosPessoa;

implementation

function CalcularIMC(PessoaPeso, PessoaAltura: Double; PessoaSexo: String): String;
var
  numIMC: Double;
  strIMC: String;

begin

  if PessoaSexo = ' ' then
  raise  Exception.Create('Obrigatório informar o sexo');

  try
    numIMC := PessoaPeso / (PessoaAltura * PessoaAltura);

    if PessoaSexo = 'Feminino' then
begin
  if numIMC < 19 then
    strIMC := 'Abaixo do normal'
  else if numIMC < 23.9 then
    strIMC := 'Normal'
  else if numIMC < 28.9 then
    strIMC := 'Obesidade leve'
  else if numIMC < 38.9 then
    strIMC := 'Obesidade moderada'
  else
    strIMC := 'Obesidade mórbida';
end
else if PessoaSexo = 'Masculino' then
begin
  if numIMC < 20 then
    strIMC := 'Abaixo do normal'
  else if numIMC < 24.9 then
    strIMC := 'Normal'
  else if numIMC < 29.9 then
    strIMC := 'Obesidade leve'
  else if numIMC < 39.9 then
    strIMC := 'Obesidade moderada'
  else
    strIMC := 'Obesidade mórbida';


    end;
    Result :=  strIMC;

  except
    raise Exception.Create('Erro ao efetuar o cálculo');
  end;


end;


end.
