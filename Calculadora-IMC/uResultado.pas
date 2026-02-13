unit uResultado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uDadosPessoa;

type
  TResultado = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LabelAltura: TLabel;
    LabelPeso: TLabel;
    LabelSexo: TLabel;
    LabelResultado: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Resultado: TResultado;

implementation

{$R *.dfm}

procedure TResultado.FormShow(Sender: TObject);
begin
  LabelAltura.Caption      := FloatToStr(Pessoa.Altura);
  LabelPeso.Caption        := FloatToStr(Pessoa.Peso);
  LabelSexo.Caption        := Pessoa.Sexo;
  LabelResultado.Caption   := Pessoa.IMC;
end;

end.
