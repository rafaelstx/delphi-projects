unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uRequisitos, uResultado, uDadosPessoa;

type
  TMain = class(TForm)
    Header: TPanel;
    Body: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditAltura: TEdit;
    EditPeso: TEdit;
    CampoSexo: TComboBox;
    BtnResultado: TButton;
    BtnRequisitos: TButton;
    procedure BtnRequisitosClick(Sender: TObject);
    procedure BtnResultadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.BtnRequisitosClick(Sender: TObject);
begin
  Requisitos.ShowModal;
end;

procedure TMain.BtnResultadoClick(Sender: TObject);
begin
  try
    Pessoa.Altura := uDadosPessoa.StrToFloatConversao(EditAltura.Text);
    Pessoa.Peso := uDadosPessoa.StrToFloatConversao(EditPeso.Text);
    if not ValidaComboBox(CampoSexo.Text) then
      begin
        MessageDlg('Selecione um sexo', mtError, [mbOk], 0);
      end
      else
        begin
          Pessoa.Sexo := CampoSexo.Text;
          Pessoa.IMC := CalcularIMC(Pessoa.Peso, Pessoa.Altura, Pessoa.Sexo);
          Resultado.ShowModal;
        end;

  except
    on E: Exception do
    ShowMessage('Dados inválidos, verifique Altura e Peso');
  end;

end;

procedure TMain.FormCreate(Sender: TObject);
begin
  Application.Title := 'Calculadora IMC';
end;

end.
