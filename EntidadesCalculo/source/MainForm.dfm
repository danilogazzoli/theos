object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Funcion'#225'rios'
  ClientHeight = 402
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcFuncionarios: TPageControl
    Left = 0
    Top = 0
    Width = 609
    Height = 402
    ActivePage = Cadastro
    Align = alClient
    TabOrder = 0
    object Cadastro: TTabSheet
      Caption = 'Cadastro'
      object CadastroGroupBox: TGroupBox
        Left = 0
        Top = 0
        Width = 601
        Height = 374
        Align = alClient
        TabOrder = 0
        object Nome: TLabel
          Left = 19
          Top = 27
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object LogradouroLabel: TLabel
          Left = 19
          Top = 51
          Width = 19
          Height = 13
          Caption = 'CPF'
        end
        object Label1: TLabel
          Left = 211
          Top = 54
          Width = 32
          Height = 13
          Caption = 'Sal'#225'rio'
        end
        object Bevel1: TBevel
          Left = 89
          Top = 102
          Width = 464
          Height = 17
          Shape = bsBottomLine
        end
        object Label2: TLabel
          Left = 19
          Top = 109
          Width = 64
          Height = 13
          Caption = 'Dependentes'
        end
        object Label3: TLabel
          Left = 19
          Top = 135
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object Label4: TLabel
          Left = 19
          Top = 165
          Width = 48
          Height = 13
          Caption = 'Calcula IR'
        end
        object Label5: TLabel
          Left = 206
          Top = 165
          Width = 60
          Height = 13
          Caption = 'Calcula INSS'
        end
        object LabelINSS: TLabel
          Left = 19
          Top = 81
          Width = 23
          Height = 13
          Caption = 'INSS'
        end
        object Label6: TLabel
          Left = 211
          Top = 83
          Width = 11
          Height = 13
          Caption = 'IR'
        end
        object NomeEdit: TMaskEdit
          Left = 80
          Top = 24
          Width = 473
          Height = 21
          TabOrder = 0
          Text = ''
        end
        object CPFEdit: TMaskEdit
          Left = 80
          Top = 51
          Width = 115
          Height = 21
          TabOrder = 1
          Text = ''
        end
        object SalarioEdit: TMaskEdit
          Left = 272
          Top = 51
          Width = 115
          Height = 21
          TabOrder = 2
          Text = ''
        end
        object GroupBox1: TGroupBox
          Left = 19
          Top = 292
          Width = 534
          Height = 49
          TabOrder = 8
          object NovoButton: TButton
            Left = 20
            Top = 13
            Width = 75
            Height = 25
            Action = NovoAction
            TabOrder = 0
          end
          object SalvarButton: TButton
            Left = 101
            Top = 13
            Width = 75
            Height = 25
            Action = SalvarAction
            TabOrder = 1
          end
          object SairButton: TButton
            Left = 434
            Top = 13
            Width = 75
            Height = 25
            Action = SairAction
            TabOrder = 3
          end
          object ImpostoButton: TButton
            Left = 184
            Top = 13
            Width = 118
            Height = 25
            Caption = 'Calcula Impostos'
            TabOrder = 2
            OnClick = ImpostoButtonClick
          end
        end
        object lbxDependentes: TListBox
          Left = 19
          Top = 189
          Width = 534
          Height = 97
          ItemHeight = 13
          TabOrder = 7
        end
        object NomeDependenteEdit: TMaskEdit
          Left = 80
          Top = 132
          Width = 473
          Height = 21
          TabOrder = 3
          Text = ''
        end
        object CalculaIREdit: TComboBox
          Left = 80
          Top = 162
          Width = 49
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 4
          Text = 'N'#227'o'
          Items.Strings = (
            'N'#227'o'
            'Sim')
        end
        object CalculaINSSEdit: TComboBox
          Left = 272
          Top = 162
          Width = 49
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 5
          Text = 'N'#227'o'
          Items.Strings = (
            'N'#227'o'
            'Sim')
        end
        object AdicionarDepButton: TButton
          Left = 478
          Top = 158
          Width = 75
          Height = 25
          Caption = 'Adicionar'
          TabOrder = 6
          OnClick = AdicionarDepButtonClick
        end
        object INSSEdit: TMaskEdit
          Left = 80
          Top = 79
          Width = 115
          Height = 21
          Enabled = False
          TabOrder = 9
          Text = ''
        end
        object IREdit: TMaskEdit
          Left = 272
          Top = 78
          Width = 115
          Height = 21
          Enabled = False
          TabOrder = 10
          Text = ''
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Pesquisa'
      ImageIndex = 1
      object PesquisaEdit: TComboBox
        Left = 6
        Top = 10
        Width = 83
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'ID'
        Items.Strings = (
          'ID')
      end
      object CodigoEdit: TMaskEdit
        Left = 95
        Top = 10
        Width = 488
        Height = 21
        TabOrder = 1
        Text = ''
        OnKeyPress = CodigoEditKeyPress
      end
      object lbxPesquisa: TListBox
        Left = 6
        Top = 43
        Width = 577
        Height = 310
        ItemHeight = 13
        TabOrder = 2
        OnDblClick = lbxPesquisaDblClick
      end
    end
  end
  object CadastroActionList: TActionList
    Left = 504
    Top = 184
    object NovoAction: TAction
      Caption = '&Novo'
      OnExecute = NovoActionExecute
    end
    object SalvarAction: TAction
      Caption = '&Salvar'
      OnExecute = SalvarActionExecute
    end
    object EditarAction: TAction
      Caption = '&Editar'
    end
    object ExcluirAction: TAction
      Caption = '&Excluir'
    end
    object PesquisarAction: TAction
      Caption = '&Pesquisar'
    end
    object SairAction: TAction
      Caption = 'Sai&r'
      OnExecute = SairActionExecute
    end
  end
end
