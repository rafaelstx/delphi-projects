unit uProduto;

interface

uses
  System.SysUtils;

  type
    TProduto = record
      Name: String;
      Id: Integer;
      Quantidade: Integer;
      Preco: Double;
    end;

    var
      Produto: TProduto;

implementation


end.

