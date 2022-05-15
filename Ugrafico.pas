unit Ugrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeEngine, Series, TeeProcs, Chart, Grids, DBGrids,
  CRGrid, StdCtrls, Menus, ComCtrls;

type
  TFgraficos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    Imprimir1: TMenuItem;
    Copiar1: TMenuItem;
    Demografia1: TMenuItem;
    Demografia2: TMenuItem;
    IDH1: TMenuItem;
    IDH2: TMenuItem;
    IDI1: TMenuItem;
    IDI2: TMenuItem;
    axas1: TMenuItem;
    axas2: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    grafico1: TChart;
    Series1: TBarSeries;
    TabSheet2: TTabSheet;
    grafico2: TChart;
    BarSeries1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    TabSheet3: TTabSheet;
    grafico3: TChart;
    BarSeries2: TBarSeries;
    BarSeries3: TBarSeries;
    BarSeries4: TBarSeries;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    axasdedistoro1: TMenuItem;
    Matriculas20041: TMenuItem;
    Urbana1: TMenuItem;
    Rural1: TMenuItem;
    otal1: TMenuItem;
    Matriculas20042: TMenuItem;
    otal2: TMenuItem;
    Rural2: TMenuItem;
    Urbana2: TMenuItem;
    axasdedistoro2: TMenuItem;
    Matriculas20043: TMenuItem;
    otal3: TMenuItem;
    Rural3: TMenuItem;
    Urbana3: TMenuItem;
    Matriculas20051: TMenuItem;
    otal4: TMenuItem;
    Rural4: TMenuItem;
    Urbana4: TMenuItem;
    PageControl4: TPageControl;
    TabSheet14: TTabSheet;
    grafico4: TChart;
    BarSeries5: TBarSeries;
    BarSeries6: TBarSeries;
    BarSeries7: TBarSeries;
    TabSheet15: TTabSheet;
    grafico12: TChart;
    BarSeries17: TBarSeries;
    BarSeries18: TBarSeries;
    BarSeries19: TBarSeries;
    PageControl5: TPageControl;
    TabSheet16: TTabSheet;
    TabSheet17: TTabSheet;
    grafico5: TChart;
    BarSeries8: TBarSeries;
    BarSeries9: TBarSeries;
    BarSeries10: TBarSeries;
    grafico13: TChart;
    BarSeries20: TBarSeries;
    BarSeries21: TBarSeries;
    BarSeries22: TBarSeries;
    PageControl2: TPageControl;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    PageControl6: TPageControl;
    TabSheet9: TTabSheet;
    grafico6: TChart;
    BarSeries11: TBarSeries;
    TabSheet18: TTabSheet;
    grafico7: TChart;
    BarSeries12: TBarSeries;
    TabSheet19: TTabSheet;
    grafico8: TChart;
    BarSeries13: TBarSeries;
    PageControl3: TPageControl;
    TabSheet11: TTabSheet;
    grafico9: TChart;
    BarSeries14: TBarSeries;
    TabSheet12: TTabSheet;
    grafico10: TChart;
    BarSeries15: TBarSeries;
    TabSheet13: TTabSheet;
    grafico11: TChart;
    BarSeries16: TBarSeries;
    TabSheet10: TTabSheet;
    PageControl7: TPageControl;
    TabSheet20: TTabSheet;
    TabSheet21: TTabSheet;
    PageControl8: TPageControl;
    TabSheet22: TTabSheet;
    TabSheet23: TTabSheet;
    TabSheet24: TTabSheet;
    grafico14: TChart;
    BarSeries23: TBarSeries;
    grafico15: TChart;
    BarSeries24: TBarSeries;
    grafico16: TChart;
    BarSeries25: TBarSeries;
    PageControl9: TPageControl;
    TabSheet25: TTabSheet;
    grafico17: TChart;
    BarSeries26: TBarSeries;
    TabSheet26: TTabSheet;
    grafico18: TChart;
    BarSeries27: TBarSeries;
    TabSheet27: TTabSheet;
    grafico19: TChart;
    BarSeries28: TBarSeries;
    TabSheet28: TTabSheet;
    N20041: TMenuItem;
    Estabelecimentos1: TMenuItem;
    N20042: TMenuItem;
    N20051: TMenuItem;
    N20043: TMenuItem;
    Urbana5: TMenuItem;
    Rural5: TMenuItem;
    otal5: TMenuItem;
    Urbana6: TMenuItem;
    Rural6: TMenuItem;
    otal6: TMenuItem;
    Estabelecimentos2: TMenuItem;
    N20044: TMenuItem;
    otal7: TMenuItem;
    Rural7: TMenuItem;
    Urbana7: TMenuItem;
    N20052: TMenuItem;
    otal8: TMenuItem;
    Rural8: TMenuItem;
    Urbana8: TMenuItem;
    PageControl10: TPageControl;
    TabSheet29: TTabSheet;
    TabSheet30: TTabSheet;
    grafico21: TChart;
    BarSeries29: TBarSeries;
    grafico20: TChart;
    BarSeries30: TBarSeries;
    Docentes1: TMenuItem;
    N20053: TMenuItem;
    N20045: TMenuItem;
    Docentes2: TMenuItem;
    N20046: TMenuItem;
    N20054: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Demografia1Click(Sender: TObject);
    procedure Demografia2Click(Sender: TObject);
    procedure IDH1Click(Sender: TObject);
    procedure IDH2Click(Sender: TObject);
    procedure IDI1Click(Sender: TObject);
    procedure IDI2Click(Sender: TObject);
    procedure axas1Click(Sender: TObject);
    procedure axas2Click(Sender: TObject);
    procedure axasdedistoro1Click(Sender: TObject);
    procedure Urbana1Click(Sender: TObject);
    procedure Rural1Click(Sender: TObject);
    procedure otal1Click(Sender: TObject);
    procedure Urbana2Click(Sender: TObject);
    procedure Rural2Click(Sender: TObject);
    procedure otal2Click(Sender: TObject);
    procedure axasdedistoro2Click(Sender: TObject);
    procedure Urbana3Click(Sender: TObject);
    procedure Rural3Click(Sender: TObject);
    procedure otal3Click(Sender: TObject);
    procedure Urbana4Click(Sender: TObject);
    procedure Rural4Click(Sender: TObject);
    procedure otal4Click(Sender: TObject);
    procedure Urbana5Click(Sender: TObject);
    procedure Rural5Click(Sender: TObject);
    procedure otal5Click(Sender: TObject);
    procedure Urbana6Click(Sender: TObject);
    procedure Rural6Click(Sender: TObject);
    procedure otal6Click(Sender: TObject);
    procedure Urbana8Click(Sender: TObject);
    procedure Rural8Click(Sender: TObject);
    procedure otal8Click(Sender: TObject);
    procedure Urbana7Click(Sender: TObject);
    procedure Rural7Click(Sender: TObject);
    procedure otal7Click(Sender: TObject);
    procedure N20053Click(Sender: TObject);
    procedure N20045Click(Sender: TObject);
    procedure N20054Click(Sender: TObject);
    procedure N20046Click(Sender: TObject);
  private
    { Private declarations }
    procedure montagrafico_1();
    procedure montagrafico_2();
    procedure montagrafico_3();
    procedure montagrafico_4();
    procedure montagrafico_5();
    procedure montaGrafico_6();
    procedure montaGrafico_7();
    procedure montaGrafico_8();
    procedure montaGrafico_9();
    procedure montaGrafico_10();
    procedure montaGrafico_11();
    procedure montaGrafico_12();
    procedure montagrafico_13();
    procedure montaGrafico_14();
    procedure montaGrafico_15();
    procedure montaGrafico_16();
    procedure montaGrafico_17();
    procedure montaGrafico_18();
    procedure montaGrafico_19();
    procedure montaGrafico_20();
    procedure montaGrafico_21();
  public
    { Public declarations }
  end;

