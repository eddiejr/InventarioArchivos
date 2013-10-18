program InventarioArchivos;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {frmInventario},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Inventario de Archivos (*.mp3)';
  TStyleManager.TrySetStyle('Lavender Classico');
  Application.CreateForm(TfrmInventario, frmInventario);
  Application.Run;
end.
