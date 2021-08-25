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
{ �p�楤�p� ������p���� ���᪠ �����㬠 �㭪樨 ��⮤�� ����⮣� �祭��.
  ����� ������ �㭪樨 FUN(x) ��� a<x<b � �筮���� �� epsilon.}

Procedure Min_F ( var Mas_F;              { ���ᨢ ��६����� }
                  nm: word;               { ࠧ��୮���       }
                  var Min_i: word         { ���浪��� ����� �������쭮��
                                            ����� }  );
{ ��楤�� ��।���� ����� �������쭮�� ����� �� ��������� ���ᨢ� }

Procedure Newton ( var x;                 { ���ᨢ ���������� }
                   n : word;              { ࠧ��୮��� �蠥��� ��⥬� }
                   var f;                 { ���ᨢ ���燐� }
                   m : word;              { �ࠢ����� ����⠭� 
                     1 - Newton bez droblenii shaga, 2 - s drobleniem}
                   var ym;                { ࠡ�稩 ���ᨢ, ���� n
                     ����⮢ - ��ᮢ� �����樥��� ���燐�, ���� n -
                     ���饭�� ��� �᫥����� ��।������ �ந�������,
                     ��⨩ �⮫��� - �筮�� �襭��, �⢥��� -
                     ��࠭�祭�� �� ���饭�� ����� x }
                   var yy;                { ࠡ�稩 ���ᨢ:
                     yy[1] - ����� ���樨,
                     yy[2] - ⥪�饥 ���祭�� �㬬�୮� ���離�,
                     yy[3] - ���祭�� �㬬�୮� ���離� �� �।. 蠣�,
                     yy[4] - �᫮ �஡����� ���饭�� }
                   FYN  : FYNprocedure;   { ��楤�� �������� ���離�
                     f �� ������� ���祭�� x, ��⠢����� ���짮��⥫�� }
                   FOUT : FOUTprocedure;  { ��楤�� �࣠������� �����
                     � �ਭ㤨⥫�� ��室 �� �ணࠬ�� }
                   var am;                { �ᯮ����⥫�� ���ᨢ }
                   n1 : word;             { n1 = n+1 }
                   var ExitResult : word { EX=0, �᫨ �襭�� 㤠����;
                     EX=1, �᫨ �襭�� �� �������; EX=2, e᫨ �ந��諠
                     �訡�� �� �襭�� ��⥬� �������� �ࠢ�����;
                     EX=3, �� �६� �襭�� };
                   var z; var aa  );
{ ��楤�� ��� �襭�� ��⥬� ���������� �ࠢ����� ���� FYN(x)=0 ����-
  ��஢���� ��⮤�� ���⮭�. �ᯮ���� ��楤��� ��� �襭�� ��⥬
  �������� �ࠢ����� SYSTEM. }

Procedure Sys ( var am;           { ����� �����樥�⮢ ��⥬� }
                l : word;         { }
                m : word;         { }
                ExitSystem : word { ES=1 - ��⥬� �ࠢ����� ��஦����,
                  ES=0 - �襭�� ������� }   );
{ ��楤�� Sys �蠥� m-l �������� �ࠢ����� � ��������묨 ������-
  ��⠬� � �⫨��騬��� �ࠢ묨 ���ﬨ, ����� �ᯮ�������� � m-l
  �⮫��� ������ �. ��襭�� ᮤ�ন��� � ��᫥���� �⮫�� ������ �. }

Procedure Approx ( var xm1;  {���ᨢ ��६����� ���பᨬ�樨 ࠧ��୮����
                             N �� Nt, }
                   var y1;   {���ᨢ ���祭�� �㭪樨 � 㧫�� ���பᨬ�樨
                             ࠧ��୮���� Nt }
                   var yf1;  {���ᨢ ���᫥���� �� ����祭��� ��㫥
                             ���祭�� �㭪樨 ࠧ��୮���� Nt }
                   var Eps1; {���ᨢ ����譮�⥩ yf-y � 㧫�� ���பᨬ�樨 }
                   var P1;   {���ᨢ �����樥�⮢ �����童�� }
                       n,    {���冷� �����童�� }
                       nt,   {�������⢮ 㧫�� ���பᨬ�樨 }
                       n1    {n+1 } : word;
                   var Am1,  {�ᯮ����⥫�� ���ᨢ ࠧ��୮�� N*(n+1)}
                       Sx1,  {�ᯮ����⥫�� ���ᨢ ࠧ��୮�� N*N}
                       Sy1   {�ᯮ����⥫�� ���ᨢ ࠧ��୮�� N} );
{ �p�楤�p� ���பᨬ�樨 ⠡��筮�� ���ᨢ� Y(x1, x2, ... xN) �����童���
  ���� Yf = P1*x1 + P2*x2 + P3*x3 +...+ PN*xN. Eps - ���ᨢ ����譮�⥩ �
  㧫�� �����ᨬ�樨.}

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

