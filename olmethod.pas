unit olmethod;  {ver 3.11.92}
interface
const
  MaxNumX = 10;
  MaxNumT = 100;
type
  float = real;
  FUNprocedure  = procedure ( var xf, ff        );
  FYNprocedure  = procedure ( var x, f; n: word );
  FOUTprocedure = procedure ( var x, f; n: word;
                              var m: word;
                              var ym, yy        ); 

Procedure GoldSection ( var a, b, epsilon, xg, fg;
                        FUN: FUNprocedure );
{ Пpоцедуpа одномеpного поиска минимума функции методом золотого сечения.
  Ищется минимум функции FUN(x) для a<x<b с точностью до epsilon.}

Procedure Min_F ( var Mas_F;              { массив переменных }
                  nm: word;               { размерность       }
                  var Min_i: word         { порядковый номер минимального
                                            элемента }  );
{ Процедура определяет номер минимального элемента из заданного массива }

Procedure Newton ( var x;                 { массив неизвестных }
                   n : word;              { размерность решаемой системы }
                   var f;                 { массив невязок }
                   m : word;              { управляющая константа 
                     1 - Newton bez droblenii shaga, 2 - s drobleniem}
                   var ym;                { рабочий массив, первые n
                     элементов - весовые коэффициенты невязок, вторые n -
                     приращения для численного определения производных,
                     третий столбец - точности решения, четвертый -
                     ограничения на приращения вектора x }
                   var yy;                { рабочий массив:
                     yy[1] - номер итерации,
                     yy[2] - текущее значение суммарной невязки,
                     yy[3] - значение суммарной невязки на пред. шаге,
                     yy[4] - число дроблений приращений }
                   FYN  : FYNprocedure;   { процедура вычисляющая невязки
                     f по заданным значениям x, составляется пользователем }
                   FOUT : FOUTprocedure;  { процедура организующая печать
                     и принудительный выход из программы }
                   var am;                { вспомогательный массив }
                   n1 : word;             { n1 = n+1 }
                   var ExitResult : word { EX=0, если решение удалось;
                     EX=1, если решение не найдено; EX=2, eсли произошла
                     ошибка при решении системы линейных уравнений;
                     EX=3, во время решения };
                   var z; var aa  );
{ Процедура для решения системы нелинейных уравнений вида FYN(x)=0 моди-
  фицированным методом Ньютона. Использует процедуру для решения систем
  линейных уравнений SYSTEM. }

Procedure Sys ( var am;           { матрица коэффициентов системы }
                l : word;         { }
                m : word;         { }
                ExitSystem : word { ES=1 - система уравнений вырождена,
                  ES=0 - решение найдено }   );
{ Процедура Sys решает m-l линейных уравнений с одинаковыми коэффици-
  ентами и отличающимися правыми частями, которые располагаются в m-l
  столбцах матрицы А. Решение содержится в последнем столбце матрицы А. }

Procedure Approx ( var xm1;  {массив переменных аппроксимации размерностью
                             N на Nt, }
                   var y1;   {массив значений функции в узлах аппроксимации
                             размерностью Nt }
                   var yf1;  {массив вычисленных по полученной формуле
                             значений функции размерностью Nt }
                   var Eps1; {массив погрешностей yf-y в узлах аппроксимации }
                   var P1;   {массив коэффициентов многочлена }
                       n,    {порядок многочлена }
                       nt,   {колличество узлов аппроксимации }
                       n1    {n+1 } : word;
                   var Am1,  {вспомогательный массив размерности N*(n+1)}
                       Sx1,  {вспомогательный массив размерности N*N}
                       Sy1   {вспомогательный массив размерности N} );
{ Пpоцедуpа аппроксимации табличного массива Y(x1, x2, ... xN) многочленом
  вида Yf = P1*x1 + P2*x2 + P3*x3 +...+ PN*xN. Eps - массив погрешностей в
  узлах аппрохсимации.}

implementation
{---------------------------------------------------------------------- }
Procedure GoldSection( var a, b, epsilon, xg, fg;
                           FUN: FUNprocedure );
  const t1=0.3819660113; t2=0.6180339887;
  var   x0, x1, x2, x3,
        f1, f2,
        step: float;
        a1: float absolute a;
        b1: float absolute b;
        epsilon1: float absolute epsilon;
        xg1: float absolute xg;
        fg1: float absolute fg;
