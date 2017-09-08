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
    Image1: TImage;
    Image2: TImage;
    linguagens: TComboBox;
    labelTitulo: TLabel;
    Memo1: TMemo;
    panelCima: TPanel;
    panelMeio: TPanel;
    txtCodigo: TMemo;
    panel1: TPanel;
    panel2: TPanel;

    procedure botaoIdentarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure panelCimaClick(Sender: TObject);
    procedure panelCimaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure panelCimaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure panelCimaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure panelMeioClick(Sender: TObject);
    procedure txtCodigoChange(Sender: TObject);



  private
    boolImg: Boolean;
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
  code: TStrings;
  i: Integer;

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


             //Apartir daqui temos a contagem de linhas :)
     Memo1.Clear;
     for i:=0 to txtCodigo.Lines.Count -1 do
     begin
           Memo1.Lines[i] := (IntToStr(i + 1));
     end;
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

procedure TForm1.Button1Click(Sender: TObject);
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

procedure TForm1.Image1MouseEnter(Sender: TObject);
begin

    Image1.Picture.LoadFromFile('img/btnClose (red bg).png')
end;

procedure TForm1.Image1MouseLeave(Sender: TObject);
begin
    Image1.Picture.LoadFromFile('img/btnClose (no bg).png')

end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TForm1.Image2MouseEnter(Sender: TObject);
begin
  Image2.Picture.LoadFromFile('img/minimizar-bg.png')
end;

procedure TForm1.Image2MouseLeave(Sender: TObject);
begin
  Image2.Picture.LoadFromFile('img/minimizar-nobg.png')
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


end.


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




end.
