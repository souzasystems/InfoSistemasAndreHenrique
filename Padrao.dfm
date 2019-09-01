object FPadrao: TFPadrao
  Left = 192
  Top = 123
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FPadrao'
  ClientHeight = 408
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object statMsg: TStatusBar
    Left = 0
    Top = 389
    Width = 733
    Height = 19
    Panels = <
      item
        Width = 450
      end
      item
        Width = 50
      end>
  end
end
