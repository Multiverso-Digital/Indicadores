unit UmenuImp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvToolBtn, StdCtrls, RxLookup, Buttons, ExtCtrls, shellAPI, MyAccess, DB;

type
  TFmenuImp = class(TForm)
    GroupBox1: TGroupBox;
    AdvToolButton1: TAdvToolButton;
    AdvToolButton2: TAdvToolButton;
    AdvToolButton3: TAdvToolButton;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    Label8: TLabel;
    AdvToolButton5: TAdvToolButton;
    CBGrupo: TRxDBLookupCombo;
    CBIndica: TRxDBLookupCombo;
    cbano: TRxDBLookupCombo;
    GroupBox2: TGroupBox;
    AdvToolButton4: TAdvToolButton;
    AdvToolButton6: TAdvToolButton;
    Panel1: TPanel;
    AdvToolButton7: TAdvToolButton;
    Panel2: TPanel;
    AdvToolButton8: TAdvToolButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    procedure AdvToolButton5Click(Sender: TObject);
    procedure AdvToolButton2Click(Sender: TObject);
    procedure AdvToolButton1Click(Sender: TObject);
    procedure AdvToolButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBGrupoChange(Sender: TObject);
    procedure CBIndicaChange(Sender: TObject);
    procedure AdvToolButton4Click(Sender: TObject);
    procedure AdvToolButton6Click(Sender: TObject);
    procedure AdvToolButton8Click(Sender: TObject);
    procedure AdvToolButton7Click(Sender: TObject);
  private
    { Private declarations }
    procedure zeraFormulario();
    procedure imprimirRelatorio();
    procedure montaquery();
    procedure imprimir();
    procedure abreTabelas();
    procedure abreIndicador();
    procedure abreAno();


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



    procedure abreMapa(id_indica:integer;ano,titulo:String);
  public
    { Public declarations }
  end;

var
  FmenuImp: TFmenuImp;
  tipo_relatorio:Integer;

implementation

uses Udm, Uprincipal, Ufaixas;

{$R *.dfm}

procedure TFmenuImp.zeraFormulario();
begin
  tipo_relatorio:=0;
  GroupBox3.visible:=false;
  Panel1.Visible:=false;
  Panel2.Visible:=false;
end;

procedure TFmenuImp.montaquery();
begin
  if dm.qRelIndicaMuni.Active then dm.qRelIndicaMuni.Active:=false;
  with dm.qRelIndicaMuni.SQL do
  begin
    clear;
    add('SELECT');
    add('  descricao_localidades.Pais,');
    add('  descricao_localidades.UF,');
    add('  descricao_localidades.Cidade,');
    add('  descricao_localidades.IBGE,');
    add('  descricao_localidades.Porte,');
    add('  descricao_indicadores.Grupo,');
    add('  descricao_indicadores.Indicador,');
    add('  descricao_indicadores.Item,');
    add('  descricao_indicadores.Zona,');
    add('  descricao_indicadores.Qualificador,');
    add('  descricao_indicadores.Fonte,');
    add('  descricao_indicadores.Tipo,');
    add('  descricao_indicadores.nomeredu,');
    add('  cad_indicadores.Ano,');
    add('  cad_indicadores.Valor,');
    add('  (SELECT indi.valor FROM cad_indicadores indi WHERE (indi.ID_Indicador = cad_indicadores.ID_Indicador) AND (indi.ano = cad_indicadores.ano) AND (indi.ID_localidade = 1)) AS ValBrasil,');
    add('  (SELECT indi.valor FROM cad_indicadores indi WHERE ');
    add('  (indi.ID_Indicador = cad_indicadores.ID_Indicador) AND (indi.ano = cad_indicadores.ano) AND (indi.ID_localidade = ');
    add('  (SELECT descr.id_localidade FROM descricao_localidades descr WHERE (descr.ID_UF = descricao_localidades.ID_UF) AND (descr.id_cidade = 0)))) AS ValUF');
    add('FROM');
    add('  cad_indicadores');
    add('  INNER JOIN descricao_indicadores ON (cad_indicadores.ID_Indicador = descricao_indicadores.ID_Indicador)');
    add('  INNER JOIN descricao_localidades ON (cad_indicadores.ID_Localidade = descricao_localidades.ID_Localidade)');
    add('WHERE');
    if tipo_relatorio = 1 then
      add('  (cad_indicadores.id_localidade = '+dm.qCidadesID_localidade.asString+')')
    else if tipo_relatorio = 2 then
      add('  (cad_indicadores.id_localidade = '+dm.qUFID_Localidade.asString+')')
    else if tipo_relatorio = 3 then
      add('  (cad_indicadores.id_localidade = 1)');

    add(' AND ');
    add(' (exporta = 1)');
    add(' AND ');
    if CBGrupo.DisplayValue<>'' then
    begin
      add(' descricao_indicadores.id_grupo = '+cbGrupo.KeyValue);
      add(' AND ');
    end;
    if CBIndica.DisplayValue<>'' then
    begin
      add(' descricao_indicadores.id_nome = '+CBIndica.KeyValue);
      add(' AND ');
    end;
    if cbano.DisplayValue<>'' then
    begin
      add(' cad_indicadores.ano = '+CBano.KeyValue);
      add(' AND ');
    end;
    delete(count-1);
    add(' Order by grupo,indicador,qualificador,zona,ano, item');
  end;
  dm.qRelIndicaMuni.Active:=true;
