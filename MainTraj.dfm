object MainOpt: TMainOpt
  Left = 211
  Top = 234
  Width = 870
  Height = 640
  Caption = 'Opt Trajectory NEP'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcMain: TPageControl
    Left = 0
    Top = 0
    Width = 854
    Height = 601
    ActivePage = tsInit
    Align = alClient
    TabOrder = 0
    object tsInit: TTabSheet
      Caption = 'Initial Data'
      object grpTarget: TGroupBox
        Left = 16
        Top = 8
        Width = 377
        Height = 249
        Caption = 'Initial Orbit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object grpFinal: TGroupBox
        Left = 432
        Top = 8
        Width = 377
        Height = 249
        Caption = 'Target Orbit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object grpSC: TGroupBox
        Left = 16
        Top = 280
        Width = 377
        Height = 249
        Caption = 'Spacecraft Characteristics'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object grpIntData: TGroupBox
        Left = 432
        Top = 288
        Width = 377
        Height = 249
        Caption = 'Spacecraft Characteristics'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    object tsResult: TTabSheet
      Caption = 'Results'
      ImageIndex = 1
      object pgcResults: TPageControl
        Left = 0
        Top = 24
        Width = 841
        Height = 545
        ActivePage = tsCharts
        Align = alCustom
        TabOrder = 0
        object tsTable: TTabSheet
          Caption = 'Table'
        end
        object tsCharts: TTabSheet
          Caption = 'Charts'
          ImageIndex = 1
        end
      end
      object btnSave: TBitBtn
        Left = 328
        Top = 8
        Width = 185
        Height = 25
        Caption = 'Save Results as .txt'
        TabOrder = 1
      end
    end
    object tsBP: TTabSheet
      Caption = 'Boundary Problem'
      ImageIndex = 2
      object pnlPontCharts: TPanel
        Left = 8
        Top = 8
        Width = 825
        Height = 265
        TabOrder = 0
        object cht1: TChart
          Left = 8
          Top = 0
          Width = 265
          Height = 250
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          BackWall.Dark3D = False
          Title.Text.Strings = (
            'TChart')
          Title.Visible = False
          Legend.Visible = False
          RightAxis.Visible = False
          TopAxis.Visible = False
          View3D = False
          BevelInner = bvRaised
          TabOrder = 0
          object Series1: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clRed
            LinePen.Color = clRed
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
        object cht2: TChart
          Left = 280
          Top = 0
          Width = 265
          Height = 250
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          BackWall.Dark3D = False
          Title.Text.Strings = (
            'TChart')
          Title.Visible = False
          Legend.Visible = False
          RightAxis.Visible = False
          TopAxis.Visible = False
          View3D = False
          BevelInner = bvRaised
          TabOrder = 1
          object Series2: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clRed
            LinePen.Color = clRed
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
        object cht3: TChart
          Left = 552
          Top = 0
          Width = 265
          Height = 250
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          BackWall.Dark3D = False
          Title.Text.Strings = (
            'TChart')
          Title.Visible = False
          Legend.Visible = False
          RightAxis.Visible = False
          TopAxis.Visible = False
          View3D = False
          BevelInner = bvRaised
          TabOrder = 2
          object Series3: TFastLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clRed
            LinePen.Color = clRed
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
      end
    end
  end
end