var
  Fgraficos: TFgraficos;

const
cor: array[1..12] of tcolor = ($99FFFF ,$993300,$0066FF,$FF6633,$00CCFF, $FFCECC,$2100A5, $CC9900, $0000E0, $00FFFF, $FF9933, $004FC6);
corBrasil:Tcolor = $0066FF;
corMuni:Tcolor = $00CCFF;
corUF:Tcolor = $993333;
implementation

{$R *.dfm}

Uses UDM, Math;

procedure TFgraficos.montagrafico_1();
var TotalPopuEstado, TotalProjetaEstado:double;
begin
  Grafico1.Title.Text.add('População');
  Grafico1.Title.Text.add('Estado: '+label1.Caption);
  Grafico1.Title.Text.add('Município: '+Label4.Caption);

  if dm.qIndicaMuni.Active then dm.qIndicaMuni.Active:=false;
  dm.qIndicaMuni.params[0].asInteger:=1;
  dm.qIndicaMuni.params[1].asInteger:=1;
  dm.qIndicaMuni.params[2].asInteger:=2000;
  dm.qIndicaMuni.params[3].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qIndicaMuni.Active:=true;
  if dm.qIndicaMuni.Locate('ID_Item',131,[]) then //localiza o total
    grafico1.Series[0].AddY(dm.qIndicaMuniValor.asFloat,'Censo 2000',corMuni)
  else
    grafico1.Series[0].AddY(0,'Censo 2000',corMuni);


  if dm.qIndicaMuni.Active then dm.qIndicaMuni.Active:=false;
  dm.qIndicaMuni.params[0].asInteger:=1;
  dm.qIndicaMuni.params[1].asInteger:=31;
  dm.qIndicaMuni.params[2].asInteger:=2007;
  dm.qIndicaMuni.params[3].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qIndicaMuni.Active:=true;
  if dm.qIndicaMuni.Locate('ID_Item',131,[]) then
    grafico1.Series[0].AddY(dm.qIndicaMuniValor.asFloat,'Estimativa 2007',corMuni)
  else
    grafico1.Series[0].AddY(0,'Estimativa 2007',corMuni);


end;

procedure TFgraficos.montagrafico_2();
var IDHMuni, IDHUF, IDHBrasil:double;
U,I:Integer;
ano: Tstringlist;
begin
  Grafico2.Title.Text.add('IDH - Índice de Desenvolvimento Humano');
  Grafico2.Title.Text.add('Estado: '+label1.Caption);
  Grafico2.Title.Text.add('Município: '+Label4.Caption);
  ano := tstringlist.Create();
  ano.add('1991');
  ano.add('2000');

    for U:=0 to ano.Count-1 do
    begin
        if dm.qIndicaMuni.Active then dm.qIndicaMuni.Active:=false;
        dm.qIndicaMuni.params[0].asInteger:=2;
        dm.qIndicaMuni.params[1].asInteger:=4;
        dm.qIndicaMuni.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaMuni.params[3].asInteger:=dm.qCidadesID_localidade.asInteger;
        dm.qIndicaMuni.Active:=true;
        if dm.qIndicaMuni.RecordCount > 0 then
          grafico2.Series[0].AddY(dm.qIndicaMuniValor.asFloat,ano[u],corMuni)
        else
          grafico2.Series[0].AddY(0,ano[u],corMuni);

        if dm.qIndicaUF.Active then dm.qIndicaUF.Active:=false;
        dm.qIndicaUF.params[0].asInteger:=2;
        dm.qIndicaUF.params[1].asInteger:=4;
        dm.qIndicaUF.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaUF.params[3].asInteger:=dm.qUFID_Localidade.asInteger;
        dm.qIndicaUF.Active:=true;
        if dm.qIndicaUF.RecordCount > 0 then
          grafico2.Series[1].AddY(dm.qIndicaUFValor.asFloat,ano[u],corUF)
        else
          grafico2.Series[1].AddY(0,ano[u],corUF);

        if dm.qIndicaBrasil.Active then dm.qIndicaBrasil.Active:=false;
        dm.qIndicaBrasil.params[0].asInteger:=2;
        dm.qIndicaBrasil.params[1].asInteger:=4;
        dm.qIndicaBrasil.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaBrasil.Active:=true;
        if dm.qIndicaBrasil.RecordCount > 0 then
          grafico2.Series[2].AddY(dm.qIndicaBrasilValor.asFloat,ano[u],corBrasil)
        else
          grafico2.Series[2].AddY(0,ano[u],corBrasil);

  end;
  ano.free;
end;

