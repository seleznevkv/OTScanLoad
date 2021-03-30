object frmSelfUpdate: TfrmSelfUpdate
  Left = 335
  Top = 134
  BorderIcons = []
  BorderStyle = bsNone
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
  ClientHeight = 34
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxdbprgrsbrProgStart: TcxDBProgressBar
    Left = 0
    Top = 0
    Align = alClient
    Properties.BarStyle = cxbsGradient
    Properties.BeginColor = clBlue
    Properties.EndColor = clSkyBlue
    Style.BorderColor = clWindowFrame
    Style.BorderStyle = ebs3D
    TabOrder = 0
    Width = 580
  end
  object tmrPBar: TTimer
    Enabled = False
    Interval = 200
    OnTimer = tmrPBarTimer
    Left = 448
    Top = 65528
  end
  object tmrCheckUpdate: TTimer
    Enabled = False
    Interval = 50
    OnTimer = tmrCheckUpdateTimer
    Left = 376
    Top = 65528
  end
end
