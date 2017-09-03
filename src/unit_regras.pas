unit unit_regras;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function set_regras(lang: string; code: TStrings): TStrings;

type
    arrString = array[0..9999] of string;
    arrInt = array[0..9999] of integer;

implementation

uses
  Unit1;


function set_regras(lang: string; code: TStrings): TStrings;
begin
     set_regras := code;

     if (lang = 'C#') then
     begin
          set_regras.Add('tes'#9'te!');
          //set_regras := CSharp(code);

     end;

     if (lang = 'Pascal') then
     begin
          set_regras.Add('pascal');
          //set_regras := Pascal(code);
     end;
end;


end.

