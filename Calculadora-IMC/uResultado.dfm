object Resultado: TResultado
  Left = 0
  Top = 0
  Caption = 'Resultado'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 232
      Top = 13
      Width = 145
      Height = 40
      Caption = 'Sua IMC '#233':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 624
    Height = 360
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 392
    ExplicitTop = 312
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label2: TLabel
      Left = 88
      Top = 48
      Width = 169
      Height = 32
      Caption = 'Altura .............'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 88
      Top = 112
      Width = 172
      Height = 32
      Caption = 'Peso ................'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 88
      Top = 180
      Width = 173
      Height = 32
      Caption = 'Sexo ................'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 88
      Top = 248
      Width = 172
      Height = 32
      Caption = 'IMC .................'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelAltura: TLabel
      Left = 332
      Top = 48
      Width = 169
      Height = 32
      Caption = 'Altura .............'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelPeso: TLabel
      Left = 332
      Top = 112
      Width = 172
      Height = 32
      Caption = 'Peso ................'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelSexo: TLabel
      Left = 332
      Top = 180
      Width = 173
      Height = 32
      Caption = 'Sexo ................'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelResultado: TLabel
      Left = 332
      Top = 248
      Width = 172
      Height = 32
      Caption = 'IMC .................'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
