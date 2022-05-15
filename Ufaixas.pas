unit Ufaixas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GISShape, GISImage, SVOLegend, ExtCtrls, GISReadWrite, StdCtrls,
  Menus, MyAccess, ShellAPI, JPeg, Buttons, AdvToolBtn;

type
  TFFaixas = class(TForm)
    Panel1: TPanel;
    SVOLegend: TSVOLegend;
    SVOGISImage1: TSVOGISImage;
    SVOGISReadWrite1: TSVOGISReadWrite;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    MainMenu1: TMainMenu;
    Imprimir1: TMenuItem;
    AdvToolButton5: TAdvToolButton;
    procedure FormShow(Sender: TObject);
    procedure SVOGISImage1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SVOGISImage1AddShapeList(Sender: TObject;
      AShapeList: TSVOShapeList);
    procedure AdvToolButton5Click(Sender: TObject);
  private
    { Private declarations }
    procedure abreHint();
    function MontaQuadroHintUF(UF:String):String;
    procedure OpenShapeFile(const FileName: String; clearShapes: Boolean=True);
    procedure ReleaseHint;
    procedure ClearShapeLists;
    procedure PintaMapa_Brasil();
    procedure abreFaixas();
    function buscaFaixa(valor_teste:double):Integer;
    function buscaFormato(tipo:string):string;
    procedure imprimeRelbrasilUF();
    procedure imprimeTabelaRel1(query:TMyquery;valor_compara:Double;HTML:TStringList;NomeMostra:String);
    procedure abreArquivonoTemp(Arq:String);
    procedure CriaBMP(cor:Integer;arquivo:String);
    procedure Bmp2Jpeg(Bmp: TBitmap; JpgFileName: string);
  public
    { Public declarations }
    id_indicador:Integer;
    ano:String;
    titulo:string;

  end;

var
  FFaixas: TFFaixas;
  fHintVisible:Boolean;
  FImageHint : THintWindow;
  Legendas:TstringList;

implementation

{$R *.dfm}
uses dynamicArrayUnit, DrawMarkUnit, DataFields,Udm, Uprincipal, DB;

procedure TFFaixas.FormShow(Sender: TObject);
begin
OpenShapeFile('Brazil.shp');
abreHint();
abreFaixas();
PintaMapa_Brasil();
end;

procedure TFFaixas.ClearShapeLists;
var
  i : Integer;
  AShapeList : TSVOShapeList;
begin
  // This will automatically clear our shape lists and any strata we made.
  SVOGISReadWrite1.ShapeList := Nil;
  FOR i := SVOGISImage1.ShapeLists.Count - 1 DOWNTO 0 DO BEGIN
    AShapeList := SVOGISImage1.ShapeList[i];
    IF NOT AShapeList.HasParent THEN
      AShapeList.Free;
  END;
  SVOGISImage1.ShapeLists.Clear;
  SvoGisImage1.UpdateCanvas;
end;

procedure TFFaixas.ReleaseHint;
begin
  IF FHintVisible THEN
    FImageHint.ReleaseHandle;
  FHintVisible := False;
end;

procedure TFFaixas.OpenShapeFile(const FileName: String; clearShapes: Boolean=True);
var
  NewShapeList : TSVOShapeList;
begin
   // Create a new shape list for the file name passed.

   ReleaseHint;

   //IF clearShapes THEN
     ClearShapeLists;

   NewShapeList := TSVOShapeList.Create;
   NewShapeList.GraphicStyles.Brush.Color := form1.cor;
   

   SVOGISReadWrite1.ShapeList := NewShapeList;
   SVOGISReadWrite1.ImportFileName := FileName;
   SVOGISReadWrite1.ReadFile;

end;

procedure TFFaixas.abreFaixas();
begin
  if dm.qFaixas.active then dm.qFaixas.active:=false;
  dm.qFaixas.Params[0].asInteger:=id_indicador;
  dm.qFaixas.Params[1].asString:=ano;
  dm.qFaixas.active:=true;
end;

