unit UmenuImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFmenuImprime = class(TForm)
    RadioGroup1: TRadioGroup;
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    procedure abreFiltro_brasil();
    procedure abreFiltro_UF();
    procedure abreFiltro();
    procedure abreMenuMapas();
    procedure menuTabelas();
  public
    { Public declarations }
  end;

var
  FmenuImprime: TFmenuImprime;

implementation

uses Ufiltro, Uprincipal, UimprimiTabelas;

{$R *.dfm}

procedure TFmenuImprime.abreFiltro_brasil();
begin
    FFiltro:=TFFiltro.create(self);
    FFiltro.GroupBox2.Visible:=false;
    FFiltro.Height:=150;
    FFiltro.tipo_relatorio:=3;
    FFiltro.showmodal;
    FFiltro.free;
end;

procedure TFmenuImprime.abreFiltro_UF();
begin
  if uppercase(form1.cbuf.DisplayValue) <> UpperCase('Brasil') then
  begin
    FFiltro:=TFFiltro.create(self);
    FFiltro.GroupBox2.Visible:=false;
    FFiltro.Height:=150;
    FFiltro.tipo_relatorio:=2;
    FFiltro.showmodal;
    FFiltro.free;
  end
  else
  begin
    showmessage('Selecione uma UF no menu anterior');
  end;
end;

procedure TFmenuImprime.abreFiltro();
begin
  if uppercase(form1.cbuf.DisplayValue) <> UpperCase('Brasil') then
  begin
    FFiltro:=TFFiltro.create(self);
    FFiltro.GroupBox2.Visible:=false;
    FFiltro.Height:=150;
    FFiltro.tipo_relatorio:=1;
    FFiltro.showmodal;
    FFiltro.free;
  end
  else
  begin
    showmessage('Selecione uma UF no menu anterior');
  end;
end;

procedure TFmenuImprime.abreMenuMapas();
begin
    FFiltro:=TFFiltro.create(self);
    FFiltro.GroupBox1.Visible:=false;
    FFiltro.Height:=440;
    FFiltro.showmodal;
    FFiltro.free;
end;

procedure TFmenuImprime.menuTabelas();
begin
  FImprimiTabelas:=TFImprimiTabelas.create(self);
  FImprimiTabelas.showmodal;
  FImprimiTabelas.free;
end;


procedure TFmenuImprime.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0:abreFiltro_Brasil();
    1:abreFiltro_UF();
    2:abreFiltro();
    3:abreMenuMapas();
    4:menuTabelas();
  end;
  RadioGroup1.ItemIndex:=-1;
end;

end.
