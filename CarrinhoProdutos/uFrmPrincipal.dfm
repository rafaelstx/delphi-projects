object TFrmPrincipal: TTFrmPrincipal
  Left = 531
  Top = 228
  Caption = 'TFrmPrincipal'
  ClientHeight = 511
  ClientWidth = 906
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object Header: TPanel
    Left = 0
    Top = 0
    Width = 906
    Height = 73
    Align = alTop
    TabOrder = 0
    ExplicitTop = -6
    ExplicitWidth = 884
    object Label5: TLabel
      Left = 232
      Top = 13
      Width = 479
      Height = 35
      Caption = 'Sistema Carrinho de Produtos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -29
      Font.Name = 'Swis721 Blk BT'
      Font.Style = []
      ParentFont = False
    end
  end
  object PnlAdicionarProduto: TPanel
    Left = 0
    Top = 73
    Width = 249
    Height = 438
    Caption = '='
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 91
      Width = 43
      Height = 20
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 187
      Width = 81
      Height = 20
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 293
      Width = 39
      Height = 20
      Caption = 'Pre'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 32
      Top = 32
      Width = 182
      Height = 30
      Caption = 'Adicionar Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EditNome: TEdit
      Left = 32
      Top = 109
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object EditQuantidade: TEdit
      Left = 32
      Top = 208
      Width = 121
      Height = 23
      TabOrder = 1
    end
    object EditPreco: TEdit
      Left = 32
      Top = 314
      Width = 121
      Height = 23
      TabOrder = 2
    end
    object BtnCriarProduto: TButton
      Left = 32
      Top = 376
      Width = 81
      Height = 33
      Caption = 'Criar Produto'
      TabOrder = 3
      OnClick = BtnCriarProdutoClick
    end
  end
  object PnlListarProduto: TPanel
    Left = 248
    Top = 73
    Width = 659
    Height = 438
    TabOrder = 2
  end
end
