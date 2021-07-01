object MainOpt: TMainOpt
  Left = 363
  Top = 223
  Width = 888
  Height = 631
  Caption = 'Opt Trajectory NEP'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pgcMain: TPageControl
    Left = 0
    Top = 0
    Width = 872
    Height = 592
    ActivePage = tsInit
    Align = alClient
    TabOrder = 0
    object tsInit: TTabSheet
      Caption = 'Initial Data'
      object grpInit: TGroupBox
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
        object lblOmega0: TLabel
          Left = 14
          Top = 24
          Width = 247
          Height = 13
          Caption = 'Argument of periapsis, deg ___________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lble0: TLabel
          Left = 14
          Top = 55
          Width = 241
          Height = 13
          Caption = 'Eccentricity_______________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblsma0: TLabel
          Left = 14
          Top = 86
          Width = 245
          Height = 13
          Caption = 'Semimajor axis, AU _________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblu0: TLabel
          Left = 14
          Top = 117
          Width = 245
          Height = 13
          Caption = 'Spacecraft latitude, deg _____________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtOmega0: TEdit
          Left = 257
          Top = 16
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '0'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edte0: TEdit
          Left = 257
          Top = 47
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '0'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtsma0: TEdit
          Left = 257
          Top = 78
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = '0'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtu0: TEdit
          Left = 257
          Top = 109
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = '0'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
      end
      object grpFinal: TGroupBox
        Left = 453
        Top = 8
        Width = 377
        Height = 193
        Caption = 'Target Orbit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblOmegaF: TLabel
          Left = 14
          Top = 24
          Width = 271
          Height = 13
          Caption = 'Argument of periapsis, deg _______________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbleF: TLabel
          Left = 14
          Top = 55
          Width = 241
          Height = 13
          Caption = 'Eccentricity_______________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblsmaF: TLabel
          Left = 14
          Top = 86
          Width = 269
          Height = 13
          Caption = 'Semimajor axis, AU _____________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtOmegaF: TEdit
          Left = 257
          Top = 16
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '0'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edteF: TEdit
          Left = 257
          Top = 47
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '0'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtsmaF: TEdit
          Left = 257
          Top = 78
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = '0'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
      end
      object grpSC: TGroupBox
        Left = 16
        Top = 272
        Width = 377
        Height = 273
        Caption = 'Spacecraft Characteristics'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object lblm0: TLabel
          Left = 14
          Top = 24
          Width = 246
          Height = 13
          Caption = 'Total mass, kg _____________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblThrust: TLabel
          Left = 14
          Top = 55
          Width = 258
          Height = 13
          Caption = 'Thrust, N ___________________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblSpImp: TLabel
          Left = 14
          Top = 86
          Width = 253
          Height = 13
          Caption = 'Specific Impulse, s ___________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtm0: TEdit
          Left = 257
          Top = 16
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '100000'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtThrust: TEdit
          Left = 257
          Top = 47
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '0'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtSpImp: TEdit
          Left = 257
          Top = 78
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = '0'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
      end
      object grpIntData: TGroupBox
        Left = 453
        Top = 216
        Width = 377
        Height = 329
        Caption = 'Integration Parameters'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object lblPr0: TLabel
          Left = 14
          Top = 90
          Width = 239
          Height = 13
          Caption = 'Costate variable of radi (Pr) _________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblPvr: TLabel
          Left = 14
          Top = 24
          Width = 249
          Height = 13
          Caption = 'Costate variable of Vr (Pvr) ___________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblPvu: TLabel
          Left = 14
          Top = 55
          Width = 325
          Height = 13
          Caption = 'Costate variable of Vu (Pvu) _______________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTF: TLabel
          Left = 14
          Top = 153
          Width = 250
          Height = 13
          Caption = 'Flight time, days ____________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblh: TLabel
          Left = 14
          Top = 195
          Width = 276
          Height = 13
          Caption = 'Integration step, days____________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblh_br: TLabel
          Left = 259
          Top = 210
          Width = 16
          Height = 13
          Caption = '0.5'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTF_br: TLabel
          Left = 259
          Top = 169
          Width = 16
          Height = 13
          Caption = '0.5'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblPm: TLabel
          Left = 14
          Top = 121
          Width = 241
          Height = 13
          Caption = 'Costate variable of fuel mass ratio (Pm) ________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object grpPr: TGroupBox
          Left = 240
          Top = 69
          Width = 101
          Height = 35
          TabOrder = 2
          object rbPrNeg: TRadioButton
            Left = 9
            Top = 12
            Width = 45
            Height = 17
            Caption = '-1'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object rbPrPos: TRadioButton
            Left = 53
            Top = 12
            Width = 46
            Height = 17
            Caption = '+1'
            TabOrder = 1
          end
        end
        object edtPvr: TEdit
          Tag = 1
          Left = 257
          Top = 16
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '0'
          OnChange = edtChange
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtPvu: TEdit
          Tag = 2
          Left = 257
          Top = 47
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '0'
          OnChange = edtChange
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtTF: TEdit
          Tag = 3
          Left = 257
          Top = 145
          Width = 81
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = '475'
          OnChange = edtChange
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edth: TEdit
          Tag = 4
          Left = 257
          Top = 187
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Text = '1'
          OnChange = edtChange
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object btnInteg: TButton
          Left = 48
          Top = 225
          Width = 139
          Height = 33
          Caption = 'Calculate Trajectory'
          TabOrder = 5
          OnClick = btnIntegClick
        end
        object btnIntStop: TButton
          Left = 224
          Top = 225
          Width = 75
          Height = 33
          Caption = 'Halt'
          Enabled = False
          TabOrder = 6
          OnClick = btnIntStopClick
        end
        object pbInteg: TProgressBar
          Left = 16
          Top = 265
          Width = 321
          Height = 17
          Max = 60
          TabOrder = 7
        end
        object edtPm: TEdit
          Tag = 3
          Left = 257
          Top = 113
          Width = 81
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Text = '475'
          OnChange = edtChange
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
      end
      object btnSwapInit: TButton
        Left = 398
        Top = 50
        Width = 49
        Height = 33
        Caption = 'Swap'#13#10'Orbits'
        TabOrder = 4
        WordWrap = True
        OnClick = btnSwapInitClick
      end
    end
    object tsResult: TTabSheet
      Caption = 'Results'
      ImageIndex = 1
      object pgcResults: TPageControl
        Left = 0
        Top = 24
        Width = 857
        Height = 529
        ActivePage = tsTable
        Align = alCustom
        TabOrder = 1
        object tsTable: TTabSheet
          Caption = 'Table'
          object strgrResults: TStringGrid
            Left = 0
            Top = 0
            Width = 849
            Height = 501
            Align = alClient
            ColCount = 9
            DefaultColWidth = 90
            FixedCols = 0
            RowCount = 2
            TabOrder = 0
          end
        end
        object tsCharts: TTabSheet
          Caption = 'Charts'
          ImageIndex = 1
          object grpChart: TGroupBox
            Left = 528
            Top = 32
            Width = 305
            Height = 425
            Caption = 'Parameters'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object rbTr: TRadioButton
              Left = 8
              Top = 24
              Width = 113
              Height = 17
              Caption = 'Trajectory r(u)'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TabStop = True
              OnClick = btnChartClick
            end
            object rbrvt: TRadioButton
              Left = 8
              Top = 48
              Width = 113
              Height = 17
              Caption = 'Radi (t)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = btnChartClick
            end
            object rbVrVt: TRadioButton
              Left = 8
              Top = 72
              Width = 113
              Height = 17
              Caption = 'Vr (t)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnClick = btnChartClick
            end
            object rbVuVt: TRadioButton
              Left = 8
              Top = 96
              Width = 113
              Height = 17
              Caption = 'Vu (t)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnClick = btnChartClick
            end
            object rblambVt: TRadioButton
              Left = 8
              Top = 120
              Width = 201
              Height = 17
              Caption = 'Control lambda (t)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              OnClick = btnChartClick
            end
            object rbPrVt: TRadioButton
              Left = 8
              Top = 144
              Width = 113
              Height = 17
              Caption = 'Pr (t)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnClick = btnChartClick
            end
            object rbPvrVt: TRadioButton
              Left = 8
              Top = 168
              Width = 113
              Height = 17
              Caption = 'Pvr (t)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              OnClick = btnChartClick
            end
            object rbPvuVt: TRadioButton
              Left = 8
              Top = 192
              Width = 113
              Height = 17
              Caption = 'Pvu (t)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              OnClick = btnChartClick
            end
            object btnChart: TButton
              Left = 56
              Top = 272
              Width = 75
              Height = 25
              Caption = 'Rebuild'
              TabOrder = 8
              OnClick = btnChartClick
            end
            object btnChSave: TButton
              Left = 168
              Top = 272
              Width = 75
              Height = 25
              Caption = 'Save'
              TabOrder = 9
              OnClick = btnChSaveClick
            end
            object btnZoomCht: TButton
              Left = 168
              Top = 104
              Width = 75
              Height = 25
              Caption = 'Zoom Out'
              TabOrder = 10
              OnClick = btnZoomChtClick
            end
          end
          object chtMain: TChart
            Left = 8
            Top = 0
            Width = 521
            Height = 497
            BackWall.Brush.Color = clWhite
            BackWall.Brush.Style = bsClear
            Title.Text.Strings = (
              'TChart')
            Title.Visible = False
            BottomAxis.Title.Caption = 'Time, days'
            BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
            BottomAxis.Title.Font.Color = clBlack
            BottomAxis.Title.Font.Height = -11
            BottomAxis.Title.Font.Name = 'Arial'
            BottomAxis.Title.Font.Style = [fsBold]
            LeftAxis.Title.Caption = 'Radi, AU'
            LeftAxis.Title.Font.Charset = RUSSIAN_CHARSET
            LeftAxis.Title.Font.Color = clBlack
            LeftAxis.Title.Font.Height = -11
            LeftAxis.Title.Font.Name = 'Arial'
            LeftAxis.Title.Font.Style = [fsBold]
            Legend.Visible = False
            View3D = False
            TabOrder = 0
            object SeriesMain: TFastLineSeries
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = 4227072
              Title = 'Series'
              LinePen.Color = 4227072
              LinePen.Width = 2
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1.000000000000000000
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1.000000000000000000
              YValues.Order = loNone
            end
            object SeriesInit: TFastLineSeries
              Marks.ArrowLength = 8
              Marks.Visible = False
              SeriesColor = 10485760
              LinePen.Color = 10485760
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1.000000000000000000
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1.000000000000000000
              YValues.Order = loNone
            end
            object SeriesFin: TFastLineSeries
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
      object btnSave: TBitBtn
        Left = 328
        Top = 8
        Width = 185
        Height = 25
        Caption = 'Save Results .txt'
        Default = True
        ModalResult = 1
        TabOrder = 0
        OnClick = btnSaveClick
        NumGlyphs = 2
      end
    end
    object tsBP: TTabSheet
      Caption = 'Boundary Problem'
      ImageIndex = 2
      object lblAlert: TLabel
        Left = 728
        Top = 312
        Width = 121
        Height = 17
        AutoSize = False
        Color = clYellow
        ParentColor = False
      end
      object pnlPont: TPanel
        Left = 312
        Top = 272
        Width = 409
        Height = 121
        TabOrder = 4
        object lblCostate: TLabel
          Left = 8
          Top = 47
          Width = 6
          Height = 65
          Caption = '1'#13#10#13#10'2'#13#10#13#10'3'
        end
        object lblWN: TLabel
          Left = 24
          Top = 8
          Width = 74
          Height = 26
          Caption = 'Waight Number'#13#10'of error'
        end
        object lbldd: TLabel
          Left = 112
          Top = 8
          Width = 80
          Height = 26
          Caption = 'Increment of '#13#10'dP for derivative'
        end
        object lblAcc: TLabel
          Left = 224
          Top = 16
          Width = 44
          Height = 13
          Caption = 'Accuracy'
        end
        object lblDl: TLabel
          Left = 320
          Top = 8
          Width = 49
          Height = 26
          Caption = 'Increment'#13#10'limitattion'
        end
        object edtc1: TEdit
          Left = 24
          Top = 45
          Width = 57
          Height = 21
          TabOrder = 0
          Text = '1'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtc2: TEdit
          Left = 24
          Top = 70
          Width = 57
          Height = 21
          TabOrder = 1
          Text = '1'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtc3: TEdit
          Left = 24
          Top = 94
          Width = 57
          Height = 21
          TabOrder = 2
          Text = '1'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtd1: TEdit
          Left = 112
          Top = 45
          Width = 89
          Height = 21
          TabOrder = 3
          Text = '1'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtd2: TEdit
          Left = 112
          Top = 70
          Width = 89
          Height = 21
          TabOrder = 4
          Text = '1'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtd3: TEdit
          Left = 112
          Top = 92
          Width = 89
          Height = 21
          TabOrder = 5
          Text = '1'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtac1: TEdit
          Left = 224
          Top = 45
          Width = 73
          Height = 21
          TabOrder = 6
          Text = '1'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtac2: TEdit
          Left = 224
          Top = 70
          Width = 73
          Height = 21
          TabOrder = 7
          Text = '1'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtac3: TEdit
          Left = 224
          Top = 92
          Width = 73
          Height = 21
          TabOrder = 8
          Text = '1'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtdl1: TEdit
          Left = 320
          Top = 45
          Width = 73
          Height = 21
          TabOrder = 9
          Text = '1'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtdl2: TEdit
          Left = 320
          Top = 70
          Width = 73
          Height = 21
          TabOrder = 10
          Text = '1'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
        object edtdl3: TEdit
          Left = 320
          Top = 92
          Width = 73
          Height = 21
          TabOrder = 11
          Text = '1'
          OnExit = NumEditExit
          OnKeyPress = NumValuesInput
        end
      end
      object grpPontMemo: TGroupBox
        Left = 8
        Top = 400
        Width = 841
        Height = 153
        Caption = 'Results of Newton method calculation'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblMemo: TLabel
          Left = 8
          Top = 16
          Width = 615
          Height = 16
          Caption = 
            '    Tf                      Pvr                     Pvu         ' +
            '          f(Tf)                f(Pvr)            f(Pvu)         ' +
            '   F_summ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object MemoMain: TMemo
          Left = 0
          Top = 40
          Width = 841
          Height = 113
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
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
      object grpCostate: TGroupBox
        Left = 8
        Top = 280
        Width = 145
        Height = 113
        Caption = 'Costate Variables'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object lbledtPm: TLabeledEdit
          Left = 57
          Top = 36
          Width = 81
          Height = 21
          EditLabel.Width = 44
          EditLabel.Height = 13
          EditLabel.Caption = 'Pm_____'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          LabelPosition = lpLeft
          ParentFont = False
          TabOrder = 0
          OnExit = lbledtExit
          OnKeyPress = lbledtKeyPress
        end
        object lbledtPvrP: TLabeledEdit
          Left = 57
          Top = 60
          Width = 81
          Height = 21
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'PVr_____'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          LabelPosition = lpLeft
          ParentFont = False
          TabOrder = 1
          Text = '1'
          OnExit = lbledtExit
          OnKeyPress = lbledtKeyPress
        end
        object lbledtPvuP: TLabeledEdit
          Left = 57
          Top = 84
          Width = 81
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = 'PVu_____'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          LabelPosition = lpLeft
          ParentFont = False
          TabOrder = 2
          Text = '1'
          OnExit = lbledtExit
          OnKeyPress = lbledtKeyPress
        end
      end
      object grpError: TGroupBox
        Left = 160
        Top = 280
        Width = 145
        Height = 113
        Caption = 'Error'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object lbledtPmE: TLabeledEdit
          Left = 59
          Top = 36
          Width = 81
          Height = 21
          EditLabel.Width = 34
          EditLabel.Height = 13
          EditLabel.Caption = 'f(r)___'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          LabelPosition = lpLeft
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnKeyPress = lbledtKeyPress
        end
        object lbledtPvrE: TLabeledEdit
          Left = 59
          Top = 60
          Width = 81
          Height = 21
          EditLabel.Width = 40
          EditLabel.Height = 13
          EditLabel.Caption = 'f(Vr)___'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          LabelPosition = lpLeft
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnKeyPress = lbledtKeyPress
        end
        object lbledtPvuE: TLabeledEdit
          Left = 59
          Top = 84
          Width = 81
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = 'f(Vu)___'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Tahoma'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          LabelPosition = lpLeft
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          OnKeyPress = lbledtKeyPress
        end
      end
      object btnChClear: TButton
        Left = 728
        Top = 280
        Width = 121
        Height = 25
        Caption = 'Clear charts and memo'
        TabOrder = 5
        OnClick = btnChClearClick
      end
      object btnPontCalc: TButton
        Left = 728
        Top = 336
        Width = 57
        Height = 25
        Caption = 'Calculate'
        TabOrder = 6
        OnClick = btnIntegClick
      end
      object btnPause: TButton
        Left = 792
        Top = 336
        Width = 57
        Height = 25
        Caption = 'Pause'
        Enabled = False
        TabOrder = 7
        OnClick = btnIntStopClick
      end
      object btnPontSave: TButton
        Left = 728
        Top = 368
        Width = 57
        Height = 25
        Caption = 'Save Init'
        TabOrder = 8
        OnClick = btnPontSaveClick
      end
      object btPontLoad: TButton
        Left = 792
        Top = 368
        Width = 57
        Height = 25
        Caption = 'Load Init'
        TabOrder = 9
        OnClick = btPontLoadClick
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 744
  end
  object OpenDialog1: TOpenDialog
    Left = 820
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 656
  end
end
