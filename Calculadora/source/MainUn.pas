unit MainUn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CalculadoraUn;

type
  TfrmCalculadora = class(TForm)
    edtDisplay: TEdit;
    edtResultado: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnImpostoA: TButton;
    btnImpostoB: TButton;
    btnImpostoC: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDisplayKeyPress(Sender: TObject; var Key: Char);
    procedure btnImpostoAClick(Sender: TObject);
    procedure btnImpostoBClick(Sender: TObject);
    procedure btnImpostoCClick(Sender: TObject);
  private
    { Private declarations }
    FCalculadoraController : TCalculadoraController;
    FValorAnterior: string;
    FResultado: double;
    FUltimaOperacao: TOperacao;
    procedure ZeraCalculadora;
    procedure CheckImposto(const aOperacao: TOperacao);
  public
    { Public declarations }
  end;

var
  frmCalculadora: TfrmCalculadora;

implementation

{$R *.dfm}


procedure TfrmCalculadora.FormCreate(Sender: TObject);
begin
  FCalculadoraController := TCalculadoraController.Create;
  Self.ZeraCalculadora;
end;

procedure TfrmCalculadora.ZeraCalculadora;
begin
  FValorAnterior := '0';
  FResultado := 0;
  FUltimaOperacao := tpNenhuma;
  EdtDisplay.Clear;
end;

procedure TfrmCalculadora.CheckImposto(const aOperacao: TOperacao);
begin
  if String(edtResultado.Text).IsEmpty then
    edtResultado.Text := 'Informe um resultado'
  else
  begin
    edtResultado.Text := FCalculadoraController.ExecutaOperacao(aOperacao, StrToCurrDef(edtResultado.Text, 0), 0).ToString;
    Self.ZeraCalculadora;
  end;
end;

procedure TfrmCalculadora.btnImpostoAClick(Sender: TObject);
begin
  Self.CheckImposto(tpImpostoA);
end;

procedure TfrmCalculadora.btnImpostoBClick(Sender: TObject);
begin
  Self.CheckImposto(tpImpostoB);
end;

procedure TfrmCalculadora.btnImpostoCClick(Sender: TObject);
begin
  Self.CheckImposto(tpImpostoC);
end;

procedure TfrmCalculadora.edtDisplayKeyPress(Sender: TObject; var Key: Char);
begin
  try
    if CharInSet(Key, ['+','-','*','x','/', '=', Chr(VK_RETURN)]) then
    begin
        if (Self.FUltimaOperacao = tpNenhuma) then
          Self.FResultado := StrToCurrDef(Self.FValorAnterior, 0)
        else
            FResultado := FCalculadoraController.ExecutaOperacao(Self.FUltimaOperacao, Self.FResultado,  StrToCurrDef(Self.FValorAnterior, 0));
        edtResultado.Text := Self.FResultado.ToString;
        Self.FValorAnterior := '0';
        if CharInSet(Key, ['=', Chr(VK_RETURN)]) then
        begin
          Self.ZeraCalculadora;
          Key := #0;
        end;
    end;

    case Key of
      '+': Self.FUltimaOperacao := tpSoma;
      '-': Self.FUltimaOperacao := tpSubtracao;
      '*', 'x': Self.FUltimaOperacao := tpMultiplicacao;
      '/': Self.FUltimaOperacao := tpDivisao;
      '0'..'9', ',': FValorAnterior := FValorAnterior + Key;
    end;
  except
    on E: Exception do
    begin
      edtResultado.Text := 'Operação aritmética inválida';
      Self.ZeraCalculadora;
    end;
  end;
end;

procedure TfrmCalculadora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FCalculadoraController.Free;
end;

end.