procedure TFgraficos.montagrafico_3();
var IDHMuni, IDHUF, IDHBrasil:double;
U:Integer;
ano: Tstringlist;
begin
  Grafico3.Title.Text.add('IDI - Indice de Desenvolvimento Infantil');
  Grafico3.Title.Text.add('Estado: '+label1.Caption);
  Grafico3.Title.Text.add('Município: '+Label4.Caption);
  ano := tstringlist.Create();
  ano.add('1999');
  ano.add('2004');

    for U:=0 to ano.Count-1 do
    begin
        if dm.qIndicaMuni.Active then dm.qIndicaMuni.Active:=false;
        dm.qIndicaMuni.params[0].asInteger:=2;
        dm.qIndicaMuni.params[1].asInteger:=29;
        dm.qIndicaMuni.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaMuni.params[3].asInteger:=dm.qCidadesID_localidade.asInteger;
        dm.qIndicaMuni.Active:=true;
        if dm.qIndicaMuni.Locate('ID_Item',109,[]) then
          grafico3.Series[0].AddY(dm.qIndicaMuniValor.asFloat,ano[u],corMuni)
        else
          grafico3.Series[0].AddY(0,ano[u],corMuni);

        if dm.qIndicaUF.Active then dm.qIndicaUF.Active:=false;
        dm.qIndicaUF.params[0].asInteger:=2;
        dm.qIndicaUF.params[1].asInteger:=29;
        dm.qIndicaUF.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaUF.params[3].asInteger:=dm.qUFID_Localidade.asInteger;
        dm.qIndicaUF.Active:=true;
        if dm.qIndicaUF.Locate('ID_Item',109,[]) then
          grafico3.Series[1].AddY(dm.qIndicaUFValor.asFloat,ano[u],corUF)
        else
          grafico3.Series[1].AddY(0,ano[u],corUF);

        if dm.qIndicaBrasil.Active then dm.qIndicaBrasil.Active:=false;
        dm.qIndicaBrasil.params[0].asInteger:=2;
        dm.qIndicaBrasil.params[1].asInteger:=29;
        dm.qIndicaBrasil.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaBrasil.Active:=true;
        if dm.qIndicaUF.Locate('ID_Item',109,[]) then
          grafico3.Series[2].AddY(dm.qIndicaBrasilValor.asFloat,ano[u],corBrasil)
        else
          grafico3.Series[2].AddY(0,ano[u],corBrasil);

  end;
  ano.free;
end;

procedure TFgraficos.montagrafico_4();
var IDHMuni, IDHUF, IDHBrasil:double;
U, J:Integer;
ano,indicador, NomeIndi: Tstringlist;
begin
  Grafico4.Title.Text.add('Taxas de Rendimento');
  Grafico4.Title.Text.add('Estado: '+label1.Caption);
  Grafico4.Title.Text.add('Município: '+Label4.Caption);
  ano := tstringlist.Create();
  //ano.add('2004');
  ano.add('2005');

  indicador := TStringList.Create();
  //indicador.add('888');
  //indicador.add('894');
  indicador.add('877');
  indicador.add('878');
  indicador.add('879');
  indicador.add('880');
  indicador.add('881');
  indicador.add('882');

  NomeIndi := TStringList.create();
  //NomeIndi.add('Taxa Distorção idade série EF');
  //NomeIndi.add('Taxa Distorção idade série EM');
  NomeIndi.add('Taxa de aprovação EF');
  NomeIndi.add('Taxa de reprovação EF');
  NomeIndi.add('Taxa de abandono EF');
  NomeIndi.add('Taxa de aprovação EM');
  NomeIndi.add('Taxa de reprovação EM');
  NomeIndi.add('Taxa de abandono EM');




  for U:=0 to ano.Count-1 do
  begin
    for J:=0 to indicador.Count-1 do
      begin

        if dm.qIndicaMuni.Active then dm.qIndicaMuni.Active:=false;
        dm.qIndicaMuni.params[0].asInteger:=5;
        dm.qIndicaMuni.params[1].asInteger:=21;
        dm.qIndicaMuni.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaMuni.params[3].asInteger:=dm.qCidadesID_localidade.asInteger;
        dm.qIndicaMuni.Active:=true;
        if dm.qIndicaMuni.Locate('ID_Indicador',indicador[j],[]) then
          grafico4.Series[0].AddY(dm.qIndicaMuniValor.asFloat,NomeIndi[j])
        else
          grafico4.Series[0].AddY(0,NomeIndi[j]);


        if dm.qIndicaUF.Active then dm.qIndicaUF.Active:=false;
        dm.qIndicaUF.params[0].asInteger:=5;
        dm.qIndicaUF.params[1].asInteger:=21;
        dm.qIndicaUF.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaUF.params[3].asInteger:=dm.qUFID_Localidade.asInteger;
        dm.qIndicaUF.Active:=true;
        if dm.qIndicaUF.Locate('ID_Indicador',indicador[j],[]) then
          grafico4.Series[1].AddY(dm.qIndicaUFValor.asFloat,NomeIndi[j])
        else
          grafico4.Series[1].AddY(0,NomeIndi[j]);

        if dm.qIndicaBrasil.Active then dm.qIndicaBrasil.Active:=false;
        dm.qIndicaBrasil.params[0].asInteger:=5;
        dm.qIndicaBrasil.params[1].asInteger:=21;
        dm.qIndicaBrasil.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaBrasil.Active:=true;
        if dm.qIndicaBrasil.Locate('ID_Indicador',indicador[j],[]) then
          grafico4.Series[2].AddY(dm.qIndicaBrasilValor.asFloat,NomeIndi[j])
        else
          grafico4.Series[2].AddY(0,NomeIndi[j]);


      end;
    end;
  ano.Free;
  indicador.free;
end;

