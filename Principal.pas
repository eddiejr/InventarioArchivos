unit Principal;

interface

uses
  Vcl.Forms, Vcl.Menus, Vcl.StdCtrls, Vcl.Controls, System.Classes;

type
  TfrmInventario = class(TForm)
    lblDirectorio: TLabel;
    edtDirectorio: TEdit;
    lsbArchivos: TListBox;
    btnAbrir: TButton;
    ppmArchivos: TPopupMenu;
    mniGuardarComo: TMenuItem;
    procedure btnAbrirClick(Sender: TObject);
    procedure mniGuardarComoClick(Sender: TObject);
  private
    procedure RealizaInventario;
    procedure ProcesaDirectorio(Directorio: string;
      Desplazamiento: Integer = 1);
  end;

var
  frmInventario: TfrmInventario;

implementation

{$R *.dfm}

uses
  System.SysUtils, Vcl.Dialogs, Vcl.FileCtrl;

procedure TfrmInventario.btnAbrirClick(Sender: TObject);
var
  Directorio: string;
begin
  Directorio := edtDirectorio.Text;
  if SelectDirectory('Seleccione la carpeta de música', '', Directorio) then
  begin
    edtDirectorio.Text := IncludeTrailingPathDelimiter(Directorio);

    RealizaInventario;
  end;
end;

procedure TfrmInventario.mniGuardarComoClick(Sender: TObject);
begin
  with TSaveDialog.Create(Self) do
    try
      DefaultExt := '.txt';
      Filter := 'Archivos de texto (*.txt)|*.txt';
      if Execute then
        lsbArchivos.Items.SaveToFile(FileName);
    finally
      Free;
    end;
end;

procedure TfrmInventario.ProcesaDirectorio(Directorio: string;
  Desplazamiento: Integer);
var
  F: TSearchRec;
begin
  if FindFirst(Directorio + '*', faAnyfile, F) = 0 then
  begin
    repeat
      if (F.Attr and faDirectory) = faDirectory then
      begin
        if (F.Name <> '.') and (F.Name <> '..') then
        begin
          lsbArchivos.AddItem(StringOfChar('-', Desplazamiento * 3) + ' ' + F.Name, nil);
          ProcesaDirectorio(Directorio + F.Name + '\', Desplazamiento + 1);
        end;
      end
      else
        if ExtractFileExt(F.Name) = '.mp3' then
        begin
          lsbArchivos.AddItem(StringOfChar(' ', Desplazamiento * 3) + F.Name, nil);

          Application.ProcessMessages;
        end;
    until FindNext(F) <> 0;
    FindClose(F);
  end;
end;

procedure TfrmInventario.RealizaInventario;
begin
  lsbArchivos.Clear;

  ProcesaDirectorio(edtDirectorio.Text);
end;

end.
