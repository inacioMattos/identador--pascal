// TAB: #9;
// NEW LINE: #13#10;

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
    procedure txtCodigoChange(Sender: TObject);


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
  unit_regras, ORegra;

{$R *.lfm}

{ TForm1 }

procedure TForm1.panelMeioClick(Sender: TObject);
begin

end;


procedure TForm1.txtCodigoChange(Sender: TObject);
begin
    if (txtCodigo.Lines.Count > 39) then
    begin
        txtCodigo.ScrollBars := ssVertical;
    end
    else begin
        txtCodigo.ScrollBars := ssNone;
    end;
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
          end

          else begin
            code := set_regras('C#', code);
          end;

          code := identar(code);
     end;

     txtCodigo.Lines := code;
end;

end.
