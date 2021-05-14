unit MainTraj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, TeeProcs, TeEngine, Chart,
  Series;

type
  TMainOpt = class(TForm)
    pgcMain: TPageControl;
    tsInit: TTabSheet;
    tsResult: TTabSheet;
    tsBP: TTabSheet;
    pgcResults: TPageControl;
    tsTable: TTabSheet;
    tsCharts: TTabSheet;
    btnSave: TBitBtn;
    pnlPontCharts: TPanel;
    cht1: TChart;
    Series1: TFastLineSeries;
    cht2: TChart;
    Series2: TFastLineSeries;
    cht3: TChart;
    Series3: TFastLineSeries;
    grpTarget: TGroupBox;
    grpFinal: TGroupBox;
    grpSC: TGroupBox;
    grpIntData: TGroupBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainOpt: TMainOpt;

implementation

{$R *.dfm}

procedure TMainOpt.FormCreate(Sender: TObject);
begin
  // Set the ScrollBar
  HorzScrollBar.Range := 840; // set the range to an higher number
  VertScrollBar.Range := 600; // set the range to an higher number
  ShowScrollBar(Handle, SB_BOTH, True);
  // input Initial Data

end;

end.
