unit MainTraj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, TeeProcs, TeEngine, Chart,
  Series, DBCtrls, Math, Grids, olmethod, Method, ExtDlgs, Menus, About;

type
  TWorkThread = class(TThread)
  public
    procedure Execute; override;
  private
    procedure ShowStatus;
  end;

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
    grpInit: TGroupBox;
    grpFinal: TGroupBox;
    grpSC: TGroupBox;
    grpIntData: TGroupBox;
    edtOmega0: TEdit;
    lblOmega0: TLabel;
    lble0: TLabel;
    edte0: TEdit;
    lblsma0: TLabel;
    edtsma0: TEdit;
    lblu0: TLabel;
    edtu0: TEdit;
    lblOmegaF: TLabel;
    edtOmegaF: TEdit;
    lbleF: TLabel;
    edteF: TEdit;
    lblsmaF: TLabel;
    edtsmaF: TEdit;
    lblm0: TLabel;
    edtm0: TEdit;
    lblPr0: TLabel;
    grpPm: TGroupBox;
    rbPrNeg: TRadioButton;
    rbPrPos: TRadioButton;
    lblPvr: TLabel;
    edtPvr: TEdit;
    lblPvu: TLabel;
    edtPvu: TEdit;
    edtTF: TEdit;
    lblTF: TLabel;
    lblh: TLabel;
    edth: TEdit;
    lblThrust: TLabel;
    edtThrust: TEdit;
    lblSpImp: TLabel;
    edtSpImp: TEdit;
    strgrResults: TStringGrid;
    btnInteg: TButton;
    btnIntStop: TButton;
    pbInteg: TProgressBar;
    lblh_br: TLabel;
    chtMain: TChart;
    SeriesMain: TFastLineSeries;
    grpChart: TGroupBox;
    rbTr: TRadioButton;
    rbrvt: TRadioButton;
    rbVrVt: TRadioButton;
    rbVuVt: TRadioButton;
    rblambVt: TRadioButton;
    rbPrVt: TRadioButton;
    rbPvrVt: TRadioButton;
    rbPvuVt: TRadioButton;
    btnChart: TButton;
    btnChSave: TButton;
    MemoMain: TMemo;
    grpPontMemo: TGroupBox;
    grpCostate: TGroupBox;
    lblMemo: TLabel;
    lbledtPr: TLabeledEdit;
    lbledtPvrP: TLabeledEdit;
    lbledtPvuP: TLabeledEdit;
    grpError: TGroupBox;
    lbledtFrE: TLabeledEdit;
    lbledtFVrE: TLabeledEdit;
    lbledtFVuE: TLabeledEdit;
    pnlPont: TPanel;
    edtc1: TEdit;
    lblCostate: TLabel;
    edtc2: TEdit;
    edtc3: TEdit;
    lblWN: TLabel;
    lbldd: TLabel;
    edtd1: TEdit;
    edtd2: TEdit;
    edtd3: TEdit;
    lblAcc: TLabel;
    edtac1: TEdit;
    edtac2: TEdit;
    edtac3: TEdit;
    lblDl: TLabel;
    edtdl1: TEdit;
    edtdl2: TEdit;
    edtdl3: TEdit;
    btnChClear: TButton;
    lblAlert: TLabel;
    btnPontCalc: TButton;
    btnPause: TButton;
    btnPontSave: TButton;
    btPontLoad: TButton;
    lblTF_br: TLabel;
    btnZoomCht: TButton;
    SeriesInit: TFastLineSeries;
    SeriesFin: TFastLineSeries;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    SavePictureDialog1: TSavePictureDialog;
    btnSwapInit: TButton;
    lblPm: TLabel;
    edtPr: TEdit;
    mm1: TMainMenu;
    MathModel1: TMenuItem;
    M221: TMenuItem;
    M23ConstantThrust1: TMenuItem;
    M23FixedTime1: TMenuItem;
    About1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NumValuesInput(Sender: TObject; var Key: Char);
    procedure NumEditExit(Sender: TObject);
    procedure btnIntegClick(Sender: TObject);
    procedure btnIntStopClick(Sender: TObject);
    procedure edtChange(Sender: TObject);
    procedure btnChartClick(Sender: TObject);
    procedure btnChClearClick(Sender: TObject);
    procedure lbledtKeyPress(Sender: TObject; var Key: Char);
    procedure lbledtExit(Sender: TObject);
    procedure btnZoomChtClick(Sender: TObject);
    procedure btnPontSaveClick(Sender: TObject);
    procedure btPontLoadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnChSaveClick(Sender: TObject);
    procedure btnSwapInitClick(Sender: TObject);
    procedure M221Click(Sender: TObject);
    procedure M23FixedTime1Click(Sender: TObject);
    procedure M23ConstantThrust1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// interface related
procedure FillGrid (var k : Integer; Grid : TStringGrid);
procedure FillEdit;
procedure FillMemo;

// Integration related
Procedure PRfull_M4 (var y1, d1; n: word); far;
Procedure PRfull_M3 (var y1, d1; n: word); far;
Procedure PRfull_M2 (var y1, d1; n: word); far;
procedure Sf_M_Min (var yr1, dr1; nr:  word;
                       var fr1;      mr:  word;
                       var hr1;      mr1: word;
                       var zr1;      nrz: word);

// Pontryagin related
procedure FYN (var xn, fn; n: word);
procedure FUN ( var x1, f1; n: word; var m: word; var ym1, yy1  );
procedure FOUT ( var x1, f1; n: word; var m: word; var ym1, yy1  );


const
  mu = 1.3273E+20;      // �������������� �������� ������, �3/c2
  Rz = 149598261000.0;  // ������ �����,  �
  n = 3; n1 = n+1;      // ��p���� �p����� ������
  nr = 10;               // ����������� ������� ���. ���������
  mr = 1; mr1 = mr+1;   // ����������� ������� ������
  nzr = 2*nr+mr1;


