program POO;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {Main},
  uSistemaPagamento in 'uSistemaPagamento.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
