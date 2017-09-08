unit ORegra;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, Dialogs;


function tab(code: TStrings; range1: Integer; range2: Integer; numOfSpaces: Integer): TStrings;
function blocks(code: TStrings; lineNumber: Integer): TStrings;
function identar(code: TStrings): TStrings;
function breakLine(code: TStrings): TStrings;
function adjustBlocks(code: TStrings): TStrings;
function deleteBlocks(code: TStrings): TStrings;


implementation



function identar(code: TStrings): TStrings;
var
    i: Integer;
    indexCHB: Integer;
    line: String;
begin
    code := breakLine(code);
    code := adjustBlocks(code);

    i := 0;

    while (i < code.Count) do
    begin
        line := code[i];
        indexCHB := pos('$CHB$', line);

        if (indexCHB > 0) then
        begin
            Delete(line, indexCHB, 5);
            code[i] := line;

            code := blocks(code, i);
        end;

        i += 1;
    end;

    code := deleteBlocks(code);
    identar := code;
end;


function deleteBlocks(code: TStrings): TStrings;
var
    line: String;
    i: Integer = 0;
    indexCHE: Integer;
    indexCHB: Integer;
begin
    while (i < code.Count) do
    begin
        line := code[i];
        indexCHB := pos('$CHB$', line);
        indexCHE := pos('$CHE$', line);

        if (indexCHE > 0) then
        begin
            Delete(line, indexCHE, 5);
        end;

        if (indexCHB > 0) then
        begin
            Delete(line, indexCHB, 5);
        end;

        code[i] := line;
        i += 1;

    end;

    deleteBlocks := code;
end;


function adjustBlocks(code: TStrings): TStrings;
var
    line: String;
    i: Integer = 0;
    indexCHE: Integer;
    indexCHB: Integer;
    l: String;
begin
    while(i < code.Count - 1) do
    begin
        line := code[i];
        indexCHB := pos('$CHB$', line);
        indexCHE := pos('$CHE$', line);

        if (indexCHE > 0) then
        begin
            l := code[i + 1];

            if (Length(l) > 4) then
            begin
                Insert(''#13#10'', l, 0);

                code[i + 1] := l;
            end;
        end;

        i += 1;
    end;

    adjustBlocks := code;
end;


function breakLine(code: TStrings): TStrings;
var
    line: String;
    i: Integer;
    indexCHE: Integer;
    indexCHB: Integer;
begin
    i := 0;

    while(i < code.Count) do
    begin
        line := code[i];
        indexCHB := pos('$CHB$', line);
        indexCHE := pos('$CHE$', line);

        if (indexCHB > 6) then
        begin
            Insert(''#13#10'', line, indexCHB);
        end
        else begin
            if (indexCHE > 6) then
            begin
                Insert(''#13#10'', line, indexCHE);
            end;
        end;

        code[i] := line;
        i += 1;
    end;

    breakLine := code;
end;


function blocks(code: TStrings; lineNumber: Integer): TStrings;
var
    line: String;
    i: Integer;
    indexCHE: Integer;
    indexCHB: Integer;
    indexEnd: Integer;
    bool: Boolean = True;
begin
    i := lineNumber + 1;
    indexEnd := code.Count;

    while ((i < code.Count) and (bool = True)) do
    begin
        line := code[i];
        indexCHB := pos('$CHB$', line);
        indexCHE := pos('$CHE$', line);

        if (indexCHB > 0) then
        begin
            Delete(line, indexCHB, 5);
            code[i] := line;

            code := blocks(code, i);
        end

        else begin

            if (indexCHE > 0) then
            begin
                code := tab(code, lineNumber + 1, i - 1, 6);

                line := code[i];
                Delete(line, indexCHE, 5);
                code[i] := line;

                bool := False;
            end;

        end;

        i += 1;
    end;

    blocks := code;
end;


function tab(code: TStrings; range1: Integer; range2: Integer; numOfSpaces: Integer): TStrings;
var
    i: Integer = 0;
    c: Integer = 0;
    line: String;
begin
    i := range1;

    while (i <= range2) do
    begin
        line := code[i];
        c := 0;

        while (c < numOfSpaces) do
        begin
            Insert(' ', line, 1);

            c += 1;
        end;

        code[i] := line;
        i += 1;
    end;

    tab := code;
end;


end.