var
  MainOpt: TMainOpt;
  WorkThread: TWorkThread;
  r, u, Vr, Vu, time, mf, lamb, // ������� ��������� �������
  Pr, Pvr, Pvu, Pm,             // ������� �������� ����. ����������
  omega0, ex0, sma0, p0,        // initial orbit
  omegaF, exF, smaF, pF,        // target orbit
  r0, u0, Vr0, Vu0, time0,      // initial system state
  Pr0, Pvr0, Pvu0, Pm0,         // initial costates value
  r_f, u_f, Vr_f, Vu_f,         // target system state
  TF, delta, beta,               // Final time, EP switch (0 or 1) and mass ratio consumption
  c, ac                         // exhaust velocit and nominal acceleration
  : extended;
  t_b_r, t_r_b,
  V_b_r, V_r_b,
  a_b_r, a_r_b : extended;      // dimensionless transformation
  MathMode : Word;  // Flags math model switching
  //���������� ������
  i_step, EP_switch : integer;
  //���������� ��� ������ �������
  Pontryagin : Boolean; // True - solve pontryagin; False - only integration
  x  : array [ 1..n ]         of float;  //
  f  : array [ 1..n ]         of float;
  y  : array [ 1..n, 1..4 ]   of float;
  ym : array [ 1..4*n]        of float;
  yy : array [ 1..4 ]         of float;
  z  : array [ 1..n ]         of float;
  a  : array [ 1..n, 1..n+1 ] of float;
  am : array [ 1..n*(n+1) ]   of float;
  aa : array [ 1..n ]         of float;
  m, ExitResult : word;
  i_new, steps_N: Integer;
  f_summ        : Extended;
  //  ���������� ��������������
  yr,dr : array[1..nr]        of float;
  hr :    array[1..mr1]       of float;
  fr :    array[1..mr]        of float;
  zr :    array[1..nzr]       of float;
  Results : array of array of float;     // ������ �����������
  lr : word;

implementation

{$R *.dfm}

//--------------------------------------------------------------
// Main Body
//--------------------------------------------------------------

procedure TMainOpt.btnIntegClick(Sender: TObject);

begin
// Switch buttons
  btnInteg.Enabled := False;
  btnIntStop.Enabled := True;
  btnPontCalc.Enabled := False;
  btnPause.Enabled := True;
// initial data gathering
  ex0    := StrToFloat(edte0.Text);
  omega0 := StrToFloat(edtOmega0.Text) * PI/180;  // rad
  sma0   := StrToFloat(edtsma0.Text);             // AU
  u0     := StrToFloat(edtu0.Text) * PI/180;      // rad
  p0     := sma0*(1-sqr(ex0));
  r0     := p0 / (1+ex0*cos(u0-omega0));              // r, AU
  Vr0    := 1 / sqrt(p0) * ex0*sin(u0-omega0);        // Vr, dim
  Vu0    := 1 / sqrt(p0) * (1+ex0*cos(u0-omega0)); // + 8000*V_r_b;    // Vu, dim
  Time0  := 0;                                    // Time, dim

  // Math Model
  case MathMode of
    2 : begin
          Pm0 := 0;
          if rbPrNeg.Checked then Pr0 := -1
          else Pr0 := 1;
        end;
    3 : begin
          Pm0 := StrToFloat(edtPr.Text); // Pr edit is used as Pm
          if rbPrNeg.Checked then Pr0 := -1
          else Pr0 := 1;
        end;
    4 : begin
          Pm0 := -1;
          Pr0 := StrToFloat(edtPr.Text);
        end;
  end;
  Pvr0   := StrToFloat(edtPvr.Text);
  Pvu0   := StrToFloat(edtPvu.Text);
// target orbit data gathering
  exF    := StrToFloat(edteF.Text);
  omegaF := StrToFloat(edtOmegaF.Text) * PI/180;  // rad
  smaF   := StrToFloat(edtsmaF.Text);             // AU
  pF     := smaF*(1-sqr(exF));
// initial data for integration gathering
  i_step := 0;
  TF     := StrToFloat(edtTF.Text) * t_r_b;       // dim
  ac     := StrToFloat(edtThrust.Text) / StrToFloat(edtm0.Text) * a_r_b; // dim
  c      := StrToFloat(edtSpImp.Text)*9.8 * V_r_b;  // dim
  beta   := ac/c;
  hr[1]  := StrToFloat(edth.Text) * t_r_b;
  hr[2]  := 1E-8;
// calculation for pure integration
  if Sender = btnInteg then
    begin
      Pontryagin := False;
      yr[1] := r0;              // r, AU
      yr[2] := u0;              // rad
      yr[3] := Vr0;             // Vr, dim
      yr[4] := Vu0;             // Vu, dim
      yr[5] := Time0;           // Time, dim
      yr[6] := Pr0;
      yr[7] := Pvr0;
      yr[8] := Pvu0;
      yr[9] := 0;               // fuel mass ratio, dim
      yr[10]:= Pm0;             // Pm
    // set progress bar
      pbInteg.Position := 0;
      if MathMode = 3 then
        pbInteg.Max := Trunc(Pm0*1000)   // Pm exit
      else
        pbInteg.Max := Trunc(TF / hr[1]); // for time Exit
    end
  else
// calculation to solve boundary problem
    begin
      Pontryagin := True;
    // Prepeare interface
      btnChClearClick(Sender as TButton);
    end;
// start new Thread that will perform calculations
  WorkThread := TworkThread.Create(False);
  WorkThread.Priority := tpHighest;
end;

// Start calculation inside new thread
procedure TWorkThread.Execute;

var
  ii, jj:integer;

label 1;

begin
//---------------calculation process for pure integration-----------------------
  if not Pontryagin then
    begin
      case MathMode of
        2 : begin
              rkdb (yr, dr, nr, fr, mr, hr, mr1, PRfull_M2, Sf_M_Min, zr, nzr, lr);
            end;
        3 : begin
              rkdb (yr, dr, nr, fr, mr, hr, mr1, PRfull_M3, Sf_M_Min, zr, nzr, lr);
              MainOpt.edtTF.Text := FloatToStrF(Results[i_step-1,1]*t_b_r, fffixed, 6,2);
            end;
        4 : begin
              rkdb (yr, dr, nr, fr, mr, hr, mr1, PRfull_M4, Sf_M_Min, zr, nzr, lr);
            end;
      end;

      FillGrid(i_step, MainOpt.strgrResults);
      MainOpt.btnChartClick(WorkThread);
      if not Terminated then Synchronize(ShowStatus);
    end
  else

