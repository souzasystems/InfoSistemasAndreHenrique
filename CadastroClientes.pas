unit CadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroPadrao, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Clientes, Funcoes, DataMod, System.Contnrs, System.JSON, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdAntiFreezeBase, Vcl.IdAntiFreeze, IdMessage, IdSSLOpenSSL, IdText, IdAttachmentFile;

type
  TfmCadastroClientes = class(TfmCadastroPadrao)
    lblNomeRazaoSocial: TLabel;
    edtNome: TEdit;
    lbl5: TLabel;
    medtTelefone: TMaskEdit;
    lblIdentInscMunicipal: TLabel;
    edtIdentidade: TEdit;
    lblCPF_CNPJ: TLabel;
    medtCpf: TMaskEdit;
    lbl1: TLabel;
    edtEmail: TEdit;
    lbl8: TLabel;
    medtCep: TMaskEdit;
    lbl17: TLabel;
    edtLogradouro: TEdit;
    lbl10: TLabel;
    lbl12: TLabel;
    edtComplemento: TEdit;
    lbl13: TLabel;
    edtBairro: TEdit;
    lbl11: TLabel;
    edtCidade: TEdit;
    lbl7: TLabel;
    edtEstado: TEdit;
    edtPais: TEdit;
    lbl2: TLabel;
    edtNumero: TEdit;
    lbl3: TLabel;
    edtIdCliente: TEdit;
    dlgOpenXML: TOpenDialog;
    procedure medtCepExit(Sender: TObject);
    procedure edtIdClienteExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    objCliente: TClientes;
    procedure carregaDadosCep(objJSON: TJSONObject);
    procedure consultaCliente;
    procedure enviaEmailCliente;
  protected
    { Protected declarations }
    function  validaDados: Boolean; override;
    procedure carregaRegistro; override;
    procedure gravaRegistro; override;
    procedure excluiRegistro; override;
    procedure executaOpcao(opcaoSel: ShortString); override;
    procedure populaObjeto; override;
    procedure habilitaCampos(habilitar: Boolean); override;
    procedure limpaCampos; override;
  public
    { Public declarations }
  end;

var
  fmCadastroClientes: TfmCadastroClientes;

implementation

{$R *.dfm}

{ TfmCadastroClientes }

procedure TfmCadastroClientes.btnCancelarClick(Sender: TObject);
begin
   inherited;

   FreeAndNil(objCliente);
end;

procedure TfmCadastroClientes.carregaDadosCep(objJSON: TJSONObject);
begin
   edtLogradouro.Text  := objJSON.Get('logradouro').JsonValue.Value;
   edtComplemento.Text := objJSON.Get('complemento').JsonValue.Value;
   edtBairro.Text      := objJSON.Get('bairro').JsonValue.Value;
   edtCidade.Text      := objJSON.Get('localidade').JsonValue.Value;
   edtEstado.Text      := objJSON.Get('uf').JsonValue.Value;
   edtPais.Text        := 'BRASIL';
end;

procedure TfmCadastroClientes.carregaRegistro;
begin
   edtIdCliente.Text   := TFuncoes.strZero(objCliente.IdCliente, 05);
   edtNome.Text        := String(objCliente.Nome);
   edtIdentidade.Text  := String(objCliente.Identidade);
   medtCpf.Text        := String(objCliente.CPF);
   medtTelefone.Text   := String(objCliente.Telefone);
   edtEmail.Text       := String(objCliente.Email);
   medtCep.Text        := String(objCliente.Cep);
   edtLogradouro.Text  := String(objCliente.Logradouro);
   edtNumero.Text      := IntToStr(objCliente.Numero);
   edtComplemento.Text := String(objCliente.Complemento);
   edtBairro.Text      := String(objCliente.Bairro);
   edtCidade.Text      := String(objCliente.Cidade);
   edtEstado.Text      := String(objCliente.Estado);
   edtPais.Text        := String(objCliente.Pais);
end;

procedure TfmCadastroClientes.consultaCliente;
begin
   objCliente := Dm.consultaCliente(StrtoIntDef(edtIdCliente.Text, 00));

   if not(Assigned(objCliente)) then
   begin
      Application.MessageBox(PChar('O código do cliente informado não está cadastrado.' + #13 +
                                   'Por favor, verifique!'), 'Atenção', MB_ICONWARNING + MB_OK);

      edtIdCliente.Clear;
      edtIdCliente.SetFocus;
      Exit;
   end;

   carregaRegistro;
   habilitaCampos(False);
   habilitaBotoes(True);
end;

procedure TfmCadastroClientes.edtIdClienteExit(Sender: TObject);
begin
   if tecPress = 013 then
      consultaCliente;
end;