function TFFaixas.buscaFormato(tipo:string):string;
begin
   if tipo = 'Quantidade' then
         begin
         result := '###,###,###,###';
         end;
   if tipo = 'Índice' then
         begin
         result := '###,###,###,##0.000';
         end;
   if tipo = 'Valor' then
         begin
         result := '###,###,###,##0.00';
         end;
   if tipo = 'Percentual' then
         begin
         result := '###,###,###,##0.00';
         end;
   if tipo = 'Taxa' then
         begin
         result := '###,###,###,##0.00';
         end;
end;



procedure TFFaixas.abreHint();
begin
  if dm.qHint_Faixa.active then dm.qHint_Faixa.active:=false;
  dm.qHint_Faixa.Params[0].asInteger:=id_indicador;
  dm.qHint_Faixa.Params[1].asString:=ano;
  dm.qHint_Faixa.active:=true;
  dm.qHintValor.DisplayFormat:=buscaFormato(dm.qHintTipo.asString);

    label1.Caption:=titulo;
    Label4.Caption:=dm.qHint_FaixaItem.asString;

     if dm.qHint_FaixaZona.asString<> '' then
     begin
       Label6.Caption:= dm.qHint_FaixaZona.asString;
     end
     else
     begin
        Label6.Visible:=false;
        Label5.Visible:=false;
     end;

     if dm.qHint_FaixaQualificador.asString<> '' then
     begin
       Label8.Caption:= dm.qHint_FaixaQualificador.asString;
     end
     else
     begin
        Label7.Visible:=false;
        Label8.Visible:=false;
     end;

     Label10.caption := dm.qHint_FaixaAno.asString;
     Label12.Caption:= dm.qHint_FaixaFonte.AsString;

end;

function TFFaixas.buscaFaixa(valor_teste:double):Integer;
begin
  dm.qFaixas.First;
  Legendas.clear;
  Legendas.Add('Legenda');
  while not dm.qFaixas.Eof do
  begin
    //result:=100;
    if (valor_teste>=dm.qFaixasvalor_ini.AsFloat) then
    begin
      if (dm.qFaixasvalor_fim.AsFloat<>-1) then
      begin
        if (valor_teste<= dm.qFaixasvalor_fim.AsFloat) then
        begin
          result:= dm.qFaixasnr_faixa.asInteger;
        end;
      end
      else
      begin
        result:= dm.qFaixasnr_faixa.asInteger;
      end;
    end;
    if Legendas.IndexOf(dm.qFaixasdesc_faixa.asString)=-1 then
    begin
      Legendas.Add(dm.qFaixasdesc_faixa.asString);
    end;
    dm.qFaixas.Next;
  end;
end;

procedure TFFaixas.PintaMapa_Brasil();
var
  AShape : TSVOShapeObject;
  aField,aFieldX : TSVODataField;
  AShapeList : TSVOShapeList;
  valor_unico:integer;
  Indice:integer;
  valor_teste:double;
