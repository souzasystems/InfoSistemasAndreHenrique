unit Clientes;

interface

uses
   System.SysUtils, System.Classes, Vcl.Forms;

type
   TClientes = class
   private
      FIdCliente: Integer;
      FNome: String[80];
      FIdentidade: String[20];
      FCPF: String[11];
      FTelefone: String[11];
      FEmail: String[80];
      FCep: String[08];
      FLogradouro: String[80];
      FNumero: Integer;
      FComplemento: String[25];
      FBairro: String[70];
      FCidade: String[60];
      FEstado: String[02];
      FPais: String[50];
   protected
      function  getIdCliente: Integer;
      function  getNome: ShortString;
      function  getIdentidade: ShortString;
      function  getCPF: ShortString;
      function  getTelefone: ShortString;
      function  getEmail: ShortString;
      function  getCep: ShortString;
      function  getLogradouro: ShortString;
      function  getNumero: Integer;
      function  getComplemento: ShortString;
      function  getBairro: ShortString;
      function  getCidade: ShortString;
      function  getEstado: ShortString;
      function  getPais: ShortString;
      function  getXML: String;
      procedure setIdCliente(const Value: Integer);
      procedure setNome(const Value: ShortString);
      procedure setIdentidade(const Value: ShortString);
      procedure setCPF(const Value: ShortString);
      procedure setTelefone(const Value: ShortString);
      procedure setEmail(const Value: ShortString);
      procedure setCep(const Value: ShortString);
      procedure setLogradouro(const Value: ShortString);
      procedure setNumero(const Value: Integer);
      procedure setComplemento(const Value: ShortString);
      procedure setBairro(const Value: ShortString);
      procedure setCidade(const Value: ShortString);
      procedure setEstado(const Value: ShortString);
      procedure setPais(const Value: ShortString);
   public
      constructor Create;
      destructor Destroy; override;

      property IdCliente: Integer       read getIdCliente   write setIdCliente;
      property Nome: ShortString        read getNome        write setNome;
      property Identidade: ShortString  read getIdentidade  write setIdentidade;
      property CPF: ShortString         read getCPF         write setCPF;
      property Telefone: ShortString    read getTelefone    write setTelefone;
      property Email: ShortString       read getEmail       write setEmail;
      property Cep: ShortString         read getCep         write setCep;
      property Logradouro: ShortString  read getLogradouro  write setLogradouro;
      property Numero: Integer          read getNumero      write setNumero;
      property Complemento: ShortString read getComplemento write setComplemento;
      property Bairro: ShortString      read getBairro      write setBairro;
      property Cidade: ShortString      read getCidade      write setCidade;
      property Estado: ShortString      read getEstado      write setEstado;
      property Pais: ShortString        read getPais        write setPais;
      property toXML: String            read getXML;
   end;

implementation

{ TClientes }

constructor TClientes.Create;
begin
   inherited Create;

end;

destructor TClientes.Destroy;
begin

   inherited;
end;

function TClientes.getBairro: ShortString;
begin
   Result := FBairro;
end;

function TClientes.getCep: ShortString;
begin
   Result := FCep;
end;

function TClientes.getCidade: ShortString;
begin
   Result := FCidade;
end;

function TClientes.getComplemento: ShortString;
begin
   Result := FComplemento;
end;

function TClientes.getCPF: ShortString;
begin
   Result := FCPF;
end;

function TClientes.getEmail: ShortString;
begin
   Result := FEmail;
end;

function TClientes.getEstado: ShortString;
begin
   Result := FEstado;
end;

function TClientes.getIdCliente: Integer;
begin
   Result := FIdCliente;
end;

function TClientes.getIdentidade: ShortString;
begin
   Result := FIdentidade;
end;

function TClientes.getLogradouro: ShortString;
begin
   Result := FLogradouro;
end;

function TClientes.getNome: ShortString;
begin
   Result := FNome;
end;

function TClientes.getNumero: Integer;
begin
   Result := FNumero;
end;

function TClientes.getPais: ShortString;
begin
   Result := FPais;
end;

function TClientes.getTelefone: ShortString;
begin
   Result := FTelefone;
end;

procedure TClientes.setBairro(const Value: ShortString);
begin
   FBairro := Value;
end;

procedure TClientes.setCep(const Value: ShortString);
begin
   FCep := Value;
end;

procedure TClientes.setCidade(const Value: ShortString);
begin
   FCidade := Value;
end;

procedure TClientes.setComplemento(const Value: ShortString);
begin
   FComplemento := Value;
end;

procedure TClientes.setCPF(const Value: ShortString);
begin
   FCPF := Value;
end;

procedure TClientes.setEmail(const Value: ShortString);
begin
   FEmail := Value;
end;

procedure TClientes.setEstado(const Value: ShortString);
begin
   FEstado := Value;
end;

procedure TClientes.setIdCliente(const Value: Integer);
begin
   FIdCliente := Value;
end;

procedure TClientes.setIdentidade(const Value: ShortString);
begin
   FIdentidade := Value;
end;

procedure TClientes.setLogradouro(const Value: ShortString);
begin
   FLogradouro := Value;
end;

procedure TClientes.setNome(const Value: ShortString);
begin
   FNome := Value;
end;

procedure TClientes.setNumero(const Value: Integer);
begin
   FNumero := Value;
end;

procedure TClientes.setPais(const Value: ShortString);
begin
   FPais := Value;
end;

procedure TClientes.setTelefone(const Value: ShortString);
begin
   FTelefone := Value;
end;

function TClientes.getXML: String;
var
   strList: TStringList;
begin
   strList := TStringList.Create;

   if FileExists(ExtractFilePath(Application.ExeName) + 'Clientes.xml') then
      DeleteFile(ExtractFilePath(Application.ExeName) + 'Clientes.xml');

   strList.Add('<?xml version="1.0">');
   strList.Add('<clientes>');
   strList.Add('   <cliente idCliente=' + IntToStr(FIdCliente) + '>');
   strList.Add('      <nome>' + String(FNome) + '</nome>');
   strList.Add('      <identidade>' + String(FIdentidade) + '</identidade>');
   strList.Add('      <cpf>' + String(FCPF) + '</cpf>');
   strList.Add('      <telefone>' + String(FTelefone) + '</telefone>');
   strList.Add('      <email>' + String(FEmail) + '</email>');
   strList.Add('      <cep>' + String(FCep) + '</cep>');
   strList.Add('      <logradouro>' + String(FLogradouro) + '</logradouro>');
   strList.Add('      <numero>' + IntToStr(FNumero) + '</numero>');
   strList.Add('      <complemento>' + String(FComplemento) + '</complemento>');
   strList.Add('      <bairro>' + String(FBairro) + '</bairro>');
   strList.Add('      <cidade>' + String(FCidade) + '</cidade>');
   strList.Add('      <estado>' + String(FEstado) + '</estado>');
   strList.Add('      <pais>' + String(FPais) + '</pais>');
   strList.Add('   </cliente>');
   strList.Add('</clientes>');

   strList.SaveToFile(ExtractFilePath(Application.ExeName) + 'Clientes.xml');
   FreeAndNil(strList);

   Result := ExtractFilePath(Application.ExeName) + 'Clientes.xml';
end;

end.
