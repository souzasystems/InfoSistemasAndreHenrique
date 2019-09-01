unit CadastroPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Padrao, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfmCadastroPadrao = class(TFPadrao)
    pgc1: TPageControl;
    tsDados: TTabSheet;
    pnlDados: TPanel;
    grp1: TGroupBox;
    btnIncluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnConsultar: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  protected
    { Protected declarations }
    opcao: String[01];
    function  validaDados: Boolean; virtual;
    procedure carregaRegistro; virtual;
    procedure gravaRegistro; virtual;
    procedure excluiRegistro; virtual;
    procedure executaOpcao(opcaoSel: ShortString); virtual;
    procedure populaObjeto; virtual;
    procedure habilitaCampos(habilitar: Boolean); virtual;
    procedure habilitaBotoes(habilitar: Boolean); virtual;
    procedure limpaCampos; virtual;
    procedure preencheComboBox; virtual;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TfmCadastroPadrao }

procedure TfmCadastroPadrao.btnAlterarClick(Sender: TObject);
begin
   executaOpcao('A');
end;

procedure TfmCadastroPadrao.btnCancelarClick(Sender: TObject);
begin
   opcao                   := ShortString(EmptyStr);
   statMsg.Panels[00].Text := EmptyStr;

   habilitaCampos(False);
   habilitaBotoes(True);
   limpaCampos;
end;

procedure TfmCadastroPadrao.btnConsultarClick(Sender: TObject);
begin
   executaOpcao('C');
end;

procedure TfmCadastroPadrao.btnExcluirClick(Sender: TObject);
begin
   executaOpcao('E');
end;

procedure TfmCadastroPadrao.btnGravarClick(Sender: TObject);
begin
   if not(validaDados) then
      Exit;

   gravaRegistro;
end;

procedure TfmCadastroPadrao.btnIncluirClick(Sender: TObject);
begin
   executaOpcao('I');
end;

procedure TfmCadastroPadrao.carregaRegistro;
begin

end;

procedure TfmCadastroPadrao.excluiRegistro;
begin

end;

procedure TfmCadastroPadrao.executaOpcao(opcaoSel: ShortString);
begin
   case opcaoSel[01] of
   'I':
      begin
      opcao                   := 'I';
      statMsg.Panels[00].Text := 'INCLUSÃO';

      Application.ProcessMessages;
      habilitaCampos(True);
      habilitaBotoes(False);
      limpaCampos;
   end;
   'A':
      begin
      opcao                   := 'A';
      statMsg.Panels[00].Text := 'ALTERAÇÃO';

      Application.ProcessMessages;
      Self.Refresh;
   end;
   'E':
      begin
      opcao                   := 'E';
      statMsg.Panels[00].Text := 'EXCLUSÃO';

      Application.ProcessMessages;
   end;
   'C':
      begin
      opcao                   := 'C';
      statMsg.Panels[00].Text := 'CONSULTA';
      btnGravar.Enabled       := False;

      Application.ProcessMessages;
      limpaCampos;
      habilitaCampos(False);
      habilitaBotoes(False);
   end;
   'P':
      begin
      opcao                   := 'P';
      statMsg.Panels[00].Text := 'PESQUISA';

      Application.ProcessMessages;
   end;
   'R':
   begin
      opcao                   := 'R';
      statMsg.Panels[00].Text := 'RELATÓRIO';

      Application.ProcessMessages;
   end;
   end;
end;

procedure TfmCadastroPadrao.FormCreate(Sender: TObject);
begin
   habilitaCampos(False);
   habilitaBotoes(True);
   preencheComboBox;
end;

procedure TfmCadastroPadrao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;

   case Key of
   113: //F2.
      if btnIncluir.Enabled then
         btnIncluir.Click;
   114: //F3.
      if btnAlterar.Enabled then
         btnAlterar.Click;
   115: //F4.
      if btnExcluir.Enabled then
         btnExcluir.Click;
   116: //F5.
      if btnConsultar.Enabled then
         btnConsultar.Click;
   119: //F8
      if btnGravar.Enabled then
         btnGravar.Click;
   027: //ESC
      if btnCancelar.Enabled then
         btnCancelar.Click;
   end;
end;

procedure TfmCadastroPadrao.gravaRegistro;
begin
   populaObjeto;
end;

procedure TfmCadastroPadrao.habilitaBotoes(habilitar: Boolean);
begin
   btnIncluir.Enabled   := habilitar;
   btnAlterar.Enabled   := habilitar;
   btnExcluir.Enabled   := habilitar;
   btnConsultar.Enabled := habilitar;
   btnGravar.Enabled    := not(habilitar);
   btnCancelar.Enabled  := not(habilitar);
end;

procedure TfmCadastroPadrao.habilitaCampos(habilitar: Boolean);
begin

end;

procedure TfmCadastroPadrao.limpaCampos;
begin

end;

procedure TfmCadastroPadrao.populaObjeto;
begin

end;

procedure TfmCadastroPadrao.preencheComboBox;
begin

end;

function TfmCadastroPadrao.validaDados: Boolean;
begin
   Result := True;
end;

end.