begin

  IF Assigned(SVOGISImage1.ActiveLayer) THEN BEGIN

    IF SVOGISImage1.ActiveLayer.HasParent THEN
      AShapeList := SVOGISImage1.ActiveLayer.ParentShapeList
    ELSE
      AShapeList := SVOGISImage1.ActiveLayer;

    // Check to see if a "crime" field exists, and if not create it.
    IF AShapeList.DataFields.FieldNames.IndexOf('CRIMES') < 0 THEN BEGIN
       aField := AShapeList.DataFields.AddField;
       aField.Caption := 'CRIMES';
       aField.FieldType := ctInteger;

       aFieldX := AShapeList.DataFields.AddField;
       aFieldX.Caption := 'Valor';
       aFieldX.FieldType := ctFloat;

    END;



    // Normally, we would load the crime data from a file or database based on the date selected,
    // but here for example we just create some random numbers:
    AShapeList.Records.First;
    WHILE NOT AShapeList.Records.EOF DO BEGIN


    IF AShapeList.DataFields.FieldNames.IndexOf('NOME_UF') >= 0 THEN
    begin
     if dm.qHint_Faixa.Locate('UF',AShapeList.DataFields.FieldByName('UF').AsString,[]) then
       valor_teste := dm.qHint_FaixaValor.AsFloat
     else
       valor_teste := -1;




       {if (valor_teste = dm.qValBrasilValor.AsFloat) then
       begin
        valor_unico:=1;
        PassouBrasilIgual:=true;
        PassouIgual:=true;
       end;


       if (valor_teste > dm.qValBrasilValor.AsFloat) then
       begin
        valor_unico:=2;
        PassouMaior:=true;
       end ;


       if (valor_teste < dm.qValBrasilValor.AsFloat) then
       begin
        valor_unico:=3;
        PassouMenor:=true;
       end;


       if (valor_teste = -1) and (valor_teste<>-1) then
       begin
        valor_unico:=4;
        PassouSem:=true;
       end;  }

         AShapeList.DataFields.FieldByName('Valor').AsFloat := valor_teste;

         if ((AShapeList.DataFields.FieldByName('UF').AsString = '') and (AShapeList.DataFields.FieldByName('Nome_UF').AsString = 'Litígio')) then
         begin
          if id_indicador = 23 then
            AShapeList.DataFields.FieldByName('CRIMES').AsInteger := 1
          else
            AShapeList.DataFields.FieldByName('CRIMES').AsInteger := 2
         end
         else
         begin
           AShapeList.DataFields.FieldByName('CRIMES').AsInteger := buscaFaixa(valor_teste);
         end
         // -1 sem valor

      end;
       AShapeList.Records.Next;
    END;



    AShapeList.StrataVars.ScaleIncrement := 1;

    if id_indicador = 23 then
    begin
      AShapeList.StrataVars.InitialValue := '1';
      //Legendas.Delete(1);
    end
    else
    begin
      AShapeList.StrataVars.InitialValue := '1';
    end;

    AShapeList.StrataVars.ScaleIncrements := true;


    AShapeList.StrataVars.StrataType := straVariable;
    AShapeList.StrataVars.StrataField := 'CRIMES';

    //AShapeList.StrataVars.StartColor:=$ff3535; azul com azul
    //AShapeList.StrataVars.EndColor:=$ffff35;

    AShapeList.StrataVars.StartColor:=$0099ff;
    AShapeList.StrataVars.EndColor:=$00ffff;





      AShapeList.StrataVars.GetStrata;








    // straVariable means we want to use the StrataField value set above.


    // We have to call Draw to show the strata.
    SVOGISImage1.Draw;
  
  END;
  //valorMesmaFaixa(formatfloat(dm.qValBrasilValor.DisplayFormat,dm.qValBrasilValor.AsFloat));

end;




function TFFaixas.MontaQuadroHintUF(UF:String):String;
var montaSTR:string;
begin

  if dm.qHint_Faixa.Locate('UF',UF,[]) then
  begin


               montaSTR :='UF ='+UF+#13+'Indi ='+dm.qHint_FaixaNomeRedu.asString+#13;
               montastr:=montastr+'Var ='+dm.qHint_FaixaItem.asString+#13;

               if dm.qHint_FaixaZona.asString<> '' then
               begin
                 montaSTR:= montaSTR+'Fil I ='+dm.qHint_FaixaZona.asString+#13;
               end;

               if dm.qHint_FaixaQualificador.asString<> '' then
               begin
                 montaSTR:= montaSTR+'Fil II ='+dm.qHint_FaixaQualificador.asString+#13;
               end;

               montaSTR := montaSTR+'Ano ='+dm.qHint_FaixaAno.asString+#13+'Valor ='+formatfloat(dm.qHint_FaixaValor.DisplayFormat,dm.qHint_FaixaValor.asFloat);


  end
  else
  begin

    montaSTR:='Sem informação';
  end;
  result:=montaSTR;

end;


procedure TFFaixas.SVOGISImage1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  inPnt : Boolean;
  AShape : Integer;
  Distance : Double;
  aHint : String;
  RelativePoint : TPoint;
  ARect : TRect;
  pnt : TDoublePoint;

  IndiceIbge : Integer;
  montaSTR:String;
