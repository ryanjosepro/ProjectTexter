program ProjectTexter;

uses
  Vcl.Forms,
  ViewMain in 'ViewMain.pas' {WindowMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TWindowMain, WindowMain);
  Application.Run;
end.
