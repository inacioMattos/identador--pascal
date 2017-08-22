unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

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
  private
    { private declarations }
  public
    { public declarations }
  end;


var
  Form1: TForm1;
  a: Integer;

implementation

{$R *.lfm}

end.