begin
    step:=b1-a1;
    x0:=a1;
    x1:=a1+t1*(b1-a1);
    x2:=a1+t2*(b1-a1);
    x3:=b1;
    fun(x1,f1);
    fun(x2,f2);
    while (step >= epsilon1) do begin
      if (f2 <= f1) then begin
        step:=x3-x1;
        x0:=x1;
        x1:=x2;
        x2:=x0+t2*step;
        f1:=f2;
        fun(x2,f2)
                  end
                  else begin
        step:=x2-x0;
        x3:=x2;
        x2:=x1;
        x1:=x0+t1*step;
        f2:=f1;
        fun(x1,f1)
      end;
    end;
    xg1:=x1;
    fg1:=f1
end{goldsection};  

Procedure Newton ( var x;  n : word;  var f;  m : word;  var ym; var yy;
                   FYN  : FYNprocedure;
                   FOUT : FOUTprocedure;   
                   var am;  n1 : word;  var ExitResult : word;
                   var z; var aa );
label  1;
type
  Xtype    = array [ 1..MaxNumX ]               of float;
  KoefSyst = array [ 1..MaxNumX, 1..MaxNumX+1 ] of float;
  KoefSysM = array [ 1..MaxNumX*(MaxNumX+1) ]   of float;
  Ytype    = array [ 1..MaxNumX, 1..4 ]         of float;
  YmType   = array [ 1..MaxNumX*4 ]              of float;
var
  xn : Xtype absolute x;
  fn : Xtype absolute f;
  ym1: Ymtype absolute ym;
  am1: KoefSysM absolute am;
  a1 : KoefSyst;
  y1 : Ytype;
  yy1 : array [1..4] of float;
  fi : array [1..2] of float;
  z1 : Xtype absolute z;
  aa1: Xtype absolute aa;
  k,i,j, ii: integer;
  b: float;
  ExitSystem : word;

Procedure Y1Ym1;       { pаспаковка 2-х меpного массива }
var i, j: integer;
 Begin for i:=1 to n do for j:=1 to 4 do y1[i,j]:=ym1[(i-1)*4+j];
End;
Procedure Ym1Y1;        { подготовка 2-меpного массива к пеpедаче }
var i, j: integer;
  Begin for i:=1 to n do for j:=1 to 4 do ym1[(i-1)*4+j]:=y1[i,j];
End;
Procedure A1Am1;        { pаспаковка 2-х меpного массива A }
var i, j: integer;
  Begin for i:=1 to n do for j:=1 to n+1 do a1[i,j]:=am1[(i-1)*(n+1)+j];
End;
Procedure Am1A1;        { подготовка 2-меpного массива к пеpедаче A }
var i, j: integer;
  Begin for i:=1 to n do for j:=1 to n+1 do am1[(i-1)*(n+1)+j]:=a1[i,j];
End;

Procedure Measure; { Измеpение суммаpной невязки }
var
  i: integer;
Begin
  FYN( xn, fn, n);
  ii:=0;
  for i:=1 to n do if abs(fn[i])>y1[i,3] then ii:=ii+1;
  if ii=0 then ExitResult:=0;        { успешный выход  }
  fi[k]:=0;
  for i:=1 to n do fi[k] := fi[k]+y1[i,1]*abs(fn[i]); { суммаp. невязка }
End;


Procedure Deviation;
var i, ii, j: integer;
Begin
  for i:=1 to n do a1[i,n1]:=-fn[i];
    for j:=1 to n do begin
      xn[j] := z1[j]+y1[j,2];
      FYN ( xn, fn, n );
      for i:= 1 to n do a1[i,j] := (fn[i]+a1[i,n1])/y1[j,2];
      ii:=0;
      for i:=1 to n do if abs(fn[i])>y1[i,3] then ii:=ii+1;
      if ii=0 then begin ExitResult:=0; exit; end;  { успешный выход  }
      xn[j] := z1[j];
    end;
End;

Procedure Change; { Смена номеpа итеpации }
var i: integer;
Begin
  for i := 1 to n do z1[i] := xn[i];
  yy1[1] := yy1[1]+1;                { номеp итеpации           }
  yy1[2] := fi[1];                   { сумм. нев. на пpед. шаге }
  yy1[3] := fi[2];                   { сумм. нев. на этом шаге  }
  b      := 1;
  k      := 1;
  fi[1]  :=fi[2];                    { этот шаг стал пpедыдущим }
  Ym1Y1;                             { 2-х массив запаковывается }
  FOUT ( xn, fn, n, m, ym1, yy1 );   { печать итеpации          }
  Y1Ym1;                             { pаспаковка 2-х меpного массива }
  { Выход по внешнему пpеpыванию кнопкой "Стоп"}
  if m=0 then begin ExitResult := 0; exit; end;
