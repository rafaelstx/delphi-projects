unit uSistemaPagamento;

interface

uses
  System.SysUtils, Vcl.Dialogs;

type
  // ==========================================
  // 1. ABSTRAÇÃO e 2. ENCAPSULAMENTO
  // ==========================================
  // 'class abstract' impede que esta classe seja instanciada diretamente.
  // Ela serve apenas como um "molde" para as classes filhas.
  TPagamento = class abstract
  private
    { ENCAPSULAMENTO: Variáveis privadas. Ninguém de fora tem acesso direto. }
    FValor: Double;
    procedure SetValor(const Value: Double);
  protected
    { PROTECTED: Visível apenas para esta classe e para as classes filhas. }

    // Método abstrato: A classe base diz QUE deve existir,
    // mas as filhas é que dizem COMO ele funciona. (Polimorfismo)
    function ObterTaxa: Double; virtual; abstract;
  public
    constructor Create(AValor: Double);

    { POLIMORFISMO: 'virtual' indica que este método pode ser reescrito pelas filhas }
    procedure Processar; virtual;

    { Propriedade pública para acessar a variável privada de forma segura }
    property Valor: Double read FValor write SetValor;
  end;

  // ==========================================
  // 3. HERANÇA (Pix herda de Pagamento)
  // ==========================================
  TPagamentoPix = class(TPagamento)
  protected
    { POLIMORFISMO: 'override' reescreve o comportamento do método base }
    function ObterTaxa: Double; override;
  public
    procedure Processar; override;
  end;

  // ==========================================
  // 3. HERANÇA (Cartão herda de Pagamento)
  // ==========================================
  TPagamentoCartao = class(TPagamento)
  private
    FNumeroCartao: string;
  protected
    function ObterTaxa: Double; override;
  public
    // Construtor modificado para receber parâmetros extras
    constructor Create(AValor: Double; ANumeroCartao: string);
    procedure Processar; override;
  end;

implementation

{ TPagamento }

constructor TPagamento.Create(AValor: Double);
begin
  FValor := AValor;
end;

procedure TPagamento.Processar;
begin
  // Método genérico que pode ser chamado (herdado) pelas filhas
  ShowMessage('Iniciando processamento do pagamento no valor de R$ ' + FloatToStr(FValor));
end;

procedure TPagamento.SetValor(const Value: Double);
begin
  // Encapsulamento permite validar o dado antes de atribuir
  if Value <= 0 then
    raise Exception.Create('O valor do pagamento deve ser maior que zero!');
  FValor := Value;
end;

{ TPagamentoPix }

function TPagamentoPix.ObterTaxa: Double;
begin
  Result := 0.0; // Pix não tem taxa neste exemplo
end;

procedure TPagamentoPix.Processar;
var
  Total: Double;
begin
  inherited Processar; // Chama o 'Processar' da classe base (TPagamento)

  Total := Valor + ObterTaxa;
  ShowMessage('Pagamento via PIX finalizado. Total: R$ ' + FloatToStr(Total));
end;

{ TPagamentoCartao }

constructor TPagamentoCartao.Create(AValor: Double; ANumeroCartao: string);
begin
  inherited Create(AValor); // Repassa o valor para o construtor da classe base
  FNumeroCartao := ANumeroCartao;
end;

function TPagamentoCartao.ObterTaxa: Double;
begin
  Result := Valor * 0.05; // 5% de taxa para cartão
end;

procedure TPagamentoCartao.Processar;
var
  Total: Double;
begin
  inherited Processar; // Chama o 'Processar' da base

  Total := Valor + ObterTaxa;
  ShowMessage('Pagamento via Cartão (' + FNumeroCartao + ') finalizado. Total: R$ ' + FloatToStr(Total));
end;

end.
