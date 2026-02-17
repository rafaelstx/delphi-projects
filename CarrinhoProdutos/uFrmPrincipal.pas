unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
    procedure BtnCriarProdutoClick(Sender: TObject);
  private
    FProdutos: TList<TProduto>;
  public
    { Public declarations }
  end;

var
  TFrmPrincipal: TTFrmPrincipal;

implementation

{$R *.dfm}

procedure TTFrmPrincipal.BtnCriarProdutoClick(Sender: TObject);
begin
  Produto.Name := EditNome.Text;
  Produto.Quantidade := StrToInt(EditQuantidade.text);
  Produto.Preco := StrToFloat(EditPreco.text);
end;

end.
