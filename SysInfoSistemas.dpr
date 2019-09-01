program SysInfoSistemas;

uses
  Vcl.Forms,
  Padrao in 'Padrao.pas' {FPadrao},
  CadastroPadrao in 'CadastroPadrao.pas' {fmCadastroPadrao},
  CadastroClientes in 'CadastroClientes.pas' {fmCadastroClientes},
  Clientes in 'Clientes.pas',
  DataMod in 'DataMod.pas' {Dm: TDataModule},
  Funcoes in 'Funcoes.pas';

{$R *.res}

begin
   ReportMemoryLeaksOnShutdown := True;

   Application.Initialize;
   Application.MainFormOnTaskbar := True;
   Application.CreateForm(TDm, Dm);
   Application.CreateForm(TfmCadastroClientes, fmCadastroClientes);
   Application.Run;
end.
