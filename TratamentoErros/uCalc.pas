unit uCalc;

interface

uses
  SysUtils;

type

  ESomaError = class(Exception);
  ESubtariError = class(Exception);
  EMultiplicaError = class(Exception);
  EDivideError = class(Exception);

  TOperacao = (opSomar, opSubtrair, opMultiplicar, opDividir);

  TCalculadora = class
  private
    FN1: Double;
    FN2: Double;
    FResultado: String;
    FValor2: String;
    FValor1: string;
    procedure SetValor1(const Value: string);
    procedure SetValor2(const Value: String);
    { private declarations }
  protected
    { protected declarations }
    procedure Somar;
    procedure Subtrair;
    procedure Multiplicar;
    procedure Dividir;
  public
    { public declarations }
    procedure ExecutaOperacao(Op: TOperacao);
  published
    { published declarations }
    property Valor1: string read FValor1 write SetValor1;
    property Valor2: String read FValor2 write SetValor2;
    property Resultado: String read FResultado;
  end;

implementation

{ TCalculadora }

procedure TCalculadora.Dividir;
begin
  try
    FN1 := StrToFloat(FValor1);
    FN2 := StrToFloat(FValor2);
    FResultado := FloatToStr(FN1 / FN2);
  except
    raise EDivideError.Create('Ocorreu um erro ao tentar executar uma operação de dividir!');
  end;

end;

procedure TCalculadora.ExecutaOperacao(Op: TOperacao);
begin
  case Op of
    opSomar: Somar;
    opSubtrair: Subtrair;
    opMultiplicar: Multiplicar;
    opDividir: Dividir;
  end;
end;

procedure TCalculadora.Multiplicar;
begin
  try
    FN1 := StrToFloat(FValor1);
    FN2 := StrToFloat(FValor2);
    FResultado := FloatToStr(FN1 * FN2);
  except
    raise EMultiplicaError.Create('Ocorreu um erro ao tentar executar uma operação de multiplicar!');
  end;
end;

procedure TCalculadora.SetValor1(const Value: string);
begin
  FValor1 := Value;
end;

procedure TCalculadora.SetValor2(const Value: String);
begin
  FValor2 := Value;
end;

procedure TCalculadora.Somar;
begin
  try
    FN1 := StrToFloat(FValor1);
    FN2 := StrToFloat(FValor2);
    FResultado := FloatToStr(FN1 + FN2);
  except
    raise ESomaError.Create('Ocorreu um erro ao tentar executar uma operação de soma!');
  end;
end;

procedure TCalculadora.Subtrair;
begin
  try
    FN1 := StrToFloat(FValor1);
    FN2 := StrToFloat(FValor2);
    FResultado := FloatToStr(FN1 - FN2);
  except
    raise ESubtariError.Create('Ocorreu um erro ao tentar executar uma operação de subtrair!');
  end;

end;

end.
