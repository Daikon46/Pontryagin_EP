program Pontryagin_EP;

uses
  Forms,
  Windows,
  MainTraj in 'MainTraj.pas' {MainOpt};

{$R *.res}

begin
  SetThreadLocale(1033);
  Application.Initialize;
  Application.CreateForm(TMainOpt, MainOpt);
  Application.Run;
end.