Procedure Y1Ym1;       { p�ᯠ����� 2-� ��p���� ���ᨢ� }
var i, j: integer;
 Begin for i:=1 to n do for j:=1 to 4 do y1[i,j]:=ym1[(i-1)*4+j];
End;
Procedure Ym1Y1;        { �����⮢�� 2-��p���� ���ᨢ� � ��p���� }
var i, j: integer;
  Begin for i:=1 to n do for j:=1 to 4 do ym1[(i-1)*4+j]:=y1[i,j];
End;
Procedure A1Am1;        { p�ᯠ����� 2-� ��p���� ���ᨢ� A }
var i, j: integer;
  Begin for i:=1 to n do for j:=1 to n+1 do a1[i,j]:=am1[(i-1)*(n+1)+j];
End;
Procedure Am1A1;        { �����⮢�� 2-��p���� ���ᨢ� � ��p���� A }
var i, j: integer;
  Begin for i:=1 to n do for j:=1 to n+1 do am1[(i-1)*(n+1)+j]:=a1[i,j];
End;

Procedure Measure; { ����p���� �㬬�p��� ���離� }
var
  i: integer;
Begin
  FYN( xn, fn, n);
  ii:=0;
  for i:=1 to n do if abs(fn[i])>y1[i,3] then ii:=ii+1;
  if ii=0 then ExitResult:=0;        { �ᯥ�� ��室  }
  fi[k]:=0;
  for i:=1 to n do fi[k] := fi[k]+y1[i,1]*abs(fn[i]); { �㬬�p. ���離� }
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
      if ii=0 then begin ExitResult:=0; exit; end;  { �ᯥ�� ��室  }
      xn[j] := z1[j];
    end;
End;

Procedure Change; { ����� ����p� ��p�樨 }
var i: integer;
Begin
  for i := 1 to n do z1[i] := xn[i];
  yy1[1] := yy1[1]+1;                { ����p ��p�樨           }
  yy1[2] := fi[1];                   { �㬬. ���. �� �p��. 蠣� }
  yy1[3] := fi[2];                   { �㬬. ���. �� �⮬ 蠣�  }
  b      := 1;
  k      := 1;
  fi[1]  :=fi[2];                    { ��� 蠣 �⠫ �p����騬 }
  Ym1Y1;                             { 2-� ���ᨢ �������뢠���� }
  FOUT ( xn, fn, n, m, ym1, yy1 );   { ����� ��p�樨          }
  Y1Ym1;                             { p�ᯠ����� 2-� ��p���� ���ᨢ� }
  { ��室 �� ���譥�� �p�p뢠��� ������� "�⮯"}
  if m=0 then begin ExitResult := 0; exit; end;
End;

Begin
  { ⥪�� ��楤��� �襭�� ��⥬� ���������� �ࠢ����� ��⮤�� ���⮭� }
  Y1Ym1;                     { p�ᯠ����� 2-� ��p���� ���ᨢ� }
  yy1[1] := 0;
  b := 1;
  k := 1;
  for i:=1 to n do z1[i] := xn[i];
  Measure;                   { ���᫥��� �㬬�p��� ���離� � �窥 }
  if ExitResult=0 then exit; { �ᯥ�� ��室  }
