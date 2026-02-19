unit uProduto;

interface

uses
  System.SysUtils, System.Generics.Collections, Vcl.Dialogs;

type
  TProduto = record
    Name: String;
    Id: Integer;
    Quantidade: Integer;
    Preco: Double;
  end;

function ProcuraProduto(Id, Quantidade: Integer; ListProduto: TList<TProduto>)
  : TProduto;
function ControleEstoque(ProdCarrinho: TProduto; Quantidade: Integer): Boolean;

var
  Produto: TProduto;

implementation

function ProcuraProduto(Id, Quantidade: Integer; ListProduto: TList<TProduto>)
  : TProduto;

begin

  for Produto in ListProduto do
  begin

    if Produto.Id = Id then
    begin

      if ControleEstoque(Produto, Quantidade) = True then
      begin
        Result := Produto;
        Exit;
      end;
    end

  end;

  raise Exception.CreateFmt('Erro ao inserir produto no carrinho', [Id]);

end;

function ControleEstoque(ProdCarrinho: TProduto; Quantidade: Integer): Boolean;

begin

  if Produto.Quantidade < Quantidade then
  begin
    MessageDlg('Quantidade solicitada maior que o disponível no estoque!' +
      sLineBreak + 'Estoque atual: ' + Produto.Quantidade.ToString, mtError,
      [mbOK], 0);

    Result := False;
  end
  else
  begin
    Produto.Quantidade := Produto.Quantidade - Quantidade;
    Result := True;
  end;

end;

end.
