program EntidadesCalculo;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmPrincipal},
  PersistenciaUn in 'PersistenciaUn.pas',
  FuncionarioUn in 'FuncionarioUn.pas',
  LibUtils in 'LibUtils.pas',
  FuncionarioControllerUn in 'FuncionarioControllerUn.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
