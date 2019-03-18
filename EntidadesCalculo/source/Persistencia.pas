unit Persistencia;

interface

Uses  Data.DB, Data.SqlExpr, System.Classes, System.SysUtils, Datasnap.DBClient,
      SimpleDS;

type

  TDGRSQLConnection = class (TSQLConnection)
  private
    procedure DBSQLConnectionBeforeConnect(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TDGRSimpleDataSet = class (TSimpleDataSet)
  private
    FTableName: string;
    const
      SQL = 'SELECT * FROM %s WHERE Id = %d';
  public
    constructor Create(AOwner: TComponent; ASqlConnection: TDGRSQLConnection; const ATableName: string);
    procedure LoadById(const aID: integer);
  end;

implementation

{ TDGRSQLConnection }

constructor TDGRSQLConnection.Create(AOwner: TComponent);
begin
  inherited;
  Self.BeforeConnect := DBSQLConnectionBeforeConnect;
end;

procedure TDGRSQLConnection.DBSQLConnectionBeforeConnect(Sender: TObject);
var
  _iniParams: TStringList;
  _i: integer;
begin
  _iniParams := TStringList.Create;
  try
    _iniParams.LoadFromFile(ExtractFilePath(ParamStr(0) ) + 'Parametros.ini');
    for _i := 0 to _iniParams.Count - 1 do
      Self.Params.Values[_iniParams.Names[_i]] := _iniParams.ValueFromIndex[_i];
  finally
    _iniParams.Free;
  end;
end;

{ TDGRSimpleDataSet }

constructor TDGRSimpleDataSet.Create(AOwner: TComponent;
  ASqlConnection: TDGRSQLConnection; const ATableName: string);
begin
  inherited Create(AOwner);
  Self.SetConnection(ASqlConnection);
  Self.FTableName := ATableName;
end;

procedure TDGRSimpleDataSet.LoadById(const aID: integer);
begin
  Self.DataSet.CommandText := Format(SQL, [Self.FTableName, aID]);
  Self.Open;
end;

end.
