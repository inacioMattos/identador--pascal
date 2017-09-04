unit unit_regras;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function set_regras(lang: string; code: TStrings): TStrings;
function CSharp(code: TStrings): TStrings;
function Pascal(code: TStrings): TStrings;
function CleanCode(code: TStrings): TStrings;

type
    arrString = array[0..9999] of string;
    arrInt = array[0..9999] of integer;

var
    test: String;

implementation

uses
  Unit1;


function set_regras(lang: string; code: TStrings): TStrings;
begin
    set_regras := code;

    if (lang = 'C#') then
    begin
        //test := 'qwerty';
        //Delete(test, 1, 1);
        //set_regras.Add(test);

        set_regras := CSharp(code);
    end;

    if (lang = 'Pascal') then
    begin
        //set_regras.Add('pascal');

        set_regras := Pascal(code);
    end;
end;


function CleanCode(code: TStrings): TStrings;
var
    line: String;
    cont: Integer;
begin
    cont := 0;

    while (cont < code.Count) do
    begin
        line := code[cont];

        if (not (line = '')) then
        begin
            while (line[1] = ' ') do
            begin
                Delete(line, 1, 1);
            end;
        end;

        code[cont] := line;
        cont := cont + 1;
    end;

    CleanCode := code;
end;


function CSharp(code: TStrings): TStrings;
var
    line: String;
    cont: Integer;
    indexCHB: Integer;
    indexCHE: Integer;

    blockB: String = '{';
    blockE: String = '}';
begin
    cont := 0;

    code := CleanCode(code);

    while (cont < code.Count) do
    begin
        line := code[cont];
        indexCHB := pos(blockB, line);
        indexCHE := pos(blockE, line);

        if (indexCHB > 0) then
        begin
            Insert('$CHB$', line, indexCHB);
        end;

        if (indexCHE > 0) then
        begin
            Insert('$CHE$', line, indexCHE);
        end;

        code[cont] := line;
        cont := cont + 1;
    end;

    CSharp := code;
end;


function Pascal(code: TStrings): TStrings;
var
    line: String;
    cont: Integer;
    indexCHB: Integer;
    indexCHE: Integer;

    blockB: String = 'begin';
    blockE: String = 'end';
begin
    cont := 0;

    code := CleanCode(code);

    while (cont < code.Count) do
    begin
        line := code[cont];
        indexCHB := pos(blockB, line);
        indexCHE := pos(blockE, line);

        if (indexCHB > 0) then
        begin
            Insert('$CHB$', line, indexCHB);
        end;

        if (indexCHE > 0) then
        begin
            Insert('$CHE$', line, indexCHE);
        end;

        code[cont] := line;
        cont := cont + 1;
    end;

    Pascal := code;
end;


end.
