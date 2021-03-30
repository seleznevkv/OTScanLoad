object frmPolyTypes: TfrmPolyTypes
  Left = 243
  Top = 142
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1080#1087#1086#1074' '#1089#1087#1080#1089#1082#1086#1074
  ClientHeight = 310
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 297
    Height = 297
    Caption = ' '#1056#1077#1076#1072#1082#1090#1086#1088' '#1090#1080#1087#1086#1074' '
    TabOrder = 0
    object cxgrdDocTypes1: TcxGrid
      Left = 8
      Top = 96
      Width = 281
      Height = 193
      PopupMenu = dxbrpmnPolyTypesPopUp
      TabOrder = 1
      object cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dmMain.dsModPolyTypes
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Editing = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object cxgrdbclmnGrid1DBTableView1Type_Importence: TcxGridDBColumn
          Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090
          DataBinding.FieldName = 'Type_Importence'
          HeaderAlignmentHorz = taCenter
        end
        object cxgrdbclmnGrid1DBTableView1Type_Name: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1089#1087#1080#1089#1082#1072
          DataBinding.FieldName = 'Type_Name'
          HeaderAlignmentHorz = taCenter
        end
      end
      object cxgrdlvlGrid1Level1: TcxGridLevel
        GridView = cxgrdbtblvwGrid1DBTableView1
      end
    end
    object grp2: TGroupBox
      Left = 8
      Top = 16
      Width = 281
      Height = 73
      Caption = ' '#1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1080#1087' '#1089#1087#1080#1089#1082#1072' '
      TabOrder = 0
      object lbl2: TLabel
        Left = 13
        Top = 21
        Width = 54
        Height = 13
        Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 114
        Top = 21
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
      object cxtxtdtImportence: TcxTextEdit
        Left = 16
        Top = 40
        TabOrder = 0
        Text = '1'
        Width = 41
      end
      object cxtxtdtNewTypes: TcxTextEdit
        Left = 64
        Top = 40
        TabOrder = 1
        Width = 121
      end
      object btnAddType: TcxButton
        Left = 193
        Top = 40
        Width = 80
        Height = 20
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 2
        OnClick = btnAddTypeClick
      end
    end
  end
  object dxbrpmnPolyTypesPopUp: TdxBarPopupMenu
    BarManager = frmMain.dxbrmngrMain
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxbrbtnPolyTypesEdit'
      end
      item
        Visible = True
        ItemName = 'dxbrbtnPolyTypesDel'
      end>
    UseOwnFont = False
    Left = 112
    Top = 192
  end
end