//--------------------calculation process for boundary problem------------------
    begin
      x[1]  := StrToFloat(MainOpt.lbledtPr.Text);     //��������� �������� �����������
      x[2]  := StrToFloat(MainOpt.lbledtPvrP.Text);
      x[3]  := StrToFloat(MainOpt.lbledtPvuP.Text);
      y[1,1]:= StrToFloat(MainOpt.edtc1.Text);     //������� ����������� �� ������ �������
      y[1,2]:= StrToFloat(MainOpt.edtd1.Text);     //���������� ��� ���������� ����������� �� ������ ����������
      y[1,3]:= StrToFloat(MainOpt.edtac1.Text);    //�������� �� ������ ����������
      y[1,4]:= StrToFloat(MainOpt.edtdl1.Text);    //����������� �� ���������� ������ ����������
      y[2,1]:= StrToFloat(MainOpt.edtc2.Text);     //������� ����������� �� ������ �������
      y[2,2]:= StrToFloat(MainOpt.edtd2.Text);     //���������� ��� ���������� ����������� �� ������ ����������
      y[2,3]:= StrToFloat(MainOpt.edtac2.Text);    //�������� �� ������ ����������
      y[2,4]:= StrToFloat(MainOpt.edtdl2.Text);    //����������� �� ���������� ������ ����������
      y[3,1]:= StrToFloat(MainOpt.edtc3.Text);     //������� ����������� �� ������� �������
      y[3,2]:= StrToFloat(MainOpt.edtd3.Text);     //���������� ��� ���������� ����������� �� ������� ����������
      y[3,3]:= StrToFloat(MainOpt.edtac3.Text);    //�������� �� ������� ����������
      y[3,4]:= StrToFloat(MainOpt.edtdl3.Text);    //����������� �� ���������� ������� ����������

      for ii      := 1 to n do for jj:= 1 to 4 do ym[(ii-1)*(4)+jj] := y[ii,jj];
      m           := 2;
      ExitResult  := 3;
      i_new       := 0;
      Steps_N     := 0;
    1:  Newton ( x, n, f, m, ym, yy, FYN, FOUT, am, n1, ExitResult, z, aa );
      FillEdit;
      if Terminated then
        begin
          MainOpt.lblAlert.Caption    := 'Process is stopped';
          MainOpt.lblAlert.Font.Color := clBlack;
          MainOpt.lblAlert.Color      := clYellow;
        end
      else
       begin
        if (ExitResult<>0) and (Steps_N<200) then
        begin
         FUN(x, f, n, m, ym, yy );
         Steps_N    := steps_N + 1;
         ExitResult := 3;
         goto 1
        end;
        if ExitResult>0 then
        begin
          MainOpt.lblAlert.Caption    := 'No solution';
          MainOpt.lblAlert.Font.Color := clBlack;
          MainOpt.lblAlert.Color      := clRed;
        end
        else
        begin
          MainOpt.lblAlert.Caption:='Solved';
          MainOpt.lblAlert.Font.Color:=clBlack;
          MainOpt.lblAlert.Color:=clGreen;
        end;
       end;

      if Not Terminated then
        begin
          FillMemo;
          FillEdit;
          Synchronize(ShowStatus);
        end;

      FillGrid(i_step, MainOpt.strgrResults);
      MainOpt.btnChartClick(WorkThread);
      MainOpt.edtPvr.Text := MainOpt.lbledtPvrP.Text;
      MainOpt.edtPvu.Text := MainOpt.lbledtPvuP.Text;
      MainOpt.edtPr.Text  := MainOpt.lbledtPr.Text;
    end;

  MainOpt.btnInteg.Enabled := True;
  MainOpt.btnIntStop.Enabled := False;
  MainOpt.btnPontCalc.Enabled := True;
  MainOpt.btnPause.Enabled := False;
  MainOpt.edtd1.Text  := FloatToStr(0.001);
  MainOpt.edtd2.Text  := FloatToStr(0.001);
  MainOpt.edtd3.Text  := FloatToStr(0.001);
  WorkThread.Free;
end;

//--------------Integration Related----------------------------------------

// Right parts of the motion equiation system

// Fixed Time
Procedure PRfull_M4 (var y1, d1; n: word); far;
 { �p���� ����� ��� ������������ ��p������ � ������ ����p��
   ������� ���p�����, ��p������� � ���p������� ����������.
   �����p�p������ �� �������. }

Var
     y: array[1..MaxNumVector] of float absolute y1;
     d: array[1..MaxNumVector] of float absolute d1;
     S, T : extended;  // acceleration components into orbit plane
     a    : extended;  // current acceleration
begin
// Initiate system state
   r     := y[1];
   u     := y[2];
   Vr    := y[3];
   Vu    := y[4];
   time  := y[5];
   Pr    := y[6];
   Pvr   := y[7];
   Pvu   := y[8];
   mf    := y[9];
   Pm    := y[10];
   delta := Pm/c + sqrt(sqr(Pvr)+sqr(Pvu))/(1-y[9]);
   if delta < 0 then
    begin
      EP_switch := 0;
      a         := 0;
      lamb      := 0;
      S         := 0;
      T         := 0;
    end
   else
    begin
      EP_Switch := 1;
      a         := ac/(1-y[9]);
      lamb      := ArcTan2(Pvu, Pvr);
      S         := a*cos(lamb); // along Vr
      T         := a*sin(lamb); // along Vu
    end;
// Right part
   d[1]  := Vr;                                  // dr
   d[2]  := Vu/r;                                // du
   d[3]  := Sqr(Vu)/r - 1/sqr(r) + S;            // dVr
   d[4]  := -Vr*Vu/r + T;                        // dVu
   d[5]  := 1;                                   // t
   d[6]  := Pvr*(sqr(Vu/r) - 2/sqr(r)/r)
              - Pvu*Vr*Vu/sqr(r);                // dPr
   d[7]  := - Pr + Pvu*Vu/r;                     // dPvr
   d[8]  := (Pvu*Vr - 2*Pvr*Vu) / r;             // dPvu
// mass consumption
   d[9]  := beta*EP_Switch;                                // dm
   d[10] := -(Pvr*S + Pvu*T)/(1-y[9]);                    // dPm
end;

// Constant Thrust
Procedure PRfull_M3 (var y1, d1; n: word); far;

Var
     y: array[1..MaxNumVector] of float absolute y1;
     d: array[1..MaxNumVector] of float absolute d1;
     S, T : extended;  // acceleration components into orbit plane
     a    : extended;  // current acceleration
begin
// Initiate system state
   r     := y[1];
   u     := y[2];
   Vr    := y[3];
   Vu    := y[4];
   time  := y[5];
   Pr    := y[6];
   Pvr   := y[7];
   Pvu   := y[8];
   mf    := y[9];
   Pm    := y[10];
   lamb  := ArcTan2(Pvu, Pvr);
   a     := ac/(1-y[9]);
   S     := a*cos(lamb); // along Vr
   T     := a*sin(lamb); // along Vu
// Right part
   d[1]  := Vr;                                  // dr
   d[2]  := Vu/r;                                // du
   d[3]  := Sqr(Vu)/r - 1/sqr(r) + S;            // dVr
   d[4]  := -Vr*Vu/r + T;                        // dVu
   d[5]  := 1;                                   // t
   d[6]  := Pvr*(sqr(Vu/r) - 2/sqr(r)/r)
              - Pvu*Vr*Vu/sqr(r);                // dPr
   d[7]  := - Pr + Pvu*Vu/r;                     // dPvr
   d[8]  := (Pvu*Vr - 2*Pvr*Vu) / r;             // dPvu
// mass consumption
   d[9]  := ac/c;                                // dm
   d[10] := -(Pvr*S + Pvu*T);                    // dPm
end;

// Constant Thrust and Mass
Procedure PRfull_M2 (var y1, d1; n: word); far;

Var
     y: array[1..MaxNumVector] of float absolute y1;
     d: array[1..MaxNumVector] of float absolute d1;
     S, T : extended;  // acceleration components into orbit plane
