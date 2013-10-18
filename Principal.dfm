object frmInventario: TfrmInventario
  Left = 0
  Top = 0
  Caption = 'Inventario de Archivos (*.mp3)'
  ClientHeight = 444
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    413
    444)
  PixelsPerInch = 96
  TextHeight = 13
  object lblDirectorio: TLabel
    Left = 8
    Top = 11
    Width = 50
    Height = 13
    Caption = 'Directorio:'
  end
  object edtDirectorio: TEdit
    Left = 64
    Top = 8
    Width = 316
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 0
    ExplicitWidth = 350
  end
  object lsbArchivos: TListBox
    Left = 8
    Top = 35
    Width = 399
    Height = 401
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    PopupMenu = ppmArchivos
    TabOrder = 1
    ExplicitWidth = 433
    ExplicitHeight = 158
  end
  object btnAbrir: TButton
    Left = 386
    Top = 8
    Width = 21
    Height = 21
    Anchors = [akTop, akRight]
    Caption = '...'
    TabOrder = 2
    OnClick = btnAbrirClick
    ExplicitLeft = 420
  end
  object ppmArchivos: TPopupMenu
    Left = 32
    Top = 48
    object mniGuardarComo: TMenuItem
      Caption = 'Guardar como...'
      OnClick = mniGuardarComoClick
    end
  end
end