end;

procedure TFmenuImp.imprimir();
var
HTML:TStringList;
quebraGrupo,quebraIndicador,flip:boolean;
oldNome,oldGrupo,Oldzona,OldQuali,formato,Titulo:String;

begin
  html := TStringList.create();
  HTML.Add(form1.Memo1.Lines.GetText);


  HTML.Add('<table width="100%">');
  HTML.Add('<tr class="titulo">');
  if tipo_relatorio = 3 then
  begin
    HTML.Add('  <td colspan="3">Brasil</td>');
  end
  else if tipo_relatorio = 2 then
  begin
    HTML.Add('  <td colspan="3">UF:'+dm.qRelIndicaMuniUF.asString+'</td>');
  end
  else if tipo_relatorio = 1 then
  begin
    HTML.Add('  <td >Munic&iacute;pio:'+dm.qRelIndicaMuniCidade.asString+'</td>');
    HTML.Add('  <td>C&oacute;digo do IBGE:'+dm.qRelIndicaMuniIBGE.asString+'</td>');
  end;

  HTML.Add('</tr>');
  HTML.Add('<tr class="titulo">');
  HTML.Add('  <td></td>');
  HTML.Add('  <td colspan="2">'+dm.qRelIndicaMuniPorte.asString+'</td>');
  HTML.Add('</tr>');
  HTML.Add('</table>');
  html.add('<br />');
  dm.qRelIndicaMuni.first;

  oldGrupo:=dm.qRelIndicaMuniGrupo.asString;
  Oldzona:=dm.qRelIndicaMuniZona.asString;
  OldQuali:=dm.qRelIndicaMuniQualificador.asString;
  oldNome:=dm.qRelIndicaMuninomeredu.asString;

  quebraGrupo:=true;
  quebraIndicador:=true;
  while not dm.qRelIndicaMuni.eof do
  begin

    if quebraGrupo then
    begin

      html.add('<table width="100%">');
      html.add('<tr class="titulo1">');
      html.add('<td>Dimensão: '+dm.qRelIndicaMuniGrupo.asString+'</td>');
      html.add('</tr>');
      html.add('<tr>');
      html.add('<td>');
      quebraGrupo:=false;
    end;
    if quebraIndicador then
    begin
      flip:=false;
      html.add('<table width="100%">');
      html.add('<tr class="titulo2">');
            Titulo := dm.qRelIndicaMuniIndicador.asString;
            if dm.qRelIndicaMuniZona.asString <> '' then
              titulo := titulo+' - '+dm.qRelIndicaMuniZona.asString;

            if dm.qRelIndicaMuniQualificador.asString <> '' then
              titulo := titulo+' - '+dm.qRelIndicaMuniQualificador.asString;
             if tipo_relatorio = 3 then
            begin
              html.add('<td colspan="2">'+Titulo+'</td>');
            end
            else if tipo_relatorio = 2 then
            begin
              html.add('<td colspan="3">'+Titulo+'</td>');
            end
            else if tipo_relatorio = 1 then
            begin
             html.add('<td colspan="4">'+Titulo+'</td>');
            end;




      html.add('<td>Fonte: '+dm.qRelIndicaMuniFonte.asString+'</td>');
      html.add('</tr>');
      html.add('<tr class="titulo2">');
      html.add('<td width="40%">Variável</td>');
      html.add('<td width="5%" align="right">Ano</td>');
        if tipo_relatorio = 3 then
        begin
          html.add('<td width="15%" align="right">Brasil</td>');
        end
        else if tipo_relatorio = 2 then
        begin
          html.add('<td width="15%" align="right">UF</td>');
          html.add('<td width="15%" align="right">Brasil</td>');
        end
        else if tipo_relatorio = 1 then
        begin
          html.add('<td width="15%" align="right">Município</td>');
          html.add('<td width="15%" align="right">UF</td>');
          html.add('<td width="15%" align="right">Brasil</td>');
        end;

      html.add('</tr>');
      quebraIndicador:=false;
    end;


    if flip then
      html.add('<tr class="zebra">')
    else
      html.add('<tr>');

      flip:= not flip;

      formato:=form1.buscaFormato(dm.qRelIndicaMuniTipo.asString);

      html.add('<td>'+dm.qRelIndicaMuniItem.asString+'</td>');
      html.add('<td>'+dm.qRelIndicaMuniAno.asString+'</td>');
        if tipo_relatorio = 3 then
        begin
          html.add('<td align="right">'+formatfloat(formato,dm.qRelIndicaMuniValor.asFloat)+'</td>');
        end
        else if tipo_relatorio = 2 then
        begin
          html.add('<td align="right">'+formatfloat(formato,dm.qRelIndicaMuniValor.asFloat)+'</td>');
          html.add('<td align="right">'+formatfloat(formato,dm.qRelIndicaMuniValBrasil.asFloat)+'</td>');
        end
        else if tipo_relatorio = 1 then
        begin
          html.add('<td align="right">'+formatfloat(formato,dm.qRelIndicaMuniValor.asFloat)+'</td>');
          html.add('<td align="right">'+formatfloat(formato,dm.qRelIndicaMuniValUF.asFloat)+'</td>');
          html.add('<td align="right">'+formatfloat(formato,dm.qRelIndicaMuniValBrasil.asFloat)+'</td>');
        end;
      html.add('</tr>');

      dm.qRelIndicaMuni.Next;

      if (Oldzona<>dm.qRelIndicaMuniZona.asString) or
          (OldQuali<>dm.qRelIndicaMuniQualificador.asString) or
            (dm.qRelIndicaMuni.eof) or
              (oldGrupo<>dm.qRelIndicaMuniGrupo.asString) or
                (oldNome<>dm.qRelIndicaMuninomeredu.asString)  then
      begin
        html.add('</table>');
        html.add('<br />');
        html.add('<br />');
        quebraIndicador:=true;
        Oldzona:=dm.qRelIndicaMuniZona.asString;
        OldQuali:=dm.qRelIndicaMuniQualificador.asString;
        oldNome:=dm.qRelIndicaMuninomeredu.asString;
      end;




      if (oldGrupo<>dm.qRelIndicaMuniGrupo.asString) or (dm.qRelIndicaMuni.eof) or
        (oldNome<>dm.qRelIndicaMuninomeredu.asString) then
      begin
        html.add('</td>');
        html.add('</tr>');
        html.add('</table>');
        html.add('<br />');
        oldGrupo:=dm.qRelIndicaMuniGrupo.asString;
        Oldzona:=dm.qRelIndicaMuniZona.asString;
        OldQuali:=dm.qRelIndicaMuniQualificador.asString;
        quebraIndicador:=true;
        quebraGrupo:=true;
        oldNome:=dm.qRelIndicaMuninomeredu.asString;
      end;
  end;
  html.add('<br />');
  HTML.Add('<table width="98%" border="0" align="center">');
  HTML.Add('<tr>');
  HTML.Add('<td> ');
  HTML.Add('<img src="rodape.jpg" alt="cenpec" />');
  HTML.Add('</td>');
  HTML.Add('</tr>');
  HTML.Add('</table>');
  html.add('</body>');

  try
    html.SaveToFile('c:\HTML_Banco\municipio_'+dm.qCidadesIBGE.asString+'.html');
  except
    exit;
  end;

  try
    shellexecute(handle,'open',pchar('c:\HTML_Banco\municipio_'+dm.qCidadesIBGE.asString+'.html'),nil,nil,SW_SHOW);
  except
    exit;
  end;