begin
  // Show hint
  IF (SVOGisImage1.Mode = moDefault) THEN BEGIN
    IF Not Assigned(SvoGisImage1.ActiveLayer) THEN Exit;
    pnt := SvoGisImage1.GetActualDataMouseXY(X,Y);
    Distance := SvoGisImage1.ActiveLayer.WhichShape(AShape, pnt.X, pnt.Y);
    // WhichShape finds the nearest point or line, or the polygon containing X,Y
    // Thus we have to reject points and lines too far away and not show hints.
    IF (SvoGisImage1.ActiveLayer.ShapeType IN [stPoint,stLine]) THEN
      inPnt := Distance<=5
    ELSE
      inPnt := True;
    IF (AShape>=0) AND inPnt THEN
      BEGIN

        IF SvoGisImage1.ActiveLayer.DataFields.FieldNames.IndexOf('NOME_UF') >= 0 THEN
        //AHint := SvoGisImage1.ActiveLayer.Items[AShape].FieldByName('NOME_UF').asString
        begin
           IF SvoGisImage1.ActiveLayer.DataFields.FieldNames.IndexOf('UF') >= 0 THEN
           begin

               AHint:=MontaQuadroHintUF(SvoGisImage1.ActiveLayer.Items[AShape].FieldByName('UF').asString);

               //AHint := SvoGisImage1.ActiveLayer.Items[AShape].FieldByName('UF').asString;
           end
           ELSE
           begin
               AHint := 'X:' + FloatToStrF(pnt.X,ffFixed,15,4) + ', Y:' + FloatToStrF(pnt.Y,ffFixed,15,4);
           end;
        end
        ELSE
        begin
            IF SvoGisImage1.ActiveLayer.DataFields.FieldNames.IndexOf('GEOCODIGO') >= 0 THEN
            begin
              //AHint:=MontaQuadroHintMuni(SvoGisImage1.ActiveLayer.Items[AShape].FieldByName('GEOCODIGO').asString);
                //AHint := SvoGisImage1.ActiveLayer.Items[AShape].FieldByName('NOME').asString;

            end
            ELSE
            begin
               AHint := 'X:' + FloatToStrF(pnt.X,ffFixed,15,4) + ', Y:' + FloatToStrF(pnt.Y,ffFixed,15,4);
            end;
        end;

        IF NOT(FHintVisible) THEN
          FImageHint := THintWindow.Create(Self);
        FHintVisible := True;
        ARect := FImageHint.CalcHintRect(150, AHint, Nil);
        RelativePoint := SvoGisImage1.ClientToScreen(Point(X, Y));
        FImageHint.ActivateHint(Rect(RelativePoint.X + 10, RelativePoint.Y + 10, RelativePoint.X + 10 + ARect.Right, RelativePoint.Y + 10 + ARect.Bottom), AHint);
      END
    ELSE BEGIN
      IF (FHintVisible) THEN
        FImageHint.ReleaseHandle;
      FHintVisible := False;
    END;
    Application.ShowHint := True;
    FOldX := X;
    FOldY := Y;
  END
  ELSE BEGIN
      IF (FHintVisible) THEN
        FImageHint.ReleaseHandle;
      FHintVisible := False;
  END;
end;

procedure TFFaixas.FormCreate(Sender: TObject);
begin
Legendas:=TStringList.create();
end;

procedure TFFaixas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
Legendas.Free;
ReleaseHint;
dm.qHint_Faixa.Active:=false;
dm.qFaixas.active:=false;
end;

procedure TFFaixas.SVOGISImage1AddShapeList(Sender: TObject;
  AShapeList: TSVOShapeList);
Var
i,iniI:integer;
begin
  SVOLegend.Panels(0).DisplayName:='Brasil';

  if SVOLegend.Items.Count>1 then
  begin
    for i:=1 to  SVOLegend.Items.Count-1 do
    begin
      if Legendas.Strings[i-1]<> null then
        SVOLegend.Panels(i).DisplayName:=Legendas.Strings[i];
    end;
  end;
  SVOGISImage1.SelectedShapeList:=SVOLegend.ShapeList[0];
end;





procedure TFFaixas.imprimeTabelaRel1(query:TMyquery;valor_compara:Double;HTML:TStringList;NomeMostra:String);
var
Formato,nome_img:String;
flip,passei:boolean;
faixa, guardaFaixa:integer;