begin
// Initiate system state
   r     := y[1];
   u     := y[2];
   Vr    := y[3];
   Vu    := y[4];
   time  := y[5];
   Pr    := y[6];
   Pvr   := y[7];
   Pvu   := y[8];
   lamb  := ArcTan2(Pvu, Pvr);
   S     := ac*cos(lamb); // along Vr
   T     := ac*sin(lamb); // along Vu
// Right part
   d[1]  := Vr;                                  // dr
   d[2]  := Vu/r;                                // du
   d[3]  := Sqr(Vu)/r - 1/sqr(r) + S;            // dVr
   d[4]  := -Vr*Vu/r + T;                        // dVu
   d[5]  := 1;                                   // t
   d[6]  := Pvr*(sqr(Vu/r) - 2/sqr(r)/r)
              - Pvu*Vr*Vu/sqr(r);                // dPr
   d[7]  := - Pr + Pvu*Vu/r;                     // dPvr
   d[8]  := (Pvu*Vr - 2*Pvr*Vu) / r;             // dPvu
end;

// Output of the results
procedure Sf_M_Min (var yr1, dr1; nr:  word;
                       var fr1;      mr:  word;
                       var hr1;      mr1: word;
                       var zr1;      nrz: word);
type
    vec = array[1..MaxNumVector] of real;
    mas = array[1..MaxNumVector*3] of real;
var
    yr: vec absolute yr1;
    dr: vec absolute dr1;
    fr: vec absolute fr1;
    hr: vec absolute hr1;
    zr: mas absolute zr1;
    i : Integer;

begin
   i_step:= i_step + 1;
// Save results of the step
   SetLength(Results, i_step, 12);
   Results[i_step-1, 0]  := i_step-1; // # of step
   Results[i_step-1, 1]  := yr[5];  // Time
   for i := 2 to 5 do Results[i_step-1, i] := yr[i-1]; // r, u, Vr, Vu
   for i := 6 to 8 do Results[i_step-1, i] := yr[i];   // Pr, Pvr, Pvu
   Results[i_step-1, 9] := lamb; // lambda
   for i := 10 to 11 do Results[i_step-1, i] := yr[i-1];  // mf, Pm

// Check exit function
   if MathMode = 3 then
    fr[1] := yr[10]  // exit by Pm = 0
   else
    fr[1] := yr[5] - TF; // exit by time

   if not Pontryagin then
    begin
      MainOpt.pbInteg.Position := i_step;
      //  MainOpt.pbInteg.Position := Trunc((Pm0 - yr[10])*1000); - for Pm bar
    // Check halt button click
      if WorkThread.Terminated then fr[1] := 0;
    end;

end;

//--------------Pontryagin Related----------------------------------------

// Math model to be calculated
procedure FYN (var xn, fn; n: word);

var x: array[1..MaxNumX] of float absolute xn;
    f: array[1..MaxNumX] of float absolute fn;

begin
  i_step:= 0;

      case MathMode of
        2 : begin
              Tf    := x[1];
              yr[1] := r0;              // r, AU
              yr[2] := u0;              // rad
              yr[3] := Vr0;             // Vr, dim
              yr[4] := Vu0;             // Vu, dim
              yr[5] := Time0;           // Time, dim
              yr[6] := Pr0;
              yr[7] := x[2];
              yr[8] := x[3];
              yr[9] := 0;
              yr[10]:= 0;
              rkdb (yr, dr, nr, fr, mr, hr, mr1, PRfull_M2, Sf_M_Min, zr, nzr, lr);
            end;
        3 : begin
              yr[1] := r0;              // r, AU
              yr[2] := u0;              // rad
              yr[3] := Vr0;             // Vr, dim
              yr[4] := Vu0;             // Vu, dim
              yr[5] := Time0;           // Time, dim
              yr[6] := Pr0;
              yr[7] := x[2];            // PVr0
              yr[8] := x[3];            // Pvu0
              yr[9] := 0;             // fuel mass ratio, dim
              yr[10] := x[1];           // Pm0
              rkdb (yr, dr, nr, fr, mr, hr, mr1, PRfull_M3, Sf_M_Min, zr, nzr, lr);
            end;
        4 : begin
              yr[1] := r0;              // r, AU
              yr[2] := u0;              // rad
              yr[3] := Vr0;             // Vr, dim
              yr[4] := Vu0;             // Vu, dim
              yr[5] := Time0;           // Time, dim
              yr[6] := x[1];            // Pr0
              yr[7] := x[2];            // PVr0
              yr[8] := x[3];            // Pvu0
              yr[9] := 0;               // fuel mass ratio, dim
              yr[10]:= Pm0;             // Pm0
              rkdb (yr, dr, nr, fr, mr, hr, mr1, PRfull_M4, Sf_M_Min, zr, nzr, lr);
            end;
      end;

  u_f := Results[High(Results), 3];                  // u, rad
  r_f   := pF / (1+exF*cos(u_f - omegaF));              // r, AU
  Vr_f  := 1 / sqrt(pF) * exF*sin(u_f - omegaF);        // Vr, dim
  Vu_f  := 1 / sqrt(pF) * (1+exF*cos(u_f - omegaF));    // Vu, dim

  f[1] := Results[High(Results), 2] - r_f;
  f[2] := Results[High(Results), 4] - Vr_f;
  f[3] := Results[High(Results), 5] - Vu_f;
end;

// Change of the diviation for Newton
procedure FUN ( var x1, f1; n: word; var m: word; var ym1, yy1  );

type Xtype    = array [ 1..MaxNumX ]       of float;
     Ytype    = array [ 1..MaxNumX, 1..4 ] of float;
     YmType   = array [ 1..4*MaxNumX ]     of float;

var x:   Xtype absolute x1;
    f:   Xtype absolute f1;
    ym:  Ymtype absolute ym1;
    y:   Ytype;
    ii, jj:integer;

begin
  for ii := 1 to n do for jj := 1 to 4 do y[ii,jj] := ym[(ii-1)*4+jj];
  if i_new < 7 then
    begin
      for ii := 1 to n do y[ii,2] := y[ii,2]/10;
      i_new := i_new + 1;
    end
  else
    begin
      for ii := 1 to n do y[ii,2] := y[ii,2]*1e+7;
      i_new := 0;
    end;
    MainOpt.MemoMain.Lines.Add('Change of the dP incement value...');
    MainOpt.edtd1.Text := floattostrF(y[1,2],fffixed, 6, 12);
    MainOpt.edtd2.Text := floattostrF(y[2,2],fffixed, 6, 12);
    MainOpt.edtd3.Text := floattostrF(y[3,2],fffixed, 6, 12);
    MainOpt.lblAlert.Color:=clYellow;
    for ii := 1 to n do for jj := 1 to 4 do ym[(ii-1)*4+jj] := y[ii,jj];
