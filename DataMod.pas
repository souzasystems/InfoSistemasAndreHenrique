unit DataMod;

interface

uses
  System.SysUtils, System.Classes, System.Contnrs, Clientes, Vcl.Forms, Winapi.Windows, Funcoes;

type
  TDm = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    lstClientes: TObjectList;
  public
    { Public declarations }
    function insereCliente(objCliente: TClientes): Boolean;
    function alteraCliente(objCliente: TClientes): Boolean;
    function excluiCliente(objCliente: TClientes): Boolean;
    function consultaCliente(idCliente: Integer): TClientes;
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDm }

function TDm.alteraCliente(objCliente: TClientes): Boolean;
var
   x: Integer;
begin
   Result := True;

   try
      for x := 00 to lstClientes.Count - 01 do
      begin
         if TClientes(lstClientes.Items[x]).IdCliente = objCliente.IdCliente then
         begin
            TClientes(lstClientes.Items[x]).Nome        := objCliente.Nome;
            TClientes(lstClientes.Items[x]).Identidade  := objCliente.Identidade;
            TClientes(lstClientes.Items[x]).CPF         := objCliente.CPF;
            TClientes(lstClientes.Items[x]).Telefone    := objCliente.Telefone;
            TClientes(lstClientes.Items[x]).Email       := objCliente.Email;
            TClientes(lstClientes.Items[x]).Cep         := objCliente.Cep;
            TClientes(lstClientes.Items[x]).Logradouro  := objCliente.Logradouro;
            TClientes(lstClientes.Items[x]).Numero      := objCliente.Numero;
            TClientes(lstClientes.Items[x]).Complemento := objCliente.Complemento;
            TClientes(lstClientes.Items[x]).Bairro      := objCliente.Bairro;
            TClientes(lstClientes.Items[x]).Cidade      := objCliente.Cidade;
            TClientes(lstClientes.Items[x]).Estado      := objCliente.Estado;
            TClientes(lstClientes.Items[x]).Pais        := objCliente.Pais;

            Break;
         end;
      end;
   except
      on E: Exception do
      begin
         Application.MessageBox(PChar('Houve um erro ao alterar o cliente' + TFuncoes.strZero(objCliente.IdCliente, 05) + ' - ' + String(objCliente.Nome) + '.' + #13#10 +
                                      'Motivo:' + E.Message), 'Atenção', MB_ICONWARNING + MB_OK);

         Result := False;
      end;
   end;
end;

function TDm.consultaCliente(idCliente: Integer): TClientes;
var
   x: Integer;
begin
   Result := nil;

   for x := 00 to lstClientes.Count - 01 do
   begin
      if TClientes(lstClientes.Items[x]).IdCliente = idCliente then
      begin
         Result := TClientes(lstClientes.Items[x]);

         Break;
      end;
   end;
end;

procedure TDm.DataModuleCreate(Sender: TObject);
begin
   lstClientes := TObjectList.Create;
end;

procedure TDm.DataModuleDestroy(Sender: TObject);
begin
   FreeAndNil(lstClientes);
end;

function TDm.excluiCliente(objCliente: TClientes): Boolean;
var
   x: Integer;
begin
   Result := True;

   try
      for x := 00 to lstClientes.Count - 01 do
      begin
         if TClientes(lstClientes.Items[x]).IdCliente = objCliente.IdCliente then
         begin
            lstClientes.Delete(x);

            Break;
         end;
      end;
   except
      on E: Exception do
      begin
         Application.MessageBox(PChar('Houve um erro ao excluir o cliente' + TFuncoes.strZero(objCliente.IdCliente, 05) + ' - ' + String(objCliente.Nome) + '.' + #13#10 +
                                      'Motivo:' + E.Message), 'Atenção', MB_ICONWARNING + MB_OK);

         Result := False;
      end;
   end;
end;

function TDm.insereCliente(objCliente: TClientes): Boolean;
begin
   Result := True;

   try
      objCliente.IdCliente := lstClientes.Count + 01;

      lstClientes.Add(objCliente);
   except
      on E: Exception do
      begin
         Application.MessageBox(PChar('Houve um erro ao inserir o cliente' + String(objCliente.Nome) + '.' + #13#10 +
                                      'Motivo:' + E.Message), 'Atenção', MB_ICONWARNING + MB_OK);

         Result := False;
      end;
   end;
end;

end.
