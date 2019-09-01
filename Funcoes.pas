unit Funcoes;

interface

uses
   System.SysUtils, Vcl.Forms, System.Contnrs, IdHashMessageDigest, Winapi.Windows, System.JSON, Data.DBXJSON, DBXJSONReflect, idHTTP, IdSSLOpenSSL, System.Classes;

type
   TFuncoes = class
   public
      class function  strZero(campoStr: String; quantZeros: Byte): String; overload;
      class function  strZero(campoInt: Integer; quantZeros: Byte): String; overload;
      class function  consultaCep(numeroCep: ShortString): TJSONObject;
      class procedure criaForm(nomeForm: TForm; classForm: TFormClass); virtual;
   end;

implementation

{ TFuncoes }

class function TFuncoes.consultaCep(numeroCep: ShortString): TJSONObject;
var
   HTTP: TIdHTTP;
   IDSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
   Response: TStringStream;
begin
   Result         := nil;
   HTTP           := TIdHTTP.Create;
   IDSSLHandler   := TIdSSLIOHandlerSocketOpenSSL.Create;
   HTTP.IOHandler := IDSSLHandler;
   Response       := TStringStream.Create(EmptyStr);

   try
      HTTP.Get('https://viacep.com.br/ws/' + String(numeroCep) + '/json', Response);

      if (HTTP.ResponseCode = 200) and not(Utf8ToAnsi(AnsiString(Response.DataString)) = '{'#$A'  "erro": true'#$A'}') then
         Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(Utf8ToAnsi(AnsiString(Response.DataString))), 00) as TJSONObject;
   finally
      FreeAndNil(HTTP);
      FreeAndNil(IDSSLHandler);
      Response.Destroy;
   end;
end;

class procedure TFuncoes.criaForm(nomeForm: TForm; classForm: TFormClass);
begin
   nomeForm := classForm.Create(nil);

   try
      nomeForm.ShowModal;
   finally
      nomeForm.Release;
      FreeAndNil(nomeForm);
   end;
end;

class function TFuncoes.strZero(campoStr: string; quantZeros: Byte): String;
begin
   Result     := Trim(campoStr);
   quantZeros := quantZeros - Length(campoStr);

   if quantZeros > 00 then
      Result := StringOfChar('0', quantZeros) + Result;
end;

class function TFuncoes.strZero(campoInt: Integer; quantZeros: Byte): String;
begin
   Result := strZero(IntToStr(campoInt), quantZeros);
end;

end.
