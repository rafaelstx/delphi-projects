program CarrinhoProdutos;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {TFrmPrincipal},
  uProduto in 'uProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTFrmPrincipal, TFrmPrincipal);
  Application.Run;
end.
