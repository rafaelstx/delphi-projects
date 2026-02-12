unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList;

type
  TFrmPrincipal = class(TForm)
    PnlTitulo: TPanel;
    PgCntrlPrincipal: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdtCaracteres: TEdit;
    BtnExibirDataHora: TButton;
    ImageList1: TImageList;
    procedure FormShow(Sender: TObject);
    procedure EdtCaracteresEnter(Sender: TObject);
    procedure EdtCaracteresExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.EdtCaracteresEnter(Sender: TObject);
begin
  EdtCaracteres.Color := $00B9FFFF;
end;

procedure TFrmPrincipal.EdtCaracteresExit(Sender: TObject);
begin
  if EdtCaracteres.Text = '' then
  begin
    MessageDlg('Você não digitou nenhum caracter', TMsgDlgType.mtError, [mbOk], 0);
    EdtCaracteres.SetFocus;
  end
  else
    if Length(EdtCaracteres.Text) <> 4 then
    begin
      MessageDlg('Digite 4 caracteres', TMsgDlgType.mtError, [mbOk], 0) ;
      EdtCaracteres.SetFocus;
      EdtCaracteres.SelectAll;
    end
    else
      EdtCaracteres.Color := clWindow;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  PnlTitulo.Caption := 'Caption alterado com onShow';
  PnlTitulo.Color := $00B9FFFF;
end;

end.
