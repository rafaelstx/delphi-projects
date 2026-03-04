unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uSistemaPagamento;

type
  TMain = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.Button1Click(Sender: TObject);
var
  MeuPagamento: TPagamento; // A declaração VAR fica sempre ANTES do begin
begin
  // EXEMPLO 1: Instanciando um pagamento via PIX
  MeuPagamento := TPagamentoPix.Create(100.00);
  try
    // O Delphi sabe automaticamente que deve chamar o "Processar" do Pix
    MeuPagamento.Processar;
  finally
    MeuPagamento.Free; // Sempre liberar a memória do objeto
  end;

  // EXEMPLO 2: Instanciando um pagamento via Cartão na mesma variável
  MeuPagamento := TPagamentoCartao.Create(100.00, '1234-5678-9012-3456');
  try
    // O Delphi agora chamará o "Processar" do Cartão, aplicando a taxa de 5%
    MeuPagamento.Processar;
  finally
    MeuPagamento.Free;
  end;
end;


end.
