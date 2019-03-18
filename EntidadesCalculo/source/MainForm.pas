unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.SqlExpr,
  Datasnap.DBClient, SimpleDS, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  System.Actions, Vcl.ActnList, FuncionarioControllerUn, PersistenciaUn,
  Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    pgcFuncionarios: TPageControl;
    Cadastro: TTabSheet;
    TabSheet2: TTabSheet;
    CadastroGroupBox: TGroupBox;
    Nome: TLabel;
    LogradouroLabel: TLabel;
    Label1: TLabel;
    NomeEdit: TMaskEdit;
    CPFEdit: TMaskEdit;
    SalarioEdit: TMaskEdit;
    CadastroActionList: TActionList;
    NovoAction: TAction;
    SalvarAction: TAction;
    EditarAction: TAction;
    ExcluirAction: TAction;
    PesquisarAction: TAction;
    SairAction: TAction;
    GroupBox1: TGroupBox;
    NovoButton: TButton;
    SalvarButton: TButton;
    SairButton: TButton;
    Bevel1: TBevel;
    Label2: TLabel;
    lbxDependentes: TListBox;
    NomeDependenteEdit: TMaskEdit;
    Label3: TLabel;
    CalculaIREdit: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    CalculaINSSEdit: TComboBox;
    AdicionarDepButton: TButton;
    PesquisaEdit: TComboBox;
    CodigoEdit: TMaskEdit;
    lbxPesquisa: TListBox;
    INSSEdit: TMaskEdit;
    IREdit: TMaskEdit;
    LabelINSS: TLabel;
    Label6: TLabel;
    ImpostoButton: TButton;
    procedure NovoActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SalvarActionExecute(Sender: TObject);
    procedure SairActionExecute(Sender: TObject);
    procedure AdicionarDepButtonClick(Sender: TObject);
    procedure CodigoEditKeyPress(Sender: TObject; var Key: Char);
    procedure lbxPesquisaDblClick(Sender: TObject);
    procedure ImpostoButtonClick(Sender: TObject);
  private
    { Private declarations }
    FFuncionarioController: TFuncionarioController;
    procedure ClearControls;
    procedure PopulateControls;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses LibUtils;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Self.FFuncionarioController := TFuncionarioController.Create(Self, TDGRSQLConnection.getInstance );
  Self.ClearControls;
end;

procedure TfrmPrincipal.ImpostoButtonClick(Sender: TObject);
begin
  INSSEdit.Text := CurrToStr( Self.FFuncionarioController.Funcionario.INSS);
  IREdit.Text := CurrToStr( Self.FFuncionarioController.Funcionario.IR);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Self.FFuncionarioController.Free;
end;

procedure TfrmPrincipal.AdicionarDepButtonClick(Sender: TObject);
begin
  Self.FFuncionarioController.Funcionario.Dependentes.Insert;
  Self.FFuncionarioController.Funcionario.Dependentes.Nome := NomeDependenteEdit.Text;
  Self.FFuncionarioController.Funcionario.Dependentes.IsCalculaIR := CalculaIREdit.ItemIndex.ToBoolean;
  Self.FFuncionarioController.Funcionario.Dependentes.IsCalculaINSS := CalculaINSSEdit.ItemIndex.ToBoolean;
  Self.FFuncionarioController.Funcionario.Dependentes.IDFuncionario := Self.FFuncionarioController.Funcionario.ID;
  Self.FFuncionarioController.Funcionario.Dependentes.Post;
  lbxDependentes.AddItem(NomeDependenteEdit.Text, TObject(Self.FFuncionarioController.Funcionario.Dependentes.ID));
end;

procedure TfrmPrincipal.ClearControls;
begin
  NomeEdit.Clear;
  CPFEdit.Clear;
  SalarioEdit.Clear;

  NomeDependenteEdit.Clear;
  CalculaIREdit.ItemIndex := 0;
  CalculaINSSEdit.ItemIndex := 0;
  lbxDependentes.Clear;
end;

procedure TfrmPrincipal.CodigoEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(VK_Return) then
  begin
    if Self.FFuncionarioController.LoadByIdFuncionario(StrToIntDef(CodigoEdit.Text, 0)) then
      lbxPesquisa.AddItem(Self.FFuncionarioController.Funcionario.Nome, TObject(Self.FFuncionarioController.Funcionario.ID));
  end;
end;

procedure TfrmPrincipal.PopulateControls;
begin
  Self.ClearControls;

  NomeEdit.Text := Self.FFuncionarioController.Funcionario.Nome;
  CPFEdit.Text := Self.FFuncionarioController.Funcionario.CPF;
  SalarioEdit.Text := CurrToStr(Self.FFuncionarioController.Funcionario.Salario);

  Self.FFuncionarioController.Funcionario.Dependentes.First;
  while not Self.FFuncionarioController.Funcionario.Dependentes.Eof do
  begin
    lbxDependentes.AddItem(Self.FFuncionarioController.Funcionario.Dependentes.Nome,
                           TObject(Self.FFuncionarioController.Funcionario.Dependentes.ID));
    Self.FFuncionarioController.Funcionario.Dependentes.Next;
  end;

end;

procedure TfrmPrincipal.NovoActionExecute(Sender: TObject);
begin
  Self.ClearControls;
  if NomeEdit.CanFocus then
    NomeEdit.SetFocus;

  Self.FFuncionarioController.Funcionario.LoadById(-1);
  Self.FFuncionarioController.Funcionario.Dependentes.LoadById(-1);
end;

procedure TfrmPrincipal.SairActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.SalvarActionExecute(Sender: TObject);
begin
  try
    Self.FFuncionarioController.Funcionario.Edit;
    Self.FFuncionarioController.Funcionario.Nome := NomeEdit.Text;
    if TLibUtils.OnlyNumbers(CPFEdit.Text).Length > 0 then
      Self.FFuncionarioController.Funcionario.CPF := CPFEdit.Text;
    Self.FFuncionarioController.Funcionario.Salario := StrToCurrDef(SalarioEdit.Text, 0);
    Self.FFuncionarioController.Funcionario.Post;

    Self.FFuncionarioController.Save;
  except
    on E: Exception do
    begin
      Self.FFuncionarioController.CancelEdit;
      raise;
    end;
  end;
end;

procedure TfrmPrincipal.lbxPesquisaDblClick(Sender: TObject);
begin
  pgcFuncionarios.ActivePageIndex := 0;
  Self.PopulateControls;
end;

end.
