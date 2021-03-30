object frmDocShow: TfrmDocShow
  Left = 300
  Top = 81
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  ClientHeight = 868
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object frmDocShow: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 657
    Height = 868
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 665
    ExplicitHeight = 873
    object ScrollBox1: TScrollBox
      Left = 12
      Top = 12
      Width = 185
      Height = 37
      BorderStyle = bsNone
      TabOrder = 0
      object img1: TcxDBImage
        Left = 0
        Top = 0
        Cursor = crHandPoint
        Hint = #1047#1072#1082#1088#1099#1090#1100
        Align = alClient
        AutoSize = True
        DataBinding.DataField = 'DocScan'
        DataBinding.DataSource = dmMain.dsScan
        Properties.GraphicClassName = 'TJPEGImage'
        Properties.PopupMenuLayout.MenuItems = [pmiCopy, pmiSave]
        Properties.ReadOnly = True
        Properties.Stretch = True
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        TabOrder = 0
        OnClick = img1Click
        Height = 37
        Width = 185
      end
    end
    object dxlytgrpLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object frmDocShowItem1: TdxLayoutItem
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'ScrollBox1'
      CaptionOptions.Visible = False
      Parent = dxlytgrpLayoutControl1Group_Root
      Control = ScrollBox1
      ControlOptions.AutoColor = True
      Index = 0
    end
  end
  object tmrClose: TTimer
    Enabled = False
    Interval = 100
    Left = 572
    Top = 44
  end
end
