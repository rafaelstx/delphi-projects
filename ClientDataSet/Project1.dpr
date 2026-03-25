program Project1;

uses
  Vcl.Forms,
  uClientDataSetExemplo in 'uClientDataSetExemplo.pas' {ClientDataSetExemplo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TClientDataSetExemplo, ClientDataSetExemplo);
  Application.Run;
end.
