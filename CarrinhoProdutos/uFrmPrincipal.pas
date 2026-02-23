unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uProduto, System.Generics.Collections,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TTFrmPrincipal = class(TForm)
    Header: TPanel;
    PnlAdicionarProduto: TPanel;
    EditNome: TEdit;
    EditQuantidade: TEdit;
    EditPreco: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtnCriarProduto: TButton;
    PnlListarProduto: TPanel;
    Label5: TLabel;
    ListBoxProdutos: TListBox;
    PnlCarrinho: TPanel;
    BtnAddCarrinho: TButton;
    ListCarrinho: TListBox;
    LabelTotalCarrinho: TLabel;
    EditCarrinho: TEdit;
    EditQuantidadeCarrinho: TEdit;
    procedure BtnCriarProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnAddCarrinhoClick(Sender: TObject);
  private
    ListProdutos: TList<TProduto>;
    procedure FormataLinha(Id, Quantidade: Integer; Nome: String;
      Preco: Double);
    procedure InsereValoresProduto;
  public
  end;

var
  TFrmPrincipal: TTFrmPrincipal;
  LinhaFormatada: String;
  CountId: Integer = 1;
  RecebeId: Integer;
  RecebeQuantidade: Integer;
  IdCarrinho: Integer;
  ValorTotal: Double;

implementation

{$R *.dfm}

procedure TTFrmPrincipal.FormCreate(Sender: TObject);
begin
  ListProdutos := TList<TProduto>.Create;
end;

procedure TTFrmPrincipal.BtnCriarProdutoClick(Sender: TObject);
begin
  InsereValoresProduto;
  FormataLinha(Produto.Id, Produto.Quantidade, Produto.Name, Produto.Preco);
  ListProdutos.Add(Produto);
  ListBoxProdutos.Items.Add(LinhaFormatada);
  Inc(CountId);
end;

procedure TTFrmPrincipal.InsereValoresProduto;
begin
  Produto.Id := CountId;
  Produto.Name := EditNome.Text;
  Produto.Quantidade := StrToInt(EditQuantidade.Text);
  Produto.Preco := StrToFloat(EditPreco.Text);
end;

procedure TTFrmPrincipal.FormataLinha(Id, Quantidade: Integer; Nome: String;
  Preco: Double);
begin
  LinhaFormatada := Format('Código: %d | %s | Qtd: %d | Preço: %s',
    [Id, Nome, Quantidade, FormatCurr('R$ #,##0.00', Preco)]);
end;

procedure TTFrmPrincipal.BtnAddCarrinhoClick(Sender: TObject);
var
  TempProd : TProduto;
begin
  RecebeId := StrToInt(EditCarrinho.Text);

  RecebeQuantidade := StrToInt(EditQuantidadeCarrinho.Text);

  IdCarrinho := ProcuraProduto(RecebeId, RecebeQuantidade, ListProdutos);

  if IdCarrinho <> -1 then
  begin
    if RecebeQuantidade <= ListProdutos[IdCarrinho].Quantidade then
    begin
      FormataLinha(ListProdutos[IdCarrinho].Id, RecebeQuantidade, ListProdutos[IdCarrinho].Name, ListProdutos[IdCarrinho].Preco);
      ListCarrinho.Items.Add(LinhaFormatada);
      TempProd := ListProdutos[IdCarrinho];
      TempProd.Quantidade := TempProd.Quantidade - RecebeQuantidade;
      ListProdutos[IdCarrinho] := TempProd;
    end
    else
    begin
      ShowMessage('Quantidade maior que a disponível em estoque!');
      Exit;
    end;

    FormataLinha(ListProdutos[IdCarrinho].Id, ListProdutos[IdCarrinho].Quantidade, ListProdutos[IdCarrinho].Name, ListProdutos[IdCarrinho].Preco);

    ListBoxProdutos.Items[IdCarrinho] := LinhaFormatada;

    ValorTotal := ValorTotal + (ListProdutos[IdCarrinho].Preco * RecebeQuantidade);

    LabelTotalCarrinho.Caption := FloatToStr(ValorTotal);LabelTotalCarrinho.Caption := FormatCurr('R$ #,##0.00', ValorTotal);
  end
  else
  begin
    ShowMessage('Produto não encontrado!');
  end;

end;


end.
