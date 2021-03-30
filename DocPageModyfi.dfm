object frmDocPageModyfi: TfrmDocPageModyfi
  Left = 507
  Top = 125
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = #1054#1093#1088#1072#1085#1072' '#1090#1088#1091#1076#1072
  ClientHeight = 112
  ClientWidth = 258
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TcxButton
    Left = 36
    Top = 80
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOkClick
  end
  object grp1: TGroupBox
    Left = 8
    Top = 8
    Width = 241
    Height = 65
    Caption = ' '#1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1074#1099#1081' '#1085#1086#1084#1077#1088' '
    TabOrder = 0
    object cxtxtdtDocPageNo: TcxTextEdit
      Left = 168
      Top = 24
      TabOrder = 0
      Text = '1'
      OnKeyPress = cxtxtdtDocPageNoKeyPress
      Width = 57
    end
    object cxlbl1: TcxLabel
      Left = 16
      Top = 26
      Caption = #1053#1086#1084#1077#1088' '#1089#1090#1088#1072#1085#1080#1094#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
  end
  object btnCancel: TcxButton
    Left = 148
    Top = 79
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = btnCancelClick
  end
end