procedure TFgraficos.montaGrafico_12();
var IDHMuni, IDHUF, IDHBrasil:double;
U, J:Integer;
ano,indicador, NomeIndi: Tstringlist;
begin
  Grafico12.Title.Text.add('Taxas de Rendimento');
  Grafico12.Title.Text.add('Estado: '+label1.Caption);
  Grafico12.Title.Text.add('Município: '+Label4.Caption);
  ano := tstringlist.Create();

  ano.add('2004');

  indicador := TStringList.Create();
  //indicador.add('888');
  //indicador.add('894');
  indicador.add('877');
  indicador.add('878');
  indicador.add('879');
  indicador.add('880');
  indicador.add('881');
  indicador.add('882');

  NomeIndi := TStringList.create();
  //NomeIndi.add('Taxa Distorção idade série EF');
  //NomeIndi.add('Taxa Distorção idade série EM');
  NomeIndi.add('Taxa de aprovação EF');
  NomeIndi.add('Taxa de reprovação EF');
  NomeIndi.add('Taxa de abandono EF');
  NomeIndi.add('Taxa de aprovação EM');
  NomeIndi.add('Taxa de reprovação EM');
  NomeIndi.add('Taxa de abandono EM');




  for U:=0 to ano.Count-1 do
  begin
    for J:=0 to indicador.Count-1 do
      begin

        if dm.qIndicaMuni.Active then dm.qIndicaMuni.Active:=false;
        dm.qIndicaMuni.params[0].asInteger:=5;
        dm.qIndicaMuni.params[1].asInteger:=21;
        dm.qIndicaMuni.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaMuni.params[3].asInteger:=dm.qCidadesID_localidade.asInteger;
        dm.qIndicaMuni.Active:=true;
        if dm.qIndicaMuni.Locate('ID_Indicador',indicador[j],[]) then
          grafico12.Series[0].AddY(dm.qIndicaMuniValor.asFloat,NomeIndi[j])
        else
          grafico12.Series[0].AddY(0,NomeIndi[j]);


        if dm.qIndicaUF.Active then dm.qIndicaUF.Active:=false;
        dm.qIndicaUF.params[0].asInteger:=5;
        dm.qIndicaUF.params[1].asInteger:=21;
        dm.qIndicaUF.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaUF.params[3].asInteger:=dm.qUFID_Localidade.asInteger;
        dm.qIndicaUF.Active:=true;
        if dm.qIndicaUF.Locate('ID_Indicador',indicador[j],[]) then
          grafico12.Series[1].AddY(dm.qIndicaUFValor.asFloat,NomeIndi[j])
        else
          grafico12.Series[1].AddY(0,NomeIndi[j]);

        if dm.qIndicaBrasil.Active then dm.qIndicaBrasil.Active:=false;
        dm.qIndicaBrasil.params[0].asInteger:=5;
        dm.qIndicaBrasil.params[1].asInteger:=21;
        dm.qIndicaBrasil.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaBrasil.Active:=true;
        if dm.qIndicaBrasil.Locate('ID_Indicador',indicador[j],[]) then
          grafico12.Series[2].AddY(dm.qIndicaBrasilValor.asFloat,NomeIndi[j])
        else
          grafico12.Series[2].AddY(0,NomeIndi[j]);


      end;
    end;
  ano.Free;
  indicador.free;
end;

procedure TFgraficos.montagrafico_5();
var IDHMuni, IDHUF, IDHBrasil:double;
U, J:Integer;
ano,indicador, NomeIndi: Tstringlist;
begin
  Grafico5.Title.Text.add('Taxas de Distorção idade série');
  Grafico5.Title.Text.add('Estado: '+label1.Caption);
  Grafico5.Title.Text.add('Município: '+Label4.Caption);
  ano := tstringlist.Create();
  //ano.add('2004');
  ano.add('2005');

  indicador := TStringList.Create();
  indicador.add('888');
  indicador.add('894');
  ///indicador.add('877');
  ///indicador.add('878');
  ///indicador.add('879');
  ///indicador.add('880');
  ///indicador.add('881');
  ///indicador.add('882');

  NomeIndi := TStringList.create();
  NomeIndi.add('Taxa Distorção idade série EF');
  NomeIndi.add('Taxa Distorção idade série EM');
  ///NomeIndi.add('Taxa de aprovação EF');
  ///NomeIndi.add('Taxa de reprovação EF');
  ///NomeIndi.add('Taxa de abandono EF');
  ///NomeIndi.add('Taxa de aprovação EM');
  ///NomeIndi.add('Taxa de reprovação EM');
  ///NomeIndi.add('Taxa de abandono EM');




  for U:=0 to ano.Count-1 do
  begin
    for J:=0 to indicador.Count-1 do
      begin

        if dm.qIndicaMuni.Active then dm.qIndicaMuni.Active:=false;
        dm.qIndicaMuni.params[0].asInteger:=5;
        dm.qIndicaMuni.params[1].asInteger:=25;
        dm.qIndicaMuni.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaMuni.params[3].asInteger:=dm.qCidadesID_localidade.asInteger;
        dm.qIndicaMuni.Active:=true;
        if dm.qIndicaMuni.Locate('ID_Indicador',indicador[j],[]) then
          grafico5.Series[0].AddY(dm.qIndicaMuniValor.asFloat,NomeIndi[j])
        else
          grafico5.Series[0].AddY(0,NomeIndi[j]);


        if dm.qIndicaUF.Active then dm.qIndicaUF.Active:=false;
        dm.qIndicaUF.params[0].asInteger:=5;
        dm.qIndicaUF.params[1].asInteger:=25;
        dm.qIndicaUF.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaUF.params[3].asInteger:=dm.qUFID_Localidade.asInteger;
        dm.qIndicaUF.Active:=true;
        if dm.qIndicaUF.Locate('ID_Indicador',indicador[j],[]) then
          grafico5.Series[1].AddY(dm.qIndicaUFValor.asFloat,NomeIndi[j])
        else
          grafico5.Series[1].AddY(0,NomeIndi[j]);

        if dm.qIndicaBrasil.Active then dm.qIndicaBrasil.Active:=false;
        dm.qIndicaBrasil.params[0].asInteger:=5;
        dm.qIndicaBrasil.params[1].asInteger:=25;
        dm.qIndicaBrasil.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaBrasil.Active:=true;
        if dm.qIndicaBrasil.Locate('ID_Indicador',indicador[j],[]) then
          grafico5.Series[2].AddY(dm.qIndicaBrasilValor.asFloat,NomeIndi[j])
        else
          grafico5.Series[2].AddY(0,NomeIndi[j]);


      end;
    end;
  ano.Free;
  indicador.free;
end;

