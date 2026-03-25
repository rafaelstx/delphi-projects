unit uClientDataSetExemplo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient,
  MidasLib;

type
  TClientDataSetExemplo = class(TForm)
    DBGrid1: TDBGrid;
    BtnAdicionar: TButton;
    BtnDesfazer: TButton;
    BtnCancelarTudo: TButton;
    BtnSalvar: TButton;
    BtnCarregar: TButton;
    LblTotal: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure BtnDesfazerClick(Sender: TObject);
    procedure BtnCancelarTudoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCarregarClick(Sender: TObject);
  private
    FClientDataSet: TClientDataSet;
    FDataSource: TDataSource;
    procedure AtualizarTotal;
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
  end;

var
  ClientDataSetExemplo: TClientDataSetExemplo;

implementation

{$R *.dfm}

{ TClientDataSetExemplo }

// CORREÇÃO: Todas as procedures agora começam com TClientDataSetExemplo

procedure TClientDataSetExemplo.FormCreate(Sender: TObject);
begin
  // 1. Instanciando os componentes na memória
  FClientDataSet := TClientDataSet.Create(Self);
  FDataSource := TDataSource.Create(Self);

  // 2. Ligando o Grid aos dados
  FDataSource.DataSet := FClientDataSet;
  FDataSource.OnDataChange := DataSourceDataChange; // Evento para atualizar o Total
  DBGrid1.DataSource := FDataSource;

  // 3. Criando a estrutura da tabela do zero (Nível 1)
  FClientDataSet.FieldDefs.Add('IDVenda', ftInteger);
  FClientDataSet.FieldDefs.Add('Cliente', ftString, 50);
  FClientDataSet.FieldDefs.Add('Valor', ftCurrency);

  // 4. Configurando a Agregação para calcular o Total automaticamente (Nível 4)
  FClientDataSet.AggregatesActive := False;
  with FClientDataSet.Aggregates.Add do
  begin
    AggregateName := 'SomaTotal';
    Expression := 'SUM(Valor)'; // Comando SQL rodando direto na memória RAM!
    Active := True;
  end;

  // 5. O comando mágico que constrói tudo fisicamente na memória
  FClientDataSet.CreateDataSet;
  FClientDataSet.LogChanges := True; // Habilita o "Delta" para podermos desfazer ações
  FClientDataSet.AggregatesActive := True;
end;

procedure TClientDataSetExemplo.BtnAdicionarClick(Sender: TObject);
begin
  // 1. Congelamos a tela antes de entrar na zona de perigo
  FClientDataSet.DisableControls;

  try // TRY EXTERNO (Garante o finally)
    try // TRY INTERNO (Garante o except)

      FClientDataSet.Append;
      FClientDataSet.FieldByName('IDVenda').AsInteger := FClientDataSet.RecordCount + 1;
      FClientDataSet.FieldByName('Cliente').AsString := 'Cliente Teste ' + IntToStr(Random(100));
      FClientDataSet.FieldByName('Valor').AsFloat := 50 + Random(200);
      FClientDataSet.Post;

    except
      on E: Exception do
      begin
        FClientDataSet.Cancel;
        ShowMessage('Erro ao registrar venda: ' + E.Message);
      end;
    end; // Fim do try interno (except)

  finally
    // 2. Descongelamos a tela, mesmo se o except for acionado acima
    FClientDataSet.EnableControls;
  end; // Fim do try externo (finally)
end;

procedure TClientDataSetExemplo.BtnDesfazerClick(Sender: TObject);
begin
  // Nível 3: O "Ctrl+Z" dos dados (O Delta em ação)
  if FClientDataSet.ChangeCount > 0 then
  begin
    // Desfaz a ÚLTIMA ação. Se foi um Insert, a linha some. Se foi um Edit, o valor volta.
    FClientDataSet.UndoLastChange(True);
  end
  else
    ShowMessage('Não há alterações recentes para desfazer.');
end;

procedure TClientDataSetExemplo.BtnCancelarTudoClick(Sender: TObject);
begin
  // Cancela TODAS as alterações que ainda não foram consolidadas (Merge)
  if FClientDataSet.ChangeCount > 0 then
  begin
    FClientDataSet.CancelUpdates;
    ShowMessage('Todas as alterações não salvas foram canceladas.');
  end;
end;

procedure TClientDataSetExemplo.BtnSalvarClick(Sender: TObject);
begin
  // Nível 2: Modelo Briefcase (Salvando offline)
  // O dfXMLUTF8 garante que acentos no nome do cliente não quebrem o arquivo
  FClientDataSet.SaveToFile('C:\Temp\VendasOffline.xml', dfXMLUTF8);

  // Se estamos salvando, assumimos que o trabalho terminou, então consolidamos o Delta
  FClientDataSet.MergeChangeLog;
  ShowMessage('Dados salvos em XML com sucesso!');
end;

procedure TClientDataSetExemplo.BtnCarregarClick(Sender: TObject);
begin
  // Recuperando os dados do pendrive/disco de volta para a memória
  if FileExists('C:\Temp\VendasOffline.xml') then
  begin
    FClientDataSet.LoadFromFile('C:\Temp\VendasOffline.xml');
    ShowMessage('Dados carregados com sucesso!');
  end
  else
    ShowMessage('Nenhum arquivo de backup encontrado.');
end;

procedure TClientDataSetExemplo.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  // Sempre que houver navegação ou alteração nos dados, atualizamos o Label do Total
  AtualizarTotal;
end;

procedure TClientDataSetExemplo.AtualizarTotal;
var
  Total: Variant;
begin
  // Acessando o valor da Agregação criada no FormCreate
  if FClientDataSet.Active and FClientDataSet.AggregatesActive then
  begin
    Total := FClientDataSet.Aggregates.Find('SomaTotal').Value;
    if not VarIsNull(Total) then
      LblTotal.Caption := 'Total das Vendas: R$ ' + FormatFloat(',0.00', Total)
    else
      LblTotal.Caption := 'Total das Vendas: R$ 0,00';
  end;
end;

end.
