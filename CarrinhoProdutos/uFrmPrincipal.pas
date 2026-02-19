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
    LabelQtdItens: TLabel;
    EditCarrinho: TEdit;
    procedure BtnCriarProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnAddCarrinhoClick(Sender: TObject);
  private
    ListProdutos: TList<TProduto>;
    procedure FormataLinha(Id, Quantidade: Integer;  Nome: String; Preco: Double);
    procedure InsereValoresProduto;
  public
  end;

var
  TFrmPrincipal: TTFrmPrincipal;
  LinhaFormatada: String;
  CountId: Integer = 0;
  RecebeId: Integer;
  ProdCarrinho: TProduto;

implementation

{$R *.dfm}

procedure TTFrmPrincipal.FormCreate(Sender: TObject);
begin
  ListProdutos := TList<TProduto>.Create;
  Inc(CountId);
end;

procedure TTFrmPrincipal.BtnCriarProdutoClick(Sender: TObject);
begin
  InsereValoresProduto;
  FormataLinha(Produto.Id, Produto.Quantidade, Produto.Name, Produto.Preco);
  ListProdutos.Add(Produto);
  ListBoxProdutos.Items.Add(LinhaFormatada);
end;

procedure TTFrmPrincipal.InsereValoresProduto;
begin
  Produto.Id := CountId;
  Produto.Name := EditNome.Text;
  Produto.Quantidade := StrToInt(EditQuantidade.Text);
  Produto.Preco := StrToFloat(EditPreco.Text);
end;

procedure TTFrmPrincipal.FormataLinha(Id, Quantidade: Integer;  Nome: String; Preco: Double);
begin
  LinhaFormatada := Format('Código: %d | %s | Qtd: %d | Preço: %s',
    [Produto.Id, Produto.Name, Produto.Quantidade, FormatCurr('R$ #,##0.00',
    Produto.Preco)]);
end;

procedure TTFrmPrincipal.BtnAddCarrinhoClick(Sender: TObject);
begin
  RecebeId := StrToInt(EditCarrinho.Text);
  ProdCarrinho := ProcuraProduto(RecebeId, ListProdutos);
  FormataLinha(ProdCarrinho.Id, ProdCarrinho.Quantidade, ProdCarrinho.Name, ProdCarrinho.Preco);
  ListCarrinho.Items.Add(LinhaFormatada);
end;

end.
