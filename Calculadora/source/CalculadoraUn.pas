unit CalculadoraUn;

interface

type
  TOperacao = (tpNenhuma, tpSoma, tpSubtracao, tpMultiplicacao, tpDivisao, tpZeraCalculadora, tpImpostoA, tpImpostoB, tpImpostoC);

  TCalculadora = class
  private
    FResultado: double;
  public
    constructor Create;
    function Somar(const ValorA, ValorB: double): double;
    function Multiplicar(const ValorA, ValorB: double): double;
    function Subtrair(const ValorA, ValorB: double): double;
    function Dividir(const ValorA, ValorB: double): double;
  end;

  TImpostoCalc = class (TCalculadora)
  public
    function GetImpostoA(const aBaseCalculo: double): double;
    function GetImpostoB(const aBaseCalculo: double): double;
    function GetImpostoC(const aBaseCalculo: double): double;
  end;

  TCalculadoraController = class
  private
    FCalculadora : TImpostoCalc;
  public
    constructor Create;
    destructor Destroy; override;
    function ExecutaOperacao(const aOperacao: TOperacao; const aValorA, aValorB: double): double;
  end;

implementation

{ TCalculadora }

constructor TCalculadora.Create;
begin
  Self.FResultado := 0;
end;

function TCalculadora.Dividir(const ValorA, ValorB: double): double;
begin
  Result := ValorA / ValorB;
end;

function TCalculadora.Multiplicar(const ValorA, ValorB: double): double;
begin
  Result := ValorA * ValorB;
end;

function TCalculadora.Somar(const ValorA, ValorB: double): double;
begin
  Result := ValorA + ValorB;
end;

function TCalculadora.Subtrair(const ValorA, ValorB: double): double;
begin
  Result := ValorA - ValorB;
end;

{ TCalculadoraController }

constructor TCalculadoraController.Create;
begin
  FCalculadora := TImpostoCalc.Create;
end;

destructor TCalculadoraController.Destroy;
begin
  FCalculadora.Free;
  inherited;
end;

function TCalculadoraController.ExecutaOperacao(
  const aOperacao: TOperacao; const aValorA, aValorB: double): double;
begin
  case aOperacao of
    tpSoma: Result := Self.FCalculadora.Somar(aValorA, aValorB);
    tpSubtracao: Result := Self.FCalculadora.Subtrair(aValorA, aValorB);
    tpMultiplicacao: Result := Self.FCalculadora.Multiplicar(aValorA, aValorB);
    tpDivisao: Result := Self.FCalculadora.Dividir(aValorA, aValorB);
    tpImpostoA: Result := Self.FCalculadora.GetImpostoA(aValorA);
    tpImpostoB: Result := Self.FCalculadora.GetImpostoB(aValorA);
    tpImpostoC: Result := Self.FCalculadora.GetImpostoC(aValorA);
  end;

end;

{ TImpostoCalc }

function TImpostoCalc.GetImpostoA(const aBaseCalculo: double): double;
begin
  Result := (aBaseCalculo * 0.02) - 500;
end;

function TImpostoCalc.GetImpostoB(const aBaseCalculo: double): double;
begin
  Result := Self.GetImpostoA(aBaseCalculo) - 15;
end;

function TImpostoCalc.GetImpostoC(const aBaseCalculo: double): double;
begin
  Result := Self.GetImpostoA(aBaseCalculo) + Self.GetImpostoB(aBaseCalculo);
end;

end.
