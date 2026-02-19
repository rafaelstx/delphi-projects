unit uProduto;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TProduto = record
    Name: String;
    Id: Integer;
    Quantidade: Integer;
    Preco: Double;
  end;

function ProcuraProduto(Id: Integer; ListProduto: TList<TProduto>): TProduto;

var
  Produto: TProduto;

implementation

function ProcuraProduto(Id: Integer; ListProduto: TList<TProduto>): TProduto;

begin

  for Produto in ListProduto do
  begin

    if Produto.Id = Id then
    begin

      Result := Produto;
      Exit;

    end

  end;

  raise Exception.CreateFmt('Produto com ID %d não foi encontrado.', [Id]);

end;

end.
