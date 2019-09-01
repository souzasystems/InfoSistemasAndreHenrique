unit Padrao;

interface

uses System.Classes, Vcl.Controls, Vcl.ComCtrls, Vcl.Forms, Winapi.Messages, Winapi.Windows;

type
  TFPadrao = class(TForm)
    statMsg: TStatusBar;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  protected
    { Protected declarations }
    tecPress: Word;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFPadrao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   tecPress := Key;

   case tecPress of
   013:
      Perform(WM_NEXTDLGCTL, 00, 00);
   end;
end;

procedure TFPadrao.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   tecPress := VK_CLEAR;
end;

end.
