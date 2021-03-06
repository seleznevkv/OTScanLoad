object dmMain: TdmMain
  OldCreateOrder = False
  Height = 643
  Width = 997
  object conADOMain: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=Operator' +
      ';Initial Catalog=OT;Data Source=192.168.76.100;Use Procedure for' +
      ' Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=D' +
      'EV-65-159;Use Encryption for Data=False;Tag with column collatio' +
      'n when possible=False'
    ConnectionTimeout = 7
    DefaultDatabase = 'OT'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 24
  end
  object dsMain: TDataSource
    DataSet = qryADOMain
    Left = 184
    Top = 24
  end
  object qryADOMain: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  dbo.OT_Prikaz_Main.id,'
      '  dbo.OT_Prikaz_Main.Number,'
      '  dbo.OT_Prikaz_Main.Page_Number,'
      '  dbo.OT_Prikaz_Main.DT,'
      '  dbo.OT_Prikaz_Main.Importance,'
      '  -- dbo.OT_Prikaz_Main.Scan,'
      '  dbo.OT_Prikaz_Main.id_type'
      'FROM'
      '  dbo.OT_Prikaz_Main'
      '  left join dbo.OT_Prikaz_Types Typ on (Typ.id = id_type)'
      
        '  left join dbo.OT_Prikaz_Categories Cat on (Typ.idCategory = Ca' +
        't.IdCategory)'
      
        '  left join dbo.OT_Prikaz_Groups Gro on (Gro.IdGroup = Cat.IdGro' +
        'up)'
      'WHERE'
      '  dbo.OT_Prikaz_Main.DT>GETDATE()-720'
      '  and Gro.GroupName = '#39#1054#1093#1088#1072#1085#1072' '#1058#1088#1091#1076#1072#39
      'and    dbo.OT_Prikaz_Main.Page_Number<>999'
      '--  MONTH(dbo.OT_Prikaz_Main.DT) = MONTH(GETDATE())'
      'ORDER BY'
      '  dbo.OT_Prikaz_Main.id DESC,'
      '  dbo.OT_Prikaz_Main.DT DESC,'
      '  dbo.OT_Prikaz_Main.Number DESC')
    Left = 88
    Top = 24
    object qryADOMainid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryADOMainNumber: TStringField
      FieldName = 'Number'
    end
    object qryADOMainPage_Number: TSmallintField
      FieldName = 'Page_Number'
    end
    object qryADOMainDT: TDateTimeField
      FieldName = 'DT'
    end
    object qryADOMainImportance: TBooleanField
      FieldName = 'Importance'
    end
    object qryADOMainid_type: TSmallintField
      FieldName = 'id_type'
    end
  end
  object dsTypes: TDataSource
    DataSet = tblTypes
    Left = 208
    Top = 512
  end
  object tblTypes: TADOTable
    Connection = conADOMain
    CursorType = ctStatic
    TableName = 'OT_Prikaz_Types'
    Left = 128
    Top = 512
  end
  object qryADOInsert: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_type'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'Number'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'Page_Number'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'DT'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'Importance'
        Attributes = [paNullable]
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      
        'INSERT INTO dbo.OT_Prikaz_Main(id_type, Number, Page_Number, DT,' +
        ' Importance)'
      'VALUES (:id_type, :Number, :Page_Number, :DT, :Importance);')
    Left = 104
    Top = 136
  end
  object qryADODel: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'DELETE FROM dbo.OT_Prikaz_Main'
      'WHERE id = :id')
    Left = 168
    Top = 256
  end
  object qryADOFindNbr: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pNumber'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '  dbo.OT_Prikaz_Main.id,'
      '  dbo.OT_Prikaz_Main.Number,'
      '  dbo.OT_Prikaz_Main.Page_Number,'
      '  dbo.OT_Prikaz_Main.DT,'
      '  dbo.OT_Prikaz_Main.Importance,'
      '--  dbo.OT_Prikaz_Main.Scan,'
      '  dbo.OT_Prikaz_Main.id_type'
      'FROM'
      '  dbo.OT_Prikaz_Main'
      '  left join dbo.OT_Prikaz_Types Typ on (Typ.id = id_type)'
      
        '  left join dbo.OT_Prikaz_Categories Cat on (Typ.idCategory = Ca' +
        't.IdCategory)'
      
        '  left join dbo.OT_Prikaz_Groups Gro on (Gro.IdGroup = Cat.IdGro' +
        'up)'
      'WHERE'
      '   dbo.OT_Prikaz_Main.Number = :pNumber'
      '   and    dbo.OT_Prikaz_Main.Page_Number<>0'
      '   and Gro.GroupName = '#39#1054#1093#1088#1072#1085#1072' '#1058#1088#1091#1076#1072#39
      'ORDER BY'
      '  dbo.OT_Prikaz_Main.DT DESC'
      '')
    Left = 24
    Top = 200
  end
  object dsFind: TDataSource
    DataSet = qryADOFindNbr
    Left = 96
    Top = 200
  end
  object qryADOFindDT: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pDT1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'pDT2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '
      '  dbo.OT_Prikaz_Main.id,'
      '  dbo.OT_Prikaz_Main.Number,'
      '  dbo.OT_Prikaz_Main.Page_Number,'
      '  dbo.OT_Prikaz_Main.DT,'
      '  dbo.OT_Prikaz_Main.Importance,'
      '--  dbo.OT_Prikaz_Main.Scan,'
      '  dbo.OT_Prikaz_Main.id_type'
      'FROM'
      '  dbo.OT_Prikaz_Main'
      '  left join dbo.OT_Prikaz_Types Typ on (Typ.id = id_type)'
      
        '  left join dbo.OT_Prikaz_Categories Cat on (Typ.idCategory = Ca' +
        't.IdCategory)'
      
        '  left join dbo.OT_Prikaz_Groups Gro on (Gro.IdGroup = Cat.IdGro' +
        'up)'
      'WHERE'
      
        '   dbo.OT_Prikaz_Main.DT > :pDT1 and dbo.OT_Prikaz_Main.DT < :pD' +
        'T2'
      'and    dbo.OT_Prikaz_Main.Page_Number<>0   '
      'and Gro.GroupName = '#39#1054#1093#1088#1072#1085#1072' '#1058#1088#1091#1076#1072#39
      'ORDER BY'
      '  dbo.OT_Prikaz_Main.DT DESC,'
      '  dbo.OT_Prikaz_Main.Number DESC')
    Left = 24
    Top = 256
  end
  object Prog_Update: TADOQuery
    Connection = conADOUpdate
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Prog_Name'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'Select *'
      'from Prog_Update'
      'where Prog_Name = :Prog_Name')
    Left = 112
    Top = 456
  end
  object qryADOScan: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '
      '--  dbo.OT_Prikaz_Main.id,'
      ' dbo.OT_Prikaz_Scans.id,'
      ' dbo.OT_Prikaz_Scans.id_doc,'
      '  dbo.OT_Prikaz_Scans.DocPageNo,'
      '  dbo.OT_Prikaz_Scans.DocScan'
      'FROM'
      '  dbo.OT_Prikaz_Main'
      
        '  INNER JOIN dbo.OT_Prikaz_Scans ON (dbo.OT_Prikaz_Main.id = dbo' +
        '.OT_Prikaz_Scans.id_doc)'
      'WHERE'
      '  dbo.OT_Prikaz_Main.id = :pID'
      'ORDER BY'
      '  dbo.OT_Prikaz_Scans.DocPageNo')
    Left = 272
    Top = 24
  end
  object dsScan: TDataSource
    DataSet = qryADOScan
    Left = 416
    Top = 24
  end
  object conADOUpdate: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=Operator' +
      ';Initial Catalog=Production;Data Source=192.168.76.100;Use Proce' +
      'dure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstat' +
      'ion ID=C2L2OS11MOLDHMI;Use Encryption for Data=False;Tag with co' +
      'lumn collation when possible=False'
    ConnectionTimeout = 7
    DefaultDatabase = 'Production'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 456
  end
  object dsModTypes: TDataSource
    DataSet = qwrModtypes
    Left = 472
    Top = 80
  end
  object qryADOTypeInsert: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Importance'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'Type'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO dbo.OT_Prikaz_Types(IdCategory, d_type)'
      'VALUES (:Importance, :Type);')
    Left = 384
    Top = 136
  end
  object qryADODelType: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'DELETE FROM dbo.OT_Prikaz_Types'
      'WHERE id = :id')
    Left = 384
    Top = 192
  end
  object qryADOInsertScan: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_doc'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DocPageNo'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'DocScan'
        Attributes = [paNullable, paLong]
        DataType = ftVarBytes
        NumericScale = 255
        Precision = 255
        Size = 2147483647
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO dbo.OT_Prikaz_Scans(id_doc, DocPageNo, DocScan)'
      'VALUES (:id_doc, :DocPageNo, :DocScan);')
    Left = 16
    Top = 136
  end
  object qryADODocPageNo: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '--  dbo.OT_Prikaz_Main.id,'
      '  COUNT(dbo.OT_Prikaz_Scans.DocPageNo) as CountPageNo'
      'FROM'
      '  dbo.OT_Prikaz_Main'
      
        '  INNER JOIN dbo.OT_Prikaz_Scans ON (dbo.OT_Prikaz_Main.id = dbo' +
        '.OT_Prikaz_Scans.id_doc)'
      'WHERE'
      '  dbo.OT_Prikaz_Main.id = :pID')
    Left = 272
    Top = 80
  end
  object qryADODcPageNoModyfi: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'NewPageNo'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE dbo.OT_Prikaz_Scans'
      'SET DocPageNo=:NewPageNo'
      'WHERE id = :id')
    Left = 272
    Top = 256
  end
  object qryADOScanDelete: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'DELETE  dbo.OT_Prikaz_Scans'
      'WHERE  dbo.OT_Prikaz_Scans.id = :id')
    Left = 272
    Top = 136
  end
  object qryADOPageCountUpdate: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Page_Count'
        Attributes = [paSigned, paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE dbo.OT_Prikaz_Main'
      'SET Page_Number=:Page_Count'
      'WHERE id = :id')
    Left = 272
    Top = 312
  end
  object qryADOFlurView: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    BeforePost = qryADOFlurViewBeforePost
    Parameters = <
      item
        Name = 'id_type'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '  dbo.OT_Poly_Main a'
      '  LEFT JOIN eTabel.dbo.OT_FIO_DATA b ON (a.TabNo = b.TAB)'
      'WHERE'
      '  a.id_type=:id_type'
      '  AND a.DateIN >= GETDATE()-210'
      'ORDER BY'
      '  a.TabNo')
    Left = 576
    Top = 24
  end
  object dsFlurView: TDataSource
    DataSet = qryADOFlurView
    Left = 672
    Top = 24
  end
  object qryADOFlurAdd: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_type'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'TabNo'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DateIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO dbo.OT_Poly_Main(id_type, TabNo, DateIN)'
      'VALUES (:id_type, :TabNo, :DateIN);')
    Left = 576
    Top = 88
  end
  object qryADOFlurCheckExist: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_type'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DateIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'TabNo'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '
      '  COUNT(dbo.OT_Poly_Main.TabNo) as TabExist'
      'FROM'
      '  dbo.OT_Poly_Main'
      'WHERE'
      '  dbo.OT_Poly_Main.id_type=:id_type AND '
      '  dbo.OT_Poly_Main.DateIN=:DateIN AND'
      '  dbo.OT_Poly_Main.TabNo=:TabNo'
      '')
    Left = 576
    Top = 152
  end
  object qryADOWrongTabNo: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id_type'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '
      '  a.TabNo'
      'FROM'
      '  dbo.OT_Poly_Main a'
      
        '  LEFT JOIN [192.168.65.100].Tabel.dbo.OT_FLUR_DATA b ON (a.TabN' +
        'o = b.TAB)'
      'WHERE'
      '  a.id_type=:id_type AND'
      '  b.TAB is NULL'
      'ORDER BY'
      '  a.TabNo'
      '')
    Left = 576
    Top = 216
  end
  object dsWrongTabNo: TDataSource
    DataSet = qryADOWrongTabNo
    Left = 672
    Top = 216
  end
  object qryADOPrevTabCheck: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    BeforePost = qryADOFlurViewBeforePost
    Parameters = <
      item
        Name = 'id_type'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'TabNo'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'DateIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '  dbo.OT_Poly_Main a'
      'WHERE'
      '  a.id_type=:id_type AND'
      '  a.TabNo=:TabNo AND'
      '  a.DateIN=:DateIN'
      'ORDER BY'
      '  a.DateIN DESC')
    Left = 576
    Top = 280
  end
  object qryADOFlurPrevUpdate: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    BeforePost = qryADOFlurViewBeforePost
    Parameters = <
      item
        Name = 'DateIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'Deb'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE dbo.OT_Poly_Main'
      'SET DateIN=:DateIN, Deb=:Deb'
      'WHERE'
      ' dbo.OT_Poly_Main.id=:id')
    Left = 576
    Top = 336
  end
  object qryADOFlurRecordDel: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'DELETE FROM dbo.OT_Poly_Main'
      'WHERE id = :id')
    Left = 576
    Top = 400
  end
  object tblPolyTypes: TADOTable
    Connection = conADOMain
    CursorType = ctStatic
    TableName = 'OT_Poly_Types'
    Left = 376
    Top = 344
  end
  object dsPolyTypes: TDataSource
    DataSet = tblPolyTypes
    Left = 472
    Top = 344
  end
  object tblModPolyTypes: TADOTable
    Connection = conADOMain
    CursorType = ctStatic
    AfterPost = tblModPolyTypesAfterPost
    TableName = 'OT_Poly_Types'
    Left = 376
    Top = 408
  end
  object dsModPolyTypes: TDataSource
    DataSet = tblModPolyTypes
    Left = 472
    Top = 408
  end
  object qryADOPolyTypeInsert: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Type_Importence'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Type_Name'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO dbo.OT_Poly_Types(Type_Importence, Type_Name)'
      'VALUES (:Type_Importence, :Type_Name);')
    Left = 704
    Top = 344
  end
  object qryADODelPolyType: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'DELETE FROM dbo.OT_Poly_Types'
      'WHERE id = :id')
    Left = 704
    Top = 400
  end
  object tblCategories: TADOTable
    Connection = conADOMain
    CursorType = ctStatic
    TableName = 'OT_Prikaz_Categories'
    Left = 128
    Top = 560
  end
  object dsCategories: TDataSource
    DataSet = tblCategories
    Left = 208
    Top = 560
  end
  object qryFrmDocTypesCombosFiller: TADOQuery
    Connection = conADOMain
    Parameters = <>
    Left = 320
    Top = 552
  end
  object tblGroups: TADOTable
    Connection = conADOMain
    CursorType = ctStatic
    TableName = 'OT_Prikaz_Groups'
    Left = 128
    Top = 608
  end
  object dsGroups: TDataSource
    DataSet = tblGroups
    Left = 208
    Top = 608
  end
  object qryFrmMainDocTypesCombosFiller: TADOQuery
    Connection = conADOMain
    Parameters = <>
    Left = 320
    Top = 600
  end
  object qwrModtypes: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT '
      '  Typ.id,'
      '  Typ.d_type,'
      '  Typ.idCategory,'
      '  Typ.t_Importance,'
      '  Cat.CategoryName,'
      '  Gro.GroupName'
      'FROM'
      '  dbo.OT_Prikaz_Types Typ'
      
        '  left join dbo.OT_Prikaz_Categories Cat on (Typ.idCategory = Ca' +
        't.IdCategory)'
      
        '  left join dbo.OT_Prikaz_Groups Gro on (Gro.IdGroup = Cat.IdGro' +
        'up)'
      'WHERE'
      '  Gro.GroupName = '#39#1054#1093#1088#1072#1085#1072' '#1058#1088#1091#1076#1072#39)
    Left = 384
    Top = 80
    object qwrModtypesid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qwrModtypesd_type: TStringField
      FieldName = 'd_type'
    end
    object qwrModtypesidCategory: TSmallintField
      FieldName = 'idCategory'
    end
    object qwrModtypest_Importance: TSmallintField
      FieldName = 't_Importance'
    end
    object qwrModtypesCategoryName: TWideStringField
      FieldName = 'CategoryName'
      Size = 100
    end
    object qwrModtypesGroupName: TStringField
      FieldName = 'GroupName'
    end
  end
  object tblPolyMonth: TADOTable
    Connection = conADOMain
    CursorType = ctStatic
    TableName = 'OT_Poly_Month'
    Left = 488
    Top = 480
  end
  object dsPolyMonth: TDataSource
    DataSet = tblPolyMonth
    Left = 488
    Top = 544
  end
  object qryADOMain2: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '  dbo.OT_Prikaz_Main.id,'
      '  dbo.OT_Prikaz_Main.Number,'
      '  dbo.OT_Prikaz_Main.Page_Number,'
      '  dbo.OT_Prikaz_Main.DT,'
      '  dbo.OT_Prikaz_Main.Importance,'
      '  -- dbo.OT_Prikaz_Main.Scan,'
      '  dbo.OT_Prikaz_Main.id_type'
      'FROM'
      '  dbo.OT_Prikaz_Main'
      ' left join dbo.OT_Prikaz_Types Typ on (Typ.id = id_type)'
      
        '  left join dbo.OT_Prikaz_Categories Cat on (Typ.idCategory = Ca' +
        't.IdCategory)'
      
        '  left join dbo.OT_Prikaz_Groups Gro on (Gro.IdGroup = Cat.IdGro' +
        'up)'
      'WHERE'
      '  dbo.OT_Prikaz_Main.DT>GETDATE()-720'
      '  and Gro.GroupName = '#39#1054#1093#1088#1072#1085#1072' '#1058#1088#1091#1076#1072#39
      'and    dbo.OT_Prikaz_Main.Page_Number=999'
      '--  MONTH(dbo.OT_Prikaz_Main.DT) = MONTH(GETDATE())'
      'ORDER BY'
      '  dbo.OT_Prikaz_Main.id DESC,'
      '  dbo.OT_Prikaz_Main.DT DESC,'
      '  dbo.OT_Prikaz_Main.Number DESC')
    Left = 88
    Top = 80
    object qryADOMain2id: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryADOMain2Number: TStringField
      FieldName = 'Number'
    end
    object qryADOMain2Page_Number: TSmallintField
      FieldName = 'Page_Number'
    end
    object qryADOMain2DT: TDateTimeField
      FieldName = 'DT'
    end
    object qryADOMain2Importance: TBooleanField
      FieldName = 'Importance'
    end
    object qryADOMain2id_type: TSmallintField
      FieldName = 'id_type'
    end
  end
  object dsMain2: TDataSource
    DataSet = qryADOMain2
    Left = 184
    Top = 80
  end
  object qryADOFindNbr2: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pNumber'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      '  dbo.OT_Prikaz_Main.id,'
      '  dbo.OT_Prikaz_Main.Number,'
      '  dbo.OT_Prikaz_Main.Page_Number,'
      '  dbo.OT_Prikaz_Main.DT,'
      '  dbo.OT_Prikaz_Main.Importance,'
      '--  dbo.OT_Prikaz_Main.Scan,'
      '  dbo.OT_Prikaz_Main.id_type'
      'FROM'
      '  dbo.OT_Prikaz_Main'
      '  left join dbo.OT_Prikaz_Types Typ on (Typ.id = id_type)'
      
        '  left join dbo.OT_Prikaz_Categories Cat on (Typ.idCategory = Ca' +
        't.IdCategory)'
      
        '  left join dbo.OT_Prikaz_Groups Gro on (Gro.IdGroup = Cat.IdGro' +
        'up)'
      'WHERE'
      '   dbo.OT_Prikaz_Main.Number = :pNumber'
      '   and    dbo.OT_Prikaz_Main.Page_Number=999'
      '   and Gro.GroupName = '#39#1054#1093#1088#1072#1085#1072' '#1058#1088#1091#1076#1072#39
      'ORDER BY'
      '  dbo.OT_Prikaz_Main.DT DESC'
      '')
    Left = 24
    Top = 320
  end
  object dsFind2: TDataSource
    DataSet = qryADOFindNbr2
    Left = 96
    Top = 352
  end
  object qryADOFindDT2: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pDT1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'pDT2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '
      '  dbo.OT_Prikaz_Main.id,'
      '  dbo.OT_Prikaz_Main.Number,'
      '  dbo.OT_Prikaz_Main.Page_Number,'
      '  dbo.OT_Prikaz_Main.DT,'
      '  dbo.OT_Prikaz_Main.Importance,'
      '--  dbo.OT_Prikaz_Main.Scan,'
      '  dbo.OT_Prikaz_Main.id_type'
      'FROM'
      '  dbo.OT_Prikaz_Main'
      '  left join dbo.OT_Prikaz_Types Typ on (Typ.id = id_type)'
      
        '  left join dbo.OT_Prikaz_Categories Cat on (Typ.idCategory = Ca' +
        't.IdCategory)'
      
        '  left join dbo.OT_Prikaz_Groups Gro on (Gro.IdGroup = Cat.IdGro' +
        'up)'
      'WHERE'
      
        '   dbo.OT_Prikaz_Main.DT > :pDT1 and dbo.OT_Prikaz_Main.DT < :pD' +
        'T2'
      'and    dbo.OT_Prikaz_Main.Page_Number=999'
      'and Gro.GroupName = '#39#1054#1093#1088#1072#1085#1072' '#1058#1088#1091#1076#1072#39
      'ORDER BY'
      '  dbo.OT_Prikaz_Main.DT DESC,'
      '  dbo.OT_Prikaz_Main.Number DESC')
    Left = 24
    Top = 376
  end
  object qryADOScan2: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '
      '--  dbo.OT_Prikaz_Main.id,'
      ' dbo.OT_Prikaz_Scans.id,'
      ' dbo.OT_Prikaz_Scans.id_doc,'
      '  dbo.OT_Prikaz_Scans.DocPageNo,'
      '  dbo.OT_Prikaz_Scans.DocScan'
      'FROM'
      '  dbo.OT_Prikaz_Main'
      
        '  INNER JOIN dbo.OT_Prikaz_Scans ON (dbo.OT_Prikaz_Main.id = dbo' +
        '.OT_Prikaz_Scans.id_doc)'
      'WHERE'
      '  dbo.OT_Prikaz_Main.id = :pID'
      'ORDER BY'
      '  dbo.OT_Prikaz_Scans.DocPageNo')
    Left = 352
    Top = 16
  end
  object dsscan2: TDataSource
    DataSet = qryADOScan2
    Left = 488
    Top = 24
  end
  object qryADOScanId: TADOQuery
    Connection = conADOMain
    Parameters = <
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT'
      ' dbo.OT_Prikaz_Main.id,'
      'dbo.OT_Prikaz_Scans.id as scanid,'
      'dbo.OT_Prikaz_Scans.DocScan'
      'FROM'
      '  dbo.OT_Prikaz_Main'
      
        '  INNER JOIN dbo.OT_Prikaz_Scans ON (dbo.OT_Prikaz_Main.id = dbo' +
        '.OT_Prikaz_Scans.id_doc)'
      'WHERE'
      '  dbo.OT_Prikaz_Main.id = :id')
    Left = 184
    Top = 184
  end
  object qryADOUpdateScan: TADOQuery
    Connection = conADOMain
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dscan'
        Attributes = [paNullable, paLong]
        DataType = ftBlob
        NumericScale = 255
        Precision = 255
        Size = 2147483647
        Value = Null
      end
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE OT_Prikaz_Scans'
      'SET DocScan=:dscan'
      'WHERE'
      'OT_Prikaz_Scans.id=:id')
    Left = 184
    Top = 128
  end
end