end;


// Outout of the results
procedure FOUT ( var x1, f1; n: word; var m: word; var ym1, yy1  );

type Xtype    = array [ 1..MaxNumX ]       of float;
     Ytype    = array [ 1..MaxNumX, 1..4 ] of float;
     YmType   = array [ 1..4*MaxNumX ]     of float;

var x:   Xtype absolute x1;
    f:   Xtype absolute f1;
    ym:  Ymtype absolute ym1;
    y:   Ytype;
    ii, j: integer;

begin
   for ii := 1 to n do for j := 1 to 4 do y[ii,j] := ym [(ii-1)*4+j];
   f_summ := y[1,1]*abs(f[1])+y[2,1]*abs(f[2])+y[3,1]*abs(f[3]);
   FillEdit;
   FillMemo;
   { MainOpt.edtTF.Text := FloatToStrF(Results[High(Results), 1]*t_b_r,
                                    fffixed, 14, 2);  // record flight duration
   }
   for ii := 1 to n do for j := 1 to 4 do ym[(ii-1)*4+j] := y[ii,j];
   // Draw charts
   MainOpt.cht1.Series[0].AddXY(x[1], f_summ);
   MainOpt.cht1.Series[0].Active := true;
   MainOpt.cht2.Series[0].AddXY(x[2], f_summ);
   MainOpt.cht2.Series[0].Active := true;
   MainOpt.cht3.Series[0].AddXY(x[3], f_summ);
   MainOpt.cht3.Series[0].Active := true;
   MainOpt.lblAlert.Color:=clLime;
   MainOpt.Repaint;
   // Halt of the calculation
   if WorkThread.Terminated then m := 0;
end;

//-------------------------------------------------------------
// Procedures for code simplification or correct working
//-------------------------------------------------------------

// Give information about thread status (needed for synchronization with GUI)
procedure TWorkThread.ShowStatus;
begin
  WorkThread.Terminate;
  MainOpt.btnIntStopClick(WorkThread);
end;

// Fill the i-th  row of the Table with Results
procedure FillGrid(var k : Integer; Grid : TStringGrid);

var
  i,j,jj : Integer;

begin
  Grid.RowCount := k+1;

  for j := 0 to k-1 do
    begin
      jj := j;

    // check for redundant rows and prevent writing them
      if (j <> k-1) and (Results[j+1, 1] < Results[j, 1]) then
        begin
            Grid.RowCount := j+2;
            jj := k-1;
        end;

      Grid.Cells[0, j+1]  :=
                          floattostrF(Results[jj, 0]           ,fffixed, 14, 0);   // # of step
      Grid.Cells[1, j+1]  :=
                          floattostrF(Results[jj, 1]*t_b_r     ,fffixed, 14, 4);   // Time, days
      Grid.Cells[2, j+1]  :=
                          floattostrF(Results[jj, 2]           ,fffixed, 14, 12);  // r, AU
      Grid.Cells[3, j+1]  :=
                          floattostrF(Results[jj, 3]*180/PI    ,fffixed, 14, 2);   // u, deg
      for i := 4 to 5 do Grid.Cells[i, j+1] :=
                          floattostrF(Results[jj, i]*V_b_r*1E-3,fffixed, 14, 12);  // Vr, Vu
      for i := 6 to 8 do Grid.Cells[i, j+1] :=
                          floattostrF(Results[jj, i]           ,fffixed, 14, 12);  // Pr, Pvr, Pvu
      Grid.Cells[9, j+1]  :=
                          floattostrF(Results[jj, 9]*180/PI    ,fffixed, 14, 2);    // lambda
      for i := 10 to 11 do Grid.Cells[i, j+1] :=
                          floattostrF(Results[jj, i]           ,fffixed, 14, 12);  // mf, Pm
    // exit loop if check true
      if (j <> k-1) and (Results[j+1, 1] < Results[j, 1]) then break;
    end;
end;

//-------------------------------------------------------------
// Interface Elements
//-------------------------------------------------------------

// Setting up the form
procedure TMainOpt.FormCreate(Sender: TObject);
begin
  pgcMain.ActivePageIndex := 0;
  // Set the ScrollBar
  HorzScrollBar.Range := 870; // set the range to an higher number
  VertScrollBar.Range := 580; // set the range to an higher number
  ShowScrollBar(Handle, SB_BOTH, True);
  // Math Mode init set for Fixed time
  MathMode := 4;
  // input Initial Data
  edtOmega0.Text := FloatToStr(85.901);              // deg
  edte0.Text     := FloatToStr(0.0167086);
  edtsma0.Text   := FloatToStr(1.000001018);        // AU
  edtu0.Text     := FloatToStr(10);                 //deg
  // input target orbit data
  edtOmegaF.Text := FloatToStr(273.867);            // deg
  edteF.Text     := FloatToStr(0.0489);
  edtsmaF.Text   := FloatToStr(5.2044);             // AU
  // input SC Data
  edtm0.Text     := FloatToStr(500);                // kg
  edtSpImp.Text  := FloatToStr(3730);               // s
  edtThrust.Text := FloatToStr(0.0132);                 // N
  // integration Data
  t_b_r  := Rz*sqrt(Rz/mu)/3600/24;                 // from dimensionless to days
  t_r_b  := 1/t_b_r;
  V_b_r  := Sqrt(mu/Rz);                            // from dimensionless to m/s
  V_r_b  := 1/V_b_r;
  a_b_r  := mu / sqr(Rz);                           // from dimensionless to m/s2
  a_r_b  := 1/a_b_r;
  rbPrNeg.Checked:= True;
  edtPvr.Text    := FloatToStr(-0.0751);
  edtPvu.Text    := FloatToStr(1.1308);
  edtPr.Text     := FloatToStr(1);
  edtTF.Text     := FloatToStrf(132*t_b_r, ffFixed, 6, 2);   // days
  edth.Text      := FloatToStr(4);   // days
  lblh_br.Caption := FloatToStrF(StrToFloat(edth.Text)*t_r_b,
                                fffixed, 3,5) + ' dimensionless';
  lblTF_br.Caption := FloatToStrF(StrToFloat(edtTF.Text)*t_r_b,
                                fffixed, 3,5) + ' dimensionless';
  Pontryagin := False;
  // Prepare table for Results
  strgrResults.RowCount         := 2;
  strgrResults.ColCount         := 12;
  strgrResults.DefaultColWidth  := 85;
  strgrResults.ColWidths[0]     := 50;
  strgrResults.Cells[0,0]       := '#';
  strgrResults.Cells[1,0]       := 'T,days';
  strgrResults.Cells[2,0]       := 'r,AU';
  strgrResults.Cells[3,0]       := 'u,deg';
  strgrResults.Cells[4,0]       := 'Vr';
  strgrResults.Cells[5,0]       := 'Vu';
  strgrResults.Cells[6,0]       := 'Pr';
  strgrResults.Cells[7,0]       := 'Pvr';
  strgrResults.Cells[8,0]       := 'PVu';
  strgrResults.Cells[9,0]       := 'Lambda,deg';
  strgrResults.Cells[10,0]      := 'mass_ratio';
  strgrResults.Cells[11,0]      := 'Pm';
  // Data for boundary problem solver
  lbledtPr.Text    := edtPr.Text;
  lbledtPvrP.Text  := edtPvr.Text;
  lbledtPvuP.Text  := edtPvu.Text;
  edtac1.Text := FloatToStr(0.0001);
  edtac2.Text := FloatToStr(0.0001);
  edtac3.Text := FloatToStr(0.0001);
  edtc1.Text  := FloatToStr(1);
  edtc2.Text  := FloatToStr(1);
  edtc3.Text  := FloatToStr(1);
  edtd1.Text  := FloatToStr(0.001);
  edtd2.Text  := FloatToStr(0.001);
  edtd3.Text  := FloatToStr(0.001);
  edtdl1.Text := FloatToStr(1);
  edtdl2.Text := FloatToStr(1);
  edtdl3.Text := FloatToStr(1);