procedure TFgraficos.montagrafico_13();
var IDHMuni, IDHUF, IDHBrasil:double;
U, J:Integer;
ano,indicador, NomeIndi: Tstringlist;
begin
  Grafico13.Title.Text.add('Taxas de Distorção idade série');
  Grafico13.Title.Text.add('Estado: '+label1.Caption);
  Grafico13.Title.Text.add('Município: '+Label4.Caption);
  ano := tstringlist.Create();

  ano.add('2004');

  indicador := TStringList.Create();
  indicador.add('888');
  indicador.add('894');
  ///indicador.add('877');
  ///indicador.add('878');
  ///indicador.add('879');
  ///indicador.add('880');
  ///indicador.add('881');
  ///indicador.add('882');

  NomeIndi := TStringList.create();
  NomeIndi.add('Taxa Distorção idade série EF');
  NomeIndi.add('Taxa Distorção idade série EM');
  ///NomeIndi.add('Taxa de aprovação EF');
  ///NomeIndi.add('Taxa de reprovação EF');
  ///NomeIndi.add('Taxa de abandono EF');
  ///NomeIndi.add('Taxa de aprovação EM');
  ///NomeIndi.add('Taxa de reprovação EM');
  ///NomeIndi.add('Taxa de abandono EM');




  for U:=0 to ano.Count-1 do
  begin
    for J:=0 to indicador.Count-1 do
      begin

        if dm.qIndicaMuni.Active then dm.qIndicaMuni.Active:=false;
        dm.qIndicaMuni.params[0].asInteger:=5;
        dm.qIndicaMuni.params[1].asInteger:=25;
        dm.qIndicaMuni.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaMuni.params[3].asInteger:=dm.qCidadesID_localidade.asInteger;
        dm.qIndicaMuni.Active:=true;
        if dm.qIndicaMuni.Locate('ID_Indicador',indicador[j],[]) then
          Grafico13.Series[0].AddY(dm.qIndicaMuniValor.asFloat,NomeIndi[j])
        else
          Grafico13.Series[0].AddY(0,NomeIndi[j]);


        if dm.qIndicaUF.Active then dm.qIndicaUF.Active:=false;
        dm.qIndicaUF.params[0].asInteger:=5;
        dm.qIndicaUF.params[1].asInteger:=25;
        dm.qIndicaUF.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaUF.params[3].asInteger:=dm.qUFID_Localidade.asInteger;
        dm.qIndicaUF.Active:=true;
        if dm.qIndicaUF.Locate('ID_Indicador',indicador[j],[]) then
          Grafico13.Series[1].AddY(dm.qIndicaUFValor.asFloat,NomeIndi[j])
        else
          Grafico13.Series[1].AddY(0,NomeIndi[j]);

        if dm.qIndicaBrasil.Active then dm.qIndicaBrasil.Active:=false;
        dm.qIndicaBrasil.params[0].asInteger:=5;
        dm.qIndicaBrasil.params[1].asInteger:=25;
        dm.qIndicaBrasil.params[2].asInteger:=strtoint(ano[u]);
        dm.qIndicaBrasil.Active:=true;
        if dm.qIndicaBrasil.Locate('ID_Indicador',indicador[j],[]) then
          Grafico13.Series[2].AddY(dm.qIndicaBrasilValor.asFloat,NomeIndi[j])
        else
          Grafico13.Series[2].AddY(0,NomeIndi[j]);


      end;
    end;
  ano.Free;
  indicador.free;
end;



procedure TFgraficos.montaGrafico_6();
const tipo: array[1..10] of Integer=(52,53,57,58,59,60,61,62,112,121);
var
corX:Tcolor;
I,total:Integer;

begin
  Grafico6.Title.Text.add('Matrículas urbanas 2004');
  Grafico6.Title.Text.add('Estado: '+label1.Caption);
  Grafico6.Title.Text.add('Município: '+Label4.Caption);


  if dm.qMat.active then dm.qMat.active:=false;
  dm.qMat.Params[0].asInteger:=1; //Urbana
  dm.qMat.Params[1].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qMat.Params[2].asInteger:=2004;
  dm.qMat.active:=true;
  dm.qmat.first;
  total:=0;
  while not dm.qmat.Eof do
  begin
    for i:=1 to 10 do
    begin
      if tipo[i]=dm.qMatID_Item.asInteger then
      corX:=cor[i];
    end;
    grafico6.Series[0].AddY(dm.qMatTotal.asInteger,dm.qMatItem.asString,corx);
    total:=total+dm.qMatTotal.asInteger;
    dm.qmat.Next;
  end;

  grafico6.Series[0].AddY(Total,'Total',cor[11]);

end;

procedure TFgraficos.montaGrafico_7();
const tipo: array[1..10] of Integer=(52,53,57,58,59,60,61,62,112,121);
var
corX:Tcolor;
I,total:Integer;

begin
  Grafico7.Title.Text.add('Matrículas rurais 2004');
  Grafico7.Title.Text.add('Estado: '+label1.Caption);
  Grafico7.Title.Text.add('Município: '+Label4.Caption);


  if dm.qMat.active then dm.qMat.active:=false;
  dm.qMat.Params[0].asInteger:=2; //Rural
  dm.qMat.Params[1].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qMat.Params[2].asInteger:=2004;
  dm.qMat.active:=true;
  dm.qmat.first;
  total:=0;
  while not dm.qmat.Eof do
  begin
    for i:=1 to 10 do
    begin
      if tipo[i]=dm.qMatID_Item.asInteger then
      corX:=cor[i];
    end;
    grafico7.Series[0].AddY(dm.qMatTotal.asInteger,dm.qMatItem.asString,corx);
    total:=total+dm.qMatTotal.asInteger;
    dm.qmat.Next;
  end;

  grafico7.Series[0].AddY(Total,'Total',cor[11]);

end;


procedure TFgraficos.montaGrafico_8();
const tipo: array[1..10] of Integer=(52,53,57,58,59,60,61,62,112,121);
var
corX:Tcolor;
I,total:Integer;

begin
  Grafico8.Title.Text.add('Matrículas totais 2004');
  Grafico8.Title.Text.add('Estado: '+label1.Caption);
  Grafico8.Title.Text.add('Município: '+Label4.Caption);


  if dm.qMat_Total.active then dm.qMat_Total.active:=false;
  dm.qMat_Total.Params[0].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qMat_Total.Params[1].asInteger:=2004;
  dm.qMat_Total.active:=true;
  dm.qMat_Total.first;
  total:=0;
  while not dm.qMat_Total.Eof do
  begin
    for i:=1 to 10 do
    begin
      if tipo[i]=dm.qMat_TotalID_Item.asInteger then
      corX:=cor[i];
    end;
    grafico8.Series[0].AddY(dm.qMat_TotalTotal.asInteger,dm.qMat_TotalItem.asString,corx);
    total:=total+dm.qMat_TotalTotal.asInteger;
    dm.qMat_Total.Next;
  end;

  grafico8.Series[0].AddY(Total,'Total',cor[11]);

end;