end;

procedure TFmenuImp.abreTabelas();
begin
  if dm.qGrupoFIltro.active then dm.qGrupoFIltro.active:=false;
  dm.qGrupoFIltro.active:=true;
end;

procedure TFmenuImp.imprimirRelatorio();
begin
  montaquery();
  imprimir();
end;

procedure TFmenuImp.AdvToolButton5Click(Sender: TObject);
begin
screen.Cursor:=crsqlwait;
imprimirRelatorio();
screen.Cursor:=crdefault;
end;

procedure TFmenuImp.AdvToolButton2Click(Sender: TObject);
begin
  zeraFormulario;
  AdvToolButton4.Down:=false;
  AdvToolButton6.Down:=false;
  tipo_relatorio:=3;
  GroupBox3.Visible:=true;
end;

procedure TFmenuImp.AdvToolButton1Click(Sender: TObject);
begin
  zeraFormulario;
  AdvToolButton4.Down:=false;
  AdvToolButton6.Down:=false;
  if form1.CBUF.DisplayValue='Brasil' then
  begin
    Showmessage('Selecione uma UF na tela anterior.');
    exit;
  end;
  tipo_relatorio:=2;
  GroupBox3.Visible:=true;
end;

procedure TFmenuImp.AdvToolButton3Click(Sender: TObject);
begin
  zeraFormulario;
  AdvToolButton4.Down:=false;
  AdvToolButton6.Down:=false;
  if form1.CBUF.DisplayValue='Brasil' then
  begin
    Showmessage('Selecione um Município na tela anterior.');
    exit;
  end;
  tipo_relatorio:=1;
  GroupBox3.Visible:=true;
