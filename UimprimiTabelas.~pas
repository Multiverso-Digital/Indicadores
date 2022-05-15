unit UimprimiTabelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MyAccess, shellAPI;

type
  TFImprimiTabelas = class(TForm)
    RadioGroup1: TRadioGroup;
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    procedure montaCabecalho(titulos:tstringlist);
    procedure imprimiValores(tabela:TMyquery);
    procedure abreArquivonoTemp(Arq:String);
    procedure ImprimiTabela1();
    procedure ImprimiTabela2();
    procedure ImprimiTabela3();
    procedure ImprimiTabela4();
    procedure ImprimiTabela5();
    procedure ImprimiTabela6();
    procedure ImprimiTabela7();
    procedure ImprimiTabela8();
    procedure ImprimiTabela9();
    procedure ImprimiTabela10();
    procedure ImprimiTabela11();
    procedure ImprimiTabela12();
    procedure ImprimiTabela13();
    procedure ImprimiTabela14();
    procedure ImprimiTabela15();
    procedure colocarodape();
  public
    { Public declarations }
  end;

var
  FImprimiTabelas: TFImprimiTabelas;
  arq:TstringList;
implementation

uses Uprincipal, Udm, DB;

{$R *.dfm}

procedure TFImprimiTabelas.abreArquivonoTemp(Arq:String);
begin
 try
    shellexecute(handle,'open',pchar('C:\HTML_Banco\'+Arq),nil,nil,SW_SHOW);
  except
    showMessage('Erro na leitura do arquivo');
  end;
end;

procedure TFImprimiTabelas.colocarodape();
begin
  arq.Add('<table width="98%" border="0" align="center">');
  arq.Add('<tr>');
  arq.Add('<td> ');
  arq.Add('<img src="rodape.jpg" alt="cenpec" />');
  arq.Add('</td>');
  arq.Add('</tr>');
  arq.Add('</table>');
end;

procedure TFImprimiTabelas.imprimiValores(tabela:TMyquery);
var i:Integer;
flip:boolean;
begin

  if tabela.active then tabela.active:=false;
  tabela.open;
  tabela.First;
  flip:=false;
  while not tabela.Eof do
  begin
    if flip then
      arq.add('<tr class="zebra">')
    else
      arq.add('<tr>');
    flip:=not flip;

    for i:=0 to tabela.FieldCount-1 do
    begin
      if tabela.Fields[i].DataType = ftString	then
      begin
        arq.add('<td align="left">');
        if tabela.FieldValues['UF'] = 'Brasil' then
        begin
          arq.add('<div class="negrito">'+tabela.Fields[i].Value+'</div>');
        end
        else
        begin
          arq.add(tabela.Fields[i].Value);
        end;
        arq.add('</td>');
      end
      else
      begin
        arq.add('<td align="right">');
                if tabela.FieldValues['UF'] = 'Brasil' then
        begin
          if tabela.Fields[i].value = null then
            //arq.add('<div class="negrito">'+formatfloat((tabela.Fields[i] as TFloatField).DisplayFormat,0.00)+'</div>')
          else
           arq.add('<div class="negrito">'+formatfloat((tabela.Fields[i] as TFloatField).DisplayFormat,tabela.Fields[i].value)+'</div>');
        end
        else
        begin
          if tabela.Fields[i].value = null then
            arq.add(formatfloat((tabela.Fields[i] as TFloatField).DisplayFormat,0.00))
          else
            arq.add(formatfloat((tabela.Fields[i] as TFloatField).DisplayFormat,tabela.Fields[i].value));
        end;



        arq.add('</td>');
      end;
    end;
    arq.add('</tr>');
    tabela.next;
  end;
  tabela.Close;
end;

procedure TFImprimiTabelas.montaCabecalho(titulos:tstringlist);
var i,l:integer;
begin
  arq.add('<tr class="titulo">');
    arq.add('<td colspan="'+inttostr(titulos.Count-1)+'">');
    arq.add(titulos[0]);
    arq.add('</td>');
  arq.add('</tr>');
  arq.add('<tr class="titulo">');
    arq.add('<td>');
      arq.add(titulos[1]);
    arq.add('</td>');
    for i:=2 to titulos.count -1 do
    begin
      arq.add('<td align="center">');
      arq.add(titulos[i]);
      arq.add('</td>');
    end;
    arq.add('</tr>');
end;


procedure TFImprimiTabelas.ImprimiTabela1();
var titulo:tstringlist;
begin
  arq:=Tstringlist.Create();
  arq.Add(form1.memo1.Lines.Text);
arq.Add('<table width="98%" border="0" align="center">');

titulo:=Tstringlist.Create();
titulo.add('Tabela 1 - Indicadores sociais dos Estados Brasileiros e do Brasil');
titulo.add('UF');
titulo.add('População residente 2000');
titulo.add('Estimativa populacional 2007');
titulo.add('Pop. em estado de pobreza 2004');
titulo.add('Pop. em estado de indigência 2004');
titulo.add('Renda per capita 2000');
titulo.add('IDH 2000');
titulo.add('IDI 2004');
titulo.add('Taxa de analfabetismo 2000');
titulo.add('Esperança de vida ao nascer 2000');
titulo.add('Taxa de mortalidade 2004');
montaCabecalho(titulo);
titulo.Free;

imprimiValores(dm.qtab1);
arq.Add('</table>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab1.html');
except

end;
abreArquivonoTemp('tab1.html');
arq.Free;


end;


procedure TFImprimiTabelas.ImprimiTabela2();
var titulo:tstringlist;
begin
  arq:=Tstringlist.Create();
  arq.Add(form1.memo1.Lines.Text);
arq.Add('<table width="98%" border="0" align="center">');

titulo:=Tstringlist.Create();
titulo.add('Tabela 2 - Estimativa populacional 0 a 3 anos 2007, N° de estabelecimentos, N° de matrículas e N° de docentes nas Creches - Estados Brasileiros e do Brasil');
titulo.add('UF');
titulo.add('Estimativa populacional 2007');
titulo.add('N° de estabelecimentos 2005');
titulo.add('N° de matrículas 2005');
titulo.add('N° de docentes 2005');
montaCabecalho(titulo);
titulo.Free;

imprimiValores(dm.qtab2);
arq.Add('</table>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab2.html');
except

end;
abreArquivonoTemp('tab2.html');
arq.Free;

end;

procedure TFImprimiTabelas.ImprimiTabela3();
var titulo:tstringlist;
begin
  arq:=Tstringlist.Create();
  arq.Add(form1.memo1.Lines.Text);
arq.Add('<table width="98%" border="0" align="center">');

titulo:=Tstringlist.Create();
titulo.add('Tabela 3 - Estimativa populacional 4 a 5 anos anos 2007, N° de estabelecimentos, N° de matrículas e N° de docentes na Pré-escola - Estados Brasileiros e do Brasil');
titulo.add('UF');
titulo.add('Estimativa populacional 2007');
titulo.add('N° de estabelecimentos 2005');
titulo.add('N° de matrículas 2005');
titulo.add('N° de docentes 2005');
montaCabecalho(titulo);
titulo.Free;

imprimiValores(dm.qtab3);
arq.Add('</table>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab3.html');
except

end;
abreArquivonoTemp('tab3.html');
arq.Free;


end;







procedure TFImprimiTabelas.ImprimiTabela4();
var titulo:tstringlist;
begin
  arq:=Tstringlist.Create();
  arq.Add(form1.memo1.Lines.Text);
arq.Add('<table width="98%" border="0" align="center">');

titulo:=Tstringlist.Create();
titulo.add('Tabela 4 - Estimativa populacional 6 a 14 anos 2007, N° de estabelecimentos, N° de matrículas e N° de docentes no Ensino Fundamental 8 anos - Estados Brasileiros e do Brasil');
titulo.add('UF');
titulo.add('Estimativa populacional 2007');
titulo.add('N° de estabelecimentos <br />2005');
titulo.add('N° de matrículas 2005');
titulo.add('N° de docentes 2005');
montaCabecalho(titulo);
titulo.Free;

imprimiValores(dm.qtab4);
arq.Add('</table>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab4.html');
except

end;
abreArquivonoTemp('tab4.html');
arq.Free;


end;

procedure TFImprimiTabelas.ImprimiTabela5();
var titulo:tstringlist;
begin
  arq:=Tstringlist.Create();
  arq.Add(form1.memo1.Lines.Text);
arq.Add('<table width="98%" border="0" align="center">');

titulo:=Tstringlist.Create();
titulo.add('Tabela 5 - Estimativa populacional 6 a 14 anos 2007, N° de estabelecimentos, N° de matrículas e N° de docentes no Ensino Fundamental 9 anos - Estados Brasileiros e do Brasil');
titulo.add('UF');
titulo.add('Estimativa populacional 2007');
titulo.add('N° de estabelecimentos <br />2005');
titulo.add('N° de matrículas 2005');
titulo.add('N° de docentes 2005');
montaCabecalho(titulo);
titulo.Free;

imprimiValores(dm.qtab5);
arq.Add('</table>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab5.html');
except

end;
abreArquivonoTemp('tab5.html');
arq.Free;


end;

procedure TFImprimiTabelas.ImprimiTabela6();
var titulo:tstringlist;
begin
  arq:=Tstringlist.Create();
  arq.Add(form1.memo1.Lines.Text);
arq.Add('<table width="98%" border="0" align="center">');

titulo:=Tstringlist.Create();
titulo.add('Tabela 6 - Estimativa populacional 15 a 18 anos 2007, N° de estabelecimentos, N° de matrículas e N° de docentes no Ensino Médio - Estados Brasileiros e do Brasil');
titulo.add('UF');
titulo.add('Estimativa populacional 2007');
titulo.add('N° de estabelecimentos <br />2005');
titulo.add('N° de matrículas 2005');
titulo.add('N° de docentes 2005');
montaCabecalho(titulo);
titulo.Free;

imprimiValores(dm.qtab6);
arq.Add('</table>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab6.html');
except

end;
abreArquivonoTemp('tab6.html');
arq.Free;


end;

procedure TFImprimiTabelas.ImprimiTabela7();
var titulo:tstringlist;
begin
  arq:=Tstringlist.Create();
  arq.Add(form1.memo1.Lines.Text);
arq.Add('<table width="98%" border="0" align="center">');

titulo:=Tstringlist.Create();
titulo.add('Tabela 7 - N° de estabelecimentos da Educação Básica em 2005 - Estados Brasileiros e do Brasil');
titulo.add('UF');
titulo.add('Creche');
titulo.add('Pré-escola');
titulo.add('Ensino <br />Fundamental <br />8 anos');
titulo.add('Ensino <br />Fundamental <br />9 anos');
titulo.add('Ensino <br />médio');
titulo.add('EJA');
titulo.add('Educação <br />especial');
titulo.add('Educação <br />profissional');
montaCabecalho(titulo);
titulo.Free;

imprimiValores(dm.qtab7);
arq.Add('</table>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab7.html');
except

end;
abreArquivonoTemp('tab7.html');
arq.Free;


end;

procedure TFImprimiTabelas.ImprimiTabela8();
var titulo:tstringlist;
begin
  arq:=Tstringlist.Create();
  arq.Add(form1.memo1.Lines.Text);
arq.Add('<table width="98%" border="0" align="center">');

titulo:=Tstringlist.Create();
titulo.add('Tabela 8 - N° de matrículas da Educação Básica em 2005 - Estados Brasileiros e do Brasil');
titulo.add('UF');
titulo.add('Creche');
titulo.add('Pré-escola');
titulo.add('Ensino <br />Fundamental <br />8 anos');
titulo.add('Ensino <br />Fundamental <br />9 anos');
titulo.add('Ensino <br />médio');
titulo.add('EJA');
titulo.add('Educação <br />especial');
titulo.add('Educação <br />profissional');
montaCabecalho(titulo);
titulo.Free;

imprimiValores(dm.qtab8);
arq.Add('</table>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab8.html');
except

end;
abreArquivonoTemp('tab8.html');
arq.Free;


end;

procedure TFImprimiTabelas.ImprimiTabela9();
var titulo:tstringlist;
begin
  arq:=Tstringlist.Create();
  arq.Add(form1.memo1.Lines.Text);
arq.Add('<table width="98%" border="0" align="center">');

titulo:=Tstringlist.Create();
titulo.add('Tabela 9 - N° de funções docentes da Educação Básica em 2005 - Estados Brasileiros e do Brasil');
titulo.add('UF');
titulo.add('Creche');
titulo.add('Pré-escola');
titulo.add('Ensino <br />Fundamental <br />8 anos');
titulo.add('Ensino <br />Fundamental <br />9 anos');
titulo.add('Ensino <br />médio');
titulo.add('EJA');
titulo.add('Educação <br />especial');
titulo.add('Educação <br />profissional');
montaCabecalho(titulo);
titulo.Free;

imprimiValores(dm.qtab9);
arq.Add('</table>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab9.html');
except

end;
abreArquivonoTemp('tab9.html');
arq.Free;


end;





procedure TFImprimiTabelas.ImprimiTabela10();
var titulo:tstringlist;
begin
  arq:=Tstringlist.Create();
  arq.Add(form1.memo1.Lines.Text);
arq.Add('<table width="98%" border="0" align="center">');

titulo:=Tstringlist.Create();
titulo.add('Tabela 10 - N° de matrículas, taxas de rendimento e distorção idade-série do Ensino Fundamental em 2005 - Estados Brasileiros e do Brasil');
titulo.add('UF');
titulo.add('Número de matrículas');
titulo.add('Taxa de aprovação');
titulo.add('Taxa de <br />reprovação');
titulo.add('Taxa de abandono');
titulo.add('Distorção idade-série');
montaCabecalho(titulo);
titulo.Free;

imprimiValores(dm.qtab10);
arq.Add('</table>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab10.html');
except

end;
abreArquivonoTemp('tab10.html');
arq.Free;


end;














procedure TFImprimiTabelas.ImprimiTabela11();
var titulo:tstringlist;
begin
  arq:=Tstringlist.Create();
  arq.Add(form1.memo1.Lines.Text);
arq.Add('<table width="98%" border="0" align="center">');

titulo:=Tstringlist.Create();
titulo.add('Tabela 11 - N° de matrículas, taxas de rendimento e distorção idade-série do Ensino Médio em 2005 - Estados Brasileiros e do Brasil');
titulo.add('UF');
titulo.add('Número de matrículas');
titulo.add('Taxa de aprovação');
titulo.add('Taxa de <br />reprovação');
titulo.add('Taxa de abandono');
titulo.add('Distorção idade-série');
montaCabecalho(titulo);
titulo.Free;

imprimiValores(dm.qtab11);
arq.Add('</table>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab11.html');
except

end;
abreArquivonoTemp('tab11.html');
arq.Free;


end;


procedure TFImprimiTabelas.ImprimiTabela12();
var titulo:tstringlist;
begin
  arq:=Tstringlist.Create();
  arq.Add(form1.memo1.Lines.Text);
arq.Add('<table width="98%" border="0" align="center">');


arq.add('<tr class="titulo">');
    arq.add('<td colspan="5">');
    arq.add('Tabela 12 - Desempenho na Prova Brasil 2005 - Rede Pública -Estados Brasileiros e do Brasil');
    arq.add('</td>');
  arq.add('</tr>');
  arq.add('<tr class="titulo" align="center">');
    arq.add('<td rowspan="2">');
      arq.add('UF');
    arq.add('</td>');
    arq.add('<td colspan="2" align="center">');
    arq.add('4ª série Ensino Fundamental');
    arq.add('</td>');
    arq.add('<td colspan="2" align="center">');
    arq.add('8ª série Ensino Fundamental');
    arq.add('</td>');
    arq.add('</tr>');
    arq.add('<tr class="titulo" align="center">');
    arq.add('<td>Língua Portuguesa</td>');
    arq.add('<td>Matemática</td>');
    arq.add('<td>Língua Portuguesa</td>');
    arq.add('<td>Matemática</td>');
    arq.add('</tr>');


imprimiValores(dm.qtab12);
arq.Add('</table>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab12.html');
except

end;
abreArquivonoTemp('tab12.html');
arq.Free;


end;

procedure TFImprimiTabelas.ImprimiTabela13();
var titulo:tstringlist;
begin
  arq:=Tstringlist.Create();
  arq.Add(form1.memo1.Lines.Text);
arq.Add('<table width="98%" border="0" align="center">');

arq.add('<tr class="titulo">');
    arq.add('<td colspan="5">');
    arq.add('Tabela 13 - Desempenho na Prova Brasil 2005 - Rede Estadual -Estados Brasileiros e do Brasil');
    arq.add('</td>');
  arq.add('</tr>');
  arq.add('<tr class="titulo" align="center">');
    arq.add('<td rowspan="2">');
      arq.add('UF');
    arq.add('</td>');
    arq.add('<td colspan="2" align="center">');
    arq.add('4ª série Ensino Fundamental');
    arq.add('</td>');
    arq.add('<td colspan="2" align="center">');
    arq.add('8ª série Ensino Fundamental');
    arq.add('</td>');
    arq.add('</tr>');
    arq.add('<tr class="titulo" align="center">');
    arq.add('<td>Língua Portuguesa</td>');
    arq.add('<td>Matemática</td>');
    arq.add('<td>Língua Portuguesa</td>');
    arq.add('<td>Matemática</td>');
    arq.add('</tr>');

imprimiValores(dm.qtab13);
arq.Add('</table>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab13.html');
except

end;
abreArquivonoTemp('tab13.html');
arq.Free;


end;

procedure TFImprimiTabelas.ImprimiTabela14();
var titulo:tstringlist;
begin
  arq:=Tstringlist.Create();
  arq.Add(form1.memo1.Lines.Text);
arq.Add('<table width="98%" border="0" align="center">');


arq.add('<tr class="titulo">');
    arq.add('<td colspan="5">');
    arq.add('Tabela 14 - Desempenho na Prova Brasil 2005 - Rede Municipal -Estados Brasileiros e do Brasil');
    arq.add('</td>');
  arq.add('</tr>');
  arq.add('<tr class="titulo" align="center">');
    arq.add('<td rowspan="2">');
      arq.add('UF');
    arq.add('</td>');
    arq.add('<td colspan="2" align="center">');
    arq.add('4ª série Ensino Fundamental');
    arq.add('</td>');
    arq.add('<td colspan="2" align="center">');
    arq.add('8ª série Ensino Fundamental');
    arq.add('</td>');
    arq.add('</tr>');
    arq.add('<tr class="titulo" align="center">');
    arq.add('<td>Língua Portuguesa</td>');
    arq.add('<td>Matemática</td>');
    arq.add('<td>Língua Portuguesa</td>');
    arq.add('<td>Matemática</td>');
    arq.add('</tr>');


imprimiValores(dm.qtab14);
arq.Add('</table>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab14.html');
except

end;
abreArquivonoTemp('tab14.html');
arq.Free;


end;


procedure TFImprimiTabelas.ImprimiTabela15();
var titulo:tstringlist;
begin
  arq:=Tstringlist.Create();
  arq.Add(form1.memo1.Lines.Text);
arq.Add('<table width="98%" border="0" align="center">');

arq.add('<tr class="titulo">');
    arq.add('<td colspan="7">');
    arq.add('Tabela 15 - Índice de Desenvolvimento da Educação Básica (IDEB) 2005 - Estados Brasileiros e do Brasil');
    arq.add('</td>');
  arq.add('</tr>');
  arq.add('<tr class="titulo" align="center">');
    arq.add('<td rowspan="2">');
      arq.add('UF');
    arq.add('</td>');
    arq.add('<td colspan="2" align="center">');
    arq.add('Anos iniciais do EF');
    arq.add('</td>');
    arq.add('<td colspan="2" align="center">');
    arq.add('Anos finais do EF');
    arq.add('</td>');
    arq.add('<td colspan="2" align="center">');
    arq.add('Ensino Médio');
    arq.add('</td>');
    arq.add('</tr>');
    arq.add('<tr class="titulo" align="center">');
    arq.add('<td>Rede Pública</td>');
    arq.add('<td>Rede Pública e Privada</td>');
    arq.add('<td>Rede Pública</td>');
    arq.add('<td>Rede Pública e Privada</td>');
    arq.add('<td>Rede Pública</td>');
    arq.add('<td>Rede Pública e Privada</td>');
    arq.add('</tr>');


imprimiValores(dm.qtab15);
arq.Add('</table>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab15.html');
except

end;
abreArquivonoTemp('tab15.html');
arq.Free;


end;


procedure TFImprimiTabelas.RadioGroup1Click(Sender: TObject);
begin
  screen.Cursor:=crsqlwait;
  case RadioGroup1.ItemIndex of
    0:ImprimiTabela1;
    1:ImprimiTabela2;
    2:ImprimiTabela3;
    3:ImprimiTabela4;
    4:ImprimiTabela5;
    5:ImprimiTabela6;
    6:ImprimiTabela7;
    7:ImprimiTabela8;
    8:ImprimiTabela9;
    9:ImprimiTabela10;
    10:ImprimiTabela11;
    11:ImprimiTabela12;
    12:ImprimiTabela13;
    13:ImprimiTabela14;
    14:ImprimiTabela15;
  end;
  screen.Cursor:=crdefault;
end;

end.