procedure TFgraficos.montaGrafico_9();
const tipo: array[1..10] of Integer=(52,53,57,58,59,60,61,62,112,121);
var
corX:Tcolor;
I,total:Integer;

begin
  Grafico9.Title.Text.add('Matrículas urbanas 2005');
  Grafico9.Title.Text.add('Estado: '+label1.Caption);
  Grafico9.Title.Text.add('Município: '+Label4.Caption);


  if dm.qMat.active then dm.qMat.active:=false;
  dm.qMat.Params[0].asInteger:=1; //Urbana
  dm.qMat.Params[1].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qMat.Params[2].asInteger:=2005;
  dm.qMat.active:=true;
  dm.qmat.first;
  total:=0;
  while not dm.qmat.Eof do
  begin
    for i:=1 to 10 do
    begin
      if tipo[i]=dm.qMatID_Item.asInteger then
      corX:=cor[i];
    end;
    grafico9.Series[0].AddY(dm.qMatTotal.asInteger,dm.qMatItem.asString,corx);
    total:=total+dm.qMatTotal.asInteger;
    dm.qmat.Next;
  end;

  grafico9.Series[0].AddY(Total,'Total',cor[11]);

end;

procedure TFgraficos.montaGrafico_10();
const tipo: array[1..10] of Integer=(52,53,57,58,59,60,61,62,112,121);
var
corX:Tcolor;
I,total:Integer;

begin
  Grafico10.Title.Text.add('Matrículas rurais 2005');
  Grafico10.Title.Text.add('Estado: '+label1.Caption);
  Grafico10.Title.Text.add('Município: '+Label4.Caption);


  if dm.qMat.active then dm.qMat.active:=false;
  dm.qMat.Params[0].asInteger:=2; //Rural
  dm.qMat.Params[1].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qMat.Params[2].asInteger:=2005;
  dm.qMat.active:=true;
  dm.qmat.first;
  total:=0;
  while not dm.qmat.Eof do
  begin
    for i:=1 to 10 do
    begin
      if tipo[i]=dm.qMatID_Item.asInteger then
      corX:=cor[i];
    end;
    grafico10.Series[0].AddY(dm.qMatTotal.asInteger,dm.qMatItem.asString,corx);
    total:=total+dm.qMatTotal.asInteger;
    dm.qmat.Next;
  end;

  grafico10.Series[0].AddY(Total,'Total',cor[11]);

end;


procedure TFgraficos.montaGrafico_11();
const tipo: array[1..10] of Integer=(52,53,57,58,59,60,61,62,112,121);
var
corX:Tcolor;
I,total:Integer;

begin
  Grafico11.Title.Text.add('Matrículas totais 2005');
  Grafico11.Title.Text.add('Estado: '+label1.Caption);
  Grafico11.Title.Text.add('Município: '+Label4.Caption);


  if dm.qMat_Total.active then dm.qMat_Total.active:=false;
  dm.qMat_Total.Params[0].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qMat_Total.Params[1].asInteger:=2005;
  dm.qMat_Total.active:=true;
  dm.qMat_Total.first;
  total:=0;
  while not dm.qMat_Total.Eof do
  begin
    for i:=1 to 10 do
    begin
      if tipo[i]=dm.qMat_TotalID_Item.asInteger then
      corX:=cor[i];
    end;
    grafico11.Series[0].AddY(dm.qMat_TotalTotal.asInteger,dm.qMat_TotalItem.asString,corx);
    total:=total+dm.qMat_TotalTotal.asInteger;
    dm.qMat_Total.Next;
  end;

  grafico11.Series[0].AddY(Total,'Total',cor[11]);

end;


procedure TFgraficos.montaGrafico_14();
const tipo: array[1..10] of Integer=(52,53,57,58,63,64,110,111,112,121);
var
corX:Tcolor;
I,total:Integer;

begin
  Grafico14.Title.Text.add('Estabelecimentos urbanos 2005');
  Grafico14.Title.Text.add('Estado: '+label1.Caption);
  Grafico14.Title.Text.add('Município: '+Label4.Caption);


  if dm.qEstab.active then dm.qEstab.active:=false;
  dm.qEstab.Params[0].asInteger:=1; //Urbana
  dm.qEstab.Params[1].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qEstab.Params[2].asInteger:=2005;
  dm.qEstab.active:=true;
  dm.qEstab.first;
  total:=0;
  while not dm.qEstab.Eof do
  begin
    for i:=1 to 10 do
    begin
      if tipo[i]=dm.qEstabID_Item.asInteger then
      corX:=cor[i];
    end;
    Grafico14.Series[0].AddY(dm.qEstabTotal.asInteger,dm.qEstabItem.asString,corx);
    total:=total+dm.qEstabTotal.asInteger;
    dm.qEstab.Next;
  end;

  Grafico14.Series[0].AddY(Total,'Total',cor[11]);

end;

procedure TFgraficos.montaGrafico_15();
const tipo: array[1..10] of Integer=(52,53,57,58,63,64,110,111,112,121);
var
corX:Tcolor;
I,total:Integer;

begin
  Grafico15.Title.Text.add('Estabelecimentos rurais 2005');
  Grafico15.Title.Text.add('Estado: '+label1.Caption);
  Grafico15.Title.Text.add('Município: '+Label4.Caption);


  if dm.qEstab.active then dm.qEstab.active:=false;
  dm.qEstab.Params[0].asInteger:=2; //Rural
  dm.qEstab.Params[1].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qEstab.Params[2].asInteger:=2005;
  dm.qEstab.active:=true;
  dm.qEstab.first;
  total:=0;
  while not dm.qEstab.Eof do
  begin
    for i:=1 to 10 do
    begin
      if tipo[i]=dm.qEstabID_Item.asInteger then
      corX:=cor[i];
    end;
    Grafico15.Series[0].AddY(dm.qEstabTotal.asInteger,dm.qEstabItem.asString,corx);
    total:=total+dm.qEstabTotal.asInteger;
    dm.qEstab.Next;
  end;

  Grafico15.Series[0].AddY(Total,'Total',cor[11]);

end;


procedure TFgraficos.montaGrafico_16();
const tipo: array[1..10] of Integer=(52,53,57,58,63,64,110,111,112,121);
var
corX:Tcolor;
I,total:Integer;

