program CalculadoraIMC;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Main},
  uRequisitos in 'uRequisitos.pas' {Requisitos},
  uResultado in 'uResultado.pas' {Resultado},
  uDadosPessoa in 'uDadosPessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TRequisitos, Requisitos);
  Application.CreateForm(TResultado, Resultado);
  Application.Run;
end.
