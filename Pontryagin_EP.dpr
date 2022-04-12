program Pontryagin_EP;

uses
  Forms,
  Windows,
  MainTraj in 'MainTraj.pas' {MainOpt},
  About in 'About.pas' {Form1};

{$R *.res}

begin
  SetThreadLocale(1033);
  Application.Initialize;
  Application.CreateForm(TMainOpt, MainOpt);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
