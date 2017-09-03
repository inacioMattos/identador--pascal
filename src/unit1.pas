unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type
    arrString = array[0..9999] of string;
    arrInt = array[0..9999] of integer;
  { TForm1 }

  TForm1 = class(TForm)
    botaoIdentar: TButton;
    linguagens: TComboBox;
    labelTitulo: TLabel;
    num1: TLabel;
    num2: TLabel;
    num3: TLabel;
    panelCima: TPanel;
    panelEsquerda: TPanel;
    panelMeio: TPanel;
    txtCodigo: TMemo;
    panel1: TPanel;
    panel2: TPanel;
    procedure botaoIdentarClick(Sender: TObject);
    procedure panelMeioClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;


var
  Form1: TForm1;
  a: Integer;
  code: TStrings;

implementation

uses
  unit_regras;

{$R *.lfm}

{ TForm1 }

procedure TForm1.panelMeioClick(Sender: TObject);
begin

end;

procedure TForm1.botaoIdentarClick(Sender: TObject);
var
  index: Integer;
begin
     index := linguagens.ItemIndex;
     code := txtCodigo.Lines;
     if (index = -1) then
     begin
       application.messagebox('por favor, selecione uma linguagem antes!', 'error 404', 0);
     end

     else begin
          if (index = 0) then begin
            code := set_regras('Pascal', code);
          end;

          if (index = 1) then begin
            code := set_regras('C#', code);
          end;
     end;

     txtCodigo.Lines := code;
end;

end.