procedure TfmCadastroClientes.enviaEmailCliente;
var
   idMsg: TIdMessage;
   idText: TIdText;
   idSMTP: TIdSMTP;
   idSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
begin
   try
      //Configurando os parâmetros necessários para SSL
      IdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocket.SSLOptions.Mode   := sslmClient;

      //Dados pertinentes a mensagem a ser enviada
      idMsg              := TIdMessage.Create(Self);
      idMsg.CharSet      := 'utf-8';
      idMsg.Encoding     := meMIME;
      idMsg.From.Name    := 'Info Sistemas';
      idMsg.From.Address := 'ahenriqueps@yahoo.com';
      idMsg.Priority     := mpNormal;
      idMsg.Subject      := 'Confirmação de Cadastro';

      //Destinatário(s)
      idMsg.Recipients.Add;
      idMsg.Recipients.EMailAddresses := edtEmail.Text;

      //Corpo da mensagem
      idText             := TIdText.Create(idMsg.MessageParts);
      idText.ContentType := 'text/html; text/plain; charset=iso-8859-1';

      idText.Body.Add('Prezado(a) ' + String(objCliente.Nome));
      idText.Body.Add('segue em anexo o arquvio XML confirmando o seu cadastro em nosso sistema.');
      idText.Body.Add('Atenciosamente,');
      idText.Body.Add('André Henrique');

      //Anexando o arquivo XML
      dlgOpenXML.FileName := objCliente.toXML;
      TIdAttachmentFile.Create(idMsg.MessageParts, dlgOpenXML.FileName);

      //Configurando o servidor para envio da mensagem
      idSMTP           := TIdSMTP.Create(Self);
      idSMTP.IOHandler := IdSSLIOHandlerSocket;
      idSMTP.UseTLS    := utUseImplicitTLS;
      idSMTP.AuthType  := satDefault;
      idSMTP.Port      := 465;
      idSMTP.Host      := 'smtp.mail.yahoo.com';
      idSMTP.Username  := 'ahenriqueps@yahoo.com';
      idSMTP.Password  := 'Cr1sT0eD3u5';

      //Conectando e autenticando
      idSMTP.Connect;
      idSMTP.Authenticate;

      //Caso a conexão seja bem sucedida, a mensagem será enviada
      if idSMTP.Connected then
      begin
         try
            IdSMTP.Send(idMsg);
         except on E:Exception do
            begin
               Application.MessageBox(PChar('Houve um erro ao enviar o e-mail de confirmação de cadastro.' + #13 +
                                            'Motivo: ' + E.Message), 'Atenção', MB_ICONWARNING + MB_OK);
            end;
         end;
      end;

      //Desconectando do servidor SMTP.
      if idSMTP.Connected then
         idSMTP.Disconnect;

   finally
      UnLoadOpenSSLLibrary;
      FreeAndNil(idMsg);
      FreeAndNil(idSSLIOHandlerSocket);
      FreeAndNil(idSMTP);
   end;
end;

