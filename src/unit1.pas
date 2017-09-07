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
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure panelCimaClick(Sender: TObject);
    procedure panelCimaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure panelCimaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure panelCimaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure panelMeioClick(Sender: TObject);
  private
    mouselsDown: Boolean;
    dx: integer;
    dy: integer;
    { private declarations }
  public
    { public declarations }
  end;


var
  Form1: TForm1;
  a: Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.panelMeioClick(Sender: TObject);
begin

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.panelCimaClick(Sender: TObject);
begin

end;

procedure TForm1.panelCimaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
     begin
       mouselsDown := True;
       dx := X;
       dy := Y;
     end;
end;

procedure TForm1.panelCimaMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if mouselsDown then Begin
       SetBounds(Left + (X - dx), Top + (Y - dy), Width, Height);
     end;
end;

procedure TForm1.panelCimaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mouselsDown:=False;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.