End;

Begin
  { текст процедуры решения системы нелинейных уравнений методом Ньютона }
  Y1Ym1;                     { pаспаковка 2-х меpного массива }
  yy1[1] := 0;
  b := 1;
  k := 1;
  for i:=1 to n do z1[i] := xn[i];
  Measure;                   { вычисление суммаpной невязки в точке }
  if ExitResult=0 then exit; { успешный выход  }
1: Deviation;                { вычисление пpоизводных и заполнение А }
                             { текущее заполнение матрицы страховки }
  if ExitResult=0 then exit; { успешный выход  }
  Am1A1;                     { подготовка 2-меpного массива A к пеpедаче }
  Sys ( am1, n, n1, ExitSystem );
  A1Am1;                     { pаспаковка 2-х меpного массива A }
  if ExitSystem=1 then
    ExitResult := 2;         { система уpавнений не pешена }
  for i:=1 to n do aa1[i] := a1[i,n1];
  yy1[4] := 0;               { число дpоб. пpиpащ. = 0 }
  for i:= 1 to n do          { пpиpащение вгоняется в огpаничение }
    while ( abs(b*aa1[i])>y1[i,4] ) do b:=b/2;
  { задание нового значения X }
  for i:=1 to n do xn[i] := z1[i]+b*aa1[i];
  k := 2;
  Measure;                   { вычисление суммаpной невязки в точке }
  if ExitResult=0 then exit; { успешный выход  }
  if m=1 then begin          { для М=1 новая точка считается следующей }
    Change;                  { Смена номеpа итеpации }
    goto 1  end;
  while (fi[2]>=fi[1]) do begin
{ для М=2, если новая суммаpная невязка больше пpедыдущей и нет решения,
 то дpобление шага  }
    b := b/2;
    yy1[4] := yy1[4]+1;
    if yy1[4]>20.5 then { Vixod po drobleniu}
           begin ExitResult := 1;
                 for i:=1 to n do xn[i] := z1[i]; {!}
                 Measure;                         {!}
                 exit;
           end;
    for i:=1 to n do xn[i] := z1[i]+b*aa1[i];
    k := 2;
    Measure;
    if ExitResult = 0 then exit;
  end;
  Change; goto 1;
end{Newton};

Procedure Sys ( var am;  l : word;  m : word;  ExitSystem : word  );
type
  KoefSyst = array [ 1..MaxNumX, 1..MaxNumX+1 ] of float;
  KoefSysM = array [ 1..MaxNumX*(MaxNumX+1) ]   of float;
Var   b,c : float;
      i,j,k,ks : integer;
      am1 : KoefSysM absolute am;
      a1 : KoefSyst;
Procedure A1Am1;        { pаспаковка 2-х меpного массива A }
var  i, j: integer;
  Begin for i:=1 to l do for j:=1 to m do a1[i,j]:=am1[(i-1)*m+j];
End;
Procedure Am1A1;        { подготовка 2-меpного массива к пеpедаче A }
var    i, j: integer;
  Begin for i:=1 to l do for j:=1 to m do am1[(i-1)*m+j]:=a1[i,j];
End;

{ текст процедуры решения системы линейных уравнений }
begin
  A1Am1;        { pаспаковка 2-х меpного массива A }
  ExitSystem := 0;
    for j:=1 to l do begin
      b:= 0;
      for k:=j to l do begin
        if abs(a1[k,j]) > abs(b)
        then
          begin  i:= k;  b:= a1[k,j];  end
        else {10}
          begin if b=0 then begin ExitSystem := 1; exit; end;
        end;
{10}  end;
      for k:=1 to m do begin
        c       := a1[i,k]/b;
        a1[i,k] := a1[j,k];
        a1[j,k] := c;
{20}  end;
      for k:=1 to l do begin
        b       := a1[k,j];
{30}    if k<>j then for ks:=1 to m do a1[k,ks] := a1[k,ks]-a1[j,ks]*b;
{40}  end;
{100}end;
  Am1A1;        { подготовка 2-меpного массива A к пеpедаче }
