program ISEB;

uses
  Forms,
  Uprincipal in 'Uprincipal.pas' {Form1},
  Udm in 'Udm.pas' {DM: TDataModule},
  Ugrafico in 'Ugrafico.pas' {Fgraficos},
  Usplash in 'Usplash.pas' {FSplash},
  GridUnit in 'GridUnit.pas' {FormGrid},
  Ufaixas in 'Ufaixas.pas' {FFaixas},
  Usobre in 'Usobre.pas' {Fsobre},
  UmenuImp in 'UmenuImp.pas' {FmenuImp};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFSplash, FSplash);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
