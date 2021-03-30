object frmDocTypes: TfrmDocTypes
  Left = 618
  Top = 148
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1080#1087#1086#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 434
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    502
    434)
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 486
    Height = 420
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' '#1056#1077#1076#1072#1082#1090#1086#1088' '#1090#1080#1087#1086#1074' '
    TabOrder = 0
    DesignSize = (
      486
      420)
    object cxgrdDocTypes1: TcxGrid
      Left = 8
      Top = 136
      Width = 471
      Height = 276
      Anchors = [akLeft, akTop, akRight, akBottom]
      PopupMenu = dxbrpmnDocTypesPopUp
      TabOrder = 1
      object cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dmMain.dsModTypes
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cxgrdbtblvwGrid1DBTableView1id: TcxGridDBColumn
          DataBinding.FieldName = 'id'
          Visible = False
        end
        object cxgrdbtblvwGrid1DBTableView1idCategory: TcxGridDBColumn
          DataBinding.FieldName = 'idCategory'
          Visible = False
        end
        object cxgrdbtblvwGrid1DBTableView1t_Importance: TcxGridDBColumn
          DataBinding.FieldName = 't_Importance'
          Visible = False
        end
        object cxgrdbtblvwGrid1DBTableView1GroupName: TcxGridDBColumn
          Caption = #1043#1088#1091#1087#1087#1072
          DataBinding.FieldName = 'GroupName'
          Width = 123
        end
        object cxgrdbtblvwGrid1DBTableView1CategoryName: TcxGridDBColumn
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
          DataBinding.FieldName = 'CategoryName'
          Width = 200
        end
        object cxgrdbtblvwGrid1DBTableView1d_type: TcxGridDBColumn
          Caption = #1058#1080#1087
          DataBinding.FieldName = 'd_type'
          Width = 146
        end
      end
      object cxgrdlvlGrid1Level1: TcxGridLevel
        GridView = cxgrdbtblvwGrid1DBTableView1
      end
    end
    object grp2: TGroupBox
      Left = 12
      Top = 16
      Width = 471
      Height = 114
      Anchors = [akLeft, akTop, akRight]
      Caption = ' '#1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '
      TabOrder = 0
      DesignSize = (
        471
        114)
      object lbl2: TLabel
        Left = 17
        Top = 57
        Width = 53
        Height = 13
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 17
        Top = 85
        Width = 19
        Height = 13
        Caption = #1058#1080#1087
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 17
        Top = 30
        Width = 35
        Height = 13
        Caption = #1043#1088#1091#1087#1087#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object cxtxtdtNewTypes: TcxTextEdit
        Left = 76
        Top = 81
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 0
        Width = 301
      end
      object btnAddType: TcxButton
        Left = 385
        Top = 81
        Width = 80
        Height = 20
        Anchors = [akRight, akBottom]
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 1
        OnClick = btnAddTypeClick
      end
      object cxcbxCategoryName: TcxComboBox
        Left = 76
        Top = 54
        Anchors = [akLeft, akRight, akBottom]
        Properties.DropDownListStyle = lsFixedList
        Properties.ReadOnly = False
        TabOrder = 2
        Width = 301
      end
      object cxcbxGroupName: TcxComboBox
        Left = 76
        Top = 27
        Anchors = [akLeft, akRight, akBottom]
        Properties.DropDownListStyle = lsFixedList
        Properties.ReadOnly = False
        Properties.OnChange = cxcbxGroupNamePropertiesChange
        TabOrder = 3
        Width = 301
      end
    end
  end
  object dxbrpmnDocTypesPopUp: TdxBarPopupMenu
    BarManager = frmMain.dxbrmngrMain
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxbrbtnEditTypes'
      end
      item
        Visible = True
        ItemName = 'dxbrbtnDelType'
      end>
    UseOwnFont = False
    Left = 112
    Top = 192
  end
end