1: Deviation;                { ���᫥��� �p��������� � ���������� � }
                             { ⥪�饥 ���������� ������ ���客�� }
  if ExitResult=0 then exit; { �ᯥ�� ��室  }
  Am1A1;                     { �����⮢�� 2-��p���� ���ᨢ� A � ��p���� }
  Sys ( am1, n, n1, ExitSystem );
  A1Am1;                     { p�ᯠ����� 2-� ��p���� ���ᨢ� A }
  if ExitSystem=1 then
    ExitResult := 2;         { ��⥬� �p������� �� p�襭� }
  for i:=1 to n do aa1[i] := a1[i,n1];
  yy1[4] := 0;               { �᫮ �p��. �p�p��. = 0 }
  for i:= 1 to n do          { �p�p�饭�� �������� � ��p���祭�� }
    while ( abs(b*aa1[i])>y1[i,4] ) do b:=b/2;
  { ������� ������ ���祭�� X }
  for i:=1 to n do xn[i] := z1[i]+b*aa1[i];
  k := 2;
  Measure;                   { ���᫥��� �㬬�p��� ���離� � �窥 }
  if ExitResult=0 then exit; { �ᯥ�� ��室  }
  if m=1 then begin          { ��� �=1 ����� �窠 ��⠥��� ᫥���饩 }
    Change;                  { ����� ����p� ��p�樨 }
    goto 1  end;
  while (fi[2]>=fi[1]) do begin
{ ��� �=2, �᫨ ����� �㬬�p��� ���離� ����� �p����饩 � ��� �襭��,
 � �p������� 蠣�  }
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
Procedure A1Am1;        { p�ᯠ����� 2-� ��p���� ���ᨢ� A }
var  i, j: integer;
  Begin for i:=1 to l do for j:=1 to m do a1[i,j]:=am1[(i-1)*m+j];
End;
Procedure Am1A1;        { �����⮢�� 2-��p���� ���ᨢ� � ��p���� A }
var    i, j: integer;
  Begin for i:=1 to l do for j:=1 to m do am1[(i-1)*m+j]:=a1[i,j];
End;

{ ⥪�� ��楤��� �襭�� ��⥬� �������� �ࠢ����� }
begin
  A1Am1;        { p�ᯠ����� 2-� ��p���� ���ᨢ� A }
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
  Am1A1;        { �����⮢�� 2-��p���� ���ᨢ� A � ��p���� }
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

Procedure AAm;        { p�ᯠ����� 2-� ��p���� ���ᨢ� A }
var  i, j: integer;
  Begin for i:=1 to n do for j:=1 to n1 do a[i,j]:=am[(i-1)*n1+j];
End;
Procedure AmA;        { �����⮢�� 2-��p���� ���ᨢ� � ��p���� A }
var    i, j: integer;
  Begin for i:=1 to n do for j:=1 to n1 do am[(i-1)*n1+j]:=a[i,j];
End;

Procedure SxSxm;        { p�ᯠ����� 2-� ��p���� ���ᨢ� Sx }
var  i, j: integer;
  Begin for i:=1 to n do for j:=1 to n do Sx[i,j]:=Sxm[(i-1)*n+j];
End;
Procedure SxmSx;        { �����⮢�� 2-��p���� ���ᨢ� � ��p���� Sx }
var    i, j: integer;
  Begin for i:=1 to n do for j:=1 to n do Sxm[(i-1)*n+j]:=Sx[i,j];
End;

Procedure XXm;        { p�ᯠ����� 2-� ��p���� ���ᨢ� X }
var  i, j: integer;
Begin 
    for i:=1 to n do 
      for j:=1 to nt do
        X[i,j]:=Xm[(i-1)*nt+j];
End;
Procedure XmX;        { �����⮢�� 2-��p���� ���ᨢ� � ��p���� X }
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
    AmA;                     { �����⮢�� 2-��p���� ���ᨢ� A � ��p���� }
    Sys ( am, n, n1, ExitSystem );
    AAm;                     { p�ᯠ����� 2-� ��p���� ���ᨢ� A }
    for i:=1 to n do p[i] := a[i,n1];
    for j:=1 to nt do yf[j] := 0;
    for i:= 1 to n do
      for j:= 1 to nt do yf[j]:= yf[j]+p[i]*x[i,j];
    for i:= 1 to nt do eps[i]:= ((yf[i]-y[i])*100)/(y[i]+0.0001);
    XmX;
end;

  begin
  end.