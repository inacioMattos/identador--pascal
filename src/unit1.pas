unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
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

