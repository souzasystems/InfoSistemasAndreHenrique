inherited fmCadastroClientes: TfmCadastroClientes
  Caption = 'Cadastro de Clientes'
  ClientHeight = 363
  ClientWidth = 721
  OnDestroy = FormDestroy
  ExplicitWidth = 727
  ExplicitHeight = 392
  PixelsPerInch = 96
  TextHeight = 13
  inherited statMsg: TStatusBar
    Top = 344
    Width = 721
    ExplicitTop = 344
    ExplicitWidth = 721
  end
  inherited pgc1: TPageControl
    Width = 529
    Height = 329
    ExplicitWidth = 529
    ExplicitHeight = 329
    inherited tsDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 521
      ExplicitHeight = 301
      inherited pnlDados: TPanel
        Width = 521
        Height = 301
        ExplicitLeft = 232
        ExplicitTop = 8
        ExplicitWidth = 521
        ExplicitHeight = 301
        object lblNomeRazaoSocial: TLabel
          Left = 72
          Top = 8
          Width = 32
          Height = 13
          Caption = 'Nome'
        end
        object lbl5: TLabel
          Left = 232
          Top = 48
          Width = 49
          Height = 13
          Caption = 'Telefone'
        end
        object lblIdentInscMunicipal: TLabel
          Left = 8
          Top = 48
          Width = 62
          Height = 13
          Caption = 'Identidade'
        end
        object lblCPF_CNPJ: TLabel
          Left = 128
          Top = 48
          Width = 20
          Height = 13
          Caption = 'CPF'
        end
        object lbl1: TLabel
          Left = 8
          Top = 88
          Width = 35
          Height = 13
          Caption = 'E-mail'
        end
        object lbl8: TLabel
          Left = 8
          Top = 128
          Width = 21
          Height = 13
          Caption = 'Cep'
        end
        object lbl17: TLabel
          Left = 8
          Top = 168
          Width = 65
          Height = 13
          Caption = 'Logradouro'
        end
        object lbl10: TLabel
          Left = 8
          Top = 208
          Width = 44
          Height = 13
          Caption = 'N'#250'mero'
        end
        object lbl12: TLabel
          Left = 72
          Top = 208
          Width = 79
          Height = 13
          Caption = 'Complemento'
        end
        object lbl13: TLabel
          Left = 264
          Top = 208
          Width = 34
          Height = 13
          Caption = 'Bairro'
        end
        object lbl11: TLabel
          Left = 8
          Top = 248
          Width = 38
          Height = 13
          Caption = 'Cidade'
        end
        object lbl7: TLabel
          Left = 384
          Top = 248
          Width = 38
          Height = 13
          Caption = 'Estado'
        end
        object lbl2: TLabel
          Left = 432
          Top = 248
          Width = 23
          Height = 13
          Caption = 'Pa'#237's'
        end
        object lbl3: TLabel
          Left = 8
          Top = 8
          Width = 38
          Height = 13
          Caption = 'C'#243'digo'
        end
        object edtNome: TEdit
          Left = 72
          Top = 24
          Width = 433
          Height = 21
          CharCase = ecUpperCase
          Color = clInfoBk
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxLength = 80
          ParentFont = False
          TabOrder = 1
        end
        object medtTelefone: TMaskEdit
          Left = 232
          Top = 64
          Width = 105
          Height = 21
          Alignment = taCenter
          Color = clInfoBk
          EditMask = '(##) #####-####;0;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxLength = 15
          ParentFont = False
          TabOrder = 4
          Text = ''
        end
        object edtIdentidade: TEdit
          Left = 8
          Top = 64
          Width = 113
          Height = 21
          CharCase = ecUpperCase
          Color = clInfoBk
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxLength = 20
          ParentFont = False
          TabOrder = 2
        end
        object medtCpf: TMaskEdit
          Left = 128
          Top = 64
          Width = 97
          Height = 21
          Alignment = taCenter
          CharCase = ecUpperCase
          Color = clInfoBk
          EditMask = '###.###.###-##;0;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxLength = 14
          ParentFont = False
          TabOrder = 3
          Text = ''
        end
        object edtEmail: TEdit
          Left = 8
          Top = 104
          Width = 497
          Height = 21
          CharCase = ecLowerCase
          Color = clInfoBk
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxLength = 80
          ParentFont = False
          TabOrder = 5
        end
        object medtCep: TMaskEdit
          Left = 8
          Top = 144
          Width = 80
          Height = 21
          Alignment = taCenter
          CharCase = ecUpperCase
          Color = clInfoBk
          EditMask = '##.###-###;0;_'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 6
          Text = ''
          OnExit = medtCepExit
        end
        object edtLogradouro: TEdit
          Left = 8
          Top = 184
          Width = 497
          Height = 21
          CharCase = ecUpperCase
          Color = clInfoBk
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
        end
        object edtComplemento: TEdit
          Left = 72
          Top = 224
          Width = 185
          Height = 21
          CharCase = ecUpperCase
          Color = clInfoBk
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxLength = 25
          ParentFont = False
          TabOrder = 9
        end
        object edtBairro: TEdit
          Left = 264
          Top = 224
          Width = 241
          Height = 21
          CharCase = ecUpperCase
          Color = clInfoBk
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
        end
        object edtCidade: TEdit
          Left = 8
          Top = 264
          Width = 369
          Height = 21
          CharCase = ecUpperCase
          Color = clInfoBk
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
        end
        object edtEstado: TEdit
          Left = 384
          Top = 264
          Width = 41
          Height = 21
          Alignment = taCenter
          CharCase = ecUpperCase
          Color = clInfoBk
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
        end
        object edtPais: TEdit
          Left = 432
          Top = 264
          Width = 73
          Height = 21
          Alignment = taCenter
          CharCase = ecUpperCase
          Color = clInfoBk
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
        end
        object edtNumero: TEdit
          Left = 8
          Top = 224
          Width = 57
          Height = 21
          CharCase = ecUpperCase
          Color = clInfoBk
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxLength = 25
          ParentFont = False
          TabOrder = 8
        end
        object edtIdCliente: TEdit
          Left = 8
          Top = 24
          Width = 57
          Height = 21
          Alignment = taCenter
          CharCase = ecUpperCase
          Color = clInfoBk
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxLength = 5
          ParentFont = False
          TabOrder = 0
          OnExit = edtIdClienteExit
        end
      end
    end
  end
  inherited grp1: TGroupBox
    Left = 544
    Height = 315
    ExplicitLeft = 544
    ExplicitHeight = 315
    inherited btnGravar: TBitBtn
      Top = 240
      ExplicitTop = 240
    end
    inherited btnCancelar: TBitBtn
      Top = 272
      ExplicitTop = 272
    end
  end
  object dlgOpenXML: TOpenDialog
    Left = 352
    Top = 184
  end
end
