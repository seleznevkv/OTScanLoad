object frmMain: TfrmMain
  Left = 201
  Top = 354
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1093#1088#1072#1085#1072' '#1090#1088#1091#1076#1072
  ClientHeight = 643
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    661
    643)
  PixelsPerInch = 96
  TextHeight = 13
  object pgcMain: TPageControl
    Left = 8
    Top = 32
    Width = 645
    Height = 603
    ActivePage = tsPrikaz
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    object tsPrikaz: TTabSheet
      Caption = #1055#1088#1080#1082#1072#1079#1099' Scan'
      OnShow = tsPrikazShow
      DesignSize = (
        637
        575)
      object imgSmall: TcxDBImage
        Left = 357
        Top = 222
        Cursor = crHandPoint
        Hint = #1059#1074#1077#1083#1080#1095#1080#1090#1100
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataBinding.DataField = 'DocScan'
        DataBinding.DataSource = dmMain.dsScan
        Properties.GraphicClassName = 'TJPEGImage'
        Properties.ReadOnly = True
        Properties.Stretch = True
        TabOrder = 2
        OnClick = imgSmallClick
        Height = 341
        Width = 272
      end
      object grp1: TGroupBox
        Left = 8
        Top = 17
        Width = 621
        Height = 120
        Anchors = [akLeft, akTop, akRight]
        Caption = ' '#1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1080#1090' '
        TabOrder = 0
        object lbl1: TLabel
          Left = 64
          Top = 65
          Width = 25
          Height = 16
          Caption = #1058#1080#1087
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 185
          Top = 65
          Width = 43
          Height = 16
          Caption = #1053#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl3: TLabel
          Left = 312
          Top = 65
          Width = 32
          Height = 16
          Caption = #1044#1072#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 380
          Top = 16
          Width = 63
          Height = 16
          Caption = #1042#1072#1078#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblGroupName: TLabel
          Left = 58
          Top = 16
          Width = 47
          Height = 16
          Caption = #1043#1088#1091#1087#1087#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblCategoryName: TLabel
          Left = 226
          Top = 16
          Width = 68
          Height = 16
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cxtxtdtNumber: TcxTextEdit
          Left = 158
          Top = 84
          TabOrder = 0
          OnKeyPress = cxtxtdtNumberKeyPress
          Width = 100
        end
        object cxdtdDate: TcxDateEdit
          Left = 280
          Top = 84
          TabOrder = 1
          Width = 100
        end
        object btnAddDoc: TcxButton
          Left = 470
          Top = 38
          Width = 120
          Height = 28
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
          TabOrder = 2
          OnClick = btnAddDocClick
        end
        object cbDocType: TcxComboBox
          Left = 14
          Top = 84
          Properties.DropDownListStyle = lsFixedList
          TabOrder = 3
          Width = 132
        end
        object cxchckbxImporten: TcxCheckBox
          Left = 401
          Top = 38
          TabOrder = 4
          Width = 25
        end
        object cbGroupName: TcxComboBox
          Left = 14
          Top = 38
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = cbGroupNamePropertiesChange
          TabOrder = 5
          Width = 132
        end
        object cbCategoryName: TcxComboBox
          Left = 152
          Top = 38
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = cbCategoryNamePropertiesChange
          TabOrder = 6
          Width = 231
        end
      end
      object grp2: TGroupBox
        Left = 8
        Top = 143
        Width = 621
        Height = 73
        Anchors = [akLeft, akTop, akRight]
        Caption = ' '#1053#1072#1081#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1080#1090' '
        TabOrder = 1
        object lbl5: TLabel
          Left = 62
          Top = 17
          Width = 43
          Height = 16
          Caption = #1053#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl6: TLabel
          Left = 202
          Top = 17
          Width = 10
          Height = 16
          Caption = #1089':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl7: TLabel
          Left = 318
          Top = 17
          Width = 19
          Height = 16
          Caption = #1087#1086':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl8: TLabel
          Left = 391
          Top = 17
          Width = 40
          Height = 16
          Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1080#1089#1082
          Caption = #1055#1086#1080#1089#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object cxtxtdtFindNo: TcxTextEdit
          Left = 34
          Top = 40
          Enabled = False
          TabOrder = 0
          OnClick = cxtxtdtFindNoClick
          OnKeyPress = cxtxtdtFindNoKeyPress
          Width = 100
        end
        object cxdtdtFindDT1: TcxDateEdit
          Left = 158
          Top = 40
          Enabled = False
          TabOrder = 1
          OnClick = cxdtdtFindDT1Click
          OnKeyPress = cxdtdtFindDT1KeyPress
          Width = 100
        end
        object btnFind: TcxButton
          Left = 470
          Top = 32
          Width = 120
          Height = 28
          Caption = #1053#1072#1081#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
          Enabled = False
          TabOrder = 4
          OnClick = btnFindClick
        end
        object cxdtdtFindDT2: TcxDateEdit
          Left = 280
          Top = 40
          Enabled = False
          TabOrder = 2
          OnClick = cxdtdtFindDT2Click
          OnKeyPress = cxdtdtFindDT2KeyPress
          Width = 100
        end
        object cxchckbxFind: TcxCheckBox
          Left = 400
          Top = 40
          Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1080#1089#1082
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = cxchckbxFindClick
          Width = 25
        end
      end
      object lblDataLoad: TcxLabel
        Left = 424
        Top = 336
        Caption = #1048#1076#1105#1090' '#1079'a'#1075#1088#1091#1079#1082#1072'...'
        ParentColor = False
        ParentFont = False
        Style.Color = clCaptionText
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -16
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxdbnvgtrScan1: TcxDBNavigator
        Left = 358
        Top = 512
        Width = 115
        Height = 25
        Buttons.CustomButtons = <>
        Buttons.PriorPage.Visible = False
        Buttons.Prior.Visible = True
        Buttons.NextPage.Visible = False
        Buttons.Insert.Visible = False
        Buttons.Append.Visible = False
        Buttons.Edit.Visible = False
        Buttons.Post.Visible = False
        Buttons.Cancel.Visible = False
        Buttons.Refresh.Visible = False
        Buttons.SaveBookmark.Visible = False
        Buttons.GotoBookmark.Visible = False
        Buttons.Filter.Visible = False
        DataSource = dmMain.dsScan
        Enabled = False
        TabOrder = 4
        Visible = False
      end
      object btnAddScan: TcxButton
        Left = 486
        Top = 536
        Width = 112
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1088#1072#1085#1080#1094#1091
        TabOrder = 10
        OnClick = btnAddScanClick
      end
      object cxlblDocPageNo: TcxLabel
        Left = 608
        Top = 232
        Caption = '1'
        ParentColor = False
        ParentFont = False
        Style.Color = clMenuBar
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object btnScanPrev: TcxButton
        Left = 358
        Top = 536
        Width = 33
        Height = 25
        Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1081' '#1089#1090#1088#1072#1085#1080#1094#1077
        Caption = '<'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = btnScanPrevClick
      end
      object btnScanNext: TcxButton
        Left = 390
        Top = 536
        Width = 33
        Height = 25
        Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1089#1090#1088#1072#1085#1080#1094#1077
        Caption = '>'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = btnScanNextClick
      end
      object btnScanDel: TcxButton
        Left = 422
        Top = 536
        Width = 33
        Height = 25
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1072#1085#1080#1094#1091
        Caption = '---'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = btnScanDelClick
      end
      object btnModyfiNo: TcxButton
        Left = 454
        Top = 536
        Width = 33
        Height = 25
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1088#1103#1076#1082#1086#1074#1099#1081' '#1085#1086#1084#1077#1088' '#1089#1090#1088#1072#1085#1080#1094#1099
        Caption = #8470
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = btnModyfiNoClick
      end
      object cxGrid1: TcxGrid
        Left = 7
        Top = 222
        Width = 345
        Height = 339
        Anchors = [akLeft, akTop, akBottom]
        PopupMenu = dxbrpmnPopUp
        TabOrder = 11
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          OnFocusedRecordChanged = cxGrid1DBTableView1FocusedRecordChanged
          DataController.DataSource = dmMain.dsMain
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.OnGetContentStyle = cxGrid1DBTableView1StylesGetContentStyle
          object cxgrdbclmnGrid1DBTableView1type: TcxGridDBColumn
            Caption = #1058#1080#1087
            DataBinding.FieldName = 'id_type'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = 'd_type'
                FieldName = 'd_type'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmMain.dsTypes
            HeaderAlignmentHorz = taCenter
            Width = 100
          end
          object cxgrdbclmnGrid1DBTableView1Number: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088
            DataBinding.FieldName = 'Number'
            HeaderAlignmentHorz = taCenter
            Width = 55
          end
          object cxgrdbclmnGrid1DBTablePageNumber: TcxGridDBColumn
            Caption = #1057#1090#1088'.'
            DataBinding.FieldName = 'Page_Number'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 40
          end
          object cxgrdbclmnGrid1DBTableView1Date: TcxGridDBColumn
            Caption = #1044#1072#1090#1072
            DataBinding.FieldName = 'DT'
            HeaderAlignmentHorz = taCenter
            Width = 115
          end
          object cxgrdbclmnGrid1DBTableView1Importance: TcxGridDBColumn
            Caption = #1042#1072#1078#1085#1086
            DataBinding.FieldName = 'Importance'
            HeaderAlignmentHorz = taCenter
            Width = 43
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object tspdf: TTabSheet
      Caption = #1055#1088#1080#1082#1072#1079#1099' PDF'
      ImageIndex = 2
      OnShow = tspdfShow
      DesignSize = (
        637
        575)
      object lblscanex: TLabel
        Left = 496
        Top = 304
        Width = 3
        Height = 13
      end
      object changepdf: TcxButton
        Left = 480
        Top = 242
        Width = 120
        Height = 25
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' PDF'
        Enabled = False
        TabOrder = 0
        OnClick = changepdfClick
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 143
        Width = 622
        Height = 73
        Anchors = [akLeft, akTop, akRight]
        Caption = ' '#1053#1072#1081#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1080#1090' '
        TabOrder = 1
        object Label2: TLabel
          Left = 62
          Top = 17
          Width = 43
          Height = 16
          Caption = #1053#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 202
          Top = 17
          Width = 10
          Height = 16
          Caption = #1089':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 318
          Top = 17
          Width = 19
          Height = 16
          Caption = #1087#1086':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 398
          Top = 17
          Width = 40
          Height = 16
          Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1080#1089#1082
          Caption = #1055#1086#1080#1089#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object cxtxtdtFindNo2: TcxTextEdit
          Left = 34
          Top = 40
          Enabled = False
          TabOrder = 0
          OnClick = cxtxtdtFindNoClick
          OnKeyPress = cxtxtdtFindNoKeyPress
          Width = 100
        end
        object cxdtdtFindDT12: TcxDateEdit
          Left = 158
          Top = 40
          Enabled = False
          TabOrder = 1
          OnClick = cxdtdtFindDT1Click
          OnKeyPress = cxdtdtFindDT1KeyPress
          Width = 100
        end
        object cxdtdtFindDT22: TcxDateEdit
          Left = 280
          Top = 40
          Enabled = False
          TabOrder = 2
          OnClick = cxdtdtFindDT2Click
          OnKeyPress = cxdtdtFindDT2KeyPress
          Width = 100
        end
        object cxchckbxFind2: TcxCheckBox
          Left = 407
          Top = 40
          Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1080#1089#1082
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = cxchckbxFind2Click
          Width = 25
        end
        object btnFind2: TcxButton
          Left = 472
          Top = 36
          Width = 120
          Height = 25
          Caption = #1053#1072#1081#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
          Enabled = False
          TabOrder = 4
          OnClick = btnFind2Click
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 17
        Width = 622
        Height = 120
        Anchors = [akLeft, akTop, akRight]
        Caption = ' '#1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1080#1090' '
        TabOrder = 2
        object Label6: TLabel
          Left = 64
          Top = 65
          Width = 25
          Height = 16
          Caption = #1058#1080#1087
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 185
          Top = 65
          Width = 43
          Height = 16
          Caption = #1053#1086#1084#1077#1088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 312
          Top = 65
          Width = 32
          Height = 16
          Caption = #1044#1072#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 386
          Top = 16
          Width = 63
          Height = 16
          Caption = #1042#1072#1078#1085#1086#1089#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 58
          Top = 16
          Width = 47
          Height = 16
          Caption = #1043#1088#1091#1087#1087#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 226
          Top = 16
          Width = 68
          Height = 16
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object cxtxtdtNumber2: TcxTextEdit
          Left = 158
          Top = 84
          TabOrder = 0
          OnKeyPress = cxtxtdtNumberKeyPress
          Width = 100
        end
        object cxdtdDate2: TcxDateEdit
          Left = 280
          Top = 84
          TabOrder = 1
          Width = 100
        end
        object btnAddDoc2: TcxButton
          Left = 472
          Top = 35
          Width = 120
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
          TabOrder = 2
          OnClick = btnAddDoc2Click
        end
        object cbDocType2: TcxComboBox
          Left = 14
          Top = 84
          Properties.DropDownListStyle = lsFixedList
          TabOrder = 3
          Width = 132
        end
        object cxchckbxImporten2: TcxCheckBox
          Left = 407
          Top = 38
          TabOrder = 4
          Width = 25
        end
        object cbGroupName2: TcxComboBox
          Left = 14
          Top = 38
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = cbGroupName2PropertiesChange
          TabOrder = 5
          Width = 132
        end
        object cbCategoryName2: TcxComboBox
          Left = 158
          Top = 38
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = cbCategoryName2PropertiesChange
          TabOrder = 6
          Width = 222
        end
        object btnaddscan2: TcxButton
          Left = 472
          Top = 83
          Width = 120
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' PDF'
          Enabled = False
          TabOrder = 7
          OnClick = btnaddscan2Click
        end
      end
      object cxGrid2: TcxGrid
        Left = 8
        Top = 222
        Width = 380
        Height = 339
        Anchors = [akLeft, akTop, akBottom]
        PopupMenu = PDFEditMenu
        TabOrder = 3
        object cxGridDBTableView1: TcxGridDBTableView
          PopupMenu = PDFEditMenu
          Navigator.Buttons.CustomButtons = <>
          OnCellClick = cxGridDBTableView1CellClick
          OnFocusedRecordChanged = cxGrid1DBTableView1FocusedRecordChanged
          DataController.DataSource = dmMain.dsMain2
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.OnGetContentStyle = cxGrid1DBTableView1StylesGetContentStyle
          object cxGridDBTableView1id_type: TcxGridDBColumn
            Caption = #1058#1080#1087
            DataBinding.FieldName = 'id_type'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                FieldName = 'd_type'
              end>
            Properties.ListSource = dmMain.dsTypes
            HeaderAlignmentHorz = taCenter
            HeaderGlyphAlignmentHorz = taCenter
            Width = 115
          end
          object cxGridDBTableView1Number: TcxGridDBColumn
            Caption = #1053#1086#1084#1077#1088
            DataBinding.FieldName = 'Number'
            HeaderAlignmentHorz = taCenter
            HeaderGlyphAlignmentHorz = taCenter
            Width = 81
          end
          object cxGridDBTableView1DT: TcxGridDBColumn
            Caption = #1044#1072#1090#1072
            DataBinding.FieldName = 'DT'
            HeaderAlignmentHorz = taCenter
            HeaderGlyphAlignmentHorz = taCenter
            Width = 139
          end
          object cxGridDBTableView1Importance: TcxGridDBColumn
            Caption = #1042#1072#1078#1085#1086
            DataBinding.FieldName = 'Importance'
            HeaderAlignmentHorz = taCenter
            HeaderGlyphAlignmentHorz = taCenter
            Width = 56
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
    object tPoly: TTabSheet
      Caption = #1057#1087#1080#1089#1082#1080' '#1087#1086#1083#1080#1082#1083#1080#1085#1080#1082#1080
      ImageIndex = 1
      object grp3: TGroupBox
        Left = 8
        Top = 8
        Width = 627
        Height = 564
        Caption = ' '#1057#1087#1080#1089#1086#1082'  '
        TabOrder = 0
        DesignSize = (
          627
          564)
        object cxgrdDocTypes1: TcxGrid
          Left = 8
          Top = 112
          Width = 611
          Height = 444
          Anchors = [akLeft, akTop, akRight, akBottom]
          PopupMenu = dxbrpmnFlurPopUp
          TabOrder = 1
          object cxgrdbtblvwGrid2DBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dmMain.dsFlurView
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Kind = skCount
                Position = spFooter
                Column = cxgrdbclmnGrid2DBTableView1TabNo
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                Column = cxgrdbclmnGrid2DBTableView1TabNo
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupFooters = gfAlwaysVisible
            Styles.OnGetContentStyle = cxgrdbtblvwGrid2DBTableView1StylesGetContentStyle
            object cxgrdbclmnGrid2DBTableView1TabNo: TcxGridDBColumn
              Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#8470
              DataBinding.FieldName = 'TabNo'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Width = 38
            end
            object cxgrdbclmnGrid2DBTableView1Status: TcxGridDBColumn
              Caption = #1057#1090#1072#1090#1091#1089
              DataBinding.FieldName = 'Status'
              HeaderAlignmentHorz = taCenter
            end
            object cxgrdbclmnGrid2DBTableView1Deb: TcxGridDBColumn
              Caption = #1044#1086#1083#1075
              DataBinding.FieldName = 'Deb'
              HeaderAlignmentHorz = taCenter
              Width = 25
            end
            object cxgrdbclmnGrid2DBTableView1FIO: TcxGridDBColumn
              Caption = #1060'.'#1048'.'#1054
              DataBinding.FieldName = 'FIO'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Width = 141
            end
            object cxgrdbclmnGrid2DBTableView1DateIN: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1087#1088#1086#1093#1086#1078#1076#1077#1085#1080#1103
              DataBinding.FieldName = 'DateIN'
              Visible = False
              GroupIndex = 0
              HeaderAlignmentHorz = taCenter
              Width = 60
            end
            object cxgrdbclmnGrid2DBTableView1DEPARTMENT: TcxGridDBColumn
              Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
              DataBinding.FieldName = 'DEPARTMENT'
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Width = 97
            end
          end
          object cxgrdlvlGrid2Level1: TcxGridLevel
            GridView = cxgrdbtblvwGrid2DBTableView1
          end
        end
        object grp4: TGroupBox
          Left = 8
          Top = 24
          Width = 611
          Height = 81
          Anchors = [akLeft, akTop, akRight]
          Caption = ' '#1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '
          TabOrder = 0
          object lbl9: TLabel
            Left = 68
            Top = 25
            Width = 25
            Height = 16
            Caption = #1058#1080#1087
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbl10: TLabel
            Left = 161
            Top = 25
            Width = 45
            Height = 16
            Caption = #1058#1072#1073'. '#8470
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label1: TLabel
            Left = 265
            Top = 25
            Width = 41
            Height = 16
            Caption = #1052#1077#1089#1103#1094
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object cxtxtdtAddTabNo: TcxTextEdit
            Left = 145
            Top = 48
            TabOrder = 1
            OnKeyPress = cxtxtdtAddTabNoKeyPress
            Width = 73
          end
          object btnFlurAdd: TcxButton
            Left = 354
            Top = 49
            Width = 114
            Height = 19
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            TabOrder = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btnFlurAddClick
          end
          object cbbPolyType: TcxLookupComboBox
            Left = 26
            Top = 48
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                FieldName = 'Type_Name'
              end
              item
                MinWidth = 0
                Width = 0
                FieldName = 'id'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmMain.dsPolyTypes
            Properties.ReadOnly = False
            Properties.OnChange = cbbPolyTypePropertiesChange
            TabOrder = 0
            Width = 111
          end
          object btnUpdateFlurList: TcxButton
            Left = 474
            Top = 49
            Width = 111
            Height = 19
            Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
            TabOrder = 3
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = btnUpdateFlurListClick
          end
          object cbbPolyMonth: TcxLookupComboBox
            Left = 226
            Top = 48
            Properties.KeyFieldNames = 'Month_Name'
            Properties.ListColumns = <
              item
                FieldName = 'Month_Name'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dmMain.dsPolyMonth
            Properties.ReadOnly = False
            Properties.OnChange = cbbPolyTypePropertiesChange
            TabOrder = 4
            Width = 122
          end
        end
        object cxlblLoading: TcxLabel
          Left = 240
          Top = 288
          Caption = #1048#1076#1105#1090' '#1079#1075#1088#1091#1079#1082#1072'...'
          ParentColor = False
          ParentFont = False
          Style.Color = clCaptionText
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -16
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Visible = False
        end
      end
    end
  end
  object dlgOpenPicScan: TOpenPictureDialog
    Filter = 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg'
    Left = 564
    Top = 24
  end
  object dxbrmngrMain: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'MainMenu'
      'PopUp'
      'DocTypesPopUp'
      'FlurPopUp'
      'PolyTypesPopUp')
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 192
    Top = 24
    DockControlHeights = (
      0
      0
      25
      0)
    object dxbrmngrMainBar1: TdxBar
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 241
      FloatTop = 209
      FloatClientWidth = 0
      FloatClientHeight = 0
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrsbtmSpravochnik'
        end>
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxbrbtnDocTypes: TdxBarButton
      Caption = #1058#1080#1087#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      Category = 0
      Hint = #1058#1080#1087#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      Visible = ivAlways
      OnClick = dxbrbtnDocTypesClick
    end
    object dxbrsbtmSpravochnik: TdxBarSubItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxbrbtnDocTypes'
        end
        item
          Visible = True
          ItemName = 'dxbrbtnPoly'
        end>
    end
    object dxbrbtnPoly: TdxBarButton
      Caption = #1057#1087#1080#1089#1082#1080' '#1087#1086#1083#1080#1082#1083#1080#1085#1080#1082#1080
      Category = 0
      Hint = #1057#1087#1080#1089#1082#1080' '#1087#1086#1083#1080#1082#1083#1080#1085#1080#1082#1080
      Visible = ivAlways
      OnClick = dxbrbtnPolyClick
    end
    object dxbrbtnEdit: TdxBarButton
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Category = 1
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = dxbrbtnEditClick
    end
    object dxbrbtnDel: TdxBarButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Category = 1
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
      OnClick = dxbrbtnDelClick
    end
    object dxbrbtnEditTypes: TdxBarButton
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Category = 2
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = dxbrbtnEditTypesClick
    end
    object dxbrbtnDelType: TdxBarButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Category = 2
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
      OnClick = dxbrbtnDelTypeClick
    end
    object dxbrbtnFlurPopUpEdit: TdxBarButton
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Category = 3
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = dxbrbtnFlurPopUpEditClick
    end
    object dxbrbtnBarFlurPopUpDel: TdxBarButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Category = 3
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
      OnClick = dxbrbtnBarFlurPopUpDelClick
    end
    object dxbrbtnPolyTypesEdit: TdxBarButton
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Category = 4
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = dxbrbtnPolyTypesEditClick
    end
    object dxbrbtnPolyTypesDel: TdxBarButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Category = 4
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Visible = ivAlways
      OnClick = dxbrbtnPolyTypesDelClick
    end
  end
  object dxbrpmnPopUp: TdxBarPopupMenu
    BarManager = dxbrmngrMain
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxbrbtnEdit'
      end
      item
        Visible = True
        ItemName = 'dxbrbtnDel'
      end>
    UseOwnFont = False
    Left = 268
    Top = 24
  end
  object tmrDataLoad: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrDataLoadTimer
    Left = 488
    Top = 24
  end
  object tmrClose: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrCloseTimer
    Left = 428
    Top = 24
  end
  object cxstylrpstry1: TcxStyleRepository
    Left = 44
    Top = 512
    PixelsPerInch = 96
    object cxstyl1: TcxStyle
      AssignedValues = [svColor]
      Color = clYellow
    end
    object cxstyl2: TcxStyle
      AssignedValues = [svColor]
      Color = clRed
    end
    object cxstyl3: TcxStyle
      AssignedValues = [svColor]
      Color = clSkyBlue
    end
  end
  object dxbrpmnFlurPopUp: TdxBarPopupMenu
    BarManager = dxbrmngrMain
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxbrbtnFlurPopUpEdit'
      end
      item
        Visible = True
        ItemName = 'dxbrbtnBarFlurPopUpDel'
      end>
    UseOwnFont = False
    Left = 356
    Top = 24
  end
  object tmrAPPTerminate: TTimer
    Enabled = False
    Interval = 1
    OnTimer = tmrAPPTerminateTimer
    Left = 112
    Top = 65528
  end
  object tmrDataLoad2: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrDataLoad2Timer
    Left = 488
    Top = 80
  end
  object flpdfdialog: TOpenDialog
    Filter = #1044#1086#1082#1091#1084#1077#1085#1090' PDF (*.pdf)|*.pdf'
    Left = 608
    Top = 80
  end
  object PDFEditMenu: TPopupMenu
    Left = 448
    Top = 352
    object dxpdfedit: TMenuItem
      AutoCheck = True
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = dxpdfeditClick
    end
    object dxpdfdel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = dxpdfdelClick
    end
  end
end