end;

// Hotkeys
procedure TMainOpt.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  buttonSelected : Integer;
begin
  case key of
    27 :
      begin
        buttonSelected := messagedlg('Do you want to close program?', mtConfirmation,
                                    [mbYes, mbNo], 0);
        if buttonSelected = mrYes then MainOpt.Close;
      end;
  end;
end;

// Edit Input Handler
procedure TMainOpt.NumValuesInput(Sender: TObject; var Key: Char);
begin
  //Key - ������, ��������������� ������� �������.
  //DecimalSeparator - �������� �������� ����������� ������� � ����� �����.
  case Key of
    '0'..'9', '+', '-', 'e', 'E' : ;
    #3, #22  : ; // CTRL+C and CTRL+V
    #8       : ; // Back Space
    '.', ',' : if pos(DecimalSeparator, (Sender as TEdit).Text)=0 then
                key := DecimalSeparator
               else
                key := #0;
    #13      :
               begin
                 If HiWord(GetKeyState(VK_SHIFT)) <> 0 then
                   SelectNext(Sender as TWinControl,False,True)
                 else
                   SelectNext(Sender as TWinControl,True,True) ;
                 Key := #0
               end;
    #27      : key := #0;
  else Key := chr(0);  //�� ���������� ��������� �������.
  end;
end;

// Edit Exit Handler
procedure TMainOpt.NumEditExit(Sender: TObject);
begin
  try
    StrToFloat((Sender as TEdit).Text);
    if Sender = edth then lblh_br.Caption := FloatToStrF(StrToFloat(edth.Text)*t_r_b,
                                                        fffixed, 3,5) + ' dimensionless';
    if (Sender = edte0) or (Sender = edteF) then
      if (StrToFloat((Sender as TEdit).Text) >= 1) or (StrToFloat((Sender as TEdit).Text) < 0) then
        begin
          showmessage('The value of eccentricity should be positive and lesser than zero!');
          (Sender as TEdit).SetFocus;
        end;
  except
    (Sender as TEdit).SetFocus;
    Beep;
  end;
end;

// Halt calculation
procedure TMainOpt.btnIntStopClick(Sender: TObject);
begin
  if NOT WorkThread.Terminated then
    begin
      WorkThread.Terminate;
      if not Pontryagin then
        Showmessage('Caluclation was terminated at t = ' +
                  FloatToStrF(time*t_b_r, fffixed, 6, 2) + ' days.')
      else
        showmessage('Calculation was terminated at f_summ = ' +
                    FloatToStrF(f_summ, fffixed, 6, 6))
    end
  else
    begin
      Showmessage('Calculation is finished!');
      pgcMain.ActivePageIndex    := 1;
      pgcResults.ActivePageIndex := 0;
    end;
  Pontryagin := False;
end;

// Convert integration step into dimensionless value
procedure TMainOpt.edtChange(Sender: TObject);
begin
  try
    if not Pontryagin then
      begin
        case TComponent(Sender).Tag of
          1 :
            lbledtPvrP.Text  := edtPvr.Text;
          2 :
            lbledtPvuP.Text  := edtPvu.Text;
          3 :
            lbledtPr.Text    := edtPr.Text;
          4 :
            lblh_br.Caption  := FloatToStrF(StrToFloat(edth.Text)*t_r_b,
                                            fffixed, 3,4) + ' dimensionless';
          5 :
            lblTF_br.Caption := FloatToStrF(StrToFloat(edtTF.Text)*t_r_b,
                                            fffixed, 3,4) + ' dimensionless';
        end;
      end
  except
      (Sender as TEdit).SetFocus;
  end;
end;

// Main Chart Building
procedure TMainOpt.btnChartClick(Sender: TObject);

const
  fi = 0.05;  // step for in and fin orbit drawing, rad

var
  i : integer;
  x, y, radi, ang, yf : Extended;
  Flag_f : Boolean; // Shows if target parameter has to be drawn

begin
// spacecraft trajectory
 chtMain.Series[0].Clear;
 chtMain.Series[0].XValues.Order:=loNone;
 chtMain.Series[0].YValues.Order:=loNone;
// init otbit
 chtMain.Series[1].Clear;
 chtMain.Series[1].XValues.Order:=loNone;
 chtMain.Series[1].YValues.Order:=loNone;
// target oribt
 chtMain.Series[2].Clear;
 chtMain.Series[2].XValues.Order:=loNone;
 chtMain.Series[2].YValues.Order:=loNone;