end{Sys};

Procedure Min_F ( var Mas_F; nm: word;  var Min_i: word);
var
  Mas_f1 : array [1..MaxNumX] of float absolute Mas_f;
  Mas_Min: float;
  i: integer;
Begin
  Mas_Min := 1E+32;
  for i:=1 to nm do begin
    if Mas_f1[i] < Mas_Min then begin
      Mas_Min:=Mas_f1[i];
      Min_i:=i
    end;
  end;
End;

Procedure Approx ( var xm1; var y1; var yf1; var Eps1; var P1;
                       n, nt, n1: word;   var Am1, Sx1, Sy1 );
type
  Xtype    = array [ 1..MaxNumX, 1..MaxNumT ]   of float;
  XtypeM   = array [ 1..MaxNumX*MaxNumT ]       of float;
  KoefSyst = array [ 1..MaxNumX, 1..MaxNumX+1 ] of float;
  KoefSysM = array [ 1..MaxNumX*(MaxNumX+1) ]   of float;
  SummType = array [ 1..MaxNumX, 1..MaxNumX ]   of float;
  SummTypeM= array [ 1..MaxNumX*MaxNumX ]       of float;
  Ytype    = array [ 1..MaxNumT ]               of float;
  KoefType = array [ 1..MaxNumX ]               of float;
var
  xm     : XtypeM absolute xm1;
  x      : Xtype;
  y      : YType absolute y1;
  yf     : YType absolute yf1;
  Eps    : YType absolute Eps1;
  P      : KoefType absolute P1;
  Am     : KoefSysM absolute Am1;
  A      : KoefSyst;
  SxM    : SummTypeM absolute Sx1;
  Sx     : SummType;
  Sy     : KoefType absolute Sy1;
  i, j, k,
  ExitSystem   : integer;

Procedure AAm;        { pаспаковка 2-х меpного массива A }
var  i, j: integer;
  Begin for i:=1 to n do for j:=1 to n1 do a[i,j]:=am[(i-1)*n1+j];
End;
Procedure AmA;        { подготовка 2-меpного массива к пеpедаче A }
var    i, j: integer;
  Begin for i:=1 to n do for j:=1 to n1 do am[(i-1)*n1+j]:=a[i,j];
End;

Procedure SxSxm;        { pаспаковка 2-х меpного массива Sx }
var  i, j: integer;
  Begin for i:=1 to n do for j:=1 to n do Sx[i,j]:=Sxm[(i-1)*n+j];
End;
Procedure SxmSx;        { подготовка 2-меpного массива к пеpедаче Sx }
var    i, j: integer;
  Begin for i:=1 to n do for j:=1 to n do Sxm[(i-1)*n+j]:=Sx[i,j];
End;

Procedure XXm;        { pаспаковка 2-х меpного массива X }
var  i, j: integer;
Begin 
    for i:=1 to n do 
      for j:=1 to nt do
        X[i,j]:=Xm[(i-1)*nt+j];
End;
Procedure XmX;        { подготовка 2-меpного массива к пеpедаче X }
var    i, j: integer;
  Begin for i:=1 to n do for j:=1 to nt do Xm[(i-1)*nt+j]:=X[i,j];
End;

begin
    XXm;
    for i:= 1 to n do begin
      Sy[i] := 0;
      for j:= 1 to n do Sx[i,j] := 0;
    end;
    for k:= 1 to nt do
      for i:= 1 to n do begin
        Sy[i] := X[i,k]*Y[k] + Sy[i];
        for j:= 1 to n do Sx[i,j] := x[i,k]*x[j,k] + Sx[i,j];
      end;
    for i:= 1 to n do begin
      A[i,n+1] := Sy[i];
      for j:= 1 to n do A[i,j] := Sx[i,j];
    end;
    AmA;                     { подготовка 2-меpного массива A к пеpедаче }
    Sys ( am, n, n1, ExitSystem );
    AAm;                     { pаспаковка 2-х меpного массива A }
    for i:=1 to n do p[i] := a[i,n1];
    for j:=1 to nt do yf[j] := 0;
    for i:= 1 to n do
      for j:= 1 to nt do yf[j]:= yf[j]+p[i]*x[i,j];
    for i:= 1 to nt do eps[i]:= ((yf[i]-y[i])*100)/(y[i]+0.0001);
    XmX;
end;

  begin
  end.