end;

procedure TFmenuImp.abreIndicador();
begin
  if dm.qIndicaFiltro.active then dm.qIndicaFiltro.active:=false;
  if CBGrupo.DisplayValue='' then
    dm.qIndicaFiltro.Params[0].asInteger:=0
  else
    dm.qIndicaFiltro.Params[0].asInteger:=dm.qGrupoFIltroID_Grupo.AsInteger;
  dm.qIndicaFiltro.active:=true;
end;

procedure TFmenuImp.abreAno();
begin

  if dm.qAnoFiltro.active then dm.qAnoFiltro.active:=false;
  if CBIndica.DisplayValue='' then
  begin
    dm.qAnoFiltro.Params[0].AsInteger:=0;
    dm.qAnoFiltro.Params[1].AsInteger:=0;
  end
  else
  begin
    dm.qAnoFiltro.Params[0].AsInteger:=dm.qGrupoFIltroID_Grupo.asInteger;
    dm.qAnoFiltro.Params[1].AsInteger:=dm.qIndicaFiltroID_nome.asInteger;
  end;
  dm.qAnoFiltro.active :=true;
end;

procedure TFmenuImp.FormShow(Sender: TObject);
begin
  abreTabelas();
  abreIndicador();
  abreAno();
end;

procedure TFmenuImp.CBGrupoChange(Sender: TObject);
begin
abreIndicador();
abreAno();
end;