// draw initial and target orbits
 if rbTr.Checked then
  begin
    for i := 0 to Trunc(2*Pi/fi)+1 do
      begin
        ang  := fi * i;
      // initial
        radi := p0 / (1+ex0*cos(ang-omega0));    // p0 / (1+ex0*cos(u-omega0));
        x := radi*cos(ang);
        y := radi*sin(ang);
        chtMain.Series[1].AddXY(x,y);
      // target
        radi := pF / (1+exF*cos(ang-omegaF));
        x := radi*cos(ang);
        y := radi*sin(ang);
        chtMain.Series[2].AddXY(x,y);
      end;
  end;

 try
 for i:=1 to strgrResults.RowCount-1 do
  begin
    if rbTr.Checked then
    begin
        x := StrToFloat(strgrResults.Cells[2,i])*cos(StrToFloat(strgrResults.Cells[3,i])*Pi/180);
        y := StrToFloat(strgrResults.Cells[2,i])*sin(StrToFloat(strgrResults.Cells[3,i])*Pi/180);
        Flag_f := false;
        chtMain.BottomAxis.Title.Caption := 'X, AU';
        chtMain.LeftAxis.Title.Caption := 'Y, AU';
    end;
    if rbrvt.Checked then
    begin   {r(t)}
        x := StrToFloat(strgrResults.Cells[1,i]);
        y := StrToFloat(strgrResults.Cells[2,i]);
        yf:= r_f;
        Flag_f := True;
        chtMain.BottomAxis.Title.Caption := 'Time, days';
        chtMain.LeftAxis.Title.Caption := 'Heliocentric Distance, AU';
    end;
    if rbVrVt.Checked then
    begin   {Vr(t)}
        x := StrToFloat(strgrResults.Cells[1,i]);
        y := StrToFloat(strgrResults.Cells[4,i]);
        yf:= Vr_f*V_b_r*1e-3;
        Flag_f := True;
        chtMain.BottomAxis.Title.Caption := 'Time, days';
        chtMain.LeftAxis.Title.Caption := 'Radial Velocity (Vr), km/s';
    end;
    if rbVuVt.Checked then
    begin   {Vu(t)}
        x := StrToFloat(strgrResults.Cells[1,i]);
        y := StrToFloat(strgrResults.Cells[5,i]);
        yf:= Vu_f*V_b_r*1e-3;
        Flag_f := True;
        chtMain.BottomAxis.Title.Caption := 'Time, days';
        chtMain.LeftAxis.Title.Caption := 'Transverse Velocity (Vu), km/s';
    end;
    if rblambVt.Checked then
    begin   {lambda1(t)}
        x := StrToFloat(strgrResults.Cells[1,i]);
        y := StrToFloat(strgrResults.Cells[9,i]);
        Flag_f := false;
        chtMain.BottomAxis.Title.Caption := 'Time, days';
        chtMain.LeftAxis.Title.Caption := 'Control angle, deg.';
    end;
    if rbPrVt.Checked then
    begin   {Pr (t)}
        x := StrToFloat(strgrResults.Cells[1,i]);
        y := StrToFloat(strgrResults.Cells[6,i]);
        Flag_f := false;
        chtMain.BottomAxis.Title.Caption := 'Time, days';
        chtMain.LeftAxis.Title.Caption := 'Distance costate var. (Pr)';
    end;
    if rbPvrVt.Checked then
    begin   {PVr(t)}
        x := StrToFloat(strgrResults.Cells[1,i]);
        y := StrToFloat(strgrResults.Cells[7,i]);
        Flag_f := false;
        chtMain.BottomAxis.Title.Caption := 'Time, days';
        chtMain.LeftAxis.Title.Caption := 'PVr costate var.';
    end;
    if rbPvuVt.Checked then
    begin   {PVu(t)}
        x := StrToFloat(strgrResults.Cells[1,i]);
        y := StrToFloat(strgrResults.Cells[8,i]);
        Flag_f := false;
        chtMain.BottomAxis.Title.Caption := 'Time, days';
        chtMain.LeftAxis.Title.Caption := 'PVu costate var.';
    end;
    chtMain.Series[0].AddXY(x,y);
    ChtMain.Series[0].Active := True;
    if Flag_f then chtMain.Series[1].AddXY(x,yf);
  end;
 except
   if Sender.ClassType = TButton then
    showmessage('The table with results is empty');
 end;
end;

procedure FillEdit;
begin
      MainOpt.lbledtPr.Text   := FloatToStr(x[1]);
      MainOpt.lbledtPvrP.Text := FloatToStr(x[2]);
      MainOpt.lbledtPvuP.Text := FloatToStr(x[3]);
      MainOpt.lbledtFrE.Text  := FloatToStrF(f[1],fffixed, 14, 12);
      MainOpt.lbledtFVrE.Text := FloatToStrF(f[2],fffixed, 14, 12);
      MainOpt.lbledtFVuE.Text := FloatToStrF(f[3],fffixed, 14, 12);
end;

procedure FillMemo;
begin
      f_summ := y[1,1]*abs(f[1])+y[2,1]*abs(f[2])+y[3,1]*abs(f[3]);                                              {*}
      MainOpt.MemoMain.Lines.Add(
                      'x ='+floattostrF(x[1],fffixed, 10, 11)+'   '
                           +floattostrF(x[2],fffixed, 10, 11)+'   '
                           +floattostrF(x[3],fffixed, 10, 11)+'   '
                     +'f ='+floattostrF(f[1],fffixed, 10, 11)+'   '
                           +floattostrF(f[2],fffixed, 10, 11)+'   '
                           +floattostrF(f[3],fffixed, 10, 11)+'   '
                           +floattostrF(f_summ,fffixed, 10, 11));
end;

procedure TMainOpt.btnChClearClick(Sender: TObject);
begin
      MainOpt.MemoMain.Clear; //������� ����
      MainOpt.cht1.Series[0].Clear;  //������� �������
      MainOpt.cht1.Series[0].XValues.Order:=loNone;
      MainOpt.cht1.Series[0].YValues.Order:=loNone;
      MainOpt.cht2.Series[0].Clear;  //������� �������
      MainOpt.cht2.Series[0].XValues.Order:=loNone;
      MainOpt.cht2.Series[0].YValues.Order:=loNone;
      MainOpt.cht3.Series[0].Clear;  //������� �������
      MainOpt.cht3.Series[0].XValues.Order:=loNone;
      MainOpt.cht3.Series[0].YValues.Order:=loNone;
end;

// LabelEdit inputhandler
procedure TMainOpt.lbledtKeyPress(Sender: TObject; var Key: Char);
begin
begin
  //Key - ������, ��������������� ������� �������.
  //DecimalSeparator - �������� �������� ����������� ������� � ����� �����.
  case Key of
    '0'..'9', '+', '-', 'e', 'E' : ;
    #3, #22  : ; // CTRL+C and CTRL+V
    #8       : ; // Back Space
    '.', ',' : if pos(DecimalSeparator, (Sender as TLabeledEdit).Text)=0 then
                key := DecimalSeparator
               else
                key := #0;
    #13      :
               begin
                 If HiWord(GetKeyState(VK_SHIFT)) <> 0 then
                   SelectNext(Sender as TWinControl,False,True)
                 else
                   SelectNext(Sender as TWinControl,True,True) ;
                 Key := #0
               end;
    #27      : key := #0;
  else Key := chr(0);  //�� ���������� ��������� �������.
  end;
end;
end;

// Labeled Edit exit handler
procedure TMainOpt.lbledtExit(Sender: TObject);
begin
  try
    StrToFloat((Sender as TlabeledEdit).Text);
  except
    (Sender as TLabeledEdit).SetFocus;
    Beep;
  end;
end;

procedure TMainOpt.btnZoomChtClick(Sender: TObject);
begin
  ChtMain.ZoomPercent( 75 );
end;