begin
  query.first;
  passei:=false;
  formato:=buscaFormato(query.FieldByName('tipo').AsString);
  flip:=true;
  guardaFaixa:=buscaFaixa(query.FieldByName('valor').AsFloat);
     {if (dm.qFaixas.recordcount+1 <> SVOLegend.Items.Count) then
     begin
      guardaFaixa:=guardaFaixa-1;
     end;  }
  html.add('<tr class="titulo">');
  html.add('<td><img src="Faixa_'+inttostr(guardaFaixa)+'.jpg" alt="">');
  html.add(SVOLegend.Panels(guardaFaixa).DisplayName);
  html.add('</td>');
  HTML.Add('  <td align="right">Valor</td>');
  html.add('</tr>');
while not query.Eof do
begin
      faixa:=buscaFaixa(query.FieldByName('valor').AsFloat);


     {if (dm.qFaixas.recordcount+1 <> SVOLegend.Items.Count) then
     begin
      faixa:=faixa-1;
     end;}





   if (query.FieldByName('valor').AsFloat < dm.qBrasilValor.asFloat) and (not Passei) then
   begin
      HTML.Add('<tr class="seleciona">');
      HTML.Add('<td>');
      HTML.Add('BRASIL');
      HTML.Add('</td>');
      HTML.Add('<td align="right">');
      HTML.Add(formatfloat(form1.buscaFormato(dm.qBrasilTipo.asString),dm.qBrasilValor.asFloat));
      HTML.Add('</td>');
      HTML.Add('</tr>');
      Passei:=true;
   end;
   if guardaFaixa<>faixa then
     begin
        guardaFaixa:=faixa;
        html.add('<tr class="titulo">');
  html.add('<td><img src="Faixa_'+inttostr(guardaFaixa)+'.jpg" alt="">');
  html.add(SVOLegend.Panels(guardaFaixa).DisplayName);
  html.add('</td>');
  HTML.Add('  <td align="right">Valor</td>');
  html.add('</tr>');
  flip:=true;
     end;
   if not flip then
      HTML.Add('<tr>')
   else
      HTML.Add('<tr class="zebra">');

     flip:= not flip;


     HTML.Add('<td>'+query.FieldByName(NomeMostra).AsString+'</td>');
     if query.FieldByName('valor').AsFloat<>-1 then
      HTML.Add('<td align="right">'+formatfloat(formato,query.FieldByName('valor').AsFloat)+'</td>')
     else
      HTML.Add('<td align="right">sem informação</td>');
     HTML.Add('</tr>');




query.Next;
end;
end;

