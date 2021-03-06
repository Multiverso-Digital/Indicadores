object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 249
  Top = 310
  Height = 512
  Width = 816
  object qCidades: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      ' descricao_localidades.ID_localidade,'
      '  descricao_localidades.Cidade,'
      '  descricao_localidades.IBGE'
      'FROM'
      '  descricao_localidades'
      'where '
      '  descricao_localidades.UF = :UF'
      '  and ID_Cidade > 0'
      'order by '
      'descricao_localidades.Cidade')
    FetchAll = True
    Left = 64
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'UF'
        Value = ''
      end>
    object qCidadesID_localidade: TIntegerField
      FieldName = 'ID_localidade'
      Origin = 'descricao_localidades.ID_localidade'
    end
    object qCidadesCidade: TStringField
      FieldName = 'Cidade'
      Origin = 'descricao_localidades.Cidade'
      Size = 50
    end
    object qCidadesIBGE: TLargeintField
      FieldName = 'IBGE'
      Origin = 'descricao_localidades.IBGE'
    end
  end
  object ds_cidades: TDataSource
    DataSet = qCidades
    Left = 64
    Top = 120
  end
  object qGrupos: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  descricao_indicadores.ID_Indicador,'
      '  descricao_indicadores.ID_Grupo,'
      '  descricao_indicadores.ID_nome,'
      '  descricao_indicadores.ID_Item,'
      '  descricao_indicadores.ID_Zona,'
      '  descricao_indicadores.ID_Qualificador,'
      '  descricao_indicadores.ID_Fonte,'
      '  descricao_indicadores.ID_Tipo,'
      '  descricao_indicadores.ID_Moeda,'
      '  descricao_indicadores.Exporta,'
      '  descricao_indicadores.Sequencia,'
      '  descricao_indicadores.Grupo'
      'FROM'
      '  descricao_indicadores'
      'where'
      '  ID_Indicador in (select ID_Indicador from cad_indicadores)'
      '  and exporta = 1'
      'group by ID_Grupo'
      'order by Grupo')
    FetchAll = True
    Left = 128
    Top = 64
    object qGruposID_Indicador: TIntegerField
      FieldName = 'ID_Indicador'
    end
    object qGruposID_Grupo: TLargeintField
      FieldName = 'ID_Grupo'
    end
    object qGruposID_nome: TLargeintField
      FieldName = 'ID_nome'
    end
    object qGruposID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qGruposID_Zona: TLargeintField
      FieldName = 'ID_Zona'
    end
    object qGruposID_Qualificador: TLargeintField
      FieldName = 'ID_Qualificador'
    end
    object qGruposID_Fonte: TLargeintField
      FieldName = 'ID_Fonte'
    end
    object qGruposID_Tipo: TLargeintField
      FieldName = 'ID_Tipo'
    end
    object qGruposID_Moeda: TLargeintField
      FieldName = 'ID_Moeda'
    end
    object qGruposExporta: TLargeintField
      FieldName = 'Exporta'
    end
    object qGruposSequencia: TLargeintField
      FieldName = 'Sequencia'
    end
    object qGruposGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
  end
  object ds_Grupos: TDataSource
    DataSet = qGrupos
    Left = 128
    Top = 120
  end
  object qUF: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  descricao_localidades.ID_Localidade,'
      '  descricao_localidades.ID_pais,'
      '  descricao_localidades.ID_UF,'
      '  descricao_localidades.ID_Cidade,'
      '  descricao_localidades.Pais,'
      
        '  if (descricao_localidades.UF is null,'#39'Brasil'#39',descricao_locali' +
        'dades.UF) as UF,'
      '  descricao_localidades.Cidade,'
      '  descricao_localidades.IBGE,'
      '  descricao_localidades.Porte,'
      '  descricao_localidades.longitude,'
      '  descricao_localidades.latitude,'
      '  descricao_localidades.porte_redu'
      'FROM'
      '  `descricao_localidades`'
      '  group by ID_UF'
      
        '  order by descricao_localidades.ID_pais,descricao_localidades.I' +
        'D_UF')
    FetchAll = True
    Left = 8
    Top = 64
    object qUFID_Localidade: TIntegerField
      FieldName = 'ID_Localidade'
    end
    object qUFID_pais: TLargeintField
      FieldName = 'ID_pais'
    end
    object qUFID_UF: TLargeintField
      FieldName = 'ID_UF'
    end
    object qUFID_Cidade: TLargeintField
      FieldName = 'ID_Cidade'
    end
    object qUFPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object qUFUF: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object qUFCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qUFIBGE: TLargeintField
      FieldName = 'IBGE'
    end
    object qUFPorte: TStringField
      FieldName = 'Porte'
      Size = 100
    end
    object qUFlongitude: TFloatField
      FieldName = 'longitude'
    end
    object qUFlatitude: TFloatField
      FieldName = 'latitude'
    end
    object qUFporte_redu: TStringField
      FieldName = 'porte_redu'
      Size = 30
    end
  end
  object ds_UF: TDataSource
    DataSet = qUF
    Left = 8
    Top = 120
  end
  object qIndicador: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  descricao_indicadores.ID_Indicador,'
      '  descricao_indicadores.ID_Grupo,'
      '  descricao_indicadores.ID_nome,'
      '  descricao_indicadores.ID_Item,'
      '  descricao_indicadores.ID_Zona,'
      '  descricao_indicadores.ID_Qualificador,'
      '  descricao_indicadores.ID_Fonte,'
      '  descricao_indicadores.ID_Tipo,'
      '  descricao_indicadores.ID_Moeda,'
      '  descricao_indicadores.Exporta,'
      '  descricao_indicadores.Sequencia,'
      '  descricao_indicadores.Grupo,'
      '  descricao_indicadores.Indicador,'
      '  descricao_indicadores.nomeredu,'
      '  descricao_indicadores.pagina_html,'
      '  descricao_indicadores.Fonte'
      'FROM'
      '  descricao_indicadores'
      'WHERE'
      
        '  (ID_Indicador IN (SELECT cad_indicadores.ID_Indicador FROM cad' +
        '_indicadores)) AND '
      '  (exporta = 1) and'
      '  ID_Grupo = :grupo'
      'GROUP BY'
      '  ID_nome'
      'ORDER BY'
      '  nomeredu')
    FetchAll = True
    Left = 192
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'grupo'
        Value = ''
      end>
    object qIndicadorID_Indicador: TIntegerField
      FieldName = 'ID_Indicador'
    end
    object qIndicadorID_Grupo: TLargeintField
      FieldName = 'ID_Grupo'
    end
    object qIndicadorID_nome: TLargeintField
      FieldName = 'ID_nome'
    end
    object qIndicadorID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qIndicadorID_Zona: TLargeintField
      FieldName = 'ID_Zona'
    end
    object qIndicadorID_Qualificador: TLargeintField
      FieldName = 'ID_Qualificador'
    end
    object qIndicadorID_Fonte: TLargeintField
      FieldName = 'ID_Fonte'
    end
    object qIndicadorID_Tipo: TLargeintField
      FieldName = 'ID_Tipo'
    end
    object qIndicadorID_Moeda: TLargeintField
      FieldName = 'ID_Moeda'
    end
    object qIndicadorExporta: TLargeintField
      FieldName = 'Exporta'
    end
    object qIndicadorSequencia: TLargeintField
      FieldName = 'Sequencia'
    end
    object qIndicadorGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qIndicadorIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qIndicadornomeredu: TStringField
      FieldName = 'nomeredu'
      Size = 50
    end
    object qIndicadorpagina_html: TStringField
      FieldName = 'pagina_html'
      Size = 50
    end
    object qIndicadorFonte: TStringField
      FieldName = 'Fonte'
      Size = 50
    end
  end
  object ds_Indicador: TDataSource
    DataSet = qIndicador
    Left = 192
    Top = 120
  end
  object qFiltroItem: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  descricao_indicadores.ID_Indicador,'
      '  descricao_indicadores.ID_Grupo,'
      '  descricao_indicadores.ID_nome,'
      '  descricao_indicadores.ID_Item,'
      '  descricao_indicadores.ID_Zona,'
      '  descricao_indicadores.ID_Qualificador,'
      '  descricao_indicadores.ID_Fonte,'
      '  descricao_indicadores.ID_Tipo,'
      '  descricao_indicadores.ID_Moeda,'
      '  descricao_indicadores.Exporta,'
      '  descricao_indicadores.Sequencia,'
      '  descricao_indicadores.Grupo,'
      '  descricao_indicadores.Indicador,'
      '  descricao_indicadores.nomeredu,'
      '  descricao_indicadores.Item'
      'FROM'
      '  descricao_indicadores'
      'WHERE'
      
        '  (ID_Indicador IN (SELECT cad_indicadores.ID_Indicador FROM cad' +
        '_indicadores)) AND '
      '  (exporta = 1) AND '
      '  (ID_Grupo = :ID_Grupo) AND '
      '  (ID_Nome = :ID_Nome)'
      'GROUP BY'
      '  ID_Item'
      'ORDER BY'
      '  Item')
    FetchAll = True
    Left = 248
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_Grupo'
      end
      item
        DataType = ftUnknown
        Name = 'ID_Nome'
      end>
    object qFiltroItemID_Indicador: TIntegerField
      FieldName = 'ID_Indicador'
    end
    object qFiltroItemID_Grupo: TLargeintField
      FieldName = 'ID_Grupo'
    end
    object qFiltroItemID_nome: TLargeintField
      FieldName = 'ID_nome'
    end
    object qFiltroItemID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qFiltroItemID_Zona: TLargeintField
      FieldName = 'ID_Zona'
    end
    object qFiltroItemID_Qualificador: TLargeintField
      FieldName = 'ID_Qualificador'
    end
    object qFiltroItemID_Fonte: TLargeintField
      FieldName = 'ID_Fonte'
    end
    object qFiltroItemID_Tipo: TLargeintField
      FieldName = 'ID_Tipo'
    end
    object qFiltroItemID_Moeda: TLargeintField
      FieldName = 'ID_Moeda'
    end
    object qFiltroItemExporta: TLargeintField
      FieldName = 'Exporta'
    end
    object qFiltroItemSequencia: TLargeintField
      FieldName = 'Sequencia'
    end
    object qFiltroItemGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qFiltroItemIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qFiltroItemnomeredu: TStringField
      FieldName = 'nomeredu'
      Size = 50
    end
    object qFiltroItemItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
  end
  object ds_FiltroItem: TDataSource
    DataSet = qFiltroItem
    Left = 248
    Top = 120
  end
  object qFiltroZona: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  descricao_indicadores.ID_Indicador,'
      '  descricao_indicadores.ID_Grupo,'
      '  descricao_indicadores.ID_nome,'
      '  descricao_indicadores.ID_Item,'
      '  descricao_indicadores.ID_Zona,'
      '  descricao_indicadores.ID_Qualificador,'
      '  descricao_indicadores.ID_Fonte,'
      '  descricao_indicadores.ID_Tipo,'
      '  descricao_indicadores.ID_Moeda,'
      '  descricao_indicadores.Exporta,'
      '  descricao_indicadores.Sequencia,'
      '  descricao_indicadores.Grupo,'
      '  descricao_indicadores.Indicador,'
      '  descricao_indicadores.nomeredu,'
      '  descricao_indicadores.Item,'
      '  descricao_indicadores.Zona'
      'FROM'
      '  descricao_indicadores'
      'WHERE'
      
        '  (ID_Indicador IN (SELECT cad_indicadores.ID_Indicador FROM cad' +
        '_indicadores)) AND '
      '  (exporta = 1) AND '
      '  (ID_Grupo = :ID_Grupo) AND '
      '  (ID_Nome = :ID_Nome) and'
      '  Zona <> '#39#39
      'GROUP BY'
      '  ID_Zona'
      'ORDER BY'
      '  Zona')
    FetchAll = True
    Left = 312
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_Grupo'
      end
      item
        DataType = ftUnknown
        Name = 'ID_Nome'
      end>
    object qFiltroZonaID_Indicador: TIntegerField
      FieldName = 'ID_Indicador'
    end
    object qFiltroZonaID_Grupo: TLargeintField
      FieldName = 'ID_Grupo'
    end
    object qFiltroZonaID_nome: TLargeintField
      FieldName = 'ID_nome'
    end
    object qFiltroZonaID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qFiltroZonaID_Zona: TLargeintField
      FieldName = 'ID_Zona'
    end
    object qFiltroZonaID_Qualificador: TLargeintField
      FieldName = 'ID_Qualificador'
    end
    object qFiltroZonaID_Fonte: TLargeintField
      FieldName = 'ID_Fonte'
    end
    object qFiltroZonaID_Tipo: TLargeintField
      FieldName = 'ID_Tipo'
    end
    object qFiltroZonaID_Moeda: TLargeintField
      FieldName = 'ID_Moeda'
    end
    object qFiltroZonaExporta: TLargeintField
      FieldName = 'Exporta'
    end
    object qFiltroZonaSequencia: TLargeintField
      FieldName = 'Sequencia'
    end
    object qFiltroZonaGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qFiltroZonaIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qFiltroZonanomeredu: TStringField
      FieldName = 'nomeredu'
      Size = 50
    end
    object qFiltroZonaItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object qFiltroZonaZona: TStringField
      FieldName = 'Zona'
      Size = 50
    end
  end
  object ds_FiltroZona: TDataSource
    DataSet = qFiltroZona
    Left = 312
    Top = 120
  end
  object qFiltroquali: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  descricao_indicadores.ID_Indicador,'
      '  descricao_indicadores.ID_Grupo,'
      '  descricao_indicadores.ID_nome,'
      '  descricao_indicadores.ID_Item,'
      '  descricao_indicadores.ID_Zona,'
      '  descricao_indicadores.ID_Qualificador,'
      '  descricao_indicadores.ID_Fonte,'
      '  descricao_indicadores.ID_Tipo,'
      '  descricao_indicadores.ID_Moeda,'
      '  descricao_indicadores.Exporta,'
      '  descricao_indicadores.Sequencia,'
      '  descricao_indicadores.Grupo,'
      '  descricao_indicadores.Indicador,'
      '  descricao_indicadores.nomeredu,'
      '  descricao_indicadores.Item,'
      '  descricao_indicadores.Qualificador'
      'FROM'
      '  descricao_indicadores'
      'WHERE'
      
        '  (ID_Indicador IN (SELECT cad_indicadores.ID_Indicador FROM cad' +
        '_indicadores)) AND '
      '  (exporta = 1) AND '
      '  (ID_Grupo = :ID_Grupo) AND '
      '  (ID_Nome = :ID_Nome) and'
      '  Qualificador <> '#39#39
      'GROUP BY'
      '  ID_Qualificador'
      'ORDER BY'
      '  Qualificador'
      '')
    FetchAll = True
    Left = 384
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_Grupo'
      end
      item
        DataType = ftUnknown
        Name = 'ID_Nome'
      end>
    object qFiltroqualiID_Indicador: TIntegerField
      FieldName = 'ID_Indicador'
    end
    object qFiltroqualiID_Grupo: TLargeintField
      FieldName = 'ID_Grupo'
    end
    object qFiltroqualiID_nome: TLargeintField
      FieldName = 'ID_nome'
    end
    object qFiltroqualiID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qFiltroqualiID_Zona: TLargeintField
      FieldName = 'ID_Zona'
    end
    object qFiltroqualiID_Qualificador: TLargeintField
      FieldName = 'ID_Qualificador'
    end
    object qFiltroqualiID_Fonte: TLargeintField
      FieldName = 'ID_Fonte'
    end
    object qFiltroqualiID_Tipo: TLargeintField
      FieldName = 'ID_Tipo'
    end
    object qFiltroqualiID_Moeda: TLargeintField
      FieldName = 'ID_Moeda'
    end
    object qFiltroqualiExporta: TLargeintField
      FieldName = 'Exporta'
    end
    object qFiltroqualiSequencia: TLargeintField
      FieldName = 'Sequencia'
    end
    object qFiltroqualiGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qFiltroqualiIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qFiltroqualinomeredu: TStringField
      FieldName = 'nomeredu'
      Size = 50
    end
    object qFiltroqualiItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object qFiltroqualiQualificador: TStringField
      FieldName = 'Qualificador'
      Size = 100
    end
  end
  object ds_Filtroquali: TDataSource
    DataSet = qFiltroquali
    Left = 384
    Top = 120
  end
  object qFiltroAno: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  `cad_indicadores`.Ano'
      'FROM'
      '  `cad_indicadores`'
      
        '  INNER JOIN `descricao_indicadores` ON (`cad_indicadores`.ID_In' +
        'dicador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      ' (ID_Grupo = :ID_Grupo) AND'
      '  (ID_Nome = :ID_Nome) and '
      '(exporta = 1)'
      ''
      'group by ano'
      'order by ano')
    FetchAll = True
    Left = 456
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_Grupo'
      end
      item
        DataType = ftUnknown
        Name = 'ID_Nome'
      end>
    object qFiltroAnoAno: TIntegerField
      FieldName = 'Ano'
    end
  end
  object ds_filtroAno: TDataSource
    DataSet = qFiltroAno
    Left = 456
    Top = 120
  end
  object qValBrasil: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  cad_indicadores.ID_Localidade,'
      '  cad_indicadores.ID_Indicador,'
      '  descricao_indicadores.ID_Grupo,'
      '  descricao_indicadores.ID_nome,'
      '  descricao_indicadores.ID_Item,'
      '  descricao_indicadores.ID_Zona,'
      '  descricao_indicadores.ID_Qualificador,'
      '  descricao_indicadores.ID_Fonte,'
      '  descricao_indicadores.ID_Tipo,'
      '  descricao_indicadores.ID_Moeda,'
      '  descricao_indicadores.Grupo,'
      '  descricao_indicadores.Indicador,'
      '  descricao_indicadores.Item,'
      '  descricao_indicadores.Zona,'
      '  descricao_indicadores.Qualificador,'
      '  descricao_indicadores.Fonte,'
      '  descricao_indicadores.Tipo,'
      '  cad_indicadores.Ano,'
      '  cad_indicadores.Valor'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN descricao_indicadores ON (cad_indicadores.ID_Indica' +
        'dor = descricao_indicadores.ID_Indicador)'
      'WHERE'
      '  (ID_Localidade = 1) AND'
      '  (descricao_indicadores.ID_Grupo = :ID_Grupo) AND '
      '  (descricao_indicadores.ID_nome = :ID_nome) AND '
      '  (exporta = 1)'
      'ORDER BY'
      '  descricao_indicadores.Item,'
      '  descricao_indicadores.Zona,'
      '  descricao_indicadores.Qualificador,'
      '  cad_indicadores.Ano')
    FetchAll = True
    Left = 8
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_Grupo'
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'ID_nome'
      end>
    object qValBrasilID_Localidade: TIntegerField
      FieldName = 'ID_Localidade'
    end
    object qValBrasilID_Indicador: TIntegerField
      FieldName = 'ID_Indicador'
    end
    object qValBrasilID_Grupo: TLargeintField
      FieldName = 'ID_Grupo'
    end
    object qValBrasilID_nome: TLargeintField
      FieldName = 'ID_nome'
    end
    object qValBrasilID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qValBrasilID_Zona: TLargeintField
      FieldName = 'ID_Zona'
    end
    object qValBrasilID_Qualificador: TLargeintField
      FieldName = 'ID_Qualificador'
    end
    object qValBrasilID_Fonte: TLargeintField
      FieldName = 'ID_Fonte'
    end
    object qValBrasilID_Tipo: TLargeintField
      FieldName = 'ID_Tipo'
    end
    object qValBrasilID_Moeda: TLargeintField
      FieldName = 'ID_Moeda'
    end
    object qValBrasilGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qValBrasilIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qValBrasilItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object qValBrasilZona: TStringField
      FieldName = 'Zona'
      Size = 50
    end
    object qValBrasilQualificador: TStringField
      FieldName = 'Qualificador'
      Size = 100
    end
    object qValBrasilFonte: TStringField
      FieldName = 'Fonte'
      Size = 50
    end
    object qValBrasilTipo: TStringField
      FieldName = 'Tipo'
      Size = 50
    end
    object qValBrasilAno: TIntegerField
      FieldName = 'Ano'
    end
    object qValBrasilValor: TFloatField
      FieldName = 'Valor'
    end
  end
  object ds_valBrasil: TDataSource
    DataSet = qValBrasil
    OnDataChange = ds_valBrasilDataChange
    Left = 8
    Top = 240
  end
  object qValMuni: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  cad_indicadores.ID_Localidade,'
      '  cad_indicadores.ID_Indicador,'
      '  descricao_indicadores.ID_Grupo,'
      '  descricao_indicadores.ID_nome,'
      '  descricao_indicadores.ID_Item,'
      '  descricao_indicadores.ID_Zona,'
      '  descricao_indicadores.ID_Qualificador,'
      '  descricao_localidades.ID_UF,'
      '  descricao_indicadores.Grupo,'
      '  descricao_indicadores.Indicador,'
      '  descricao_indicadores.Item,'
      '  descricao_indicadores.Zona,'
      '  descricao_indicadores.Qualificador,'
      '  descricao_indicadores.Fonte,'
      '  descricao_indicadores.Tipo,'
      '  descricao_indicadores.nomeredu,'
      '  cad_indicadores.Ano,'
      '  cad_indicadores.Valor,'
      
        '  (SELECT indi.valor FROM cad_indicadores indi WHERE (indi.ID_In' +
        'dicador = cad_indicadores.ID_Indicador) AND (indi.ano = cad_indi' +
        'cadores.ano) AND (indi.ID_localidade = 1)) AS ValBrasil,'
      
        '  (SELECT indi.valor FROM cad_indicadores indi WHERE (indi.ID_In' +
        'dicador = cad_indicadores.ID_Indicador) AND (indi.ano = cad_indi' +
        'cadores.ano) AND (indi.ID_localidade = (SELECT descr.id_localida' +
        'de FROM descricao_localidades descr WHERE (descr.ID_UF = descric' +
        'ao_localidades.ID_UF) AND (descr.id_cidade = 0)))) AS ValUF,'
      '  descricao_localidades.UF,'
      '  descricao_localidades.Cidade,'
      '  descricao_localidades.IBGE,'
      '  descricao_localidades.Porte,'
      '  descricao_localidades.porte_redu'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN descricao_indicadores ON (cad_indicadores.ID_Indica' +
        'dor = descricao_indicadores.ID_Indicador)'
      
        '  INNER JOIN descricao_localidades ON (cad_indicadores.ID_Locali' +
        'dade = descricao_localidades.ID_Localidade)'
      'WHERE'
      '  (cad_indicadores.ID_Localidade = :ID_Local) AND '
      '  (descricao_indicadores.ID_Grupo = :ID_grupo) AND '
      '  (descricao_indicadores.ID_nome = :ID_nome) AND '
      '  (exporta = 1)'
      'ORDER BY'
      '  descricao_indicadores.Item,'
      '  descricao_indicadores.Zona,'
      '  descricao_indicadores.Qualificador,'
      '  cad_indicadores.Ano')
    FetchAll = True
    Left = 72
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_Local'
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'ID_grupo'
      end
      item
        DataType = ftUnknown
        Name = 'ID_nome'
      end>
    object qValMuniID_Localidade: TIntegerField
      FieldName = 'ID_Localidade'
    end
    object qValMuniID_Indicador: TIntegerField
      FieldName = 'ID_Indicador'
    end
    object qValMuniID_Grupo: TLargeintField
      FieldName = 'ID_Grupo'
    end
    object qValMuniID_nome: TLargeintField
      FieldName = 'ID_nome'
    end
    object qValMuniID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qValMuniID_Zona: TLargeintField
      FieldName = 'ID_Zona'
    end
    object qValMuniID_Qualificador: TLargeintField
      FieldName = 'ID_Qualificador'
    end
    object qValMuniID_UF: TLargeintField
      FieldName = 'ID_UF'
    end
    object qValMuniGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qValMuniIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qValMuniItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object qValMuniZona: TStringField
      FieldName = 'Zona'
      Size = 50
    end
    object qValMuniQualificador: TStringField
      FieldName = 'Qualificador'
      Size = 100
    end
    object qValMuniFonte: TStringField
      FieldName = 'Fonte'
      Size = 50
    end
    object qValMuniTipo: TStringField
      FieldName = 'Tipo'
      Size = 50
    end
    object qValMuninomeredu: TStringField
      FieldName = 'nomeredu'
      Size = 50
    end
    object qValMuniAno: TIntegerField
      FieldName = 'Ano'
    end
    object qValMuniValor: TFloatField
      FieldName = 'Valor'
    end
    object qValMuniValBrasil: TFloatField
      FieldName = 'ValBrasil'
    end
    object qValMuniValUF: TFloatField
      FieldName = 'ValUF'
    end
    object qValMuniUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object qValMuniCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qValMuniIBGE: TLargeintField
      FieldName = 'IBGE'
    end
    object qValMuniPorte: TStringField
      FieldName = 'Porte'
      Size = 100
    end
    object qValMuniporte_redu: TStringField
      FieldName = 'porte_redu'
      Size = 30
    end
  end
  object ds_ValMuni: TDataSource
    DataSet = qValMuni
    OnDataChange = ds_ValMuniDataChange
    Left = 72
    Top = 240
  end
  object qHint: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      '      `cad_indicadores`.ID_Localidade,'
      '      `cad_indicadores`.ID_Indicador,'
      '      `descricao_localidades`.ID_pais,'
      '      `descricao_localidades`.ID_UF,'
      '      `descricao_localidades`.ID_Cidade,'
      '      `descricao_indicadores`.ID_Grupo,'
      '      `descricao_indicadores`.ID_nome,'
      '      `descricao_indicadores`.ID_Item,'
      '      `descricao_indicadores`.ID_Zona,'
      '      `descricao_indicadores`.ID_Qualificador,'
      '      `descricao_indicadores`.ID_Fonte,'
      '      `descricao_indicadores`.ID_Tipo,'
      '      `descricao_indicadores`.ID_Moeda,'
      '      `descricao_localidades`.IBGE,'
      '      `descricao_localidades`.UF,'
      '      `descricao_localidades`.Cidade,'
      '      `descricao_indicadores`.Nomeredu,'
      '      `descricao_indicadores`.Item,'
      '      `descricao_indicadores`.Zona,'
      '      `descricao_indicadores`.Qualificador,'
      '      `descricao_localidades`.porte_redu,'
      '      `descricao_indicadores`.Tipo,'
      '      `cad_indicadores`.Ano,'
      '      `cad_indicadores`.Valor'
      '    FROM'
      '      `cad_indicadores`'
      
        '      INNER JOIN `descricao_indicadores` ON (`cad_indicadores`.I' +
        'D_Indicador = `descricao_indicadores`.ID_Indicador)'
      
        '      INNER JOIN `descricao_localidades` ON (`cad_indicadores`.I' +
        'D_Localidade = `descricao_localidades`.ID_Localidade)'
      '      WHERE'
      '      `descricao_localidades`.ID_Cidade = 0'
      '      and'
      '      `cad_indicadores`.ID_Indicador = :Id'
      '      and'
      '      `cad_indicadores`.ano = :ano')
    FetchAll = True
    Left = 152
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'Id'
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'ano'
      end>
    object qHintID_Localidade: TIntegerField
      FieldName = 'ID_Localidade'
    end
    object qHintID_Indicador: TIntegerField
      FieldName = 'ID_Indicador'
    end
    object qHintID_pais: TLargeintField
      FieldName = 'ID_pais'
    end
    object qHintID_UF: TLargeintField
      FieldName = 'ID_UF'
    end
    object qHintID_Cidade: TLargeintField
      FieldName = 'ID_Cidade'
    end
    object qHintID_Grupo: TLargeintField
      FieldName = 'ID_Grupo'
    end
    object qHintID_nome: TLargeintField
      FieldName = 'ID_nome'
    end
    object qHintID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qHintID_Zona: TLargeintField
      FieldName = 'ID_Zona'
    end
    object qHintID_Qualificador: TLargeintField
      FieldName = 'ID_Qualificador'
    end
    object qHintID_Fonte: TLargeintField
      FieldName = 'ID_Fonte'
    end
    object qHintID_Tipo: TLargeintField
      FieldName = 'ID_Tipo'
    end
    object qHintID_Moeda: TLargeintField
      FieldName = 'ID_Moeda'
    end
    object qHintIBGE: TLargeintField
      FieldName = 'IBGE'
    end
    object qHintUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object qHintCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qHintNomeredu: TStringField
      FieldName = 'Nomeredu'
      Size = 50
    end
    object qHintItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object qHintZona: TStringField
      FieldName = 'Zona'
      Size = 50
    end
    object qHintQualificador: TStringField
      FieldName = 'Qualificador'
      Size = 100
    end
    object qHintporte_redu: TStringField
      FieldName = 'porte_redu'
      Size = 30
    end
    object qHintTipo: TStringField
      FieldName = 'Tipo'
      Size = 50
    end
    object qHintAno: TIntegerField
      FieldName = 'Ano'
    end
    object qHintValor: TFloatField
      FieldName = 'Valor'
    end
  end
  object ds_Hint: TDataSource
    DataSet = qHint
    Left = 152
    Top = 248
  end
  object qLocalidade: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  `descricao_localidades`.ID_Localidade,'
      '  `descricao_localidades`.ID_pais,'
      '  `descricao_localidades`.ID_UF,'
      '  `descricao_localidades`.ID_Cidade,'
      '  `descricao_localidades`.Pais,'
      '  `descricao_localidades`.UF,'
      '  `descricao_localidades`.Cidade,'
      '  `descricao_localidades`.IBGE,'
      '  `descricao_localidades`.Porte,'
      '  `descricao_localidades`.longitude,'
      '  `descricao_localidades`.latitude,'
      '  `descricao_localidades`.porte_redu'
      'FROM'
      '  `descricao_localidades`'
      'where IBGE = :IBGE')
    FetchAll = True
    Left = 200
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IBGE'
      end>
    object qLocalidadeID_Localidade: TIntegerField
      FieldName = 'ID_Localidade'
    end
    object qLocalidadeID_pais: TLargeintField
      FieldName = 'ID_pais'
    end
    object qLocalidadeID_UF: TLargeintField
      FieldName = 'ID_UF'
    end
    object qLocalidadeID_Cidade: TLargeintField
      FieldName = 'ID_Cidade'
    end
    object qLocalidadePais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object qLocalidadeUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object qLocalidadeCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qLocalidadeIBGE: TLargeintField
      FieldName = 'IBGE'
    end
    object qLocalidadePorte: TStringField
      FieldName = 'Porte'
      Size = 100
    end
    object qLocalidadelongitude: TFloatField
      FieldName = 'longitude'
    end
    object qLocalidadelatitude: TFloatField
      FieldName = 'latitude'
    end
    object qLocalidadeporte_redu: TStringField
      FieldName = 'porte_redu'
      Size = 30
    end
  end
  object qRelUFbrasil: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      '(SELECT'
      '  `descricao_localidades`.Pais,'
      '  `descricao_localidades`.UF,'
      '  `descricao_indicadores`.Grupo,'
      '  `descricao_indicadores`.Indicador,'
      '  `descricao_indicadores`.Item,'
      '  `descricao_indicadores`.Zona,'
      '  `descricao_indicadores`.Qualificador,'
      '  `descricao_indicadores`.Fonte,'
      '  `descricao_indicadores`.Tipo,'
      '  `descricao_indicadores`.nomeredu,'
      '  `cad_indicadores`.Ano,'
      '  `cad_indicadores`.Valor'
      'FROM'
      '  `cad_indicadores`'
      
        '  INNER JOIN `descricao_indicadores` ON (`cad_indicadores`.ID_In' +
        'dicador = `descricao_indicadores`.ID_Indicador)'
      
        '  INNER JOIN `descricao_localidades` ON (`cad_indicadores`.ID_Lo' +
        'calidade = `descricao_localidades`.ID_Localidade)'
      'where'
      '  descricao_localidades.ID_Cidade = 0 and'
      '  ID_UF > 0 and'
      '  cad_indicadores.ID_Indicador = :ID_Indica and'
      '  cad_indicadores.Ano = :Ano  and'
      '  (cad_indicadores.Valor is not null) and'
      '  (exporta = 1))'
      ''
      'UNION'
      ''
      '(SELECT'
      '  `descricao_localidades`.Pais,'
      '  `descricao_localidades`.UF,'
      '  '#39'nada'#39' as Grupo,'
      '  '#39'nada'#39' as Indicador,'
      '  '#39'nada'#39' as Item,'
      '  '#39'nada'#39' as Zona,'
      '  '#39'nada'#39' as Qualificador,'
      '  '#39'nada'#39' as Fonte,'
      '  '#39'nada'#39' as Tipo,'
      '  '#39'nada'#39' as nomeredu,'
      '  -1 as Ano,'
      '  -1 as Valor'
      'FROM'
      '  `descricao_localidades`'
      'where'
      '  descricao_localidades.ID_Cidade = 0 and'
      '  descricao_localidades.ID_UF > 0 and'
      
        '  descricao_localidades.id_localidade not in(select cad_indicado' +
        'res.id_localidade from cad_indicadores where'
      '  '
      '  cad_indicadores.ID_Indicador = :ID_Indica and'
      '  cad_indicadores.Ano = :Ano  and'
      '  (cad_indicadores.Valor is not null)))'
      'order by valor desc')
    FetchAll = True
    Left = 208
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_Indica'
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'Ano'
      end
      item
        DataType = ftString
        Name = 'ID_Indica'
      end
      item
        DataType = ftUnknown
        Name = 'Ano'
      end>
    object qRelUFbrasilPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object qRelUFbrasilUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object qRelUFbrasilGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qRelUFbrasilIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qRelUFbrasilItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object qRelUFbrasilZona: TStringField
      FieldName = 'Zona'
      Size = 50
    end
    object qRelUFbrasilQualificador: TStringField
      FieldName = 'Qualificador'
      Size = 100
    end
    object qRelUFbrasilFonte: TStringField
      FieldName = 'Fonte'
      Size = 50
    end
    object qRelUFbrasilTipo: TStringField
      FieldName = 'Tipo'
      Size = 50
    end
    object qRelUFbrasilnomeredu: TStringField
      FieldName = 'nomeredu'
      Size = 50
    end
    object qRelUFbrasilAno: TLargeintField
      FieldName = 'Ano'
    end
    object qRelUFbrasilValor: TFloatField
      FieldName = 'Valor'
    end
  end
  object qRelMuniUF: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      '(SELECT'
      '  descricao_localidades.Pais,'
      '  descricao_localidades.UF,'
      '  descricao_localidades.Cidade,'
      '  descricao_localidades.IBGE,'
      '  descricao_localidades.Porte,'
      '  descricao_indicadores.Grupo,'
      '  descricao_indicadores.Indicador,'
      '  descricao_indicadores.Item,'
      '  descricao_indicadores.Zona,'
      '  descricao_indicadores.Qualificador,'
      '  descricao_indicadores.Fonte,'
      '  descricao_indicadores.Tipo,'
      '  descricao_indicadores.nomeredu,'
      '  cad_indicadores.Ano,'
      '  cad_indicadores.Valor'
      ''
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN descricao_indicadores ON (cad_indicadores.ID_Indica' +
        'dor = descricao_indicadores.ID_Indicador)'
      
        '  INNER JOIN descricao_localidades ON (cad_indicadores.ID_Locali' +
        'dade = descricao_localidades.ID_Localidade)'
      'WHERE'
      '  (ID_UF = :ID_UF) AND'
      '  (id_cidade <> 0) AND'
      '  (cad_indicadores.ID_Indicador = :ID_indica) AND'
      '  (cad_indicadores.Ano = :ano) and'
      '  (cad_indicadores.Valor is not null) and'
      '  (exporta = 1))'
      'UNION'
      '(SELECT'
      '  descricao_localidades.Pais,'
      '  descricao_localidades.UF,'
      '  descricao_localidades.Cidade,'
      '  descricao_localidades.IBGE,'
      '  descricao_localidades.Porte,'
      '  '#39'nada'#39' as grupo,'
      '  '#39'nada'#39' as Indicador,'
      '  '#39'nada'#39' as Item,'
      '  '#39'nada'#39' as Zona,'
      '  '#39'nada'#39' as Qualificador,'
      '  '#39'nada'#39' as Fonte,'
      '  '#39'nada'#39' as Tipo,'
      '  '#39'nada'#39' as nomeredu,'
      '  -1 as Ano,'
      '  -1 as Valor'
      ''
      'FROM'
      '  descricao_localidades'
      'where'
      '  (descricao_localidades.ID_UF = :id_UF)'
      '  and  descricao_localidades.id_localidade not in'
      
        '                                      (select ID_localidade from' +
        ' cad_indicadores'
      
        '                                      where  (cad_indicadores.ID' +
        '_Indicador = :ID_Indica) AND'
      
        '                                      (cad_indicadores.Ano = :an' +
        'o) and'
      
        '                                      (cad_indicadores.Valor is ' +
        'not null))'
      ''
      ''
      '  and (descricao_localidades.id_cidade <> 0) )'
      ''
      '  order by valor Desc')
    FetchAll = True
    Left = 288
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_UF'
        Value = ''
      end
      item
        DataType = ftString
        Name = 'ID_Indica'
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'Ano'
      end
      item
        DataType = ftString
        Name = 'id_UF'
      end
      item
        DataType = ftString
        Name = 'ID_Indica'
      end
      item
        DataType = ftUnknown
        Name = 'ano'
      end>
    object qRelMuniUFPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object qRelMuniUFUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object qRelMuniUFCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qRelMuniUFIBGE: TLargeintField
      FieldName = 'IBGE'
    end
    object qRelMuniUFPorte: TStringField
      FieldName = 'Porte'
      Size = 100
    end
    object qRelMuniUFGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qRelMuniUFIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qRelMuniUFItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object qRelMuniUFZona: TStringField
      FieldName = 'Zona'
      Size = 50
    end
    object qRelMuniUFQualificador: TStringField
      FieldName = 'Qualificador'
      Size = 100
    end
    object qRelMuniUFFonte: TStringField
      FieldName = 'Fonte'
      Size = 50
    end
    object qRelMuniUFTipo: TStringField
      FieldName = 'Tipo'
      Size = 50
    end
    object qRelMuniUFnomeredu: TStringField
      FieldName = 'nomeredu'
      Size = 50
    end
    object qRelMuniUFAno: TLargeintField
      FieldName = 'Ano'
    end
    object qRelMuniUFValor: TFloatField
      FieldName = 'Valor'
    end
  end
  object qGrupoFIltro: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  descricao_indicadores.ID_Indicador,'
      '  descricao_indicadores.ID_Grupo,'
      '  descricao_indicadores.ID_nome,'
      '  descricao_indicadores.ID_Item,'
      '  descricao_indicadores.ID_Zona,'
      '  descricao_indicadores.ID_Qualificador,'
      '  descricao_indicadores.ID_Fonte,'
      '  descricao_indicadores.ID_Tipo,'
      '  descricao_indicadores.ID_Moeda,'
      '  descricao_indicadores.Exporta,'
      '  descricao_indicadores.Sequencia,'
      '  descricao_indicadores.Grupo'
      'FROM'
      '  descricao_indicadores'
      'where'
      '  ID_Indicador in (select ID_Indicador from cad_indicadores)'
      'and descricao_indicadores.Exporta = 1'
      'group by ID_Grupo'
      'order by Grupo')
    FetchAll = True
    Left = 632
    Top = 16
    object qGrupoFIltroID_Indicador: TIntegerField
      FieldName = 'ID_Indicador'
    end
    object qGrupoFIltroID_Grupo: TLargeintField
      FieldName = 'ID_Grupo'
    end
    object qGrupoFIltroID_nome: TLargeintField
      FieldName = 'ID_nome'
    end
    object qGrupoFIltroID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qGrupoFIltroID_Zona: TLargeintField
      FieldName = 'ID_Zona'
    end
    object qGrupoFIltroID_Qualificador: TLargeintField
      FieldName = 'ID_Qualificador'
    end
    object qGrupoFIltroID_Fonte: TLargeintField
      FieldName = 'ID_Fonte'
    end
    object qGrupoFIltroID_Tipo: TLargeintField
      FieldName = 'ID_Tipo'
    end
    object qGrupoFIltroID_Moeda: TLargeintField
      FieldName = 'ID_Moeda'
    end
    object qGrupoFIltroExporta: TLargeintField
      FieldName = 'Exporta'
    end
    object qGrupoFIltroSequencia: TLargeintField
      FieldName = 'Sequencia'
    end
    object qGrupoFIltroGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
  end
  object ds_grupoFiltro: TDataSource
    DataSet = qGrupoFIltro
    Left = 632
    Top = 72
  end
  object qIndicaFiltro: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  descricao_indicadores.ID_Indicador,'
      '  descricao_indicadores.ID_Grupo,'
      '  descricao_indicadores.ID_nome,'
      '  descricao_indicadores.ID_Item,'
      '  descricao_indicadores.ID_Zona,'
      '  descricao_indicadores.ID_Qualificador,'
      '  descricao_indicadores.ID_Fonte,'
      '  descricao_indicadores.ID_Tipo,'
      '  descricao_indicadores.ID_Moeda,'
      '  descricao_indicadores.Exporta,'
      '  descricao_indicadores.Sequencia,'
      '  descricao_indicadores.Grupo,'
      '  descricao_indicadores.Indicador,'
      '  descricao_indicadores.nomeredu,'
      '  descricao_indicadores.pagina_html,'
      '  descricao_indicadores.Fonte'
      'FROM'
      '  descricao_indicadores'
      'WHERE'
      
        '  (ID_Indicador IN (SELECT cad_indicadores.ID_Indicador FROM cad' +
        '_indicadores)) AND '
      '  (exporta = 1) and'
      '  ID_Grupo = :grupo'
      'GROUP BY'
      '  ID_nome'
      'ORDER BY'
      '  nomeredu')
    FetchAll = True
    Left = 696
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'grupo'
        Value = ''
      end>
    object qIndicaFiltroID_Indicador: TIntegerField
      FieldName = 'ID_Indicador'
    end
    object qIndicaFiltroID_Grupo: TLargeintField
      FieldName = 'ID_Grupo'
    end
    object qIndicaFiltroID_nome: TLargeintField
      FieldName = 'ID_nome'
    end
    object qIndicaFiltroID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qIndicaFiltroID_Zona: TLargeintField
      FieldName = 'ID_Zona'
    end
    object qIndicaFiltroID_Qualificador: TLargeintField
      FieldName = 'ID_Qualificador'
    end
    object qIndicaFiltroID_Fonte: TLargeintField
      FieldName = 'ID_Fonte'
    end
    object qIndicaFiltroID_Tipo: TLargeintField
      FieldName = 'ID_Tipo'
    end
    object qIndicaFiltroID_Moeda: TLargeintField
      FieldName = 'ID_Moeda'
    end
    object qIndicaFiltroExporta: TLargeintField
      FieldName = 'Exporta'
    end
    object qIndicaFiltroSequencia: TLargeintField
      FieldName = 'Sequencia'
    end
    object qIndicaFiltroGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qIndicaFiltroIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qIndicaFiltronomeredu: TStringField
      FieldName = 'nomeredu'
      Size = 50
    end
    object qIndicaFiltropagina_html: TStringField
      FieldName = 'pagina_html'
      Size = 50
    end
    object qIndicaFiltroFonte: TStringField
      FieldName = 'Fonte'
      Size = 50
    end
  end
  object ds_IndicaFiltro: TDataSource
    DataSet = qIndicaFiltro
    Left = 696
    Top = 72
  end
  object qAnoFiltro: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  `cad_indicadores`.Ano'
      'FROM'
      '  `cad_indicadores`'
      
        '  INNER JOIN `descricao_indicadores` ON (`cad_indicadores`.ID_In' +
        'dicador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      ' (ID_Grupo = :ID_Grupo) AND'
      '  (ID_Nome = :ID_Nome) and '
      '(exporta = 1)'
      ''
      'group by ano'
      'order by ano')
    FetchAll = True
    Left = 760
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_Grupo'
      end
      item
        DataType = ftUnknown
        Name = 'ID_Nome'
      end>
    object qAnoFiltroAno: TIntegerField
      FieldName = 'Ano'
    end
  end
  object ds_anoFiltro: TDataSource
    DataSet = qAnoFiltro
    Left = 760
    Top = 72
  end
  object qRelIndicaMuni: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      '  descricao_localidades.Pais,'
      '  descricao_localidades.UF,'
      '  descricao_localidades.Cidade,'
      '  descricao_localidades.IBGE,'
      '  descricao_localidades.Porte,'
      '  descricao_indicadores.Grupo,'
      '  descricao_indicadores.Indicador,'
      '  descricao_indicadores.Item,'
      '  descricao_indicadores.Zona,'
      '  descricao_indicadores.Qualificador,'
      '  descricao_indicadores.Fonte,'
      '  descricao_indicadores.Tipo,'
      '  descricao_indicadores.nomeredu,'
      '  cad_indicadores.Ano,'
      '  cad_indicadores.Valor,'
      
        '  (SELECT indi.valor FROM cad_indicadores indi WHERE (indi.ID_In' +
        'dicador = cad_indicadores.ID_Indicador) AND (indi.ano = cad_indi' +
        'cadores.ano) AND (indi.ID_localidade = 1)) AS ValBrasil,'
      
        '  (SELECT indi.valor FROM cad_indicadores indi WHERE (indi.ID_In' +
        'dicador = cad_indicadores.ID_Indicador) AND (indi.ano = cad_indi' +
        'cadores.ano) AND (indi.ID_localidade = (SELECT descr.id_localida' +
        'de FROM descricao_localidades descr WHERE (descr.ID_UF = descric' +
        'ao_localidades.ID_UF) AND (descr.id_cidade = 0)))) AS ValUF'
      ''
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN descricao_indicadores ON (cad_indicadores.ID_Indica' +
        'dor = descricao_indicadores.ID_Indicador)'
      
        '  INNER JOIN descricao_localidades ON (cad_indicadores.ID_Locali' +
        'dade = descricao_localidades.ID_Localidade)')
    FetchAll = True
    Left = 360
    Top = 248
    object qRelIndicaMuniPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object qRelIndicaMuniUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object qRelIndicaMuniCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qRelIndicaMuniIBGE: TLargeintField
      FieldName = 'IBGE'
    end
    object qRelIndicaMuniPorte: TStringField
      FieldName = 'Porte'
      Size = 100
    end
    object qRelIndicaMuniGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qRelIndicaMuniIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qRelIndicaMuniItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object qRelIndicaMuniZona: TStringField
      FieldName = 'Zona'
      Size = 50
    end
    object qRelIndicaMuniQualificador: TStringField
      FieldName = 'Qualificador'
      Size = 100
    end
    object qRelIndicaMuniFonte: TStringField
      FieldName = 'Fonte'
      Size = 50
    end
    object qRelIndicaMuniTipo: TStringField
      FieldName = 'Tipo'
      Size = 50
    end
    object qRelIndicaMuninomeredu: TStringField
      FieldName = 'nomeredu'
      Size = 50
    end
    object qRelIndicaMuniAno: TIntegerField
      FieldName = 'Ano'
    end
    object qRelIndicaMuniValor: TFloatField
      FieldName = 'Valor'
    end
    object qRelIndicaMuniValBrasil: TFloatField
      FieldName = 'ValBrasil'
    end
    object qRelIndicaMuniValUF: TFloatField
      FieldName = 'ValUF'
    end
  end
  object qIndicaBrasil: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  `cad_indicadores`.ID_Localidade,'
      '  `cad_indicadores`.ID_Indicador,'
      '  `descricao_indicadores`.ID_Grupo,'
      '  `descricao_indicadores`.ID_nome,'
      '  `descricao_indicadores`.ID_Item,'
      '  `descricao_indicadores`.ID_Zona,'
      '  `descricao_indicadores`.ID_Qualificador,'
      '  `descricao_indicadores`.ID_Fonte,'
      '  `descricao_indicadores`.ID_Tipo,'
      '  `descricao_indicadores`.ID_Moeda,'
      '  `cad_indicadores`.Ano,'
      '  `cad_indicadores`.Valor'
      'FROM'
      '  `cad_indicadores`'
      
        '  INNER JOIN `descricao_indicadores` ON (`cad_indicadores`.ID_In' +
        'dicador = `descricao_indicadores`.ID_Indicador)'
      'where'
      '`descricao_indicadores`.ID_Grupo = :ID_Grupo and'
      '`descricao_indicadores`.ID_nome = :ID_nome and'
      '`cad_indicadores`.ano = :ano and'
      '`cad_indicadores`.ID_Localidade = 1')
    FetchAll = True
    Left = 208
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_Grupo'
      end
      item
        DataType = ftUnknown
        Name = 'ID_nome'
      end
      item
        DataType = ftUnknown
        Name = 'ano'
      end>
    object qIndicaBrasilID_Localidade: TIntegerField
      FieldName = 'ID_Localidade'
    end
    object qIndicaBrasilID_Indicador: TIntegerField
      FieldName = 'ID_Indicador'
    end
    object qIndicaBrasilID_Grupo: TLargeintField
      FieldName = 'ID_Grupo'
    end
    object qIndicaBrasilID_nome: TLargeintField
      FieldName = 'ID_nome'
    end
    object qIndicaBrasilID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qIndicaBrasilID_Zona: TLargeintField
      FieldName = 'ID_Zona'
    end
    object qIndicaBrasilID_Qualificador: TLargeintField
      FieldName = 'ID_Qualificador'
    end
    object qIndicaBrasilID_Fonte: TLargeintField
      FieldName = 'ID_Fonte'
    end
    object qIndicaBrasilID_Tipo: TLargeintField
      FieldName = 'ID_Tipo'
    end
    object qIndicaBrasilID_Moeda: TLargeintField
      FieldName = 'ID_Moeda'
    end
    object qIndicaBrasilAno: TIntegerField
      FieldName = 'Ano'
    end
    object qIndicaBrasilValor: TFloatField
      FieldName = 'Valor'
    end
  end
  object qIndicaUF: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  `cad_indicadores`.ID_Localidade,'
      '  `cad_indicadores`.ID_Indicador,'
      '  `descricao_indicadores`.ID_Grupo,'
      '  `descricao_indicadores`.ID_nome,'
      '  `descricao_indicadores`.ID_Item,'
      '  `descricao_indicadores`.ID_Zona,'
      '  `descricao_indicadores`.ID_Qualificador,'
      '  `descricao_indicadores`.ID_Fonte,'
      '  `descricao_indicadores`.ID_Tipo,'
      '  `descricao_indicadores`.ID_Moeda,'
      '  `cad_indicadores`.Ano,'
      '  `cad_indicadores`.Valor'
      'FROM'
      '  `cad_indicadores`'
      
        '  INNER JOIN `descricao_indicadores` ON (`cad_indicadores`.ID_In' +
        'dicador = `descricao_indicadores`.ID_Indicador)'
      'where'
      '`descricao_indicadores`.ID_Grupo = :ID_Grupo and'
      '`descricao_indicadores`.ID_nome = :ID_nome and'
      '`cad_indicadores`.ano = :ano and'
      '`cad_indicadores`.ID_Localidade = :ID_Indica')
    FetchAll = True
    Left = 288
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_Grupo'
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'ID_nome'
      end
      item
        DataType = ftUnknown
        Name = 'ano'
      end
      item
        DataType = ftUnknown
        Name = 'ID_Indica'
      end>
    object qIndicaUFID_Localidade: TIntegerField
      FieldName = 'ID_Localidade'
    end
    object qIndicaUFID_Indicador: TIntegerField
      FieldName = 'ID_Indicador'
    end
    object qIndicaUFID_Grupo: TLargeintField
      FieldName = 'ID_Grupo'
    end
    object qIndicaUFID_nome: TLargeintField
      FieldName = 'ID_nome'
    end
    object qIndicaUFID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qIndicaUFID_Zona: TLargeintField
      FieldName = 'ID_Zona'
    end
    object qIndicaUFID_Qualificador: TLargeintField
      FieldName = 'ID_Qualificador'
    end
    object qIndicaUFID_Fonte: TLargeintField
      FieldName = 'ID_Fonte'
    end
    object qIndicaUFID_Tipo: TLargeintField
      FieldName = 'ID_Tipo'
    end
    object qIndicaUFID_Moeda: TLargeintField
      FieldName = 'ID_Moeda'
    end
    object qIndicaUFAno: TIntegerField
      FieldName = 'Ano'
    end
    object qIndicaUFValor: TFloatField
      FieldName = 'Valor'
    end
  end
  object qIndicaMuni: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  `cad_indicadores`.ID_Localidade,'
      '  `cad_indicadores`.ID_Indicador,'
      '  `descricao_indicadores`.ID_Grupo,'
      '  `descricao_indicadores`.ID_nome,'
      '  `descricao_indicadores`.ID_Item,'
      '  `descricao_indicadores`.ID_Zona,'
      '  `descricao_indicadores`.ID_Qualificador,'
      '  `descricao_indicadores`.ID_Fonte,'
      '  `descricao_indicadores`.ID_Tipo,'
      '  `descricao_indicadores`.ID_Moeda,'
      '  `cad_indicadores`.Ano,'
      '  `cad_indicadores`.Valor'
      'FROM'
      '  `cad_indicadores`'
      
        '  INNER JOIN `descricao_indicadores` ON (`cad_indicadores`.ID_In' +
        'dicador = `descricao_indicadores`.ID_Indicador)'
      'where'
      '`descricao_indicadores`.ID_Grupo = :ID_Grupo and'
      '`descricao_indicadores`.ID_nome = :ID_nome and'
      '`cad_indicadores`.ano = :ano and'
      '`cad_indicadores`.ID_Localidade = :ID_indica')
    FetchAll = True
    Left = 360
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_Grupo'
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'ID_nome'
      end
      item
        DataType = ftUnknown
        Name = 'ano'
      end
      item
        DataType = ftUnknown
        Name = 'ID_indica'
      end>
    object qIndicaMuniID_Localidade: TIntegerField
      FieldName = 'ID_Localidade'
    end
    object qIndicaMuniID_Indicador: TIntegerField
      FieldName = 'ID_Indicador'
    end
    object qIndicaMuniID_Grupo: TLargeintField
      FieldName = 'ID_Grupo'
    end
    object qIndicaMuniID_nome: TLargeintField
      FieldName = 'ID_nome'
    end
    object qIndicaMuniID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qIndicaMuniID_Zona: TLargeintField
      FieldName = 'ID_Zona'
    end
    object qIndicaMuniID_Qualificador: TLargeintField
      FieldName = 'ID_Qualificador'
    end
    object qIndicaMuniID_Fonte: TLargeintField
      FieldName = 'ID_Fonte'
    end
    object qIndicaMuniID_Tipo: TLargeintField
      FieldName = 'ID_Tipo'
    end
    object qIndicaMuniID_Moeda: TLargeintField
      FieldName = 'ID_Moeda'
    end
    object qIndicaMuniAno: TIntegerField
      FieldName = 'Ano'
    end
    object qIndicaMuniValor: TFloatField
      FieldName = 'Valor'
    end
  end
  object MyEmbConnection1: TMyEmbConnection
    Database = 'bancao'
    Params.Strings = (
      '--basedir=E:\@Projetos_em_andamento\bancao\PRG_Access\'
      '--datadir=E:\@Projetos_em_andamento\bancao\PRG_Access\data'
      '--skip-innodb')
    Username = 'root'
    LoginPrompt = False
    Left = 32
    Top = 8
  end
  object qMat: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  `cad_indicadores`.ID_Localidade,'
      '  `descricao_indicadores`.ID_Item,'
      '  `descricao_indicadores`.Grupo,'
      '  `descricao_indicadores`.Indicador,'
      '  `descricao_indicadores`.Item,'
      '  `descricao_indicadores`.Zona,'
      '  `cad_indicadores`.Ano,'
      '  sum(`cad_indicadores`.Valor) as Total'
      'FROM'
      '  `cad_indicadores`'
      
        '  INNER JOIN `descricao_indicadores` ON (`cad_indicadores`.ID_In' +
        'dicador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      ' id_grupo = 5 and'
      ' ID_Nome = 19 and'
      ' ID_Zona = :Zona and'
      ' ID_Localidade = :local and'
      ' ano = :ano'
      ' group by id_item, id_zona'
      'order by `descricao_indicadores`.Item')
    FetchAll = True
    Left = 432
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Zona'
      end
      item
        DataType = ftUnknown
        Name = 'local'
      end
      item
        DataType = ftUnknown
        Name = 'ano'
      end>
    object qMatID_Localidade: TIntegerField
      FieldName = 'ID_Localidade'
    end
    object qMatID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qMatGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qMatIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qMatItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object qMatZona: TStringField
      FieldName = 'Zona'
      Size = 50
    end
    object qMatAno: TIntegerField
      FieldName = 'Ano'
    end
    object qMatTotal: TFloatField
      FieldName = 'Total'
    end
  end
  object qMat_Total: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  `cad_indicadores`.ID_Localidade,'
      '  `descricao_indicadores`.ID_Item,'
      '  `descricao_indicadores`.Grupo,'
      '  `descricao_indicadores`.Indicador,'
      '  `descricao_indicadores`.Item,'
      '  `descricao_indicadores`.Zona,'
      '  `cad_indicadores`.Ano,'
      '  sum(`cad_indicadores`.Valor) as Total'
      'FROM'
      '  `cad_indicadores`'
      
        '  INNER JOIN `descricao_indicadores` ON (`cad_indicadores`.ID_In' +
        'dicador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      ' id_grupo = 5 and'
      ' ID_Nome = 19 and'
      ' ID_Localidade = :Local and'
      ' ano = :ano'
      ' group by id_item'
      'order by `descricao_indicadores`.Item')
    FetchAll = True
    Left = 432
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'local'
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'ano'
      end>
    object qMat_TotalID_Localidade: TIntegerField
      FieldName = 'ID_Localidade'
    end
    object qMat_TotalID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qMat_TotalGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qMat_TotalIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qMat_TotalItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object qMat_TotalZona: TStringField
      FieldName = 'Zona'
      Size = 50
    end
    object qMat_TotalAno: TIntegerField
      FieldName = 'Ano'
    end
    object qMat_TotalTotal: TFloatField
      FieldName = 'Total'
    end
  end
  object qHint_Faixa: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      '    SELECT'
      '      `cad_indicadores`.ID_Localidade,'
      '      `cad_indicadores`.ID_Indicador,'
      '      `descricao_localidades`.ID_pais,'
      '      `descricao_localidades`.ID_UF,'
      '      `descricao_localidades`.ID_Cidade,'
      '      `descricao_indicadores`.ID_Grupo,'
      '      `descricao_indicadores`.ID_nome,'
      '      `descricao_indicadores`.ID_Item,'
      '      `descricao_indicadores`.ID_Zona,'
      '      `descricao_indicadores`.ID_Qualificador,'
      '      `descricao_indicadores`.ID_Fonte,'
      '      `descricao_indicadores`.ID_Tipo,'
      '      `descricao_indicadores`.ID_Moeda,'
      '      `descricao_localidades`.IBGE,'
      '      `descricao_localidades`.UF,'
      '      `descricao_localidades`.Cidade,'
      '      `descricao_indicadores`.Grupo,'
      '      `descricao_indicadores`.Nomeredu,'
      '      `descricao_indicadores`.Item,'
      '      `descricao_indicadores`.Zona,'
      '      `descricao_indicadores`.Qualificador,'
      '      `descricao_localidades`.porte_redu,'
      '      `descricao_indicadores`.Tipo,'
      '      `descricao_indicadores`.Fonte,'
      '      `cad_indicadores`.Ano,'
      '      `cad_indicadores`.Valor'
      '    FROM'
      '      `cad_indicadores`'
      
        '      INNER JOIN `descricao_indicadores` ON (`cad_indicadores`.I' +
        'D_Indicador = `descricao_indicadores`.ID_Indicador)'
      
        '      INNER JOIN `descricao_localidades` ON (`cad_indicadores`.I' +
        'D_Localidade = `descricao_localidades`.ID_Localidade)'
      '    WHERE'
      '       `descricao_localidades`.ID_Cidade = 0'
      '      and'
      '       `cad_indicadores`.ID_Indicador = :Id'
      '      and'
      '       `cad_indicadores`.ano = :ano')
    FetchAll = True
    Left = 16
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'Id'
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'ano'
      end>
    object qHint_FaixaID_Localidade: TIntegerField
      FieldName = 'ID_Localidade'
    end
    object qHint_FaixaID_Indicador: TIntegerField
      FieldName = 'ID_Indicador'
    end
    object qHint_FaixaID_pais: TLargeintField
      FieldName = 'ID_pais'
    end
    object qHint_FaixaID_UF: TLargeintField
      FieldName = 'ID_UF'
    end
    object qHint_FaixaID_Cidade: TLargeintField
      FieldName = 'ID_Cidade'
    end
    object qHint_FaixaID_Grupo: TLargeintField
      FieldName = 'ID_Grupo'
    end
    object qHint_FaixaID_nome: TLargeintField
      FieldName = 'ID_nome'
    end
    object qHint_FaixaID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qHint_FaixaID_Zona: TLargeintField
      FieldName = 'ID_Zona'
    end
    object qHint_FaixaID_Qualificador: TLargeintField
      FieldName = 'ID_Qualificador'
    end
    object qHint_FaixaID_Fonte: TLargeintField
      FieldName = 'ID_Fonte'
    end
    object qHint_FaixaID_Tipo: TLargeintField
      FieldName = 'ID_Tipo'
    end
    object qHint_FaixaID_Moeda: TLargeintField
      FieldName = 'ID_Moeda'
    end
    object qHint_FaixaIBGE: TLargeintField
      FieldName = 'IBGE'
    end
    object qHint_FaixaUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object qHint_FaixaCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qHint_FaixaGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qHint_FaixaNomeredu: TStringField
      FieldName = 'Nomeredu'
      Size = 50
    end
    object qHint_FaixaItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object qHint_FaixaZona: TStringField
      FieldName = 'Zona'
      Size = 50
    end
    object qHint_FaixaQualificador: TStringField
      FieldName = 'Qualificador'
      Size = 100
    end
    object qHint_Faixaporte_redu: TStringField
      FieldName = 'porte_redu'
      Size = 30
    end
    object qHint_FaixaTipo: TStringField
      FieldName = 'Tipo'
      Size = 50
    end
    object qHint_FaixaFonte: TStringField
      FieldName = 'Fonte'
      Size = 50
    end
    object qHint_FaixaAno: TIntegerField
      FieldName = 'Ano'
    end
    object qHint_FaixaValor: TFloatField
      FieldName = 'Valor'
    end
  end
  object ds_Hint_Faixa: TDataSource
    DataSet = qHint_Faixa
    Left = 16
    Top = 344
  end
  object qFaixas: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  `tab_faxias`.ID,'
      '  `tab_faxias`.ID_indicador,'
      '  `tab_faxias`.ano,'
      '  `tab_faxias`.desc_faixa,'
      '  `tab_faxias`.valor_ini,'
      '  `tab_faxias`.valor_fim,'
      '  `tab_faxias`.nr_faixa'
      ''
      'FROM'
      '  `tab_faxias`'
      '  where'
      '  `tab_faxias`.ID_indicador = :ID_indica and'
      '  `tab_faxias`.ano = :ano')
    FetchAll = True
    Left = 80
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_indica'
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'ano'
      end>
    object qFaixasID: TIntegerField
      FieldName = 'ID'
    end
    object qFaixasID_indicador: TIntegerField
      FieldName = 'ID_indicador'
    end
    object qFaixasano: TIntegerField
      FieldName = 'ano'
    end
    object qFaixasdesc_faixa: TStringField
      FieldName = 'desc_faixa'
      Size = 100
    end
    object qFaixasvalor_ini: TFloatField
      FieldName = 'valor_ini'
    end
    object qFaixasvalor_fim: TFloatField
      FieldName = 'valor_fim'
    end
    object qFaixasnr_faixa: TIntegerField
      FieldName = 'nr_faixa'
    end
  end
  object ds_faixas: TDataSource
    DataSet = qFaixas
    Left = 80
    Top = 344
  end
  object qExportaValMuni: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  descricao_localidades.IBGE,'
      '  descricao_localidades.UF,'
      '  descricao_localidades.Cidade,'
      '  descricao_indicadores.Grupo as Dimensao,'
      '  descricao_indicadores.Indicador,'
      '  descricao_indicadores.Item as Vari'#225'vel,'
      '  descricao_indicadores.Zona as FiltroI,'
      '  descricao_indicadores.Qualificador as FiltroII,'
      '  descricao_indicadores.Fonte,'
      '  descricao_indicadores.Tipo,'
      '  descricao_indicadores.nomeredu,'
      '  cad_indicadores.Ano,'
      '  cad_indicadores.Valor as ValorMuni,'
      
        '  (SELECT indi.valor FROM cad_indicadores indi WHERE (indi.ID_In' +
        'dicador = cad_indicadores.ID_Indicador) AND (indi.ano = cad_indi' +
        'cadores.ano) AND (indi.ID_localidade = 1)) AS ValBrasil,'
      
        '  (SELECT indi.valor FROM cad_indicadores indi WHERE (indi.ID_In' +
        'dicador = cad_indicadores.ID_Indicador) AND (indi.ano = cad_indi' +
        'cadores.ano) AND (indi.ID_localidade = (SELECT descr.id_localida' +
        'de FROM descricao_localidades descr WHERE (descr.ID_UF = descric' +
        'ao_localidades.ID_UF) AND (descr.id_cidade = 0)))) AS ValUF'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN descricao_indicadores ON (cad_indicadores.ID_Indica' +
        'dor = descricao_indicadores.ID_Indicador)'
      
        '  INNER JOIN descricao_localidades ON (cad_indicadores.ID_Locali' +
        'dade = descricao_localidades.ID_Localidade)'
      'WHERE'
      '  (cad_indicadores.ID_Localidade = :ID_Local) AND '
      '  (descricao_indicadores.ID_Grupo = :ID_grupo) AND '
      '  (descricao_indicadores.ID_nome = :ID_nome) AND '
      '  (exporta = 1)'
      'ORDER BY'
      '  descricao_indicadores.Item,'
      '  descricao_indicadores.Zona,'
      '  descricao_indicadores.Qualificador,'
      '  cad_indicadores.Ano')
    FetchAll = True
    Left = 264
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_Local'
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'ID_grupo'
      end
      item
        DataType = ftUnknown
        Name = 'ID_nome'
      end>
    object qExportaValMuniIBGE: TLargeintField
      FieldName = 'IBGE'
    end
    object qExportaValMuniUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object qExportaValMuniCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qExportaValMuniDimensao: TStringField
      FieldName = 'Dimensao'
      Size = 50
    end
    object qExportaValMuniIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qExportaValMuniVarivel: TStringField
      FieldName = 'Vari'#225'vel'
      Size = 50
    end
    object qExportaValMuniFiltroI: TStringField
      FieldName = 'FiltroI'
      Size = 50
    end
    object qExportaValMuniFiltroII: TStringField
      FieldName = 'FiltroII'
      Size = 100
    end
    object qExportaValMuniFonte: TStringField
      FieldName = 'Fonte'
      Size = 50
    end
    object qExportaValMuniTipo: TStringField
      FieldName = 'Tipo'
      Size = 50
    end
    object qExportaValMuninomeredu: TStringField
      FieldName = 'nomeredu'
      Size = 50
    end
    object qExportaValMuniAno: TIntegerField
      FieldName = 'Ano'
    end
    object qExportaValMuniValorMuni: TFloatField
      FieldName = 'ValorMuni'
    end
    object qExportaValMuniValBrasil: TFloatField
      FieldName = 'ValBrasil'
    end
    object qExportaValMuniValUF: TFloatField
      FieldName = 'ValUF'
    end
  end
  object qExportaValBrasil: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  '#39'Brasil'#39' as Localidade,'
      '  descricao_indicadores.Grupo as Dimensao,'
      '  descricao_indicadores.Indicador,'
      '  descricao_indicadores.Item as Variavel,'
      '  descricao_indicadores.Zona as FiltroI,'
      '  descricao_indicadores.Qualificador as FiltroII,'
      '  descricao_indicadores.Fonte,'
      '  descricao_indicadores.Tipo,'
      '  cad_indicadores.Ano,'
      '  cad_indicadores.Valor'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN descricao_indicadores ON (cad_indicadores.ID_Indica' +
        'dor = descricao_indicadores.ID_Indicador)'
      'WHERE'
      '  (ID_Localidade = 1) AND'
      '  (descricao_indicadores.ID_Grupo = :ID_Grupo) AND '
      '  (descricao_indicadores.ID_nome = :ID_nome) AND '
      '  (exporta = 1)'
      'ORDER BY'
      '  descricao_indicadores.Item,'
      '  descricao_indicadores.Zona,'
      '  descricao_indicadores.Qualificador,'
      '  cad_indicadores.Ano'
      '')
    FetchAll = True
    Left = 328
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_Grupo'
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'ID_nome'
      end>
    object qExportaValBrasilLocalidade: TStringField
      FieldName = 'Localidade'
      FixedChar = True
      Size = 6
    end
    object qExportaValBrasilDimensao: TStringField
      FieldName = 'Dimensao'
      Size = 50
    end
    object qExportaValBrasilIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qExportaValBrasilVariavel: TStringField
      FieldName = 'Variavel'
      Size = 50
    end
    object qExportaValBrasilFiltroI: TStringField
      FieldName = 'FiltroI'
      Size = 50
    end
    object qExportaValBrasilFiltroII: TStringField
      FieldName = 'FiltroII'
      Size = 100
    end
    object qExportaValBrasilFonte: TStringField
      FieldName = 'Fonte'
      Size = 50
    end
    object qExportaValBrasilTipo: TStringField
      FieldName = 'Tipo'
      Size = 50
    end
    object qExportaValBrasilAno: TIntegerField
      FieldName = 'Ano'
    end
    object qExportaValBrasilValor: TFloatField
      FieldName = 'Valor'
    end
  end
  object qEstab: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  `cad_indicadores`.ID_Localidade,'
      '  `descricao_indicadores`.ID_Item,'
      '  `descricao_indicadores`.Grupo,'
      '  `descricao_indicadores`.Indicador,'
      '  `descricao_indicadores`.Item,'
      '  `descricao_indicadores`.Zona,'
      '  `cad_indicadores`.Ano,'
      '  sum(`cad_indicadores`.Valor) as Total'
      'FROM'
      '  `cad_indicadores`'
      
        '  INNER JOIN `descricao_indicadores` ON (`cad_indicadores`.ID_In' +
        'dicador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      ' id_grupo = 5 and'
      ' ID_Nome = 18 and'
      ' ID_Zona = :Zona and'
      ' ID_Localidade = :local and'
      ' ano = :ano'
      ' group by id_item, id_zona'
      'order by `descricao_indicadores`.Item')
    FetchAll = True
    Left = 472
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Zona'
      end
      item
        DataType = ftUnknown
        Name = 'local'
      end
      item
        DataType = ftUnknown
        Name = 'ano'
      end>
    object qEstabID_Localidade: TIntegerField
      FieldName = 'ID_Localidade'
    end
    object qEstabID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qEstabGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qEstabIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qEstabItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object qEstabZona: TStringField
      FieldName = 'Zona'
      Size = 50
    end
    object qEstabAno: TIntegerField
      FieldName = 'Ano'
    end
    object qEstabTotal: TFloatField
      FieldName = 'Total'
    end
  end
  object qEstab_Total: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  `cad_indicadores`.ID_Localidade,'
      '  `descricao_indicadores`.ID_Item,'
      '  `descricao_indicadores`.Grupo,'
      '  `descricao_indicadores`.Indicador,'
      '  `descricao_indicadores`.Item,'
      '  `descricao_indicadores`.Zona,'
      '  `cad_indicadores`.Ano,'
      '  sum(`cad_indicadores`.Valor) as Total'
      'FROM'
      '  `cad_indicadores`'
      
        '  INNER JOIN `descricao_indicadores` ON (`cad_indicadores`.ID_In' +
        'dicador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      ' id_grupo = 5 and'
      ' ID_Nome = 18 and'
      ' ID_Localidade = :Local and'
      ' ano = :ano'
      ' group by id_item'
      'order by `descricao_indicadores`.Item')
    FetchAll = True
    Left = 472
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'local'
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'ano'
      end>
    object qEstab_TotalID_Localidade: TIntegerField
      FieldName = 'ID_Localidade'
    end
    object qEstab_TotalID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qEstab_TotalGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qEstab_TotalIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qEstab_TotalItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object qEstab_TotalZona: TStringField
      FieldName = 'Zona'
      Size = 50
    end
    object qEstab_TotalAno: TIntegerField
      FieldName = 'Ano'
    end
    object qEstab_TotalTotal: TFloatField
      FieldName = 'Total'
    end
  end
  object qtab1: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      
        '  if (descricao_localidades.ID_UF=0,'#39'Brasil'#39',descricao_localidad' +
        'es.UF) as UF,'
      
        '  (select cad_indicadores.valor from cad_indicadores where cad_i' +
        'ndicadores.ID_Localidade = descricao_localidades.ID_localidade a' +
        'nd cad_indicadores.id_indicador = 943 and cad_indicadores.ano = ' +
        '2000) as PopResidente,'
      
        '  (select cad_indicadores.valor from cad_indicadores where cad_i' +
        'ndicadores.ID_Localidade = descricao_localidades.ID_localidade a' +
        'nd cad_indicadores.id_indicador = 993 and cad_indicadores.ano = ' +
        '2007) as PopEstima,'
      
        '  (select cad_indicadores.valor from cad_indicadores where cad_i' +
        'ndicadores.ID_Localidade = descricao_localidades.ID_localidade a' +
        'nd cad_indicadores.id_indicador = 30 and cad_indicadores.ano = 2' +
        '004) as PopPobreza,'
      
        '  (select cad_indicadores.valor from cad_indicadores where cad_i' +
        'ndicadores.ID_Localidade = descricao_localidades.ID_localidade a' +
        'nd cad_indicadores.id_indicador = 31 and cad_indicadores.ano = 2' +
        '004) as PopIndi,'
      
        '  (select cad_indicadores.valor from cad_indicadores where cad_i' +
        'ndicadores.ID_Localidade = descricao_localidades.ID_localidade a' +
        'nd cad_indicadores.id_indicador = 29 and cad_indicadores.ano = 2' +
        '000) as RendaPerCap,'
      
        '  (select cad_indicadores.valor from cad_indicadores where cad_i' +
        'ndicadores.ID_Localidade = descricao_localidades.ID_localidade a' +
        'nd cad_indicadores.id_indicador = 23 and cad_indicadores.ano = 2' +
        '000) as IDH2000,'
      
        '  (select cad_indicadores.valor from cad_indicadores where cad_i' +
        'ndicadores.ID_Localidade = descricao_localidades.ID_localidade a' +
        'nd cad_indicadores.id_indicador = 236 and cad_indicadores.ano = ' +
        '2004) as IDI2004,'
      
        '  (select cad_indicadores.valor from cad_indicadores where cad_i' +
        'ndicadores.ID_Localidade = descricao_localidades.ID_localidade a' +
        'nd cad_indicadores.id_indicador = 33 and cad_indicadores.ano = 2' +
        '000) as Analfa,'
      
        '  (select cad_indicadores.valor from cad_indicadores where cad_i' +
        'ndicadores.ID_Localidade = descricao_localidades.ID_localidade a' +
        'nd cad_indicadores.id_indicador = 25 and cad_indicadores.ano = 2' +
        '000) as EsperancaVida,'
      
        '  (select cad_indicadores.valor from cad_indicadores where cad_i' +
        'ndicadores.ID_Localidade = descricao_localidades.ID_localidade a' +
        'nd cad_indicadores.id_indicador = 24 and cad_indicadores.ano = 2' +
        '004) as Mortalidade'
      'FROM'
      '  descricao_localidades'
      'where id_cidade = 0'
      'order by ID_UF')
    FetchAll = True
    Left = 544
    Top = 144
    object qtab1UF: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object qtab1PopResidente: TFloatField
      FieldName = 'PopResidente'
      DisplayFormat = '###,###,###,###'
    end
    object qtab1PopEstima: TFloatField
      FieldName = 'PopEstima'
      DisplayFormat = '###,###,###,###'
    end
    object qtab1PopPobreza: TFloatField
      FieldName = 'PopPobreza'
      DisplayFormat = '###,###,###,###'
    end
    object qtab1PopIndi: TFloatField
      FieldName = 'PopIndi'
      DisplayFormat = '###,###,###,###'
    end
    object qtab1RendaPerCap: TFloatField
      FieldName = 'RendaPerCap'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qtab1IDH2000: TFloatField
      FieldName = 'IDH2000'
      DisplayFormat = '###,###,###,##0.000'
    end
    object qtab1IDI2004: TFloatField
      FieldName = 'IDI2004'
      DisplayFormat = '###,###,###,##0.000'
    end
    object qtab1Analfa: TFloatField
      FieldName = 'Analfa'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qtab1EsperancaVida: TFloatField
      FieldName = 'EsperancaVida'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qtab1Mortalidade: TFloatField
      FieldName = 'Mortalidade'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object qtab2: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      
        '  if (descricao_localidades.ID_UF=0,'#39'Brasil'#39',descricao_localidad' +
        'es.UF) as UF,'
      ''
      '  (SELECT'
      '  sum(`cad_indicadores`.Valor) as Total'
      'FROM'
      '  `cad_indicadores`'
      '  where'
      
        '  (cad_indicadores.id_indicador = 970 or cad_indicadores.id_indi' +
        'cador = 971 or cad_indicadores.id_indicador = 972 or cad_indicad' +
        'ores.id_indicador = 973) and'
      '  cad_indicadores.ano = 2007 and'
      
        '  cad_indicadores.id_Localidade = descricao_localidades.ID_local' +
        'idade'
      'group by'
      'ID_Localidade) as 0a3anos,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '  descricao_indicadores.id_grupo = 5 and descricao_indicadores.i' +
        'd_nome= 18 and descricao_indicadores.id_item = 52 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as Estab,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '  descricao_indicadores.id_grupo = 5 and descricao_indicadores.i' +
        'd_nome= 19 and descricao_indicadores.id_item = 52 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Matricula,'
      ''
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '  descricao_indicadores.id_grupo = 5 and descricao_indicadores.i' +
        'd_nome= 20 and descricao_indicadores.id_item = 52 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Prof'
      ''
      'FROM'
      '  descricao_localidades'
      'where id_cidade = 0'
      'order by ID_UF')
    FetchAll = True
    Left = 592
    Top = 144
    object qtab2UF: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object qtab2DSDesigner0a3anos: TFloatField
      FieldName = '0a3anos'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab2Estab: TFloatField
      FieldName = 'Estab'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab2Matricula: TFloatField
      FieldName = 'Matricula'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab2Prof: TFloatField
      FieldName = 'Prof'
      DisplayFormat = '###,###,###,##0'
    end
  end
  object qtab4: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      
        '  if (descricao_localidades.ID_UF=0,'#39'Brasil'#39',descricao_localidad' +
        'es.UF) as UF,'
      ''
      '  (SELECT'
      '  sum(`cad_indicadores`.Valor) as Total'
      'FROM'
      '  `cad_indicadores`'
      '  where'
      
        '  (cad_indicadores.id_indicador >= 976 and cad_indicadores.id_in' +
        'dicador <= 984) and'
      '  cad_indicadores.ano = 2007 and'
      
        '  cad_indicadores.id_Localidade = descricao_localidades.ID_local' +
        'idade'
      'group by'
      'ID_Localidade) as 6a14anos,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '  descricao_indicadores.id_grupo = 5 and descricao_indicadores.i' +
        'd_nome= 18 and (descricao_indicadores.id_item = 63 or descricao_' +
        'indicadores.id_item = 64) AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as Estab,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '    descricao_indicadores.id_grupo = 5 and descricao_indicadores' +
        '.id_nome= 19 and (descricao_indicadores.id_item = 59 or descrica' +
        'o_indicadores.id_item = 60) AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Matricula,'
      ''
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '      descricao_indicadores.id_grupo = 5 and descricao_indicador' +
        'es.id_nome= 20 and (descricao_indicadores.id_item = 59 or descri' +
        'cao_indicadores.id_item = 60) AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Prof'
      ''
      'FROM'
      '  descricao_localidades'
      'where id_cidade = 0'
      'order by ID_UF'
      '')
    FetchAll = True
    Left = 704
    Top = 145
    object qtab4UF: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object qtab4DSDesigner6a14anos: TFloatField
      FieldName = '6a14anos'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab4Estab: TFloatField
      FieldName = 'Estab'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab4Matricula: TFloatField
      FieldName = 'Matricula'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab4Prof: TFloatField
      FieldName = 'Prof'
      DisplayFormat = '###,###,###,##0'
    end
  end
  object qDocentes_Total: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  `cad_indicadores`.ID_Localidade,'
      '  `descricao_indicadores`.ID_Item,'
      '  `descricao_indicadores`.Grupo,'
      '  `descricao_indicadores`.Indicador,'
      '  `descricao_indicadores`.Item,'
      '  `descricao_indicadores`.Zona,'
      '  `cad_indicadores`.Ano,'
      '  sum(`cad_indicadores`.Valor) as Total'
      'FROM'
      '  `cad_indicadores`'
      
        '  INNER JOIN `descricao_indicadores` ON (`cad_indicadores`.ID_In' +
        'dicador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      ' id_grupo = 5 and'
      ' ID_Nome = 20 and'
      ' ID_Localidade = :Local and'
      ' ano = :ano'
      ' group by id_item'
      'order by `descricao_indicadores`.Item')
    FetchAll = True
    Left = 528
    Top = 312
    ParamData = <
      item
        DataType = ftString
        Name = 'local'
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'ano'
      end>
    object qDocentes_TotalID_Localidade: TIntegerField
      FieldName = 'ID_Localidade'
    end
    object qDocentes_TotalID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qDocentes_TotalGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qDocentes_TotalIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qDocentes_TotalItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object qDocentes_TotalZona: TStringField
      FieldName = 'Zona'
      Size = 50
    end
    object qDocentes_TotalAno: TIntegerField
      FieldName = 'Ano'
    end
    object qDocentes_TotalTotal: TFloatField
      FieldName = 'Total'
    end
  end
  object qtab5: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      
        '  if (descricao_localidades.ID_UF=0,'#39'Brasil'#39',descricao_localidad' +
        'es.UF) as UF,'
      ''
      '  (SELECT'
      '  sum(`cad_indicadores`.Valor) as Total'
      'FROM'
      '  `cad_indicadores`'
      '  where'
      
        '  (cad_indicadores.id_indicador >= 976 and cad_indicadores.id_in' +
        'dicador <= 984) and'
      '  cad_indicadores.ano = 2007 and'
      
        '  cad_indicadores.id_Localidade = descricao_localidades.ID_local' +
        'idade'
      'group by'
      'ID_Localidade) as 6a14anos,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '  descricao_indicadores.id_grupo = 5 and descricao_indicadores.i' +
        'd_nome= 18 and (descricao_indicadores.id_item = 110 or descricao' +
        '_indicadores.id_item = 111) AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as Estab,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '    descricao_indicadores.id_grupo = 5 and descricao_indicadores' +
        '.id_nome= 19 and (descricao_indicadores.id_item = 61 or descrica' +
        'o_indicadores.id_item = 62) AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Matricula,'
      ''
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '      descricao_indicadores.id_grupo = 5 and descricao_indicador' +
        'es.id_nome= 20 and (descricao_indicadores.id_item = 61 or descri' +
        'cao_indicadores.id_item = 62) AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Prof'
      ''
      'FROM'
      '  descricao_localidades'
      'where id_cidade = 0'
      'order by ID_UF')
    FetchAll = True
    Left = 752
    Top = 144
    object qtab5UF: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object qtab5DSDesigner6a14anos: TFloatField
      FieldName = '6a14anos'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab5Estab: TFloatField
      FieldName = 'Estab'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab5Matricula: TFloatField
      FieldName = 'Matricula'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab5Prof: TFloatField
      FieldName = 'Prof'
      DisplayFormat = '###,###,###,##0'
    end
  end
  object qtab6: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      
        '  if (descricao_localidades.ID_UF=0,'#39'Brasil'#39',descricao_localidad' +
        'es.UF) as UF,'
      ''
      '  (SELECT'
      '  sum(`cad_indicadores`.Valor) as Total'
      'FROM'
      '  `cad_indicadores`'
      '  where'
      
        '  (cad_indicadores.id_indicador >= 985 and cad_indicadores.id_in' +
        'dicador <= 988) and'
      '  cad_indicadores.ano = 2007 and'
      
        '  cad_indicadores.id_Localidade = descricao_localidades.ID_local' +
        'idade'
      'group by'
      'ID_Localidade) as 15a18anos,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '  descricao_indicadores.id_grupo = 5 and descricao_indicadores.i' +
        'd_nome= 18 and descricao_indicadores.id_item = 58 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as Estab,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '  descricao_indicadores.id_grupo = 5 and descricao_indicadores.i' +
        'd_nome= 19 and descricao_indicadores.id_item = 58 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Matricula,'
      ''
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '  descricao_indicadores.id_grupo = 5 and descricao_indicadores.i' +
        'd_nome= 20 and descricao_indicadores.id_item = 58 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Prof'
      ''
      'FROM'
      '  descricao_localidades'
      'where id_cidade = 0'
      'order by ID_UF'
      '')
    FetchAll = True
    Left = 576
    Top = 208
    object qtab6UF: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object qtab6DSDesigner15a18anos: TFloatField
      FieldName = '15a18anos'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab6Estab: TFloatField
      FieldName = 'Estab'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab6Matricula: TFloatField
      FieldName = 'Matricula'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab6Prof: TFloatField
      FieldName = 'Prof'
      DisplayFormat = '###,###,###,##0'
    end
  end
  object qtab7: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      
        '  if (descricao_localidades.ID_UF=0,'#39'Brasil'#39',descricao_localidad' +
        'es.UF) as UF,'
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 18 and'
      '   descricao_indicadores.id_item = 52 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as Creche,'
      ''
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 18 and'
      '   descricao_indicadores.id_item = 53 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as Pre_escola,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 18 and'
      
        '   (descricao_indicadores.id_item = 63 or descricao_indicadores.' +
        'id_item = 64 )AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as EF8anos,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 18 and'
      
        '   (descricao_indicadores.id_item = 110 or descricao_indicadores' +
        '.id_item = 111 )AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as EF9anos,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 18 and'
      '   descricao_indicadores.id_item = 58 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as EM,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 18 and'
      '   descricao_indicadores.id_item = 57 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as EJA,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 18 and'
      '   descricao_indicadores.id_item = 112 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as educa_especial,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 18 and'
      '   descricao_indicadores.id_item = 121 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as educa_prof'
      ''
      ''
      'FROM'
      '  descricao_localidades'
      'where id_cidade = 0'
      'order by ID_UF'
      '')
    FetchAll = True
    Left = 624
    Top = 208
    object qtab7UF: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object qtab7Creche: TFloatField
      FieldName = 'Creche'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab7Pre_escola: TFloatField
      FieldName = 'Pre_escola'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab7EF8anos: TFloatField
      FieldName = 'EF8anos'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab7EF9anos: TFloatField
      FieldName = 'EF9anos'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab7EM: TFloatField
      FieldName = 'EM'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab7EJA: TFloatField
      FieldName = 'EJA'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab7educa_especial: TFloatField
      FieldName = 'educa_especial'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab7educa_prof: TFloatField
      FieldName = 'educa_prof'
      DisplayFormat = '###,###,###,##0'
    end
  end
  object qtab8: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      
        '  if (descricao_localidades.ID_UF=0,'#39'Brasil'#39',descricao_localidad' +
        'es.UF) as UF,'
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 19 and'
      '   descricao_indicadores.id_item = 52 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as Creche,'
      ''
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 19 and'
      '   descricao_indicadores.id_item = 53 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as Pre_escola,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 19 and'
      
        '   (descricao_indicadores.id_item = 59 or descricao_indicadores.' +
        'id_item = 60 )AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as EF8anos,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 19 and'
      
        '   (descricao_indicadores.id_item = 61 or descricao_indicadores.' +
        'id_item = 62 )AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as EF9anos,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 19 and'
      '   descricao_indicadores.id_item = 58 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as EM,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 19 and'
      '   descricao_indicadores.id_item = 57 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as EJA,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 19 and'
      '   descricao_indicadores.id_item = 112 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as educa_especial,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 19 and'
      '   descricao_indicadores.id_item = 121 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as educa_prof'
      ''
      ''
      'FROM'
      '  descricao_localidades'
      'where id_cidade = 0'
      'order by ID_UF'
      '')
    FetchAll = True
    Left = 672
    Top = 208
    object StringField1: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object FloatField1: TFloatField
      FieldName = 'Creche'
      DisplayFormat = '###,###,###,##0'
    end
    object FloatField2: TFloatField
      FieldName = 'Pre_escola'
      DisplayFormat = '###,###,###,##0'
    end
    object FloatField3: TFloatField
      FieldName = 'EF8anos'
      DisplayFormat = '###,###,###,##0'
    end
    object FloatField4: TFloatField
      FieldName = 'EF9anos'
      DisplayFormat = '###,###,###,##0'
    end
    object FloatField5: TFloatField
      FieldName = 'EM'
      DisplayFormat = '###,###,###,##0'
    end
    object FloatField6: TFloatField
      FieldName = 'EJA'
      DisplayFormat = '###,###,###,##0'
    end
    object FloatField7: TFloatField
      FieldName = 'educa_especial'
      DisplayFormat = '###,###,###,##0'
    end
    object FloatField8: TFloatField
      FieldName = 'educa_prof'
      DisplayFormat = '###,###,###,##0'
    end
  end
  object qtab9: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      
        '  if (descricao_localidades.ID_UF=0,'#39'Brasil'#39',descricao_localidad' +
        'es.UF) as UF,'
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 20 and'
      '   descricao_indicadores.id_item = 52 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as Creche,'
      ''
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 20 and'
      '   descricao_indicadores.id_item = 53 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as Pre_escola,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 20 and'
      
        '   (descricao_indicadores.id_item = 59 or descricao_indicadores.' +
        'id_item = 60 )AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as EF8anos,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 20 and'
      
        '   (descricao_indicadores.id_item = 61 or descricao_indicadores.' +
        'id_item = 62 )AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as EF9anos,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 20 and'
      '   descricao_indicadores.id_item = 58 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as EM,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 20 and'
      '   descricao_indicadores.id_item = 57 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as EJA,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 20 and'
      '   descricao_indicadores.id_item = 112 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as educa_especial,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      '   descricao_indicadores.id_grupo = 5 and'
      '   descricao_indicadores.id_nome= 20 and'
      '   descricao_indicadores.id_item = 121 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as educa_prof'
      ''
      ''
      'FROM'
      '  descricao_localidades'
      'where id_cidade = 0'
      'order by ID_UF'
      '')
    FetchAll = True
    Left = 712
    Top = 208
    object qtab9UF: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object qtab9Creche: TFloatField
      FieldName = 'Creche'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab9Pre_escola: TFloatField
      FieldName = 'Pre_escola'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab9EF8anos: TFloatField
      FieldName = 'EF8anos'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab9EF9anos: TFloatField
      FieldName = 'EF9anos'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab9EM: TFloatField
      FieldName = 'EM'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab9EJA: TFloatField
      FieldName = 'EJA'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab9educa_especial: TFloatField
      FieldName = 'educa_especial'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab9educa_prof: TFloatField
      FieldName = 'educa_prof'
      DisplayFormat = '###,###,###,##0'
    end
  end
  object qtab10: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      
        '  if (descricao_localidades.ID_UF=0,'#39'Brasil'#39',descricao_localidad' +
        'es.UF) as UF,'
      ''
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '      descricao_indicadores.id_grupo = 5 and descricao_indicador' +
        'es.id_nome= 19 and (descricao_indicadores.id_item = 59 or descri' +
        'cao_indicadores.id_item = 60 or descricao_indicadores.id_item = ' +
        '61 or descricao_indicadores.id_item = 62) AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Matricula,'
      ''
      ''
      ''
      '  (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 877 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Aprovacao,'
      ''
      '    (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 878 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as reprovacao,'
      ''
      '      (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 879 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Abandono,'
      ''
      ''
      ''
      '      (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 888 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as idade_serie'
      ''
      'FROM'
      '  descricao_localidades'
      'where id_cidade = 0'
      'order by ID_UF')
    FetchAll = True
    Left = 760
    Top = 208
    object qtab10UF: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object qtab10Matricula: TFloatField
      FieldName = 'Matricula'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab10Aprovacao: TFloatField
      FieldName = 'Aprovacao'
    end
    object qtab10reprovacao: TFloatField
      FieldName = 'reprovacao'
    end
    object qtab10Abandono: TFloatField
      FieldName = 'Abandono'
    end
    object qtab10idade_serie: TFloatField
      FieldName = 'idade_serie'
    end
  end
  object qtab11: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      
        '  if (descricao_localidades.ID_UF=0,'#39'Brasil'#39',descricao_localidad' +
        'es.UF) as UF,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '  descricao_indicadores.id_grupo = 5 and descricao_indicadores.i' +
        'd_nome= 19 and descricao_indicadores.id_item = 58 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Matricula,'
      '  '
      '  '
      '  '
      '  (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 880 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Aprovacao,'
      '  '
      '    (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 881 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as reprovacao,'
      '  '
      '      (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 882 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Abandono,'
      '  '
      ''
      ''
      '      (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 894 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as idade_serie'
      ''
      ''
      ''
      'FROM'
      '  descricao_localidades'
      'where id_cidade = 0'
      'order by ID_UF'
      '')
    FetchAll = True
    Left = 608
    Top = 296
    object qtab11UF: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object qtab11Matricula: TFloatField
      FieldName = 'Matricula'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab11Aprovacao: TFloatField
      FieldName = 'Aprovacao'
    end
    object qtab11reprovacao: TFloatField
      FieldName = 'reprovacao'
    end
    object qtab11Abandono: TFloatField
      FieldName = 'Abandono'
    end
    object qtab11idade_serie: TFloatField
      FieldName = 'idade_serie'
    end
  end
  object qtab12: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      
        '  if (descricao_localidades.ID_UF=0,'#39'Brasil'#39',descricao_localidad' +
        'es.UF) as UF,'
      '  '
      '  (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 996 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as LP_4_publi,'
      ''
      '  (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 994 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Mat_4_publi,'
      ''
      ''
      '    (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 997 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as LP_8_publi,'
      ''
      '  (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 995 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Mat_8_publi'
      '  '
      '  '
      '  FROM'
      '  descricao_localidades'
      'where id_cidade = 0'
      'order by ID_UF'
      '')
    FetchAll = True
    Left = 648
    Top = 296
    object qtab12UF: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object qtab12LP_4_publi: TFloatField
      FieldName = 'LP_4_publi'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qtab12Mat_4_publi: TFloatField
      FieldName = 'Mat_4_publi'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qtab12LP_8_publi: TFloatField
      FieldName = 'LP_8_publi'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qtab12Mat_8_publi: TFloatField
      FieldName = 'Mat_8_publi'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object qtab15: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      
        '  if (descricao_localidades.ID_UF=0,'#39'Brasil'#39',descricao_localidad' +
        'es.UF) as UF,'
      '  '
      '  (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 805 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as SI_EF_Publica,'
      '  '
      '  '
      '    (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 808 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as SI_EF_PrivadaEPublica,'
      '  '
      '  '
      '  '
      '  '
      '  '
      '    (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 806 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as SF_EF_Publica,'
      ''
      ''
      '    (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 809 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as SF_EF_PrivadaEPublica,'
      '  '
      '  '
      '  '
      '  '
      '  '
      '      (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 807 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as EM_Publica,'
      ''
      ''
      '    (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 810 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as EM_PrivadaEPublica'
      ''
      ''
      '  '
      ''
      ''
      ''
      'FROM'
      '  descricao_localidades'
      'where id_cidade = 0'
      'order by ID_UF')
    FetchAll = True
    Left = 768
    Top = 296
    object qtab15UF: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object qtab15SI_EF_Publica: TFloatField
      FieldName = 'SI_EF_Publica'
      DisplayFormat = '###,###,###,##0.0'
    end
    object qtab15SI_EF_PrivadaEPublica: TFloatField
      FieldName = 'SI_EF_PrivadaEPublica'
      DisplayFormat = '###,###,###,##0.0'
    end
    object qtab15SF_EF_Publica: TFloatField
      FieldName = 'SF_EF_Publica'
      DisplayFormat = '###,###,###,##0.0'
    end
    object qtab15SF_EF_PrivadaEPublica: TFloatField
      FieldName = 'SF_EF_PrivadaEPublica'
      DisplayFormat = '###,###,###,##0.0'
    end
    object qtab15EM_Publica: TFloatField
      FieldName = 'EM_Publica'
      DisplayFormat = '###,###,###,##0.0'
    end
    object qtab15EM_PrivadaEPublica: TFloatField
      FieldName = 'EM_PrivadaEPublica'
      DisplayFormat = '###,###,###,##0.0'
    end
  end
  object qtab3: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      
        '  if (descricao_localidades.ID_UF=0,'#39'Brasil'#39',descricao_localidad' +
        'es.UF) as UF,'
      ''
      '  (SELECT'
      '  sum(`cad_indicadores`.Valor) as Total'
      'FROM'
      '  `cad_indicadores`'
      '  where'
      
        '  (cad_indicadores.id_indicador >= 974 and cad_indicadores.id_in' +
        'dicador <= 975) and'
      '  cad_indicadores.ano = 2007 and'
      
        '  cad_indicadores.id_Localidade = descricao_localidades.ID_local' +
        'idade'
      'group by'
      'ID_Localidade) as 4a5anos,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '  descricao_indicadores.id_grupo = 5 and descricao_indicadores.i' +
        'd_nome= 18 and descricao_indicadores.id_item = 53 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade'
      ') as Estab,'
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '  descricao_indicadores.id_grupo = 5 and descricao_indicadores.i' +
        'd_nome= 19 and descricao_indicadores.id_item = 53 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Matricula,'
      ''
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN `descricao_indicadores` ON (cad_indicadores.ID_Indi' +
        'cador = `descricao_indicadores`.ID_Indicador)'
      'WHERE'
      
        '  descricao_indicadores.id_grupo = 5 and descricao_indicadores.i' +
        'd_nome= 20 and descricao_indicadores.id_item = 53 AND'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Prof'
      ''
      'FROM'
      '  descricao_localidades'
      'where id_cidade = 0'
      'order by ID_UF'
      ''
      '')
    FetchAll = True
    Left = 648
    Top = 144
    object qtab3UF: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object qtab3DSDesigner4a5anos: TFloatField
      FieldName = '4a5anos'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab3Estab: TFloatField
      FieldName = 'Estab'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab3Matricula: TFloatField
      FieldName = 'Matricula'
      DisplayFormat = '###,###,###,##0'
    end
    object qtab3Prof: TFloatField
      FieldName = 'Prof'
      DisplayFormat = '###,###,###,##0'
    end
  end
  object qtab13: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      
        '  if (descricao_localidades.ID_UF=0,'#39'Brasil'#39',descricao_localidad' +
        'es.UF) as UF,'
      '   '
      ''
      '(SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 799 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as LP_4_estadual,'
      '  '
      '  (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 798 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Mat_4_estadual,'
      '  '
      '  '
      '  (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 803 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as LP_8_estadual,'
      ''
      '  (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 802 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Mat_8_estadual'
      '  '
      '  '
      ''
      ' FROM'
      '  descricao_localidades'
      'where id_cidade = 0'
      'order by ID_UF'
      ''
      '')
    FetchAll = True
    Left = 688
    Top = 296
    object qtab13UF: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object qtab13LP_4_estadual: TFloatField
      FieldName = 'LP_4_estadual'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qtab13Mat_4_estadual: TFloatField
      FieldName = 'Mat_4_estadual'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qtab13LP_8_estadual: TFloatField
      FieldName = 'LP_8_estadual'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qtab13Mat_8_estadual: TFloatField
      FieldName = 'Mat_8_estadual'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object qtab14: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT'
      
        '  if (descricao_localidades.ID_UF=0,'#39'Brasil'#39',descricao_localidad' +
        'es.UF) as UF,'
      '  '
      '  (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 797 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as LP_4_municip,'
      ''
      '  (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 796 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Mat_4_municip,'
      '  '
      '  '
      '    (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 801 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as LP_8_municip,'
      ''
      '  (SELECT'
      '  sum(cad_indicadores.Valor) AS Total'
      'FROM'
      '  cad_indicadores'
      'WHERE'
      '  cad_indicadores.id_indicador = 800 and'
      '  (cad_indicadores.ano = 2005) AND'
      
        '  (cad_indicadores.id_localidade = descricao_localidades.ID_loca' +
        'lidade)'
      'GROUP BY'
      '  cad_indicadores.id_localidade) as Mat_8_municip'
      '  '
      ''
      ''
      ''
      'FROM'
      '  descricao_localidades'
      'where id_cidade = 0'
      'order by ID_UF'
      ''
      '')
    FetchAll = True
    Left = 728
    Top = 296
    object qtab14UF: TStringField
      FieldName = 'UF'
      Size = 6
    end
    object qtab14LP_4_municip: TFloatField
      FieldName = 'LP_4_municip'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qtab14Mat_4_municip: TFloatField
      FieldName = 'Mat_4_municip'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qtab14LP_8_municip: TFloatField
      FieldName = 'LP_8_municip'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qtab14Mat_8_municip: TFloatField
      FieldName = 'Mat_8_municip'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object qRelUFBrasil_faixas: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      '(SELECT'
      '  `descricao_localidades`.Pais,'
      '  `descricao_localidades`.UF,'
      '  `descricao_indicadores`.Grupo,'
      '  `descricao_indicadores`.Indicador,'
      '  `descricao_indicadores`.Item,'
      '  `descricao_indicadores`.Zona,'
      '  `descricao_indicadores`.Qualificador,'
      '  `descricao_indicadores`.Fonte,'
      '  `descricao_indicadores`.Tipo,'
      '  `descricao_indicadores`.nomeredu,'
      '  `cad_indicadores`.Ano,'
      '  `cad_indicadores`.Valor'
      'FROM'
      '  `cad_indicadores`'
      
        '  INNER JOIN `descricao_indicadores` ON (`cad_indicadores`.ID_In' +
        'dicador = `descricao_indicadores`.ID_Indicador)'
      
        '  INNER JOIN `descricao_localidades` ON (`cad_indicadores`.ID_Lo' +
        'calidade = `descricao_localidades`.ID_Localidade)'
      'where'
      '  descricao_localidades.ID_Cidade = 0 and'
      '  ID_UF > 0 and'
      '  cad_indicadores.ID_Indicador = :ID_Indica and'
      '  cad_indicadores.Ano = :Ano  and'
      '  (cad_indicadores.Valor is not null) '
      'order by `cad_indicadores`.Valor desc)'
      ''
      'UNION'
      ''
      '(SELECT'
      '  `descricao_localidades`.Pais,'
      '  `descricao_localidades`.UF,'
      '  '#39'nada'#39' as Grupo,'
      '  '#39'nada'#39' as Indicador,'
      '  '#39'nada'#39' as Item,'
      '  '#39'nada'#39' as Zona,'
      '  '#39'nada'#39' as Qualificador,'
      '  '#39'nada'#39' as Fonte,'
      '  '#39'nada'#39' as Tipo,'
      '  '#39'nada'#39' as nomeredu,'
      '  -1 as Ano,'
      '  -1 as Valor'
      'FROM'
      '  `descricao_localidades`'
      'where'
      '  descricao_localidades.ID_Cidade = 0 and'
      '  descricao_localidades.ID_UF > 0 and'
      
        '  descricao_localidades.id_localidade not in(select cad_indicado' +
        'res.id_localidade from cad_indicadores where'
      '  '
      '  cad_indicadores.ID_Indicador = :ID_Indica and'
      '  cad_indicadores.Ano = :Ano  and'
      '  (cad_indicadores.Valor is not null))'
      'order by Valor)'
      'order by Valor desc'
      '')
    FetchAll = True
    Left = 72
    Top = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'ID_Indica'
        Value = ''
      end
      item
        DataType = ftUnknown
        Name = 'Ano'
      end
      item
        DataType = ftString
        Name = 'ID_Indica'
      end
      item
        DataType = ftUnknown
        Name = 'Ano'
      end>
    object StringField2: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object StringField3: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object StringField4: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object StringField5: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object StringField6: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object StringField7: TStringField
      FieldName = 'Zona'
      Size = 50
    end
    object StringField8: TStringField
      FieldName = 'Qualificador'
      Size = 100
    end
    object StringField9: TStringField
      FieldName = 'Fonte'
      Size = 50
    end
    object StringField10: TStringField
      FieldName = 'Tipo'
      Size = 50
    end
    object StringField11: TStringField
      FieldName = 'nomeredu'
      Size = 50
    end
    object LargeintField1: TLargeintField
      FieldName = 'Ano'
    end
    object FloatField9: TFloatField
      FieldName = 'Valor'
    end
  end
  object qBrasil: TMyQuery
    Connection = MyEmbConnection1
    SQL.Strings = (
      'SELECT '
      '  cad_indicadores.ID_Localidade,'
      '  cad_indicadores.ID_Indicador,'
      '  descricao_indicadores.ID_Grupo,'
      '  descricao_indicadores.ID_nome,'
      '  descricao_indicadores.ID_Item,'
      '  descricao_indicadores.ID_Zona,'
      '  descricao_indicadores.ID_Qualificador,'
      '  descricao_indicadores.ID_Fonte,'
      '  descricao_indicadores.ID_Tipo,'
      '  descricao_indicadores.ID_Moeda,'
      '  descricao_indicadores.Grupo,'
      '  descricao_indicadores.Indicador,'
      '  descricao_indicadores.Item,'
      '  descricao_indicadores.Zona,'
      '  descricao_indicadores.Qualificador,'
      '  descricao_indicadores.Fonte,'
      '  descricao_indicadores.Tipo,'
      '  cad_indicadores.Ano,'
      '  cad_indicadores.Valor'
      'FROM'
      '  cad_indicadores'
      
        '  INNER JOIN descricao_indicadores ON (cad_indicadores.ID_Indica' +
        'dor = descricao_indicadores.ID_Indicador)'
      'WHERE'
      '  (ID_Localidade = 1) AND'
      '  (cad_indicadores.ID_Indicador = :ID_indica) and'
      '  (cad_indicadores.Ano = :ano)')
    FetchAll = True
    Left = 240
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_indica'
      end
      item
        DataType = ftUnknown
        Name = 'ano'
      end>
    object qBrasilID_Localidade: TIntegerField
      FieldName = 'ID_Localidade'
    end
    object qBrasilID_Indicador: TIntegerField
      FieldName = 'ID_Indicador'
    end
    object qBrasilID_Grupo: TLargeintField
      FieldName = 'ID_Grupo'
    end
    object qBrasilID_nome: TLargeintField
      FieldName = 'ID_nome'
    end
    object qBrasilID_Item: TLargeintField
      FieldName = 'ID_Item'
    end
    object qBrasilID_Zona: TLargeintField
      FieldName = 'ID_Zona'
    end
    object qBrasilID_Qualificador: TLargeintField
      FieldName = 'ID_Qualificador'
    end
    object qBrasilID_Fonte: TLargeintField
      FieldName = 'ID_Fonte'
    end
    object qBrasilID_Tipo: TLargeintField
      FieldName = 'ID_Tipo'
    end
    object qBrasilID_Moeda: TLargeintField
      FieldName = 'ID_Moeda'
    end
    object qBrasilGrupo: TStringField
      FieldName = 'Grupo'
      Size = 50
    end
    object qBrasilIndicador: TStringField
      FieldName = 'Indicador'
      Size = 150
    end
    object qBrasilItem: TStringField
      FieldName = 'Item'
      Size = 50
    end
    object qBrasilZona: TStringField
      FieldName = 'Zona'
      Size = 50
    end
    object qBrasilQualificador: TStringField
      FieldName = 'Qualificador'
      Size = 100
    end
    object qBrasilFonte: TStringField
      FieldName = 'Fonte'
      Size = 50
    end
    object qBrasilTipo: TStringField
      FieldName = 'Tipo'
      Size = 50
    end
    object qBrasilAno: TIntegerField
      FieldName = 'Ano'
    end
    object qBrasilValor: TFloatField
      FieldName = 'Valor'
    end
  end
end