procedure TFmenuImp.CBIndicaChange(Sender: TObject);
begin
abreAno();
end;




procedure TFMenuImp.abreArquivonoTemp(Arq:String);
begin
 try
    shellexecute(handle,'open',pchar('C:\HTML_Banco\'+Arq),nil,nil,SW_SHOW);
  except
    showMessage('Erro na leitura do arquivo');
  end;
end;

procedure TFMenuImp.colocarodape();
begin
  arq.Add('<table width="98%" border="0" align="center">');
  arq.Add('<tr>');
  arq.Add('<td> ');
  arq.Add('<img src="rodape.jpg" alt="cenpec" />');
  arq.Add('</td>');
  arq.Add('</tr>');
  arq.Add('</table>');
end;

procedure TFMenuImp.imprimiValores(tabela:TMyquery);
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

procedure TFMenuImp.montaCabecalho(titulos:tstringlist);
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


procedure TFMenuImp.ImprimiTabela1();
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


procedure TFMenuImp.ImprimiTabela2();
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
arq.add('<div><em>');
arq.add('Nota: O mesmo docente pode atuar em mais de um nível/modalidade de ensino e em mais de um estabelecimento.<br \>');
arq.add('Nota: O mesmo estabelecimento pode oferecer mais de uma modalidade de ensino.');
arq.add('</div></em>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab2.html');
except

end;
abreArquivonoTemp('tab2.html');
arq.Free;

end;

procedure TFMenuImp.ImprimiTabela3();
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
arq.add('<div><em>');
arq.add('Nota: O mesmo docente pode atuar em mais de um nível/modalidade de ensino e em mais de um estabelecimento.<br \>');
arq.add('Nota: O mesmo estabelecimento pode oferecer mais de uma modalidade de ensino.');
arq.add('</div></em>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab3.html');
except

end;
abreArquivonoTemp('tab3.html');
arq.Free;


end;







procedure TFMenuImp.ImprimiTabela4();
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
arq.add('<div><em>');
arq.add('Nota: O mesmo docente pode atuar em mais de um nível/modalidade de ensino e em mais de um estabelecimento.<br \>');
arq.add('Nota: O mesmo estabelecimento pode oferecer mais de uma modalidade de ensino.');
arq.add('</div></em>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab4.html');
except

end;
abreArquivonoTemp('tab4.html');
arq.Free;


end;

procedure TFMenuImp.ImprimiTabela5();
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
arq.add('<div><em>');
arq.add('Nota: O mesmo docente pode atuar em mais de um nível/modalidade de ensino e em mais de um estabelecimento.<br \>');
arq.add('Nota: O mesmo estabelecimento pode oferecer mais de uma modalidade de ensino.');
arq.add('</div></em>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab5.html');
except

end;
abreArquivonoTemp('tab5.html');
arq.Free;


end;

procedure TFMenuImp.ImprimiTabela6();
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
arq.add('<div><em>');
arq.add('Nota: O mesmo docente pode atuar em mais de um nível/modalidade de ensino e em mais de um estabelecimento.<br \>');
arq.add('Nota: O mesmo estabelecimento pode oferecer mais de uma modalidade de ensino.');
arq.add('</div></em>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab6.html');
except

end;
abreArquivonoTemp('tab6.html');
arq.Free;


end;

procedure TFMenuImp.ImprimiTabela7();
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
arq.add('<div><em>');
arq.add('Nota: O mesmo estabelecimento pode oferecer mais de uma modalidade de ensino.');
arq.add('</div></em>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab7.html');
except

end;
abreArquivonoTemp('tab7.html');
arq.Free;


end;

procedure TFMenuImp.ImprimiTabela8();
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

procedure TFMenuImp.ImprimiTabela9();
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
arq.add('<div><em>');
arq.add('Nota: O mesmo docente pode atuar em mais de um nível/modalidade de ensino e em mais de um estabelecimento.<br \>');
arq.add('</div></em>');
colocarodape();

try
arq.SaveToFile('c:\HTML_Banco\tab9.html');
except

end;
abreArquivonoTemp('tab9.html');
arq.Free;


end;





procedure TFMenuImp.ImprimiTabela10();
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














procedure TFMenuImp.ImprimiTabela11();
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


procedure TFMenuImp.ImprimiTabela12();
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

procedure TFMenuImp.ImprimiTabela13();
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

procedure TFMenuImp.ImprimiTabela14();
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


procedure TFMenuImp.ImprimiTabela15();
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







procedure TFmenuImp.AdvToolButton4Click(Sender: TObject);
begin
zeraFormulario();
 AdvToolButton1.Down:=false;
 AdvToolButton2.Down:=false;
 AdvToolButton3.Down:=false;
panel1.Visible:=true;
end;

procedure TFmenuImp.AdvToolButton6Click(Sender: TObject);
begin
zeraFormulario();
 AdvToolButton1.Down:=false;
 AdvToolButton2.Down:=false;
 AdvToolButton3.Down:=false;
panel2.Visible:=true;
end;

procedure TFmenuImp.AdvToolButton8Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex = -1 then
  begin
    Showmessage('Selecione uma das tabelas no menu acima.');
    exit;
  end;
  screen.Cursor:=crsqlwait;
  case ComboBox1.ItemIndex of
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


procedure TFmenuImp.abreMapa(id_indica:integer;ano,titulo:String);
begin
  ffaixas:=Tffaixas.create(self);
  ffaixas.id_indicador:=id_indica;
  ffaixas.ano:=ano;
  ffaixas.titulo:=titulo;
  ffaixas.showmodal;
  ffaixas.free;
end;

procedure TFmenuImp.AdvToolButton7Click(Sender: TObject);
begin
  if ComboBox2.ItemIndex = -1 then
  begin
    Showmessage('Selecione um dos mapas pré-definidos no menu acima.');
    exit;
  end;
  screen.Cursor:=crsqlwait;
  case ComboBox2.ItemIndex of
    0:abreMapa(23,'2000',ComboBox2.Items[ComboBox2.ItemIndex]);
    1:abreMapa(236,'2004',ComboBox2.Items[ComboBox2.ItemIndex]);
    2:abreMapa(24,'2004',ComboBox2.Items[ComboBox2.ItemIndex]);
    3:abreMapa(33,'2000',ComboBox2.Items[ComboBox2.ItemIndex]);
    4:abreMapa(877,'2005',ComboBox2.Items[ComboBox2.ItemIndex]);
    5:abreMapa(880,'2005',ComboBox2.Items[ComboBox2.ItemIndex]);
    6:abreMapa(878,'2005',ComboBox2.Items[ComboBox2.ItemIndex]);
    7:abreMapa(881,'2005',ComboBox2.Items[ComboBox2.ItemIndex]);
    8:abreMapa(879,'2005',ComboBox2.Items[ComboBox2.ItemIndex]);
    9:abreMapa(882,'2005',ComboBox2.Items[ComboBox2.ItemIndex]);
    10:abreMapa(888,'2005',ComboBox2.Items[ComboBox2.ItemIndex]);
    11:abreMapa(894,'2005',ComboBox2.Items[ComboBox2.ItemIndex]);
    12:abreMapa(805,'2005',ComboBox2.Items[ComboBox2.ItemIndex]);
    13:abreMapa(806,'2005',ComboBox2.Items[ComboBox2.ItemIndex]);
    14:abreMapa(807,'2005',ComboBox2.Items[ComboBox2.ItemIndex]);
    15:abreMapa(994,'2005',ComboBox2.Items[ComboBox2.ItemIndex]);
    16:abreMapa(996,'2005',ComboBox2.Items[ComboBox2.ItemIndex]);
    17:abreMapa(995,'2005',ComboBox2.Items[ComboBox2.ItemIndex]);
    18:abreMapa(997,'2005',ComboBox2.Items[ComboBox2.ItemIndex]);
  end;
  screen.Cursor:=crdefault;
end;

end.
