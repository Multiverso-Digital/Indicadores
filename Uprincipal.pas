unit Uprincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, HTTPApp, DBWeb, DBBdeWeb, GISReadWrite,
  Menus, GISShape, GISImage, SVOLegend, RXSplit, ComCtrls, ToolWin,
  Buttons, Grids, DBGrids, CRGrid, ExtCtrls,ShellAPI, RxLookup, MyAccess, DataFields, JPeg,
  mxExport, DB;

type
  TForm1 = class(TForm)
    Panel2: TPanel;
    GridBrasil: TCRDBGrid;
    GridVal: TCRDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ToolBar1: TToolBar;
    ToolButtonBack: TToolButton;
    ToolButton8: TToolButton;
    ToolButtonZoomIn: TToolButton;
    ToolButtonZoomOut: TToolButton;
    ToolButtonPan: TToolButton;
    ToolButtonReset: TToolButton;
    ToolButtonExecuteCrimeMonth: TToolButton;
    ToolButton4: TToolButton;
    ToolButtonGrid: TToolButton;
    ToolButton5: TToolButton;
    ToolButton2: TToolButton;
    Panel1: TPanel;
    ToolButton1: TToolButton;
    RxSplitter1: TRxSplitter;
    SVOLegend: TSVOLegend;
    SVOGISImage1: TSVOGISImage;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Informao1: TMenuItem;
    Histricodoprogramamelhoria1: TMenuItem;
    Apresentao1: TMenuItem;
    Indicadores1: TMenuItem;
    Glossrio1: TMenuItem;
    CensoDemogrfico1: TMenuItem;
    Censoescolar1: TMenuItem;
    Dependnciaadministrativa1: TMenuItem;
    Domiclioconceitoeclassificao1: TMenuItem;
    Fundeb1: TMenuItem;
    Indicadorsocial1: TMenuItem;
    niveiseModalidadesdaEducaoBsica1: TMenuItem;
    Oramentopblico1: TMenuItem;
    rgoseinstitutos1: TMenuItem;
    DATASUS1: TMenuItem;
    IBGE1: TMenuItem;
    INEP1: TMenuItem;
    IPEA1: TMenuItem;
    PNUD1: TMenuItem;
    SIAFI1: TMenuItem;
    UNICEF1: TMenuItem;
    Sobre1: TMenuItem;
    SVOGISReadWrite1: TSVOGISReadWrite;
    QueryTableProducer1: TQueryTableProducer;
    ImageList: TImageList;
    ImageList1: TImageList;
    Memo1: TMemo;
    CBMuni: TRxDBLookupCombo;
    CBGrupo: TRxDBLookupCombo;
    CBUF: TRxDBLookupCombo;
    CBIndica: TRxDBLookupCombo;
    CBItem: TRxDBLookupCombo;
    CBZona: TRxDBLookupCombo;
    CBquali: TRxDBLookupCombo;
    cbano: TRxDBLookupCombo;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    PopupMenu1: TPopupMenu;
    Exportar1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    Navegao2: TMenuItem;
    N1: TMenuItem;
    Verso1: TMenuItem;
    ToolButton7: TToolButton;
    ColorDialog1: TColorDialog;
    Crditos1: TMenuItem;
    dsBrasil: TDataSource;
    dsUf: TDataSource;
    GridBrasil_falso: TDBGrid;
    GridVal_falso: TDBGrid;
    mxDBGridExport1: TmxDBGridExport;
    Imprimir1: TMenuItem;
    Imprimir2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SVOGISImage1Click(Sender: TObject);
    procedure ToolButtonBackClick(Sender: TObject);
    procedure SVOGISImage1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CBUFChange(Sender: TObject);
    procedure CBMuniCloseUp(Sender: TObject);
    procedure CBGrupoChange(Sender: TObject);
    procedure CBIndicaChange(Sender: TObject);
    procedure CBMuniChange(Sender: TObject);
    procedure CBItemChange(Sender: TObject);
    procedure CBZonaChange(Sender: TObject);
    procedure CBqualiChange(Sender: TObject);
    procedure cbanoChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButtonZoomInClick(Sender: TObject);
    procedure ToolButtonZoomOutClick(Sender: TObject);
    procedure ToolButtonPanClick(Sender: TObject);
    procedure ToolButtonResetClick(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Histricodoprogramamelhoria1Click(Sender: TObject);
    procedure Apresentao1Click(Sender: TObject);
    procedure Navegao1Click(Sender: TObject);
    procedure Indicadores1Click(Sender: TObject);
    procedure CensoDemogrfico1Click(Sender: TObject);
    procedure Censoescolar1Click(Sender: TObject);
    procedure Dependnciaadministrativa1Click(Sender: TObject);
    procedure Domiclioconceitoeclassificao1Click(Sender: TObject);
    procedure Fundeb1Click(Sender: TObject);
    procedure Indicadorsocial1Click(Sender: TObject);
    procedure niveiseModalidadesdaEducaoBsica1Click(Sender: TObject);
    procedure Oramentopblico1Click(Sender: TObject);
    procedure DATASUS1Click(Sender: TObject);
    procedure IBGE1Click(Sender: TObject);
    procedure INEP1Click(Sender: TObject);
    procedure IPEA1Click(Sender: TObject);
    procedure PNUD1Click(Sender: TObject);
    procedure SIAFI1Click(Sender: TObject);
    procedure UNICEF1Click(Sender: TObject);
    procedure ToolButtonExecuteCrimeMonthClick(Sender: TObject);
    procedure SVOGISImage1AddShapeList(Sender: TObject;
      AShapeList: TSVOShapeList);
    procedure ToolButtonGridClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure Navegao2Click(Sender: TObject);
    procedure Verso1Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Imprimir2Click(Sender: TObject);
    procedure Crditos1Click(Sender: TObject);
  private
    { Private declarations }
    procedure corrigeLegenda(Sender: TObject;E:Exception);
    procedure OpenShapeFile(const FileName: String; clearShapes: Boolean=True);
    procedure ReleaseHint;
    procedure ClearShapeLists;
    function DelTree(DirName : string): Boolean;
    procedure MudaGrid(I:integer);

    procedure abreTabelas();
    procedure abremapaBrasil();
    procedure abreQMuni(UF:String);
    procedure abreMapaUF(UF:String);
    procedure piscaMunicipio(IBGE:String);
    procedure filtraIndicadores();
    procedure colocaFiltro(query:TMyQuery);
    procedure filtraBrasil();
    procedure filtraMuni();
    procedure colocaFonte();
    procedure abreArquivonoCD(arq:string);
    procedure mudaHint();
    function MontaQuadroHintUF(UF:String):String;
    function MontaQuadroHintMuni(IBGE:String):String;
    function PintaMapa_Brasil():Boolean;
    function pintaMapa_UF():boolean;
    procedure limpaPintura();

    procedure arrumaFormatFloat();
    procedure imprimeRelbrasilUF();
    procedure imprimeTabelaRel1(query:TMyquery;valor_compara:Double;HTML:TStringList;NomeMostra:String;temCores:Boolean);
    procedure abreArquivonoTemp(Arq:String);
    procedure imprimeRelUFMuni();

    procedure avisaSemInfo();
    function BuscaLegenda(painel:Integer;valor:String):String;
    function valorMesmaFaixa(valor:string):Boolean;

    procedure montaCabecalho(titulos:TDBGridColumns);
    procedure imprimiValores(grid:TDBGrid);
    procedure imprimirTabela(grid:TDBGrid);
    procedure colocarodape();
    procedure colocaInfos(grid:TDBGrid);

    function colortohtml(s:string):string;
    procedure OrdenaColunas(Grid:TcrDBgrid);




  public
    { Public declarations }
    cor:Tcolor;
    procedure abreIndicadores();
    procedure montaCBFiltroItem();
    procedure montaCBFiltroZona();
    procedure montaCBFiltroQuali();
    procedure montaCBFiltroAno();
    procedure abreHint(id_indicador:Integer;ano:string);
    function buscaFormato(tipo:string):string;

  end;

var
  Form1: TForm1;

  fHintVisible, PassouBrasilIgual,PassouMaior,PassouMenor,PassouIgual,PassouSem : Boolean;
  FImageHint : THintWindow;
  FOldX, FOldY : Integer;
  guardaIBGE:String;
  //cor:Tcolor;
  prima:Boolean;
  arq:Tstringlist;
implementation

{$R *.dfm}

uses dynamicArrayUnit, DrawMarkUnit, FileCtrl, Udm, Ufiltro, Ugrafico,
  GridUnit, Ufaixas, UmenuImpressao, Usobre, UmenuImp;//, GridUnit, Ugrafico, Ufiltro;

procedure TForm1.corrigeLegenda(Sender: TObject;E:Exception);
begin
  if E.ClassType <> EReadError then
    ShowMessage(E.Message);
end;


procedure TForm1.FormCreate(Sender: TObject);
var
Origem,Destino:String;
begin
prima:=true;

 if not DirectoryExists('C:\HTML_Banco') then
  begin
    try
      CreateDir('C:\HTML_Banco\');

      Origem := dm.Dire+'\HTML\cabecalho.jpg';
      Destino := 'C:\HTML_Banco\cabecalho.jpg';
      CopyFile(PChar(Origem), PChar(Destino), true);

      Origem := dm.Dire+'\HTML\rodape.jpg';
      Destino := 'C:\HTML_Banco\rodape.jpg';
      CopyFile(PChar(Origem), PChar(Destino), true);

      Origem := dm.Dire+'\HTML\igual.gif';
      Destino := 'C:\HTML_Banco\igual.gif';
      CopyFile(PChar(Origem), PChar(Destino), true);

      Origem := dm.Dire+'\HTML\maior.gif';
      Destino := 'C:\HTML_Banco\maior.gif';
      CopyFile(PChar(Origem), PChar(Destino), true);

      Origem := dm.Dire+'\HTML\menor.gif';
      Destino := 'C:\HTML_Banco\menor.gif';
      CopyFile(PChar(Origem), PChar(Destino), true);

      Origem := dm.Dire+'\HTML\seminfo.gif';
      Destino := 'C:\HTML_Banco\seminfo.gif';
      CopyFile(PChar(Origem), PChar(Destino), true);


    except
      exit;
    end;
  end;

Application.OnException := corrigeLegenda;
cor:=$D2D2D2;
end;

procedure TForm1.colocaFiltro(query:TMyQuery);
var monta:TstringList;
begin
  monta:=TStringList.Create;
  if CBItem.DisplayValue<>'' then
  begin
    monta.add('id_item='+cbItem.KeyValue);
    monta.add('and');
  end;
  if CBZona.DisplayValue<>'' then
  begin
    monta.add('id_zona='+cbzona.KeyValue);
    monta.add('and');
  end;
  if CBquali.DisplayValue<>'' then
  begin
    monta.add('id_qualificador='+CBquali.KeyValue);
    monta.add('and');
  end;
  if CBano.DisplayValue<>'' then
  begin
    monta.add('ano='+cbano.KeyValue);
    monta.add('and');
  end;
  if monta.Count>0 then
  begin
    monta.Delete(monta.Count-1);
    query.Filter:=monta.Text;
    query.Filtered:=true;
  end
  else
  begin
    query.Filtered:=false;
  end;




end;

procedure TForm1.filtraBrasil();
begin
  if dm.qValBrasil.active then dm.qValBrasil.active:=false;
  dm.qValBrasil.Params[0].asInteger:=dm.qGruposID_Grupo.asInteger;
  dm.qValBrasil.Params[1].asInteger:=dm.qIndicadorID_nome.asInteger;
  colocaFiltro(dm.qValBrasil);
  dm.qValBrasil.active:=true;
end;

procedure TForm1.filtraMuni();
begin
  if dm.qValMuni.active then dm.qValMuni.active:=false;
  dm.qValMuni.Params[0].asInteger:=dm.qCidadesID_Localidade.asInteger;
  dm.qValMuni.Params[1].asInteger:=dm.qGruposID_Grupo.asInteger;
  dm.qValMuni.Params[2].asInteger:=dm.qIndicadorID_nome.asInteger;
  colocaFiltro(dm.qValMuni);
  dm.qValMuni.active:=true;

  
end;


procedure TForm1.filtraIndicadores();
begin
  if cbmuni.DisplayValue='' then
  begin
    filtraBrasil();
    MudaGrid(1);
  end
  else
  begin

    filtraMuni();
    MudaGrid(2);
  end;
  arrumaFormatFloat();
end;

procedure TForm1.abreIndicadores();
begin

  if dm.qIndicador.active then dm.qIndicador.active:=false;
  dm.qIndicador.Params[0].asInteger:=dm.qGruposID_Grupo.AsInteger;
  dm.qIndicador.active:=true;
  dm.qIndicador.first;
  CBIndica.DisplayValue:=dm.qIndicadornomeredu.asString;
  
end;

procedure TForm1.montaCBFiltroZona();
begin

  if dm.qFiltroZona.active then dm.qFiltroZona.active:=false;
  dm.qFiltroZona.Params[0].AsInteger:=dm.qGruposID_Grupo.asInteger;
  dm.qFiltroZona.Params[1].AsInteger:=dm.qIndicadorID_nome.asInteger;
  dm.qFiltroZona.active :=true;
  if dm.qFiltroZona.RecordCount<=1 then
  begin

    Label6.Visible:=false;
    CBZona.Visible:=false;
    GridBrasil.Columns[1].Visible:=false;
    GridBrasil_falso.Columns[3].Visible:=false;
    GridVal.Columns[1].Visible:=false;
    GridVal_falso.Columns[5].Visible:=false;
  end
  else
  begin
    Label6.Visible:=true;
    CBZona.Visible:=true;
    GridBrasil.Columns[1].Visible:=true;
    GridBrasil_falso.Columns[3].Visible:=true;

    GridVal.Columns[1].Visible:=true;
    GridVal_falso.Columns[5].Visible:=true;
  end;


  CBZona.DisplayValue:='';
end;

procedure TForm1.montaCBFiltroAno();
begin
  if dm.qFiltroAno.active then dm.qFiltroAno.active:=false;
  dm.qFiltroAno.Params[0].AsInteger:=dm.qGruposID_Grupo.asInteger;
  dm.qFiltroAno.Params[1].AsInteger:=dm.qIndicadorID_nome.asInteger;
  dm.qFiltroAno.active :=true;
  if dm.qFiltroano.RecordCount < 2 then
  begin
    label8.Visible:=false;
    cbano.Visible:=false;
  end
  else
  begin
    label8.Visible:=true;
    cbano.Visible:=true;
  end;
  CBAno.DisplayValue:='';
  
end;

procedure TForm1.montaCBFiltroQuali();
begin

  if dm.qFiltroquali.active then dm.qFiltroquali.active:=false;
  dm.qFiltroquali.Params[0].AsInteger:=dm.qGruposID_Grupo.asInteger;
  dm.qFiltroquali.Params[1].AsInteger:=dm.qIndicadorID_nome.asInteger;
  dm.qFiltroquali.active :=true;

  if dm.qFiltroquali.RecordCount<=1 then
  begin
    Label7.Visible:=false;
    CBquali.Visible:=false;
    GridBrasil.Columns[2].Visible:=false;
    GridBrasil_falso.Columns[4].Visible:=false;
    GridVal.Columns[2].Visible:=false;
    GridVal_falso.Columns[6].Visible:=false;
  end
  else
  begin
    Label7.Visible:=true;
    CBquali.Visible:=true;
    GridBrasil.Columns[2].Visible:=true;
    GridBrasil_falso.Columns[4].Visible:=true;
    GridVal.Columns[2].Visible:=true;
    GridVal_falso.Columns[6].Visible:=true;
  end;
  CBquali.DisplayValue:='';
end;

procedure TForm1.montaCBFiltroItem();
begin

  if dm.qFiltroItem.active then dm.qFiltroItem.active:=false;
  dm.qFiltroItem.Params[0].AsInteger:=dm.qGruposID_Grupo.asInteger;
  dm.qFiltroItem.Params[1].AsInteger:=dm.qIndicadorID_nome.asInteger;
  dm.qFiltroItem.active :=true;

  if dm.qGruposID_Grupo.asInteger = 6 then
  begin
    label5.Visible:=true;
    CBItem.Visible:=true;
  end
  else
  begin
    label5.Visible:=true;
    CBItem.Visible:=true;
  end;

  if dm.qFiltroItem.RecordCount < 2 then
  begin
    label5.Visible:=false;
    CBItem.Visible:=false;
  end
  else
  begin
    label5.Visible:=true;
    CBItem.Visible:=true;
  end;
  cbItem.DisplayValue:='';
  
end;

procedure TForm1.abreTabelas();
begin

  if dm.qUF.active then dm.qUF.active:=false;
  dm.qUF.active:=true;
  dm.qUF.First;
  cbUF.DisplayValue:=dm.qUFUF.asString;


  if dm.qGrupos.active then dm.qGrupos.active:=false;
  dm.qGrupos.active:=true;
  dm.qGrupos.First;
  cbgrupo.DisplayValue:=dm.qGruposGrupo.asString;

  abreIndicadores();

  montaCBFiltroItem();
  montaCBFiltroZona();
  
end;


procedure TForm1.FormShow(Sender: TObject);
begin
abreTabelas();
OpenShapeFile('Brazil.shp');

end;

procedure TForm1.OpenShapeFile(const FileName: String; clearShapes: Boolean=True);
var
  NewShapeList : TSVOShapeList;
begin
   // Create a new shape list for the file name passed.

   ReleaseHint;

   //IF clearShapes THEN
     ClearShapeLists;

   NewShapeList := TSVOShapeList.Create;
   NewShapeList.GraphicStyles.Brush.Color := cor;


   SVOGISReadWrite1.ShapeList := NewShapeList;
   SVOGISReadWrite1.ImportFileName := FileName;
   SVOGISReadWrite1.ReadFile;

end;

procedure TForm1.ClearShapeLists;
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

procedure TForm1.limpaPintura();
begin
    SVOGISImage1.ActiveLayer.StrataVars.StrataField := '';
    SVOGISImage1.ActiveLayer.StrataVars.GetStrata;
    SVOGISImage1.Draw;
end;

procedure TForm1.ReleaseHint;
begin
  IF FHintVisible THEN
    FImageHint.ReleaseHandle;
  FHintVisible := False;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
ReleaseHint;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if DirectoryExists('C:\HTML_Banco') then  DelTree('C:\HTML_Banco');
ReleaseHint;
end;

Function TForm1.DelTree(DirName : string): Boolean;
var
  SHFileOpStruct : TSHFileOpStruct;
  DirBuf : array [0..255] of char;
begin
  try
   Fillchar(SHFileOpStruct,Sizeof(SHFileOpStruct),0) ;
   FillChar(DirBuf, Sizeof(DirBuf), 0 ) ;
   StrPCopy(DirBuf, DirName) ;
   with SHFileOpStruct do begin
    Wnd := 0;
    pFrom := @DirBuf;
    wFunc := FO_DELETE;
    fFlags := FOF_ALLOWUNDO;
    fFlags := fFlags or FOF_NOCONFIRMATION;
    fFlags := fFlags or FOF_SILENT;
   end;
    Result := (SHFileOperation(SHFileOpStruct) = 0) ;
   except
    Result := False;
  end;
end;

Procedure TForm1.MudaGrid(I:integer);
begin
//1 = Brasil 2 = Muni
  If I = 1  then
  begin
    GridBrasil.Align  := alNone;
    GridVal.Align  := alNone;
    Gridval.Visible := false;
    GridBrasil.Visible := true;
    GridBrasil.Align:= alClient;
  end
  else
  begin
    GridBrasil.Align  := alNone;
    GridBrasil.Visible := false;
    Gridval.Visible := true;
    GridVal.Align:= alClient;
  end;
end;


procedure TForm1.piscaMunicipio(IBGE:String);
const
  BlinkCount = 3;
  BlinkRate = 200; // milliseconds between blinks
  BlinkThenPersist = false;
var
  AshapeIndex:integer;
  i:integer;
  AShape : TSVOShapeObject;
begin

  //SVOGISImage1.ActiveLayer.Draw;
  //SVOGISImage1.Repaint;
  for i:=0 to SvoGisImage1.ActiveLayer.Count-1  do
  begin
  IF SvoGisImage1.ActiveLayer.DataFields.FieldNames.IndexOf('GEOCODIGO') >= 0 then
    begin
      if SVOGISImage1.ActiveLayer.Items[i].FieldByName('GEOCODIGO').AsString=guardaIBGE then
      begin
        AShape:=SVOGISImage1.ActiveLayer.Shape(i);
        SVOGISImage1.ActiveLayer.PickShapeObject(AShape);
        SVOGISImage1.ActiveLayer.SelectedShape.GraphicStyles.Brush.Color:=cor;
        SVOGISImage1.ActiveLayer.SelectedShape.Draw(SVOGISImage1.Canvas,SVOGISImage1.ScaleParams);
        SVOGISImage1.ActiveLayer.UnpickAllShapes;
        break;
      end;
    end

  end;




  for AshapeIndex := 0 to SvoGisImage1.ActiveLayer.Count-1 do
  begin


    IF SvoGisImage1.ActiveLayer.DataFields.FieldNames.IndexOf('GEOCODIGO') >= 0 then
    begin

      if SVOGISImage1.ActiveLayer.Items[AshapeIndex].FieldByName('GEOCODIGO').AsString=IBGE then
      begin
        guardaIBGE:=IBGE;
        AShape:=SVOGISImage1.ActiveLayer.Shape(AshapeIndex);
        SVOGISImage1.ActiveLayer.BlinkShape(AshapeIndex, BlinkCount, BlinkRate, BlinkThenPersist);
        SVOGISImage1.ActiveLayer.PickShapeObject(AShape);
        SVOGISImage1.ActiveLayer.SelectedShape.GraphicStyles.Brush.Color:=$0000BF;
        SVOGISImage1.ActiveLayer.SelectedShape.Draw(SVOGISImage1.Canvas,SVOGISImage1.ScaleParams);
        break;
      end;



    end;
  end;
  SVOGISImage1.ActiveLayer.Draw;
  SVOGISImage1.Repaint;
end;




procedure TForm1.abreMapaUF(UF:String);
var
  ClearShapes: Boolean;
  AShape : Integer;
  CurrentFolder, SourceMap, SourceFolder, ext : String;
  RelativePoint : TPoint;
  pnt : TDoublePoint;
  F: TSearchRec;
begin
   clearShapes:=true;
   CurrentFolder := ExtractFilePath(Application.ExeName);
   //SourceMap := SvoGisImage1.ActiveLayer.Items[AShape].FieldByName('ON_CLICK').asString;

  for Ashape := 0 to SvoGisImage1.ActiveLayer.Count-1 do
  begin
    IF SvoGisImage1.ActiveLayer.DataFields.FieldNames.IndexOf('UF') >= 0 then
    begin
      if SVOGISImage1.ActiveLayer.Items[Ashape].FieldByName('UF').AsString=UF then
      begin
        IF SvoGisImage1.ActiveLayer.DataFields.FieldNames.IndexOf('ON_CLICK') >= 0 then
        begin
          SourceMap:=SVOGISImage1.ActiveLayer.Items[Ashape].FieldByName('ON_CLICK').AsString;
          break;
        end
        else
        begin
          exit;
        end;
      end;
    end;
  end;

   SourceFolder := CurrentFolder + SourceMap;

   // This design is to use a field in the "Brazil.shp" file that tells us in what
   // folder where to look for the shape files for each state.  Note using FindFirst and
   // FindNext we will locate and load all the shapes in the folder.  The shape file names
   // should be ordered alphabetically so that polygons load first, then line shapes, and
   // Finally points shapes.  That is: aPolygons1.shp, aPolygons2.shp, bLines.shp, cPonts.shp...
   IF DirectoryExists(SourceFolder) THEN
     BEGIN
       IF FindFirst(SourceFolder + '\*.*', faAnyFile, F) = 0 THEN
         BEGIN
            ext := ExtractFileExt(F.Name);
            IF ext = '.shp' THEN BEGIN
              OpenShapeFile(SourceFolder + '\' + F.Name, True);
              ToolButtonBack.Enabled := True;
              ClearShapes := False;
            END;
            WHILE FindNext(F) = 0 DO BEGIN
              ext := ExtractFileExt(F.Name);
              IF ext = '.shp' THEN BEGIN
                OpenShapeFile(SourceFolder + '\' + F.Name, ClearShapes);
                ClearShapes := False;
                ToolButtonBack.Enabled := True;
              END;
            END;
         END
       ELSE
         MessageDlg('Erro, arquivo dos mapas inexistente:' + SourceMap, mtError, [mbOK], 0);
     END
   ELSE
     MessageDlg('O diretório com os mapas não existe: ' + SourceFolder, mtError, [mbOK], 0);


end;









procedure TForm1.SVOGISImage1Click(Sender: TObject);
var
  ClearShapes,clique_na_uf: Boolean;
  AShape : Integer;
  CurrentFolder, SourceMap, SourceFolder, ext,UFMapa, IBGE : String;
  RelativePoint : TPoint;
  pnt : TDoublePoint;
  F: TSearchRec;
   AShapeList : TSVOShapeList;
begin
 SVOGISImage1.Enabled:=false;

CBUF.Enabled:=false;
SVOGISImage1.SelectedShapesClear;
SVOGISImage1.ActiveLayer.UnpickAllShapes;
SVOGISImage1.ActiveLayer.Draw;
SVOGISImage1.Repaint;

//SVOGISImage1.ActiveLayer.SelectedShapes.Clear;
SVOGISImage1.Repaint;
clique_na_uf:=false;
  // Only open new files if the default pointer is activ.
  IF (SVOGisImage1.Mode <> moDefault) THEN
  begin
    SVOGISImage1.Enabled:=true;
    CBUF.Enabled:=true;
    Exit;
  end;


  AShapeList := SVOLegend.SelectedShapes;


  IF SvoGisImage1.ActiveLayer.ShapeType = stPolygon THEN BEGIN
    ClearShapes := True;

    RelativePoint := SvoGisImage1.ScreenToClient(Mouse.CursorPos);
    pnt := SvoGisImage1.GetActualDataMouseXY(RelativePoint.X,RelativePoint.Y);
    SvoGisImage1.ActiveLayer.WhichShape(AShape, pnt.X, pnt.Y);
    IF AShape >= 0 THEN BEGIN

      IF SvoGisImage1.ActiveLayer.DataFields.FieldNames.IndexOf('GEOCODIGO') >= 0 THEN
           begin
             IBGE:=SvoGisImage1.ActiveLayer.Items[AShape].FieldByName('GEOCODIGO').asString;

             if not dm.qCidades.Locate('IBGE',IBGE,[]) then
             begin
              SVOGISImage1.Enabled:=true;
              CBUF.Enabled:=true;
              exit;

             end;

             cbMuni.DisplayValue:=dm.qCidadesCidade.asString;
             piscaMunicipio(CBMuni.KeyValue);
             SVOGISImage1.Enabled:=true;
             CBUF.Enabled:=true;
             exit;
           end
      else IF SvoGisImage1.ActiveLayer.DataFields.FieldNames.IndexOf('UF') >= 0 THEN
           begin
             UFMapa:=SVOGISImage1.ActiveLayer.Items[Ashape].FieldByName('UF').AsString;

             if not dm.qUF.Locate('UF',UFMapa,[]) then
             begin
              SVOGISImage1.Enabled:=false;
              CBUF.Enabled:=true;
              exit;

             end;

             cbUF.DisplayValue:=dm.qUFUF.asString;
             //CBUFChange(self);
             {abreQMuni(UFMapa);
             SVOGISImage1.Enabled:=true;
             SVOGISImage1.ActiveLayer.UnpickAllShapes;
              SVOGISImage1.ActiveLayer.Draw;
             showmessage('vou sair');}

             SVOGISImage1.Enabled:=true;
             CBUF.Enabled:=true;
             exit;


           end;





      {IF SvoGisImage1.ActiveLayer.DataFields.FieldNames.IndexOf('ON_CLICK') < 0 THEN

      ELSE BEGIN
         CurrentFolder := ExtractFilePath(Application.ExeName);
         SourceMap := SvoGisImage1.ActiveLayer.Items[AShape].FieldByName('ON_CLICK').asString;
         SourceFolder := CurrentFolder + SourceMap;

         // This design is to use a field in the "Brazil.shp" file that tells us in what
         // folder where to look for the shape files for each state.  Note using FindFirst and
         // FindNext we will locate and load all the shapes in the folder.  The shape file names
         // should be ordered alphabetically so that polygons load first, then line shapes, and
         // Finally points shapes.  That is: aPolygons1.shp, aPolygons2.shp, bLines.shp, cPonts.shp...
         IF DirectoryExists(SourceFolder) THEN
           BEGIN
             IF FindFirst(SourceFolder + '\*.*', faAnyFile, F) = 0 THEN
               BEGIN
                  ext := ExtractFileExt(F.Name);
                  IF ext = '.shp' THEN BEGIN
                    OpenShapeFile(SourceFolder + '\' + F.Name, True);
                    ToolButtonBack.Enabled := True;
                    ClearShapes := False;
                  END;
                  WHILE FindNext(F) = 0 DO BEGIN
                    ext := ExtractFileExt(F.Name);
                    IF ext = '.shp' THEN BEGIN
                      OpenShapeFile(SourceFolder + '\' + F.Name, ClearShapes);
                      ClearShapes := False;
                      ToolButtonBack.Enabled := True;

                    END;
                  END;
               END
             ELSE
               MessageDlg('Erro, arquivo dos mapas inexistente:' + SourceMap, mtError, [mbOK], 0);
           END
         ELSE
           MessageDlg('O diretório com os mapas não existe: ' + SourceFolder, mtError, [mbOK], 0);


      END;}
    END;
  END;

SVOGISImage1.Enabled:=true;
CBUF.Enabled:=true;
end;

procedure TForm1.ToolButtonBackClick(Sender: TObject);
begin
screen.Cursor:=crSQLWait;
abremapaBrasil();
abreQMuni('');
dm.qUF.First;
CBUF.DisplayValue:=dm.qUFUF.asString;
screen.Cursor:=crDefault;

end;

function TForm1.MontaQuadroHintUF(UF:String):String;
var montaSTR:string;
begin

  if dm.qhint.Locate('UF',UF,[]) then
  begin


               montaSTR :='UF ='+UF+#13+'Indi ='+dm.qHintNomeRedu.asString+#13;
               montastr:=montastr+'Var ='+dm.qHintItem.asString+#13;

               if dm.qHintZona.asString<> '' then
               begin
                 montaSTR:= montaSTR+'Fil I ='+dm.qHintZona.asString+#13;
               end;

               if dm.qHintQualificador.asString<> '' then
               begin
                 montaSTR:= montaSTR+'Fil II ='+dm.qHintQualificador.asString+#13;
               end;

               montaSTR := montaSTR+'Ano ='+dm.qHintAno.asString+#13+'Valor ='+formatfloat(dm.qHintValor.DisplayFormat,dm.qHintValor.asFloat);


  end
  else
  begin
               montaSTR :='UF ='+UF+#13+'Indi ='+dm.qIndicadornomeredu.asString+#13;
               montastr:=montastr+'Var ='+dm.qValBrasilItem.asString+#13;

               if dm.qValBrasilZona.asString<> '' then
               begin
                 montaSTR:= montaSTR+'Fil I ='+dm.qValBrasilZona.asString+#13;
               end;

               if dm.qValBrasilQualificador.asString<> '' then
               begin
                 montaSTR:= montaSTR+'Fil II ='+dm.qValBrasilQualificador.asString+#13;
               end;

               montaSTR := montaSTR+'Ano ='+dm.qValBrasilAno.asString+#13+'Valor = Sem informação';




    montaSTR:='Sem informação';
  end;
  result:=montaSTR;

end;


function TForm1.MontaQuadroHintMuni(IBGE:String):String;
var montaSTR:string;
begin


  if dm.qValMuni.RecordCount=0 then exit;

  if dm.qhint.Locate('IBGE',IBGE,[]) then
  begin

              montaSTR :='Muni ='+dm.qHintCidade.asString +#13+'Porte='+dm.qHintporte_redu.asString+#13;
              montaSTR:=montaSTR+'Indi ='+dm.qHintNomeRedu.asString+#13+'Var ='+dm.qHintItem.asString+#13;

               if dm.qHintZona.asString<> '' then
               begin
                 montaSTR:= montaSTR+'Fil I ='+dm.qHintZona.asString+#13;
               end;

               if dm.qHintQualificador.asString<> '' then
               begin
                 montaSTR:= montaSTR+'Fil II ='+dm.qHintQualificador.asString+#13;
               end;


               montaSTR := montaSTR+'Ano ='+dm.qHintAno.asString+#13+'Valor ='+formatfloat(dm.qHintValor.DisplayFormat,dm.qHintValor.asFloat);
  end
  else
  begin

    if dm.qLocalidade.active then dm.qLocalidade.active:=false;
    dm.qLocalidade.Params[0].AsString:=IBGE;
    dm.qLocalidade.active:=true;
    montaSTR :='Muni ='+dm.qLocalidadeCidade.asString +#13+'Porte='+dm.qLocalidadeporte_redu.asString+#13;
     montaSTR:=montaSTR+'Indi ='+dm.qValMuninomeredu.asString+#13+'Var ='+dm.qValMuniItem.asString+#13;

               if dm.qValMuniZona.asString<> '' then
               begin
                 montaSTR:= montaSTR+'Fil I ='+dm.qValMuniZona.asString+#13;
               end;

               if dm.qValMuniQualificador.asString<> '' then
               begin
                 montaSTR:= montaSTR+'Fil II ='+dm.qValMuniQualificador.asString+#13;
               end;

               montaSTR := montaSTR+'Ano ='+dm.qValMuniAno.asString+#13+'Valor = Sem informação';

  end;
  result:=montaSTR;

end;






procedure TForm1.SVOGISImage1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
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
              AHint:=MontaQuadroHintMuni(SvoGisImage1.ActiveLayer.Items[AShape].FieldByName('GEOCODIGO').asString);
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

procedure TForm1.abreQMuni(UF:String);
begin
  if uf = '' then
  begin
    if dm.qCidades.Active then dm.qCidades.Active:=false;
  end
  else
  begin
  
    if dm.qCidades.Active then dm.qCidades.Active:=false;
    dm.qCidades.Params[0].asString := UF;
    dm.qCidades.Active :=true;
    dm.qCidades.first;
    cbmuni.DisplayValue:=dm.qCidadesCidade.asString;
    
  end;
end;

procedure TForm1.abremapaBrasil();
begin
  OpenShapeFile('Brazil.shp');
  ToolButtonBack.Enabled := False;
end;


procedure TForm1.CBUFChange(Sender: TObject);
begin
  CBUF.Enabled:=false;
  Screen.Cursor:=crsqlwait;
  abremapaBrasil();
  if cbuf.DisplayValue='Brasil' then
  begin
    abreQMuni('');

  end
  else
  begin
    abreMapaUF(CBUF.DisplayValue);
    abreQMuni(CBUF.DisplayValue);
    piscaMunicipio(CBMuni.KeyValue);
  end;
  filtraIndicadores();
  Screen.Cursor:=crDefault;
  CBUF.Enabled:=true;
  avisaSemInfo();
end;




procedure TForm1.CBMuniCloseUp(Sender: TObject);
begin
piscaMunicipio(CBMuni.KeyValue);
end;

procedure TForm1.CBGrupoChange(Sender: TObject);
begin
screen.Cursor:=crsqlwait;
  OrdenaColunas(GridVal);
  OrdenaColunas(GridBrasil);
abreIndicadores();
filtraIndicadores();
arrumaFormatFloat();
screen.Cursor:=crDefault;
avisaSemInfo();
end;

procedure TForm1.colocaFonte();
begin
  Panel1.Caption:='Fonte: '+dm.qIndicadorFonte.asString;
end;


procedure TForm1.avisaSemInfo();
begin
if uppercase(cbUF.DisplayValue) = 'BRASIL' then
begin
  if dm.qValBrasil.RecordCount=0 then
  begin
    GridBrasil.FixedColor:=  $0000DD;
    GridBrasil.ShowHint:=true;
    GridBrasil.PopupMenu:=nil;
  end
  else
  begin
    GridBrasil.FixedColor:= $00D08200;
    GridBrasil.ShowHint:=false;
    GridBrasil.PopupMenu:=PopupMenu2;
  end;
end
else
begin
    if dm.qValMuni.RecordCount=0 then
  begin
    GridVal.FixedColor:=  $0000DD;
    GridVal.ShowHint:=true;
    Gridval.PopupMenu:=nil;
  end
  else
  begin
    GridVal.FixedColor:=  $00D08200;
    GridVal.ShowHint:=false;
    Gridval.PopupMenu:=PopupMenu1;
  end;
end;

end;




procedure TForm1.CBIndicaChange(Sender: TObject);
begin
screen.Cursor:=crsqlwait;
  OrdenaColunas(GridVal);
  OrdenaColunas(GridBrasil);
montaCBFiltroItem();
montaCBFiltroZona();
montaCBFiltroQuali();
montaCBFiltroAno();
filtraIndicadores();
colocaFonte();
arrumaFormatFloat();
screen.Cursor:=crDefault;
avisaSemInfo();






end;

procedure TForm1.CBMuniChange(Sender: TObject);
begin
screen.Cursor:=crsqlwait;

filtraIndicadores();
screen.Cursor:=crdefault;
avisaSemInfo();
end;

procedure TForm1.CBItemChange(Sender: TObject);
begin
screen.Cursor:=crsqlwait;
//montaCBFiltroItem();
montaCBFiltroZona();
montaCBFiltroQuali();
montaCBFiltroAno();
filtraIndicadores();
screen.Cursor:=crDefault;
avisaSemInfo();
end;

procedure TForm1.CBZonaChange(Sender: TObject);
begin
screen.Cursor:=crsqlwait;
filtraIndicadores();
screen.Cursor:=crdefault;
avisaSemInfo();
end;

procedure TForm1.CBqualiChange(Sender: TObject);
begin
screen.Cursor:=crsqlwait;
filtraIndicadores();
screen.Cursor:=crDefault;
avisaSemInfo();
end;

procedure TForm1.cbanoChange(Sender: TObject);
begin
screen.Cursor:=crsqlwait;
filtraIndicadores();
screen.Cursor:=crDefault;
avisaSemInfo();
end;

procedure TForm1.abreArquivonoCD(Arq:String);
begin
 try
    shellexecute(handle,'open',pchar(dm.dire+'HTML\'+Arq),nil,nil,SW_SHOW);
  except
    showMessage('Erro na leitura do arquivo');
  end;
end;

procedure TForm1.abreArquivonoTemp(Arq:String);
begin
 try
    shellexecute(handle,'open',pchar('C:\HTML_Banco\'+Arq),nil,nil,SW_SHOW);
  except
    showMessage('Erro na leitura do arquivo');
  end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  abreArquivonoCD(dm.qIndicadorpagina_html.asString);
end;

procedure TForm1.ToolButton8Click(Sender: TObject);
begin
SVOGisImage1.Mode := moDefault;
end;

procedure TForm1.ToolButtonZoomInClick(Sender: TObject);
begin
SVOGisImage1.Mode := moZoomIn;
end;

procedure TForm1.ToolButtonZoomOutClick(Sender: TObject);
begin
SVOGisImage1.Mode := moZoomOut;
end;

procedure TForm1.ToolButtonPanClick(Sender: TObject);
begin
SVOGisImage1.Mode := moOpenHand;
end;

procedure TForm1.ToolButtonResetClick(Sender: TObject);
begin
SVOGISImage1.UpdateCanvas;
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
var
ende : string;
begin


  If cbmuni.Text <> '' then
  begin
    ende := 'http://200.207.217.8/mapas/mapa_muni.asp?muni='+cbmuni.text+', '+cbuf.Text+', '+'Brazil';
    try
    shellexecute(handle,'open',pchar(ende),nil,nil,SW_SHOW);
    except

    end;
  end
  else
  begin
    showmessage('Você precisa selecionar um município.');
  end;
end;

procedure TForm1.Sair1Click(Sender: TObject);
begin
close;
end;




procedure TForm1.Histricodoprogramamelhoria1Click(Sender: TObject);
begin
abreArquivonoCD('pop4.html');
end;

procedure TForm1.Apresentao1Click(Sender: TObject);
begin
abreArquivonoCD('pop1.html');
end;

procedure TForm1.Navegao1Click(Sender: TObject);
begin
//abreArquivonoCD('pop3.html');
end;

procedure TForm1.Indicadores1Click(Sender: TObject);
begin
abreArquivonoCD('pop2.html');
end;

procedure TForm1.CensoDemogrfico1Click(Sender: TObject);
begin
abreArquivonoCD('pop5.html');
end;

procedure TForm1.Censoescolar1Click(Sender: TObject);
begin
abreArquivonoCD('pop6.html');
end;

procedure TForm1.Dependnciaadministrativa1Click(Sender: TObject);
begin
abreArquivonoCD('pop7.html');
end;

procedure TForm1.Domiclioconceitoeclassificao1Click(Sender: TObject);
begin
abreArquivonoCD('pop8.html');
end;

procedure TForm1.Fundeb1Click(Sender: TObject);
begin
abreArquivonoCD('pop9.html');
end;

procedure TForm1.Indicadorsocial1Click(Sender: TObject);
begin
abreArquivonoCD('pop10.html');
end;

procedure TForm1.niveiseModalidadesdaEducaoBsica1Click(Sender: TObject);
begin
abreArquivonoCD('pop11.html');
end;

procedure TForm1.Oramentopblico1Click(Sender: TObject);
begin
abreArquivonoCD('pop12.html');
end;

procedure TForm1.DATASUS1Click(Sender: TObject);
begin
abreArquivonoCD('pop13.html');
end;

procedure TForm1.IBGE1Click(Sender: TObject);
begin
abreArquivonoCD('pop14.html');
end;

procedure TForm1.INEP1Click(Sender: TObject);
begin
abreArquivonoCD('pop15.html');
end;

procedure TForm1.IPEA1Click(Sender: TObject);
begin
abreArquivonoCD('pop16.html');
end;

procedure TForm1.PNUD1Click(Sender: TObject);
begin
abreArquivonoCD('pop17.html');
end;

procedure TForm1.SIAFI1Click(Sender: TObject);
begin
abreArquivonoCD('pop18.html');
end;

procedure TForm1.UNICEF1Click(Sender: TObject);
begin
abreArquivonoCD('pop19.html');
end;

procedure TForm1.mudaHint();
begin

  if dm.qHint.Active then dm.qHint.Active:=false;
  with dm.qHint.SQL do
  begin
    clear;
    add('SELECT');
    add('  `cad_indicadores`.ID_Localidade,');
    add('  `cad_indicadores`.ID_Indicador,');
    add('  `descricao_localidades`.ID_pais,');
    add('  `descricao_localidades`.ID_UF,');
    add('  `descricao_localidades`.ID_Cidade,');
    add('  `descricao_indicadores`.ID_Grupo,');
    add('  `descricao_indicadores`.ID_nome,');
    add('  `descricao_indicadores`.ID_Item,');
    add('  `descricao_indicadores`.ID_Zona,');
    add('  `descricao_indicadores`.ID_Qualificador,');
    add('  `descricao_indicadores`.ID_Fonte,');
    add('  `descricao_indicadores`.ID_Tipo,');
    add('  `descricao_indicadores`.ID_Moeda,');
    add('  `descricao_localidades`.IBGE,');
    add('  `descricao_localidades`.UF,');
    add('  `descricao_localidades`.Cidade,');
    add('  `descricao_indicadores`.Nomeredu,');
    add('  `descricao_indicadores`.Item,');
    add('  `descricao_indicadores`.Zona,');
    add('  `descricao_indicadores`.Qualificador,');
    add('  `descricao_localidades`.porte_redu,');
    add('  `descricao_indicadores`.Tipo,');
    add('  `cad_indicadores`.Ano,');
    add('  `cad_indicadores`.Valor');
    add('FROM');
    add('  `cad_indicadores`');
    add('  INNER JOIN `descricao_indicadores` ON (`cad_indicadores`.ID_Indicador = `descricao_indicadores`.ID_Indicador)');
    add('  INNER JOIN `descricao_localidades` ON (`cad_indicadores`.ID_Localidade = `descricao_localidades`.ID_Localidade)');
    if UpperCase(cbUF.DisplayValue)=UpperCase('Brasil') then
    begin
      add('WHERE');
      add('   `descricao_localidades`.ID_Cidade = 0');
      add('  and');
      add('   `cad_indicadores`.ID_Indicador = :Id');
      add('  and');
      add('   `cad_indicadores`.ano = :ano');
    end
    else
    begin
      add('WHERE');
      add('   `descricao_localidades`.ID_UF = '+dm.qUFID_UF.asString);
      add('  and');
      add('   `cad_indicadores`.ID_Indicador = :Id');
      add('  and');
      add('   `cad_indicadores`.ano = :ano');
    end;
  end;
  
end;


function TForm1.buscaFormato(tipo:string):string;
begin
   if tipo = 'Quantidade' then
         begin
         result := '###,###,###,##0';
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
   if tipo = 'Taxa 2' then
         begin
         result := '###,###,###,##0.0';
         end;
end;


procedure TForm1.arrumaFormatFloat();
var
strFormat:string;
begin
  strFormat:=buscaFormato(dm.qHintTipo.asString);
  dm.qHintValor.DisplayFormat:=strFormat;
  dm.qValBrasilValor.DisplayFormat:=strFormat;
  dm.qValMuniValor.DisplayFormat:=strFormat;
  dm.qValMuniValBrasil.DisplayFormat:=strFormat;
  dm.qValMuniValUF.DisplayFormat:=strFormat;


end;

procedure TForm1.abreHint(id_indicador:Integer;ano:string);
begin
  limpaPintura();
  mudaHint();
  if dm.qHint.Active then dm.qHint.Active:=false;
  dm.qHint.Params[0].asInteger:=id_indicador;
  dm.qHint.Params[1].asstring:=ano;
  dm.qHint.Active:=true;
end;



function TForm1.valorMesmaFaixa(valor:string):boolean;
begin
  result:=true;
  if (PassouMaior) and (not PassouMenor) and (not PassouIgual) then
  begin
    ShowMEssage('Todos os valores são maiores que '+valor);
    exit;
  end;

  if (not PassouMaior) and (PassouMenor) and (not PassouIgual) then
  begin
    ShowMEssage('Todos os valores são menores que '+valor);
    exit;
  end;

  if (not PassouMaior) and (not PassouMenor) and (PassouIgual) then
  begin
    ShowMEssage('Todos os valores são iguais a '+valor);
    exit;
  end;

   if (not PassouMaior) and (not PassouMenor) and (not PassouIgual) and (PassouSem) then
  begin
    //ShowMEssage('sem informação para todos os valores');
    showMessage('Sem informação do valor para o município selecionado');
    exit;
  end;
  result:=false;
end;

function TForm1.pintaMapa_UF():boolean;
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
    PassouIgual:=false;
    PassouMaior:=false;
    PassouMenor:=false;
    PassouSem:=false;

    WHILE NOT AShapeList.Records.EOF DO BEGIN

  
    IF AShapeList.DataFields.FieldNames.IndexOf('GEOCODIGO') >= 0 THEN
    begin

     if dm.qHint.locate('IBGE', AShapeList.DataFields.FieldByName('GEOCODIGO').AsString,[]) then
      valor_teste := dm.qHintValor.AsFloat
     else
      valor_teste := -1;




     if (valor_teste = dm.qValMuniValor.AsFloat) then
     begin
      valor_unico:=1;
      PassouIgual:=true;
     end;

     if (valor_teste > dm.qValMuniValor.AsFloat) then
     begin
      valor_unico:=2;
      PassouMaior:=true;
     end ;


     if (valor_teste < dm.qValMuniValor.AsFloat) and (valor_teste<>-1) then
     begin
      valor_unico:=3;
      PassouMenor:=true;
     end;


     if (valor_teste = -1) then
     begin
      valor_unico:=4;
      PassouSem:=true;
     end;

    end;
       AShapeList.DataFields.FieldByName('Valor').AsFloat := valor_teste;
       AShapeList.DataFields.FieldByName('CRIMES').AsInteger := valor_unico;


       AShapeList.Records.Next;
    END;

    AShapeList.StrataVars.ScaleIncrement := 1;
    AShapeList.StrataVars.InitialValue := '1';


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
  result:=not valorMesmaFaixa(formatfloat(dm.qValMuniValor.DisplayFormat,dm.qValMuniValor.AsFloat));
end;


function TForm1.PintaMapa_Brasil():Boolean;
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
    PassouBrasilIgual:=false;
    PassouIgual:=false;
    PassouMaior:=false;
    PassouMenor:=false;
    PassouSem:=false;

    AShapeList.Records.First;
    WHILE NOT AShapeList.Records.EOF DO BEGIN


    IF AShapeList.DataFields.FieldNames.IndexOf('NOME_UF') >= 0 THEN
    begin
     if dm.qHint.Locate('UF',AShapeList.DataFields.FieldByName('UF').AsString,[]) then
       valor_teste := dm.qHintValor.AsFloat
     else
       valor_teste := -1;


       if (valor_teste = dm.qValBrasilValor.AsFloat) then
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


       if (valor_teste = -1) then
       begin
        valor_unico:=4;
        PassouSem:=true;
       end;

         AShapeList.DataFields.FieldByName('Valor').AsFloat := valor_teste;
         AShapeList.DataFields.FieldByName('CRIMES').AsInteger := valor_unico;

      end;
       AShapeList.Records.Next;
    END;
  


    AShapeList.StrataVars.ScaleIncrement := 1;

    if PassouBrasilIgual then
      AShapeList.StrataVars.InitialValue := '1'
    else
      AShapeList.StrataVars.InitialValue := '2';

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
  result:= not valorMesmaFaixa(formatfloat(dm.qValBrasilValor.DisplayFormat,dm.qValBrasilValor.AsFloat));

end;

procedure TForm1.ToolButtonExecuteCrimeMonthClick(Sender: TObject);
begin
  ToolButtonExecuteCrimeMonth.Enabled:=false;
  screen.Cursor:=crsqlwait;
  if UpperCase(cbuf.DisplayValue) = UpperCase('Brasil') then
  begin
    PintaMapa_Brasil();
  end
  else
  begin
    pintaMapa_UF();
  end;
  screen.Cursor:=crdefault;
  ToolButtonExecuteCrimeMonth.Enabled:=true;
end;


function TForm1.BuscaLegenda(painel:Integer;valor:String):String;
var Legenda:String;
begin

if passouigual and passoumaior and passoumenor and passousem then
begin
if painel = 1 then legenda:='igual a '+valor;
if painel = 2 then legenda:='maior que '+valor;
if painel = 3 then legenda:='menor que '+valor;
if painel = 4 then legenda:='sem informação';
end;

if passouigual and passoumaior and passoumenor and not passousem then
begin
if painel = 1 then legenda:='igual a '+valor;
if painel = 2 then legenda:='maior que '+valor;
if painel = 3 then legenda:='menor que '+valor;
end;

if passouigual and passoumaior and not passoumenor and passousem then
begin
if painel = 1 then legenda:='igual a '+valor;
if painel = 2 then legenda:='maior que '+valor;
if painel = 3 then legenda:='sem informação';
end;

if passouigual and passoumaior and not passoumenor and not passousem then
begin
if painel = 1 then legenda:='igual a '+valor;
if painel = 2 then legenda:='maior que '+valor;
end;

if passouigual and not passoumaior and passoumenor and passousem then
begin
if painel = 1 then legenda:='igual a '+valor;
if painel = 2 then legenda:='menor que '+valor;
if painel = 3 then legenda:='sem informação';
end;

if passouigual and not passoumaior and passoumenor and not passousem then
begin
if painel = 1 then legenda:='igual a '+valor;
if painel = 2 then legenda:='sem informação';
end;

if passouigual and not passoumaior and not passoumenor and passousem then
begin
if painel = 1 then legenda:='igual a '+valor;
if painel = 2 then legenda:='sem informação';
end;

if passouigual and not passoumaior and not passoumenor and not passousem then
begin
if painel = 1 then legenda:='igual a '+valor;
end;

if not passouigual and passoumaior and passoumenor and passousem then
begin
if painel = 1 then legenda:='maior que '+valor;
if painel = 2 then legenda:='menor que '+valor;
if painel = 3 then legenda:='sem informação';
end;

if not passouigual and passoumaior and passoumenor and not passousem then
begin
if painel = 1 then legenda:='maior que '+valor;
if painel = 2 then legenda:='menor que '+valor;
end;

if not passouigual and passoumaior and not passoumenor and passousem then
begin
if painel = 1 then legenda:='maior que '+valor;
if painel = 2 then legenda:='sem informação';
end;

if not passouigual and passoumaior and not passoumenor and not passousem then
begin
if painel = 1 then legenda:='maior que '+valor;
end;

if not passouigual and not passoumaior and passoumenor and passousem then
begin
if painel = 1 then legenda:='menor que '+valor;
if painel = 2 then legenda:='sem informação';
end;

if not passouigual and not passoumaior and passoumenor and not passousem then
begin
if painel = 1 then legenda:='menor que '+valor;
end;

if not passouigual and not passoumaior and not passoumenor and passousem then
begin
if painel = 1 then legenda:='sem informação';
end;

if not passouigual and not passoumaior and not passoumenor and not passousem then
begin
  //nunca vai acontecer
end;

  result:=Legenda;
end;


procedure TForm1.SVOGISImage1AddShapeList(Sender: TObject;
  AShapeList: TSVOShapeList);
Var valor:String;
begin

  SVOLegend.Panels(0).DisplayName:=CBUF.DisplayValue;
  if uppercase(CBUF.DisplayValue) <> 'BRASIL' then
  begin
      valor:=formatfloat(dm.qValMuniValor.DisplayFormat,dm.qValMuniValor.asfloat);
  end
  else
  begin
      valor:=formatfloat(dm.qValBrasilValor.DisplayFormat,dm.qValBrasilValor.asfloat);

  end;

  if SVOLegend.Items.Count=2 then
  begin
    SVOLegend.Panels(1).DisplayName:=BuscaLegenda(1,valor);
  end;
  if SVOLegend.Items.Count=3 then
  begin
    SVOLegend.Panels(1).DisplayName:=BuscaLegenda(1,valor);
    SVOLegend.Panels(2).DisplayName:=BuscaLegenda(2,valor);
  end;

  if SVOLegend.Items.Count=4 then
  begin
    SVOLegend.Panels(1).DisplayName:=BuscaLegenda(1,valor);
    SVOLegend.Panels(2).DisplayName:=BuscaLegenda(2,valor);
    SVOLegend.Panels(3).DisplayName:=BuscaLegenda(3,valor);
  end;

  if SVOLegend.Items.Count=5 then
  begin
    SVOLegend.Panels(1).DisplayName:=BuscaLegenda(1,valor);
    SVOLegend.Panels(2).DisplayName:=BuscaLegenda(2,valor);
    SVOLegend.Panels(3).DisplayName:=BuscaLegenda(3,valor);
    SVOLegend.Panels(4).DisplayName:=BuscaLegenda(4,valor);
  end;



SVOGISImage1.SelectedShapeList:=SVOLegend.ShapeList[0];
end;


procedure TForm1.imprimeTabelaRel1(query:TMyquery;valor_compara:Double;HTML:TStringList;NomeMostra:String;temCores:Boolean);
var
Formato,nome_img:String;
flip:boolean;
numero:string;
coresval,cores:array[0..4] of string;
i:integer;
begin
  query.first;
  formato:=buscaFormato(query.FieldByName('tipo').AsString);
  flip:=true;

  for i:=0 to 4 do
  begin
    cores[i]:='@';
    coresval[i]:='@';
  end;

  for i:=0 to  SVOLegend.Items.Count-1 do
  begin
   cores[i]:=colortohtml(colortostring(SVOLegend.Panels(i).GraphicStyles.Brush.Color));

   if pos('igual',SVOLegend.Panels(i).DisplayName) > 0 then
    coresval[i]:='=';

   if pos('menor',SVOLegend.Panels(i).DisplayName) > 0 then
    coresval[i]:='<';

   if pos('maior',SVOLegend.Panels(i).DisplayName) > 0 then
    coresval[i]:='>';

   if pos('sem', SVOLegend.Panels(i).DisplayName) > 0 then
    coresval[i]:='*';
  end;


while not query.Eof do
begin

   if query.FieldByName(NomeMostra).AsString = CBMuni.DisplayValue then
   begin
        HTML.Add('<tr class="seleciona">')
   end
   else
   begin
     if not flip then
        HTML.Add('<tr>')
     else
        HTML.Add('<tr class="zebra">');

       flip:= not flip;
   end;
     if valor_compara=query.FieldByName('valor').AsFloat then
     begin
      for i:=0 to 4 do
      begin
        if coresval[i] = '=' then
          nome_img:='<td bgcolor="'+cores[i]+'" align="center" width="20px"><strong>'+coresval[i]+'</strong></td>';
      end;
      //nome_img:='igual.gif';
     end;

     if valor_compara>query.FieldByName('valor').AsFloat then
     begin
     for i:=0 to 4 do
      begin
        if coresval[i] = '<' then
          nome_img:='<td bgcolor="'+cores[i]+'" align="center" width="20px"><strong>'+coresval[i]+'</strong></td>';
      end;
      //nome_img:='menor.gif';
     end;

     if valor_compara<query.FieldByName('valor').AsFloat then
     begin
          for i:=0 to 4 do
      begin
        if coresval[i] = '>' then
          nome_img:='<td bgcolor="'+cores[i]+'" align="center" width="20px"><strong>'+coresval[i]+'</strong></td>';
      end;
      //nome_img:='maior.gif';
     end;

     if query.FieldByName('valor').AsFloat=-1 then
     begin
      for i:=0 to 4 do
      begin
        if coresval[i] = '*' then
          nome_img:='<td bgcolor="'+cores[i]+'" align="center" width="20px"><strong>&nbsp;</strong></td>';
      end;
      //nome_img:='seminfo.gif';
     end;


     if query.RecNo<10 then
     begin
      numero:='0'+inttostr(query.RecNo);
     end
     else
     begin
      numero:=inttostr(query.RecNo);
     end;


     if SVOLegend.PanelCount>1 then
     begin
        HTML.Add('<td width="20px"> '+numero+'. </td>'+nome_img+' <td>'+query.FieldByName(NomeMostra).AsString+'</td>');
     end
     else
        HTML.Add('<td width="20px"> '+numero+'. </td><td colspan="2">'+query.FieldByName(NomeMostra).AsString+'</td>');
     begin
     end;
     if query.FieldByName('valor').AsFloat<>-1 then
      HTML.Add('<td align="right">'+formatfloat(formato,query.FieldByName('valor').AsFloat)+'</td>')
     else
      HTML.Add('<td align="right">sem informação</td>');
     HTML.Add('</tr>');




query.Next;
end;

end;

procedure TForm1.imprimeRelbrasilUF();
Var HTML:TStringList;
valor_compara:Double;
largura, altura,I : integer;
cores,coresval:String;
temFaixas:Boolean;
begin
  temFaixas:=PintaMapa_Brasil();








  HTML := TStringList.Create;
  HTML.Add(Memo1.Lines.GetText);

  HTML.Add('<table width="100%">');
  HTML.Add('<tr class="titulo">');
  HTML.Add('  <td colspan="3">Localização</td>');
  HTML.Add('</tr>');
  HTML.Add('<tr>');
  HTML.Add('  <td colspan="3">Brasil</td>');
  HTML.Add('</tr>');
  HTML.Add('<tr class="titulo">');
  HTML.Add('  <td>Dimensão do Indicador</td>');
  HTML.Add('  <td>Indicador</td>');
  HTML.Add('  <td>variável</td>');
  HTML.Add('</tr>');
  HTML.Add('<tr>');
  HTML.Add('  <td>'+dm.qValBrasilGrupo.asString+'</td>');
  HTML.Add('  <td>'+dm.qValBrasilIndicador.asString+'</td>');
  HTML.Add('  <td>'+dm.qValBrasilItem.asString+'</td>');
  HTML.Add('</tr>');

  if ((dm.qValBrasilZona.AsString <>'') or (dm.qValBrasilqualificador.asString<>'')) then
  begin
  HTML.Add('<tr class="titulo">');


  HTML.Add('  <td></td>');
    if dm.qValBrasilZona.AsString = '' then
      HTML.Add('  <td></td>')
    else
      HTML.Add('  <td>Filtro I</td>');


    if dm.qValBrasilqualificador.asString = '' then
      HTML.Add('  <td></td>')
    else
      HTML.Add('  <td>Filtro II</td>');

  HTML.Add('</tr>');
  HTML.Add('<tr>');

  HTML.Add('  <td></td>');
    if dm.qValBrasilZona.AsString = '' then
      HTML.Add('  <td></td>')
    else
      HTML.Add('  <td>'+dm.qValBrasilZona.AsString+'</td>');
    if dm.qValBrasilqualificador.asString = '' then
      HTML.Add('  <td></td>')
    else
      HTML.Add('  <td>'+dm.qValBrasilqualificador.asString+'</td>');


  HTML.Add('</tr>');
  end;

  HTML.Add('<tr class="titulo">');
  HTML.Add('  <td>Ano</td>');
  HTML.Add('  <td colspan="2">Valor</td>');
  HTML.Add('</tr>');
  HTML.Add('<tr>');
  HTML.Add('  <td>'+dm.qValBrasilAno.asString+'</td>');
  HTML.Add('  <td colspan="2">'+formatfloat(dm.qValBrasilValor.DisplayFormat,dm.qValBrasilvalor.asfloat)+'</td>');
  HTML.Add('</tr>');
  HTML.Add('<tr class="titulo">');
  HTML.Add('  <td colspan="3">Fonte</td>');
  HTML.Add('</tr>');
  HTML.Add('<tr>');
  HTML.Add('  <td colspan="3">'+dm.qValBrasilFonte.asString+'</td>');
  HTML.Add('</tr>');
  valor_compara:=dm.qValBrasilvalor.asfloat;
  HTML.Add('</table>');
  html.add('<br />');






  largura := SVOGISImage1.Width;
  altura  := SVOGISImage1.Height;

  If largura > 750 then
  begin
  largura := trunc(largura * 0.70);
  altura  := trunc(altura * 0.70);
  end;

  SVOGISImage1.SaveAsJPEG('c:\HTML_Banco\municipio.jpg',SVOGISImage1.Width,100,jpBestSpeed,jf24Bit,false,false);




  HTML.Add('<table width="100%">');
  HTML.Add('<tr>');
  HTML.Add('<td>');
  HTML.Add('<div align="left"><img src="municipio.jpg" width="'+inttostr(largura)+'" height="'+inttostr(altura)+'"></div>');
  HTML.Add('</td>');
  HTML.Add('</tr>');
  HTML.Add('</table>');









  HTML.Add('<table width="50%" align="center">');
  for i:=1 to  SVOLegend.Items.Count-1 do
  begin
   cores:=colortohtml(colortostring(SVOLegend.Panels(i).GraphicStyles.Brush.Color));

   if pos('igual',SVOLegend.Panels(i).DisplayName) > 0 then
    coresval:='=';

   if pos('menor',SVOLegend.Panels(i).DisplayName) > 0 then
    coresval:='<';

   if pos('maior',SVOLegend.Panels(i).DisplayName) > 0 then
    coresval:='>';

   if pos('sem', SVOLegend.Panels(i).DisplayName) > 0 then
    coresval:='&nbsp;';


    HTML.Add('  <td bgcolor="'+cores+'" width="20px" align="center"><strong>'+coresval+'</strong></td>');
    HTML.Add('  <td>'+SVOLegend.Panels(i).DisplayName+'</td>');
  end;
  HTML.add('</table>');


  HTML.Add('<table width="50%" align="center">');
  HTML.Add('<tr class="titulo">');
  HTML.Add('  <td colspan="3">Estado</td>');
  HTML.Add('  <td align="right">Valor</td>');
  HTML.Add('</tr>');

  if dm.qRelUFbrasil.active then dm.qRelUFbrasil.active:=false;
  dm.qRelUFbrasil.Params[0].asInteger:=dm.qValBrasilID_Indicador.asInteger;
  dm.qRelUFbrasil.Params[1].asInteger:=dm.qValBrasilano.AsInteger;
  
  dm.qRelUFbrasil.Params[2].asInteger:=dm.qValBrasilID_Indicador.asInteger;
  dm.qRelUFbrasil.Params[3].asInteger:=dm.qValBrasilano.AsInteger;
  dm.qRelUFbrasil.Active :=true;

  imprimeTabelaRel1(dm.qRelUFbrasil,valor_compara,HTML,'UF',temFaixas);



  HTML.Add('</table>');
  HTML.Add('<table width="98%" border="0" align="center">');
  HTML.Add('<tr>');
  HTML.Add('<td> ');
  HTML.Add('<img src="rodape.jpg" alt="cenpec" />');
  HTML.Add('</td>');
  HTML.Add('</tr>');
  HTML.Add('</table>');
  try
    html.SaveToFile('c:\HTML_Banco\valores_municipio.html');
  except




  end;
  abreArquivonoTemp('valores_municipio.html');
  //limpaPintura();
end;


procedure TForm1.imprimeRelUFMuni();
Var HTML:TStringList;
valor_compara:Double;
largura, altura,I : integer;
cores,coresval:String;
temFaixas:boolean;
begin
  temFaixas:=pintaMapa_UF();






  HTML := TStringList.Create;
  HTML.Add(Memo1.Lines.GetText);
  HTML.Add('<table width="100%">');
  HTML.Add('<tr class="titulo">');
  HTML.Add('  <td>UF</td>');
  HTML.Add('  <td colspan="2">Município</td>');
  HTML.Add('</tr>');
  HTML.Add('<tr>');
  HTML.Add('  <td>'+dm.qValMuniUF.asString+'</td>');
  HTML.Add('  <td colspan="2">'+dm.qValMuniCidade.asString+'</td>');
  HTML.Add('</tr>');
  HTML.Add('<tr class="titulo">');
  HTML.Add('  <td>Dimensão do Indicador</td>');
  HTML.Add('  <td>Indicador</td>');
  HTML.Add('  <td>Variável</td>');
  HTML.Add('</tr>');
  HTML.Add('<tr>');
  HTML.Add('  <td>'+dm.qValMuniGrupo.asString+'</td>');
  HTML.Add('  <td>'+dm.qValMuniIndicador.asString+'</td>');
  HTML.Add('  <td>'+dm.qValMuniItem.asString+'</td>');
  HTML.Add('</tr>');

  if ((dm.qValMuniZona.AsString <>'') or (dm.qValMuniqualificador.asString<>'')) then
  begin
    HTML.Add('<tr class="titulo">');
    HTML.Add('  <td></td>');

        if dm.qValMuniZona.AsString = '' then
        HTML.Add('  <td></td>')
      else
        HTML.Add('  <td>Filtro I</td>');


      if dm.qValMuniqualificador.asString = '' then
        HTML.Add('  <td></td>')
      else
        HTML.Add('  <td>Filtro II</td>');


    HTML.Add('</tr>');
  end;

  HTML.Add('<tr>');
  HTML.Add('  <td></td>');

      if dm.qValMuniZona.AsString = '' then
      HTML.Add('  <td></td>')
    else
      HTML.Add('  <td>'+dm.qValMunizona.AsString+'</td>');


    if dm.qValMuniqualificador.asString = '' then
      HTML.Add('  <td></td>')
    else
      HTML.Add('  <td>'+dm.qValMuniQualificador.asString+'</td>');




  HTML.Add('</tr>');



  HTML.Add('<tr class="titulo">');
  HTML.Add('  <td>Ano</td>');
  HTML.Add('  <td colspan="2">Valor</td>');
  HTML.Add('</tr>');
  HTML.Add('<tr>');
  HTML.Add('  <td>'+dm.qValMuniAno.asString+'</td>');
  HTML.Add('  <td colspan="2">'+formatfloat(dm.qValMuniValor.DisplayFormat,dm.qValMunivalor.asfloat)+'</td>');
  HTML.Add('</tr>');
  HTML.Add('<tr class="titulo">');
  HTML.Add('  <td colspan="3">Fonte</td>');
  HTML.Add('</tr>');
  HTML.Add('<tr>');
  HTML.Add('  <td colspan="3">'+dm.qValMuniFonte.asString+'</td>');
  HTML.Add('</tr>');

  valor_compara:=dm.qValMunivalor.asfloat;

  HTML.Add('</table>');
  html.add('<br />');


  largura := SVOGISImage1.Width;
  altura  := SVOGISImage1.Height;

  If largura > 750 then
  begin
  largura := trunc(largura * 0.70);
  altura  := trunc(altura * 0.70);
  end;

  SVOGISImage1.SaveAsJPEG('c:\HTML_Banco\municipio.jpg',SVOGISImage1.Width,100,jpBestSpeed,jf24Bit,false,false);




  HTML.Add('<table width="100%">');
  HTML.Add('<tr>');
  HTML.Add('<td>');
  HTML.Add('<div align="left"><img src="municipio.jpg" width="'+inttostr(largura)+'" height="'+inttostr(altura)+'"></div>');
  HTML.Add('</td>');
  HTML.Add('</tr>');
  HTML.Add('</table>');


    HTML.Add('<table width="50%" align="center">');
  for i:=1 to  SVOLegend.Items.Count-1 do
  begin
   cores:=colortohtml(colortostring(SVOLegend.Panels(i).GraphicStyles.Brush.Color));

   if pos('igual',SVOLegend.Panels(i).DisplayName) > 0 then
    coresval:='=';

   if pos('menor',SVOLegend.Panels(i).DisplayName) > 0 then
    coresval:='<';

   if pos('maior',SVOLegend.Panels(i).DisplayName) > 0 then
    coresval:='>';

   if pos('sem', SVOLegend.Panels(i).DisplayName) > 0 then
    coresval:='&nbsp;';


    HTML.Add('  <td bgcolor="'+cores+'" width="20px" align="center"><strong>'+coresval+'</strong></td>');
    HTML.Add('  <td>'+SVOLegend.Panels(i).DisplayName+'</td>');
  end;
  HTML.add('</table>');





  HTML.Add('<table width="50%" align="center">');
  HTML.Add('<tr class="titulo">');
   HTML.Add('  <td colspan="3">Município</td>');
   HTML.Add('  <td align="right">Valor</td>');
   HTML.Add('</tr>');

   if dm.qValMuni.RecNo=0 then
   begin
    //showMessage('Sem informação do valor para o município selecionado');
    exit;
   end;
  if dm.qRelMuniUF.active then dm.qRelMuniUF.active:=false;
  dm.qRelMuniUF.Params[0].asInteger:=dm.qUFID_UF.asInteger;
  dm.qRelMuniUF.Params[1].asInteger:=dm.qValMuniID_Indicador.AsInteger;
  dm.qRelMuniUF.Params[2].asInteger:=dm.qValMuniano.AsInteger;
  
  dm.qRelMuniUF.Params[3].asInteger:=dm.qUFID_UF.asInteger;
  dm.qRelMuniUF.Params[4].asInteger:=dm.qValMuniID_Indicador.AsInteger;
  dm.qRelMuniUF.Params[5].asInteger:=dm.qValMuniano.AsInteger;
  dm.qRelMuniUF.Active :=true;

  imprimeTabelaRel1(dm.qRelMuniUF,valor_compara,HTML,'Cidade',temFaixas);



  HTML.Add('</table>');
  HTML.Add('<table width="98%" border="0" align="center">');
  HTML.Add('<tr>');
  HTML.Add('<td> ');
  HTML.Add('<img src="rodape.jpg" alt="cenpec" />');
  HTML.Add('</td>');
  HTML.Add('</tr>');
  HTML.Add('</table>');
  try
    html.SaveToFile('c:\HTML_Banco\valores_municipio.html');
  except

  end;
  abreArquivonoTemp('valores_municipio.html');
  //limpaPintura();
end;

function TForm1.colortohtml(s:string):string;
var
salva:String;
begin
  salva:=copy(s,4,2);
  result:='#'+copy(s,8,2)+copy(s,6,2)+salva;
end;


procedure TForm1.ToolButtonGridClick(Sender: TObject);
var
i:integer;
begin
  screen.Cursor:=crsqlwait;
  if uppercase(cbuf.DisplayValue) = UpperCase('Brasil') then
  begin
    imprimeRelbrasilUF();
  end
  else
  begin
    imprimeRelUFMuni();
  end;
  screen.Cursor:=crdefault;
end;

procedure TForm1.ToolButton4Click(Sender: TObject);
begin
 {if uppercase(cbuf.DisplayValue) = UpperCase('Brasil') then
  begin
    FFiltro:=TFFiltro.create(self);
    FFiltro.GroupBox1.Visible:=false;
    FFiltro.showmodal;
    FFiltro.free;
  end
  else
  begin
    FFiltro:=TFFiltro.create(self);
    FFiltro.showmodal
    FFiltro.free;
  end;
  FmenuImprime:=tFmenuImprime.create(self);
  FmenuImprime.showmodal;
  FmenuImprime.free;}

  FmenuImp:=TFmenuImp.create(self);
  fmenuImp.showmodal;
  fmenuImp.free;


end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
  if uppercase(cbuf.DisplayValue) = UpperCase('Brasil') then
  begin
    showMessage('Selecione uma UF');
  end
  else
  begin
    Fgraficos:=tFgraficos.create(self);
    Fgraficos.showmodal;
    Fgraficos.free;
  end;
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
 IF Not Assigned(SVOLegend.SelectedShapes) THEN Exit;
  FormGrid:=TFormGrid.Create(self);
  FormGrid.SVODataGrid1.DataFields := SVOLegend.SelectedShapes.DataFields;
  FormGrid.Show;
end;

procedure TForm1.OrdenaColunas(Grid:TcrDBgrid);
var I:Integer;
begin
  with Grid do
  begin
    for i:=0 to Columns.Count-1 do
    begin
      Columns[i].Visible:=true;
    end;
    for i:=0 to Columns.Count-1 do
    begin
      If Columns[i].FieldName='Item' then Columns[i].Index:=0;
      If Columns[i].FieldName='Zona' then Columns[i].Index:=1;
      If Columns[i].FieldName='Qualificador' then Columns[i].Index:=2;
      If Columns[i].FieldName='Ano' then Columns[i].Index:=3;
      If Columns[i].FieldName='Valor' then Columns[i].Index:=4;
      If Columns[i].FieldName='ValUF' then Columns[i].Index:=5;
      If Columns[i].FieldName='ValBrasil' then Columns[i].Index:=6;
    end;
  end;
end;

procedure TForm1.ToolButton6Click(Sender: TObject);
begin
    SVOGISImage1.ActiveLayer.UnpickAllShapes;
    SVOGISImage1.ActiveLayer.Draw;
    SVOGISImage1.Repaint;
end;


procedure TForm1.Exportar1Click(Sender: TObject);
begin
 { if dm.qExportaValMuni.active then dm.qExportaValMuni.active:=false;
  dm.qExportaValMuni.Params[0].asInteger:=dm.qCidadesID_Localidade.asInteger;
  dm.qExportaValMuni.Params[1].asInteger:=dm.qGruposID_Grupo.asInteger;
  dm.qExportaValMuni.Params[2].asInteger:=dm.qIndicadorID_nome.asInteger;
  dm.qExportaValMuniValorMuni.DisplayFormat:=dm.qValMuniValor.DisplayFormat;
  dm.qExportaValMuniValBrasil.DisplayFormat:=dm.qValMuniValBrasil.DisplayFormat;
  dm.qExportaValMuniValUF.DisplayFormat:=dm.qValMuniValUF.DisplayFormat;
  //colocaFiltro(dm.qExportaValMuni);
  dm.qExportaValMuni.active:=true;}

  mxDBGridExport1.DBGrid:=GridVal_falso;;
  mxDBGridExport1.Select;

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  {if dm.qExportaValBrasil.active then dm.qExportaValBrasil.active:=false;
  dm.qExportaValBrasil.Params[0].asInteger:=dm.qGruposID_Grupo.asInteger;
  dm.qExportaValBrasil.Params[1].asInteger:=dm.qIndicadorID_nome.asInteger;
  dm.qExportaValBrasilValor.DisplayFormat:=dm.qValBrasilValor.DisplayFormat;
  //colocaFiltro(dm.qExportaValBrasil);
  dm.qExportaValBrasil.active:=true;}

  mxDBGridExport1.DBGrid:=Gridbrasil_falso;;
  mxDBGridExport1.Select;
end;

procedure TForm1.Navegao2Click(Sender: TObject);
begin
abreArquivonoCD('pop3.html');
end;

procedure TForm1.Verso1Click(Sender: TObject);
begin
//showmessage('ISEB: Versão 2.1. Todos os direitos reservados para o CENPEC.');
fsobre:=tfsobre.create(self);
fsobre.showmodal;
fsobre.free;
end;

procedure TForm1.ToolButton7Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
  begin
    cor:=ColorDialog1.Color;
    SVOGISImage1.ActiveLayer.GraphicStyles.Brush.Color:=cor;
    ToolButtonBackClick(self);
    ToolButton7.Hint:='Cor escolhida: '+ColorToString(cor);
  end;
end;

procedure TForm1.ToolButton9Click(Sender: TObject);
begin
  ffaixas:=Tffaixas.create(self);
  ffaixas.id_indicador:=888;
  ffaixas.ano:='2005';
  ffaixas.showmodal;
  ffaixas.free;
end;

procedure TForm1.montaCabecalho(titulos:TDBGridColumns);
var i,l:integer;
begin
  arq.add('<tr class="titulo">');
    for i:=0 to titulos.count -1 do
    begin
      if titulos.Items[i].Visible then
      begin
        if (titulos.Items[i].DisplayName = 'Item') or (titulos.Items[i].DisplayName = 'Zona')
          or (titulos.Items[i].DisplayName = 'Qualificador') or (titulos.Items[i].DisplayName = 'Ano')
            or (titulos.Items[i].DisplayName = 'Valor') or (titulos.Items[i].DisplayName = 'ValUF')
              or (titulos.Items[i].DisplayName = 'ValBrasil') then
        begin
          arq.add('<td align="center">');
          {if titulos.Items[i].DisplayName = 'Qualificador' then
            arq.add('Filtro II')
          else if titulos.Items[i].DisplayName = 'Zona' then
            arq.add('Filtro I')
          else if titulos.Items[i].DisplayName = 'Item' then
            arq.add('Variável')
          else
            arq.add(titulos.Items[i].DisplayName); }
            arq.add(titulos.Items[i].Title.Caption);

          arq.add('</td>');
        end;
      end;
    end;
    arq.add('</tr>');
end;

procedure TForm1.imprimiValores(grid:TDBGrid);
var i:Integer;
flip:boolean;
Tabela:TDataSet;
begin

  tabela:=grid.DataSource.DataSet;
  //if tabela.active then tabela.active:=false;
  //tabela.open;
  tabela.First;
  flip:=false;
  while not tabela.Eof do
  begin
    if flip then
      arq.add('<tr class="zebra">')
    else
      arq.add('<tr>');
    flip:=not flip;

    for i:=0 to Grid.Columns.Count-1 do
    begin
      if grid.Columns.Items[i].Visible then
      begin
        if (grid.Columns.Items[i].DisplayName = 'Item') or (grid.Columns.Items[i].DisplayName = 'Zona')
            or (grid.Columns.Items[i].DisplayName = 'Qualificador') or (grid.Columns.Items[i].DisplayName = 'Ano')
              or (grid.Columns.Items[i].DisplayName = 'Valor') or (grid.Columns.Items[i].DisplayName = 'ValUF')
                or (grid.Columns.Items[i].DisplayName = 'ValBrasil') then
        begin
          if (grid.Columns.Items[i].DisplayName = 'Valor') or (grid.Columns.Items[i].DisplayName = 'ValUF')
                or (grid.Columns.Items[i].DisplayName = 'ValBrasil') then
          begin
            arq.add('<td align="right">');



            arq.add(    formatfloat( (tabela.Fields.FieldByName(grid.Columns.Items[i].FieldName) as TfloatField).DisplayFormat, tabela.FieldByName(grid.Columns.Items[i].FieldName).AsFloat));


            arq.add('</td>');
          end
          else if (grid.Columns.Items[i].DisplayName = 'Ano')  then
          begin
            arq.add('<td align="right">');
            arq.add(tabela.FieldByName(grid.Columns.Items[i].FieldName).AsString);
            arq.add('</td>');
          end
          else
          begin
            arq.add('<td align="left">');
            arq.add(tabela.FieldByName(grid.Columns.Items[i].FieldName).AsString);
            arq.add('</td>');
          end
        end;
      end;
    end;
    arq.add('</tr>');
    tabela.next;
  end;
  tabela.First;
end;

procedure tform1.colocarodape();
begin
  arq.Add('<table width="98%" border="0" align="center">');
  arq.Add('<tr>');
  arq.Add('<td> ');
  arq.Add('<img src="rodape.jpg" alt="cenpec" />');
  arq.Add('</td>');
  arq.Add('</tr>');
  arq.Add('</table>');
end;


procedure tform1.imprimirTabela(grid:TDBGrid);
begin
 arq:=tstringlist.create();
 arq.Add(memo1.Lines.Text);


 colocaInfos(grid);
 arq.add('<table width = "100%">');
 montaCabecalho(grid.Columns);
 imprimiValores(grid);
 arq.add('</table>');
 colocarodape();
 try
    arq.SaveToFile('c:\HTML_Banco\tabela.html');
  except




  end;
  abreArquivonoTemp('tabela.html');
 arq.free;

end;

procedure tform1.colocaInfos(grid:TDBGrid);
var
Tabela:TDataSet;
begin
  tabela:=grid.DataSource.DataSet;

  arq.Add('<table width="100%">');
  arq.Add('<tr class="titulo">');
  if cbuf.DisplayValue <> 'Brasil' then
  begin
    arq.Add('  <td>UF</td>');
    arq.Add('  <td colspan="2">Município</td>');
  end
  else
  begin
    arq.Add('  <td colspan="3">Localidade</td>');
  end;
  arq.Add('</tr>');
  arq.Add('<tr>');
  if cbuf.DisplayValue <> 'Brasil' then
  begin
    arq.Add('  <td>'+cbuf.DisplayValue+'</td>');
    arq.Add('  <td colspan="2">'+CBMuni.DisplayValue+'</td>');
  end
  else
  begin
    arq.Add('  <td colspan="3">Brasil</td>');
  end;
  arq.Add('</tr>');
  arq.Add('<tr class="titulo">');
  arq.Add('  <td>Dimensão do Indicador</td>');
  arq.Add('  <td>Indicador</td>');
  arq.Add('</tr>');
  arq.Add('<tr>');
  arq.Add('  <td>'+CBGrupo.DisplayValue+'</td>');
  arq.Add('  <td>'+CBIndica.DisplayValue+'</td>');
  arq.Add('</tr>');

  if ((CBZona.DisplayValue <>'') or (CBquali.DisplayValue<>'')) then
  begin
    arq.Add('<tr class="titulo">');
    arq.Add('  <td></td>');

        if CBZona.DisplayValue = '' then
        arq.Add('  <td></td>')
      else
        arq.Add('  <td>Filtro I</td>');


      if CBquali.DisplayValue = '' then
        arq.Add('  <td></td>')
      else
        arq.Add('  <td>Filtro II</td>');


    arq.Add('</tr>');
  end;


  if ((CBZona.DisplayValue <>'') or (CBquali.DisplayValue<>'')) then
  begin
  arq.Add('<tr>');
  arq.Add('  <td></td>');

      if CBZona.DisplayValue = '' then
      arq.Add('  <td></td>')
    else
      arq.Add('  <td>'+CBZona.DisplayValue+'</td>');


    if CBquali.DisplayValue = '' then
      arq.Add('  <td></td>')
    else
      arq.Add('  <td>'+CBquali.DisplayValue+'</td>');




  arq.Add('</tr>');
  end;

  arq.Add('<tr class="titulo">');
  arq.Add('  <td colspan="3">Fonte</td>');
  arq.Add('</tr>');
  arq.Add('<tr>');
  arq.Add('  <td colspan="3">'+Panel1.Caption+'</td>');
  arq.Add('</tr>');

  //

  arq.Add('</table>');
end;



procedure TForm1.Imprimir1Click(Sender: TObject);
begin

imprimirTabela(GridBrasil_falso);

end;

procedure TForm1.Imprimir2Click(Sender: TObject);
begin
imprimirTabela(GridVal_falso);
end;

procedure TForm1.Crditos1Click(Sender: TObject);
begin
 try
    shellexecute(handle,'open',pchar(dm.dire+'HTML\pop46.htm'),nil,nil,SW_SHOW);
  except
    showMessage('Erro na leitura do arquivo');
  end;




end;

end.



