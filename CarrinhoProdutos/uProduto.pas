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

function ProcuraProduto(Id: Integer; ListProduto: TList<TProduto>)
  : Integer;
var
  Produto: TProduto;

implementation

function ProcuraProduto(Id: Integer; ListProduto: TList<TProduto>)
  : Integer;
var
  I: Integer;

begin
  Result := -1;

  for I := 0 to ListProduto.Count -1 do
  begin
    if ListProduto[I].Id = Id then
    begin
      Exit(I);
    end;
  end;


end;

end.