begin
  Grafico16.Title.Text.add('Estabelecimentos totais 2005');
  Grafico16.Title.Text.add('Estado: '+label1.Caption);
  Grafico16.Title.Text.add('Município: '+Label4.Caption);


  if dm.qEstab_Total.active then dm.qEstab_Total.active:=false;
  dm.qEstab_Total.Params[0].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qEstab_Total.Params[1].asInteger:=2005;
  dm.qEstab_Total.active:=true;
  dm.qEstab_Total.first;
  total:=0;
  while not dm.qEstab_Total.Eof do
  begin
    for i:=1 to 10 do
    begin
      if tipo[i]=dm.qEstab_TotalID_Item.asInteger then
      corX:=cor[i];
    end;
    Grafico16.Series[0].AddY(dm.qEstab_TotalTotal.asInteger,dm.qEstab_TotalItem.asString,corx);
    total:=total+dm.qEstab_TotalTotal.asInteger;
    dm.qEstab_Total.Next;
  end;

  Grafico16.Series[0].AddY(Total,'Total',cor[11]);

end;

procedure TFgraficos.montaGrafico_17();
const tipo: array[1..10] of Integer=(52,53,57,58,63,64,110,111,112,121);
var
corX:Tcolor;
I,total:Integer;

begin
  Grafico17.Title.Text.add('Estabelecimentos urbanos 2004');
  Grafico17.Title.Text.add('Estado: '+label1.Caption);
  Grafico17.Title.Text.add('Município: '+Label4.Caption);


  if dm.qEstab.active then dm.qEstab.active:=false;
  dm.qEstab.Params[0].asInteger:=1; //Urbana
  dm.qEstab.Params[1].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qEstab.Params[2].asInteger:=2004;
  dm.qEstab.active:=true;
  dm.qEstab.first;
  total:=0;
  while not dm.qEstab.Eof do
  begin
    for i:=1 to 10 do
    begin
      if tipo[i]=dm.qEstabID_Item.asInteger then
      corX:=cor[i];
    end;
    Grafico17.Series[0].AddY(dm.qEstabTotal.asInteger,dm.qEstabItem.asString,corx);
    total:=total+dm.qEstabTotal.asInteger;
    dm.qEstab.Next;
  end;

  Grafico17.Series[0].AddY(Total,'Total',cor[11]);

end;

procedure TFgraficos.montaGrafico_18();
const tipo: array[1..10] of Integer=(52,53,57,58,63,64,110,111,112,121);
var
corX:Tcolor;
I,total:Integer;

begin
  Grafico18.Title.Text.add('Estabelecimentos rurais 2004');
  Grafico18.Title.Text.add('Estado: '+label1.Caption);
  Grafico18.Title.Text.add('Município: '+Label4.Caption);


  if dm.qEstab.active then dm.qEstab.active:=false;
  dm.qEstab.Params[0].asInteger:=2; //Rural
  dm.qEstab.Params[1].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qEstab.Params[2].asInteger:=2004;
  dm.qEstab.active:=true;
  dm.qEstab.first;
  total:=0;
  while not dm.qEstab.Eof do
  begin
    for i:=1 to 10 do
    begin
      if tipo[i]=dm.qEstabID_Item.asInteger then
      corX:=cor[i];
    end;
    Grafico18.Series[0].AddY(dm.qEstabTotal.asInteger,dm.qEstabItem.asString,corx);
    total:=total+dm.qEstabTotal.asInteger;
    dm.qEstab.Next;
  end;

  Grafico18.Series[0].AddY(Total,'Total',cor[11]);

end;


procedure TFgraficos.montaGrafico_19();
const tipo: array[1..10] of Integer=(52,53,57,58,63,64,110,111,112,121);

var
corX:Tcolor;
I,total:Integer;

begin
  Grafico19.Title.Text.add('Estabelecimentos totais 2004');
  Grafico19.Title.Text.add('Estado: '+label1.Caption);
  Grafico19.Title.Text.add('Município: '+Label4.Caption);


  if dm.qEstab_Total.active then dm.qEstab_Total.active:=false;
  dm.qEstab_Total.Params[0].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qEstab_Total.Params[1].asInteger:=2004;
  dm.qEstab_Total.active:=true;
  dm.qEstab_Total.first;
  total:=0;
  while not dm.qEstab_Total.Eof do
  begin
    for i:=1 to 10 do
    begin
      if tipo[i]=dm.qEstab_TotalID_Item.asInteger then
      corX:=cor[i];
    end;
    Grafico19.Series[0].AddY(dm.qEstab_TotalTotal.asInteger,dm.qEstab_TotalItem.asString,corx);
    total:=total+dm.qEstab_TotalTotal.asInteger;
    dm.qEstab_Total.Next;
  end;

  Grafico19.Series[0].AddY(Total,'Total',cor[11]);

end;


procedure TFgraficos.montaGrafico_20();
const tipo: array[1..10] of Integer=(52,53,57,58,59,60,61,62,112,121);
var
corX:Tcolor;
I,total:Integer;

begin
  Grafico20.Title.Text.add('Docentes totais 2005');
  Grafico20.Title.Text.add('Estado: '+label1.Caption);
  Grafico20.Title.Text.add('Município: '+Label4.Caption);


  if dm.qDocentes_Total.active then dm.qDocentes_Total.active:=false;
  dm.qDocentes_Total.Params[0].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qDocentes_Total.Params[1].asInteger:=2005;
  dm.qDocentes_Total.active:=true;
  dm.qDocentes_Total.first;
  total:=0;
  while not dm.qDocentes_Total.Eof do
  begin
    for i:=1 to 10 do
    begin
      if tipo[i]=dm.qDocentes_TotalID_Item.asInteger then
      corX:=cor[i];
    end;
    Grafico20.Series[0].AddY(dm.qDocentes_TotalTotal.asInteger,dm.qDocentes_TotalItem.asString,corx);
    total:=total+dm.qDocentes_TotalTotal.asInteger;
    dm.qDocentes_Total.Next;
  end;

  Grafico20.Series[0].AddY(Total,'Total',cor[11]);

end;

procedure TFgraficos.montaGrafico_21();
const tipo: array[1..10] of Integer=(52,53,57,58,59,60,61,62,112,121);
var
corX:Tcolor;
I,total:Integer;