procedure TfmCadastroClientes.excluiRegistro;
begin
   if Application.MessageBox(PChar('Deseja realmente excluir o cliente ' + TFuncoes.strZero(objCliente.IdCliente, 05) + ' - ' + String(objCliente.Nome) + '?'),
                                   'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
   begin
      if not(Dm.excluiCliente(objCliente)) then
         Exit;

      limpaCampos;
      Application.MessageBox('Cliente excluído com sucesso!', 'Informação', MB_ICONINFORMATION + MB_OK);
   end;

   statMsg.Panels[00].Text := EmptyStr;
end;

procedure TfmCadastroClientes.executaOpcao(opcaoSel: ShortString);
begin
   inherited;

   case opcaoSel[01] of
   'I':
   begin
      objCliente := TClientes.Create;

      edtNome.SetFocus;
   end;
   'A':
   begin
      if StrToIntDef(edtIdCliente.Text, 00) = 00 then
      begin
         executaOpcao('C');
         Exit;
      end;

      habilitaCampos(True);
      habilitaBotoes(False);

      edtNome.SetFocus;
   end;
   'E':
   begin
      if StrToIntDef(edtIdCliente.Text, 00) = 00 then
      begin
         executaOpcao('C');
         Exit;
      end;

      excluiRegistro;
   end;
   'C':
   begin
      edtIdCliente.Enabled := True;

      edtIdCliente.SetFocus;
   end;
   end;
end;

procedure TfmCadastroClientes.FormDestroy(Sender: TObject);
begin
   FreeAndNil(objCliente);

   inherited;
end;

procedure TfmCadastroClientes.gravaRegistro;
begin
   inherited;

   case opcao[01] of
   'I':
   begin
      if not(Dm.insereCliente(objCliente)) then
         Exit;

      Application.MessageBox(PChar('Cliente incluído com sucesso.' + #13 + 'O ID gerado para o aluno é ' + TFuncoes.strZero(objCliente.IdCliente, 05) + '.'),
                                   'Informação', MB_ICONINFORMATION + MB_OK);

      enviaEmailCliente;
      executaOpcao('I');
   end;
   'A':
   begin
      if not(Dm.alteraCliente(objCliente)) then
         Exit;

      habilitaBotoes(True);
      habilitaCampos(False);
      Application.MessageBox('Alteração do cliente realizada com sucesso!', 'Informação', MB_ICONINFORMATION + MB_OK);

      statMsg.Panels[00].Text := 'CONSULTA';
   end;
   end;
end;

procedure TfmCadastroClientes.habilitaCampos(habilitar: Boolean);
begin
   edtIdCliente.Enabled   := False;
   edtNome.Enabled        := habilitar;
   edtIdentidade.Enabled  := habilitar;
   medtCpf.Enabled        := habilitar;
   medtTelefone.Enabled   := habilitar;
   edtEmail.Enabled       := habilitar;
   medtCep.Enabled        := habilitar;
   edtNumero.Enabled      := habilitar;
   edtComplemento.Enabled := habilitar;
end;

procedure TfmCadastroClientes.limpaCampos;
begin
   medtCpf.Clear;
   medtCep.Clear;
   edtPais.Clear;
   edtNome.Clear;
   edtEmail.Clear;
   edtNumero.Clear;
   edtBairro.Clear;
   edtCidade.Clear;
   edtEstado.Clear;
   edtIdCliente.Clear;
   medtTelefone.Clear;
   edtLogradouro.Clear;
   edtIdentidade.Clear;
   edtComplemento.Clear;
end;

procedure TfmCadastroClientes.medtCepExit(Sender: TObject);
var
   objJSON: TJSONObject;
begin
   if tecPress = 013 then
   begin
      if Trim(medtCep.Text) = EmptyStr then
      begin
         Application.MessageBox(PChar('O número do CEP não pode ficar em branco.' + #13 +
                                      'Por favor, verifique!'), 'Atenção', MB_ICONWARNING + MB_OK);

         medtCep.SetFocus;
         Exit;
      end;

      if Length(medtCep.Text) <> 08 then
      begin
         Application.MessageBox(PChar('O número do CEP informado é inválido.' + #13 +
                                      'Por favor, verifique!'), 'Atenção', MB_ICONWARNING + MB_OK);

         medtCep.SetFocus;
         Exit;
      end;

      objJSON := TFuncoes.consultaCep(ShortString(medtCep.Text));

      if not(Assigned(objJSON)) then
      begin
         Application.MessageBox(PChar('O número do CEP informado não foi encontrado ou é inválido.' + #13 +
                                      'Por favor, verifique!'), 'Atenção', MB_ICONWARNING + MB_OK);

         medtCep.SetFocus;
         Exit;
      end;

      carregaDadosCep(objJSON);
      edtNumero.SetFocus;

      FreeAndNil(objJSON);
   end;
end;

procedure TfmCadastroClientes.populaObjeto;
begin
   objCliente.IdCliente   := StrToIntDef(edtIdCliente.Text, 00);
   objCliente.Nome        := ShortString(edtNome.Text);
   objCliente.Identidade  := ShortString(edtIdentidade.Text);
   objCliente.CPF         := ShortString(medtCpf.Text);
   objCliente.Telefone    := ShortString(medtTelefone.Text);
   objCliente.Email       := ShortString(edtEmail.Text);
   objCliente.Cep         := ShortString(medtCep.Text);
   objCliente.Logradouro  := ShortString(edtLogradouro.Text);
   objCliente.Numero      := StrToIntDef(edtNumero.Text, 00);
   objCliente.Complemento := ShortString(edtComplemento.Text);
   objCliente.Bairro      := ShortString(edtBairro.Text);
   objCliente.Cidade      := ShortString(edtCidade.Text);
   objCliente.Estado      := ShortString(edtEstado.Text);
   objCliente.Pais        := ShortString(edtPais.Text);
end;

function TfmCadastroClientes.validaDados: Boolean;
begin
   Result := False;

   if Trim(edtNome.Text) = EmptyStr then
   begin
      Application.MessageBox(PChar('O nome do cliente não pode ficar em branco.' + #13 +
                                   'Por favor, verifique!'), 'Atenção', MB_ICONWARNING + MB_OK);

      edtNome.SetFocus;
      Exit;
   end;

   if Trim(edtEmail.Text) = EmptyStr then
   begin
      Application.MessageBox(PChar('O e-mail do cliente não pode ficar em branco.' + #13 +
                                   'Por favor, verifique!'), 'Atenção', MB_ICONWARNING + MB_OK);

      edtEmail.SetFocus;
      Exit;
   end;

   Result := True;
end;

end.
