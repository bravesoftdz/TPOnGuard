program Exusg2;

{$mode objfpc}{$H+}

uses
  Interfaces,
  Forms,
  Exusg2u in 'EXUSG2U.PAS' {Form1}, tponguard;


begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
