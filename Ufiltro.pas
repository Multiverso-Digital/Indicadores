unit Ufiltro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, shellAPI, RxLookup, ExtCtrls;

type
  TFFiltro = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    CBGrupo: TRxDBLookupCombo;
    CBIndica: TRxDBLookupCombo;
    cbano: TRxDBLookupCombo;
    Button1: TButton;
    GroupBox2: TGroupBox;
    RadioGroup1: TRadioGroup;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure CBGrupoChange(Sender: TObject);
    procedure CBIndicaChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    procedure abreTabelas();
    procedure abreIndicador();
    procedure abreAno();
    procedure montaquery();
    procedure imprimirRelatorio();
    procedure imprimir();
    procedure abreMapa(id_indica:integer;ano,titulo:String);
  public
    { Public declarations }
    tipo_relatorio:Integer; //1= muni, 2=UF, 3=Brasil
  end;

var
  FFiltro:TFFiltro;


implementation

uses Udm, Uprincipal, Ufaixas;


{$R *.dfm}




procedure TFFiltro.abreTabelas();
begin
  if dm.qGrupoFIltro.active then dm.qGrupoFIltro.active:=false;
  dm.qGrupoFIltro.active:=true;
end;


procedure TFFiltro.FormShow(Sender: TObject);
begin
  abreTabelas();
  abreIndicador();
  abreAno();
end;

procedure TFFiltro.abreIndicador();
begin
  if dm.qIndicaFiltro.active then dm.qIndicaFiltro.active:=false;
  if CBGrupo.DisplayValue='' then
    dm.qIndicaFiltro.Params[0].asInteger:=0
  else
    dm.qIndicaFiltro.Params[0].asInteger:=dm.qGrupoFIltroID_Grupo.AsInteger;
  dm.qIndicaFiltro.active:=true;
end;

procedure TFFiltro.abreAno();
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

procedure TFFiltro.CBGrupoChange(Sender: TObject);
begin
abreIndicador();
abreAno();
end;

procedure TFFiltro.CBIndicaChange(Sender: TObject);
begin
abreAno();
end;

procedure TFFiltro.montaquery();
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

    add('AND');
    add('exporta = 1');
    add('AND');
    if CBGrupo.DisplayValue<>'' then
    begin
      add('descricao_indicadores.id_grupo = '+cbGrupo.KeyValue);
      add('AND');
    end;
    if CBIndica.DisplayValue<>'' then
    begin
      add('descricao_indicadores.id_nome = '+CBIndica.KeyValue);
      add('AND');
    end;
    if cbano.DisplayValue<>'' then
    begin
      add('cad_indicadores.ano = '+CBano.KeyValue);
      add('AND');
    end;
    delete(count-1);
    add('Order by grupo,indicador,qualificador,zona,ano, item');
  end;
  dm.qRelIndicaMuni.Active:=true;
end;

procedure TFFiltro.imprimir();
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




      html.add('<td>'+dm.qRelIndicaMuniFonte.asString+'</td>');
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



procedure TFFiltro.imprimirRelatorio();
begin
  montaquery();
  imprimir();
end;



procedure TFFiltro.Button1Click(Sender: TObject);
begin
  imprimirRelatorio();
end;

procedure TFFiltro.abreMapa(id_indica:integer;ano,titulo:String);
begin
  ffaixas:=Tffaixas.create(self);
  ffaixas.id_indicador:=id_indica;
  ffaixas.ano:=ano;
  ffaixas.titulo:=titulo;
  ffaixas.showmodal;
  ffaixas.free;
end;


procedure TFFiltro.Button2Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0:abreMapa(23,'2000',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    1:abreMapa(236,'2004',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    2:abreMapa(24,'2004',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    3:abreMapa(33,'2000',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    4:abreMapa(877,'2005',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    5:abreMapa(880,'2005',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    6:abreMapa(878,'2005',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    7:abreMapa(881,'2005',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    8:abreMapa(879,'2005',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    9:abreMapa(882,'2005',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    10:abreMapa(888,'2005',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    11:abreMapa(894,'2005',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    12:abreMapa(805,'2005',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    13:abreMapa(806,'2005',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    14:abreMapa(807,'2005',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    15:abreMapa(994,'2005',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    16:abreMapa(996,'2005',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    17:abreMapa(995,'2005',RadioGroup1.Items[RadioGroup1.ItemIndex]);
    18:abreMapa(997,'2005',RadioGroup1.Items[RadioGroup1.ItemIndex]);
  end;
end;

procedure TFFiltro.RadioGroup1Click(Sender: TObject);
begin
Button2Click(self);
end;

end.