begin
  Grafico21.Title.Text.add('Docentes totais 2004');
  Grafico21.Title.Text.add('Estado: '+label1.Caption);
  Grafico21.Title.Text.add('Município: '+Label4.Caption);


  if dm.qDocentes_Total.active then dm.qDocentes_Total.active:=false;
  dm.qDocentes_Total.Params[0].asInteger:=dm.qCidadesID_localidade.asInteger;
  dm.qDocentes_Total.Params[1].asInteger:=2004;
  dm.qDocentes_Total.active:=true;
  dm.qDocentes_Total.first;
  total:=0;
  while not dm.qDocentes_Total.Eof do
  begin
    for i:=1 to 10 do
    begin
      if tipo[i]=dm.qDocentes_TotalID_Item.asInteger then
      corX:=cor[i];
    end;
    Grafico21.Series[0].AddY(dm.qDocentes_TotalTotal.asInteger,dm.qDocentes_TotalItem.asString,corx);
    total:=total+dm.qDocentes_TotalTotal.asInteger;
    dm.qDocentes_Total.Next;
  end;

  Grafico21.Series[0].AddY(Total,'Total',cor[11]);

end;


procedure TFgraficos.FormShow(Sender: TObject);
begin
  screen.cursor:=crsqlwait;
  label1.Caption:=dm.qUFUF.asString;
  Label4.Caption:=dm.qCidadesCidade.asString;


  montagrafico_1();
  montagrafico_2();
  montagrafico_3();
  
  montagrafico_4();
  montaGrafico_12();

  montagrafico_5();
  montaGrafico_13();

  montaGrafico_6();
  montaGrafico_7();
  montaGrafico_8();

  montaGrafico_9();
  montaGrafico_10();
  montaGrafico_11();

  montaGrafico_14();
  montaGrafico_15();
  montaGrafico_16();

  montaGrafico_17();
  montaGrafico_18();
  montaGrafico_19();

  montaGrafico_20();
  montaGrafico_21();




  screen.cursor:=crdefault;
end;









procedure TFgraficos.Demografia1Click(Sender: TObject);
begin
  grafico1.PrintLandscape;
end;

procedure TFgraficos.Demografia2Click(Sender: TObject);
begin
  grafico1.CopyToClipboardBitmap;
end;

procedure TFgraficos.IDH1Click(Sender: TObject);
begin
Grafico2.PrintLandscape;
end;

procedure TFgraficos.IDH2Click(Sender: TObject);
begin
 grafico1.CopyToClipboardBitmap;
end;

procedure TFgraficos.IDI1Click(Sender: TObject);
begin
Grafico3.PrintLandscape;
end;

procedure TFgraficos.IDI2Click(Sender: TObject);
begin
grafico3.CopyToClipboardBitmap;
end;

procedure TFgraficos.axas1Click(Sender: TObject);
begin
Grafico4.PrintLandscape;
end;

procedure TFgraficos.axas2Click(Sender: TObject);
begin
grafico4.CopyToClipboardBitmap;
end;

procedure TFgraficos.axasdedistoro1Click(Sender: TObject);
begin
Grafico5.PrintLandscape;
end;

procedure TFgraficos.Urbana1Click(Sender: TObject);
begin
Grafico6.PrintLandscape;
end;

procedure TFgraficos.Rural1Click(Sender: TObject);
begin
Grafico7.PrintLandscape;
end;

procedure TFgraficos.otal1Click(Sender: TObject);
begin
Grafico8.PrintLandscape;
end;

procedure TFgraficos.Urbana2Click(Sender: TObject);
begin
Grafico9.PrintLandscape;
end;

procedure TFgraficos.Rural2Click(Sender: TObject);
begin
Grafico10.PrintLandscape;
end;

procedure TFgraficos.otal2Click(Sender: TObject);
begin
Grafico11.PrintLandscape;
end;

procedure TFgraficos.axasdedistoro2Click(Sender: TObject);
begin
grafico5.CopyToClipboardBitmap;
end;

procedure TFgraficos.Urbana3Click(Sender: TObject);
begin
grafico6.CopyToClipboardBitmap;
end;

procedure TFgraficos.Rural3Click(Sender: TObject);
begin
grafico7.CopyToClipboardBitmap;
end;

procedure TFgraficos.otal3Click(Sender: TObject);
begin
grafico8.CopyToClipboardBitmap;
end;

procedure TFgraficos.Urbana4Click(Sender: TObject);
begin
grafico9.CopyToClipboardBitmap;
end;

procedure TFgraficos.Rural4Click(Sender: TObject);
begin
grafico10.CopyToClipboardBitmap;
end;

procedure TFgraficos.otal4Click(Sender: TObject);
begin
grafico11.CopyToClipboardBitmap;
end;

procedure TFgraficos.Urbana5Click(Sender: TObject);
begin
grafico14.PrintLandscape;
end;

procedure TFgraficos.Rural5Click(Sender: TObject);
begin
grafico15.PrintLandscape;
end;

procedure TFgraficos.otal5Click(Sender: TObject);
begin
grafico16.PrintLandscape;
end;

procedure TFgraficos.Urbana6Click(Sender: TObject);
begin
grafico17.PrintLandscape;
end;

procedure TFgraficos.Rural6Click(Sender: TObject);
begin
grafico18.PrintLandscape;
end;

procedure TFgraficos.otal6Click(Sender: TObject);
begin
grafico19.PrintLandscape;
end;

procedure TFgraficos.Urbana8Click(Sender: TObject);
begin
grafico14.CopyToClipboardBitmap;
end;

procedure TFgraficos.Rural8Click(Sender: TObject);
begin
grafico15.CopyToClipboardBitmap;
end;

procedure TFgraficos.otal8Click(Sender: TObject);
begin
grafico16.CopyToClipboardBitmap;
end;

procedure TFgraficos.Urbana7Click(Sender: TObject);
begin
grafico17.CopyToClipboardBitmap;
end;

procedure TFgraficos.Rural7Click(Sender: TObject);
begin
grafico18.CopyToClipboardBitmap;
end;

procedure TFgraficos.otal7Click(Sender: TObject);
begin
grafico19.CopyToClipboardBitmap;
end;

procedure TFgraficos.N20053Click(Sender: TObject);
begin
grafico20.PrintLandscape;
end;

procedure TFgraficos.N20045Click(Sender: TObject);
begin
grafico21.PrintLandscape;
end;

procedure TFgraficos.N20054Click(Sender: TObject);
begin
grafico20.CopyToClipboardBitmap;
end;

procedure TFgraficos.N20046Click(Sender: TObject);
begin
grafico21.CopyToClipboardBitmap;
end;

end.