// Save initial costate variables values
procedure TMainOpt.btnPontSaveClick(Sender: TObject);
  var f: TextFile;
begin
 try
  if SaveDialog1.Execute then
    begin
       AssignFile(f, SaveDialog1.Filename + '.txt');
       Rewrite(f);
       // String to identify correct file
       writeln(f, 'Initial Data:');
       // Write costate variables
       writeln(f, lbledtPr.Text);
       writeln(f, lbledtPvrP.Text);
       writeln(f, lbledtPvuP.Text);
       // Write initial orbit and SC position
       Writeln(f, edtOmega0.Text);
       Writeln(f, edte0.Text);
       Writeln(f, edtsma0.Text);
       Writeln(f, edtu0.Text);
       // Write target orbit
       Writeln(f, edtOmegaF.Text);
       Writeln(f, edteF.Text);
       Writeln(f, edtsmaF.Text);
       // Write SC parameters
       Writeln(f, edtm0.Text);
       Writeln(f, edtThrust.Text);
       Writeln(f, edtSpImp.Text);
       CloseFile(f);
       MessageBox(Handle,'Initial data have been saved.','Message...',MB_ICONINFORMATION);
    end
  else MessageBox(Handle,'Attention! Data is not saved.','Message...',MB_ICONSTOP);
 except
  showmessage('Program could not create file. Check your antivirus.');
 end;
end;

// Load initial costate variables values
procedure TMainOpt.btPontLoadClick(Sender: TObject);
  var
    f : TextFile;
    text : String;
begin
  if OpenDialog1.Execute then
    begin
      AssignFile(f, OpenDialog1.FileName);
      Reset(f);
      ReadLn(f, text);
      if text <> 'Initial Data:' then
        ShowMessage('Attention! Incorrect file has been choosen.')
      else
        begin
          // Read costate variables
          ReadLn(f, text);
          lbledtPr.Text := text;
          ReadLn(f, text);
          lbledtPvrP.Text := text;
          ReadLn(f, text);
          lbledtPvuP.Text := text;
          // Read initial orbit and SC position
          ReadLn(f, text);
          edtOmega0.Text := text;
          ReadLn(f, text);
          edte0.Text := text;
          ReadLn(f, text);
          edtsma0.Text := text;
          ReadLn(f, text);
          edtu0.Text := text;
          // Read target orbit
          ReadLn(f, text);
          edtOmegaF.Text := text;
          ReadLn(f, text);
          edteF.Text := text;
          ReadLn(f, text);
          edtsmaF.Text := text;
          // Read SC parameters
          ReadLn(f, text);
          edtm0.Text := text;
          ReadLn(f, text);
          edtThrust.Text := text;
          ReadLn(f, text);
          edtSpImp.Text := text;
          ShowMessage('Data loaded from the file.')
        end;
      CloseFile(f);
    end
  else
    begin
      MessageBox(Handle,'Attention! File was not opened','Message...',MB_ICONSTOP);
    end;
 edtPvu.Text := lbledtPvuP.Text;
 edtPvr.Text := lbledtPvrP.Text;
 edtPr.Text  := lbledtPr.Text;
end;

// Save results of integration (table of data)
procedure TMainOpt.btnSaveClick(Sender: TObject);
var f: TextFile;
    s1:string;
    RowCount,ColCount:integer;
begin
 try
  if SaveDialog1.Execute then
   begin
    AssignFile(f,SaveDialog1.FileName+ '.txt');
    Rewrite(f);
    Append(f);
     for RowCount:=0 to StrgrResults.RowCount do
      begin
       for ColCount:=0 to StrgrResults.ColCount do
        begin
         s1:= s1 + '   '+ StrgrResults.Cells[ColCount,RowCount];
        end;
       writeln(f,s1);
       s1:=' ';
      end;
    CloseFile(f);
    MessageBox(Handle,'Data have been saved!','Message...',MB_ICONINFORMATION);
   end
  else MessageBox(Handle,'Attention! Data is not saved.','Message...',MB_ICONSTOP);
 except
  showmessage('Program could not create file. Check your antivirus.');
 end;
end;

// save chart
procedure TMainOpt.btnChSaveClick(Sender: TObject);
begin
 try
  if SavePictureDialog1.Execute then
   begin
    ChtMain.SaveToBitmapFile(SavePictureDialog1.FileName + '.bmp');
    MessageBox(Handle,'The chart has been saved!','Message...',MB_ICONINFORMATION);
   end
  else MessageBox(Handle,'Attention! Chart is not saved.','Message...',MB_ICONSTOP);
 except
  showmessage('Program could not create file. Check your antivirus.');
 end;
end;

// Swap initial and target orbits
procedure TMainOpt.btnSwapInitClick(Sender: TObject);

var
  argument, eccent, smaxe : string;

begin
  argument := edtOmega0.Text;
  eccent := edte0.Text;
  smaxe := edtsma0.Text;
  edtOmega0.Text := edtOmegaF.Text;
  edte0.Text := edteF.Text;
  edtsma0.Text := edtsmaF.Text;
  edtOmegaF.Text := argument;
  edteF.Text := eccent;
  edtsmaF.Text := smaxe;
end;

procedure TMainOpt.M221Click(Sender: TObject);
begin
  MathMode := 2;
  edtSpImp.Enabled := False;
  lblPr0.Hide;
  edtPr.Hide;
  lblPm.Caption := 'Costate variable of radi (Pr) ______________________';
  rbPrNeg.Enabled := True;
  rbPrPos.Enabled := True;
  edtTF.Enabled := True;
  lbledtPr.EditLabel.Caption := 'Time____';
end;

procedure TMainOpt.M23ConstantThrust1Click(Sender: TObject);
begin
  MathMode := 3;
  edtSpImp.Enabled := True;
  lblPr0.Show;
  edtPr.Show;
  lblPm.Caption := 'Costate variable of radi (Pr) ______________________';
  rbPrNeg.Enabled := True;
  rbPrPos.Enabled := True;
  lblPr0.Caption := 'Costate variable of fuel mass ratio (Pm) ______';
  edtTF.Enabled := False;
  lbledtPr.EditLabel.Caption := 'Pm_____';
end;

procedure TMainOpt.M23FixedTime1Click(Sender: TObject);
begin
  MathMode := 4;
  edtSpImp.Enabled := True;
  lblPr0.Show;
  edtPr.Show;
  lblPm.Caption := 'Costate variable of fuel mass ratio (Pm) _______';
  rbPrPos.Checked := True;
  rbPrNeg.Enabled := False;
  rbPrPos.Enabled := False;
  lblPr0.Caption := 'Costate variable of radi (Pr) ______________________';
  edtTF.Enabled := True;
  lbledtPr.EditLabel.Caption := 'Pr_____';
end;

procedure TMainOpt.About1Click(Sender: TObject);
begin
  About.Form1.Show;
end;

end.
