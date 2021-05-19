unit method;
interface
  const
    MaxNumVector = 100;
    MaxNumFun    = 10;
  type
    float = real;
    SFprocedure = procedure (var y, d; n: word; var f; m: word;
                   var h; m1: word; var z; nz: word);
    PRprocedure = procedure (var y, d; n: word);
   { var      Buf : char;}
  procedure rkdb (var y, d;  { T�� }
                   n: word;  { p����p����� �������� y, d }
                   var f;    { ������ ������� ������ }
                   m: word;  { p����p����� ������� ������� ������ }
                   var h;    { ������ ��������� }
                   m1: word; { p����p ������� ��������� m1 := m + 1 }
                   PR: PRprocedure; { �p�����p� �p���� ������ }
                   SF: SFprocedure; { �p�����p� ������� ������ }
                   var z;    { p������ ������ }
                   nz: word; { p����p����� ������� nz := 2*n+m }
                   var exitfunc: word { ����p �p��������� ������� ������ }
                   );
{ �p�����p� �����p�p������ ������� �� n �����p���������� �p�������
  ������� �����-����� 4-�� ��p���� � ���������� ����� }

implementation
{ ============================================================= }

  procedure rkdb (var y, d;  { ������� �p���� ������ � ��p������� }
                   n: word;  { p����p����� �������� y, d }
                   var f;    { ������ ������� ������ }
                   m: word;  { p����p����� ������� ������� ������ }
                   var h;    { ������ ��������� }
                   m1: word; { p����p ������� ��������� m1 := m + 1 }
                   PR: PRprocedure; { �p�����p� �p���� ������ }
                   SF: SFprocedure; { �p�����p� ������� ������ }
                   var z;    { p������ ������ }
                   nz: word; { p����p����� ������� nz := 2*n+m }
                   var exitfunc: word { ����p �p��������� ������� ������ }
                   );
  Label 1,6,7,8,100;
  Const
    a=0.16666667; b=0.33333333; haf=0.5; one=1;
  Type
    up=1..4;
    vector = array [1..MaxNumVector] of float;
    massiv = array [1..MaxNumVector*2+MaxNumFun] of float;
  Var
     c2,c1:	array [up] of float;
     y1:        vector absolute y;
     d1:        vector absolute d;
     f1:        vector absolute f;
     h1:        vector absolute h;
     z1:        massiv absolute z;
     sr   :	Boolean;
     i,j,it,ir: Integer;
     hrk,hrk1,zz: float;

{ ����� ������������ �������������� ������� �����-����� 4-�� ������� }
      Begin	{ 1 }
      c2[1] := haf; c2[2] := haf; c2[3] := one; c2[4] := one;
      c1[1] := a; c1[2] := b; c1[3] := b; c1[4] := a;
      hrk := h1[1];
      hrk1 := hrk;
      sr := True;
1:    For j := 1 To 4 Do
	Begin	{ 2 }
	PR (y1, d1, n);
	If j<>1 Then GoTo 7;
	SF (y1, d1, n, f1, m, h1, m1, z1, nz);
	For i := 1 To m Do
	  Begin	{ 3 }
	  If Abs(f1[i]) <= h1[i+1] Then Begin	{ 4 }
	  exitfunc := i;
	  GoTo 100;
	  End;					{ 4 }
	  If sr = True Then GoTo 6
		     Else If z1[2*n+i]*f1[i] > 0 Then GoTo 6;
	  hrk := z1[2*n+i]*hrk1/(z1[2*n+i]-f1[i]);
	  For ir := 1 To n Do y1[ir] := z1[ir];
	  GoTo 1;
6:	  z1[2*n+i] := f1[i];
	  End;	{ 3 }
	  hrk1 := {h1[1]}hrk;
7:	  For i := 1 To n Do
	    Begin	{ 3 }
	    If j <> 1 Then GoTo 8;
	    z1[i] := y1[i];
	    z1[n+i] := y1[i];
8:	    z1[n+i] := z1[n+i]+hrk1*d1[i]*c1[j];
	    y1[i] := z1[i]+hrk1*d1[i]*c2[j];
	    End;	{ 3 }
	  End;	{ 2 }
	  For i := 1 To n Do y1[i] := z1[n+i];
	  sr := False;
	  GoTo 1;
100:	sr := True;
	End; { *** RKDB *** }

 Function Sign ( a : float ) : integer;
 { ������� ����������� ����� }
      Begin
	Sign := Round ( a / Abs (a) );
      End; { *** SIGN *** }

  begin
  end.