procedure TFFaixas.abreArquivonoTemp(Arq:String);
begin
 try
    shellexecute(handle,'open',pchar('C:\HTML_Banco\'+Arq),nil,nil,SW_SHOW);
  except
    showMessage('Erro na leitura do arquivo');
  end;
end;




procedure TFFaixas.imprimeRelbrasilUF();
Var HTML:TStringList;
valor_compara:Double;
largura, altura, i : integer;
begin
  //PintaMapa_Brasil();
  HTML := TStringList.Create;
  HTML.Add(form1.Memo1.Lines.GetText);
    if dm.qBrasil.active then dm.qBrasil.active:=false;
  dm.qBrasil.Params[0].asInteger:=id_indicador;
  dm.qBrasil.Params[1].asString:=ano;
  dm.qBrasil.Active :=true;

  {HTML.Add('<tr class="titulo">');
  HTML.Add('  <td><strong>Brasil</strong></td>');
  HTML.Add('  <td align="right"><strong>'+formatfloat(form1.buscaFormato(dm.qBrasilTipo.asString),dm.qBrasilValor.asFloat)+'</strong></td>');
  HTML.Add('</tr>');}

  HTML.Add('<table width="100%">');
  HTML.Add('<tr class="titulo">');
  HTML.Add('  <td colspan="3">'+Titulo+'</td>');
  HTML.Add('  <td align="right"><strong>Brasil = '+formatfloat(form1.buscaFormato(dm.qBrasilTipo.asString),dm.qBrasilValor.asFloat)+'</strong></td>');
  HTML.Add('</tr>');
  HTML.Add('</table>');




  largura := SVOGISImage1.Width;
  altura  := SVOGISImage1.Height;

  //If largura > 750 then
  //begin
  largura := trunc(largura * 1);
  altura  := trunc(altura * 1);
  //end;

  SVOGISImage1.SaveAsJPEG('c:\HTML_Banco\municipio.jpg',SVOGISImage1.Width,100,jpBestSpeed,jf24Bit,false,false);




  HTML.Add('<table width="100%">');
  HTML.Add('<tr>');
  HTML.Add('<td>');
  //HTML.Add('<div align="center"><img src="municipio.jpg" width="400" height="360"></div>');
  HTML.Add('<div align="center"><img src="municipio.jpg"></div>');
  HTML.Add('</td>');
  HTML.Add('</tr>');
  HTML.Add('</table>');









  //HTML.Add('<table width="50%" align="center">');
  //HTML.Add('<tr>');
  for i:=0 to  SVOLegend.Items.Count-1 do
  begin
   CriaBMP(SVOLegend.Panels(i).GraphicStyles.Brush.Color,'C:\HTML_Banco\Faixa_'+inttostr(i)+'.jpg');
   //HTML.Add('  <td><img src="Faixa_'+inttostr(i)+'.jpg" alt="faixa '+inttostr(i)+'" /></td>');
   //HTML.Add('  <td>'+SVOLegend.Panels(i).DisplayName+'</td>');
  end;
   //HTML.Add('</tr>');





  HTML.Add('<table width="50%" align="center">');




  if dm.qRelUFBrasil_faixas.active then dm.qRelUFBrasil_faixas.active:=false;
  dm.qRelUFBrasil_faixas.Params[0].asInteger:=id_indicador;
  dm.qRelUFBrasil_faixas.Params[1].asString:=ano;

  dm.qRelUFBrasil_faixas.Params[2].asInteger:=id_indicador;
  dm.qRelUFBrasil_faixas.Params[3].asString:=ano;
  dm.qRelUFBrasil_faixas.Active :=true;
  dm.qRelUFbrasilValor.DisplayFormat:=form1.buscaFormato(dm.qRelUFbrasilTipo.asString);



  imprimeTabelaRel1(dm.qRelUFBrasil_faixas,valor_compara,HTML,'UF');



  HTML.Add('</table>');
  {
  HTML.Add('<table width="98%" border="0" align="center">');
  HTML.Add('<tr>');
  HTML.Add('<td> ');
  HTML.Add('<img src="rodape.jpg" alt="cenpec" />');
  HTML.Add('</td>');
  HTML.Add('</tr>');
  HTML.Add('</table>'); }
  try
    html.SaveToFile('c:\HTML_Banco\Brasil.html');
  except




  end;
  abreArquivonoTemp('Brasil.html');
  //limpaPintura();
end;



procedure TFFaixas.Bmp2Jpeg(Bmp: TBitmap; JpgFileName: string);
var
  Jpg: TJPEGImage;
begin
  Jpg := TJPEGImage.Create;
  try
    Jpg.Assign(Bmp);
    Jpg.SaveToFile(JpgFileName);
  finally
    Jpg.Free;
  end;
end;


Procedure TFFaixas.CriaBMP(cor:Integer;arquivo:String);
var
b1:Tbitmap;
begin
  b1 := Tbitmap.Create;
  b1.Height := 13;
  b1.Width  := 28;
  b1.Canvas.Pixels[13,28];
  b1.Canvas.Brush.Color := cor;//$00FFCC99;
  b1.Canvas.Brush.Style := bsSolid;
  b1.Canvas.Pen.Color   := cor;//$00FFCC99;
  b1.Canvas.Pen.Style   := psSolid;
  b1.Canvas.Pen.Mode    := pmCopy;
  b1.Canvas.Draw(13,28,b1);
  b1.Canvas.FillRect(b1.Canvas.ClipRect);
  Bmp2Jpeg(b1,arquivo);
  b1.Free;
end;



procedure TFFaixas.AdvToolButton5Click(Sender: TObject);
begin
imprimeRelbrasilUF();
end;

end.
