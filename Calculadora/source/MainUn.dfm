object frmCalculadora: TfrmCalculadora
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Calculadora'
  ClientHeight = 184
  ClientWidth = 276
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
  object Label1: TLabel
    Left = 7
    Top = 132
    Width = 147
    Height = 13
    Caption = 'Opera'#231#245'es suportadas: + - * /'
  end
  object Label2: TLabel
    Left = 7
    Top = 151
    Width = 256
    Height = 13
    Caption = 'Pressione = ou <Enter> para terminar uma opera'#231#227'o'
  end
  object edtDisplay: TEdit
    Left = 8
    Top = 24
    Width = 256
    Height = 21
    TabOrder = 0
    Text = '0'
    OnKeyPress = edtDisplayKeyPress
  end
  object edtResultado: TEdit
    Left = 8
    Top = 51
    Width = 256
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 1
  end
  object btnImpostoA: TButton
    Left = 17
    Top = 84
    Width = 75
    Height = 25
    Caption = 'Imposto A'
    TabOrder = 2
    OnClick = btnImpostoAClick
  end
  object btnImpostoB: TButton
    Left = 98
    Top = 84
    Width = 75
    Height = 25
    Caption = 'Imposto B'
    TabOrder = 3
    OnClick = btnImpostoBClick
  end
  object btnImpostoC: TButton
    Left = 179
    Top = 84
    Width = 75
    Height = 25
    Caption = 'Imposto C'
    TabOrder = 4
    OnClick = btnImpostoCClick
  end
end
