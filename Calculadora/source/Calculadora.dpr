program Calculadora;

uses
  Vcl.Forms,
  MainUn in 'MainUn.pas' {frmCalculadora},
  CalculadoraUn in 'CalculadoraUn.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCalculadora, frmCalculadora);
  Application.Run;
end.
