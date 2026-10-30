unit rangeMinMax;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ExtCtrls,
  StdCtrls, colors, Types, GraphMath;

type

  { TForm2 }

  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Label1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2Paint(Sender: TObject);
    procedure Panel3Paint(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel4MouseEnter(Sender: TObject);
    procedure Panel4MouseLeave(Sender: TObject);
    procedure Panel4Paint(Sender: TObject);
  private
    shift: TPoint;
  public
    minmax: TFloatPoint;
  end;

var
  Form2: TForm2;
  cl: TClPallete;
  move: Boolean;
  onBtn: Boolean;

implementation

uses
   main;

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin
  Form2.Height := 200;
  Form2.Width := 350;
  Form2.Color := cl.clHeadFont;
  Form2.BorderStyle := bsNone;
  Form2.Left := (Screen.Width div 2) - (Form2.Width div 2);
  FOrm2.Top := (Screen.Height div 2) - (Form2.Height div 2);

  Image1.Width := Form2.Width;
  Image1.Canvas.Brush.Color := cl.clHeadFont;
  Image1.Canvas.FillRect(0,0,Image1.Width, image1.Height);

  Panel1.Left := 4;
  Panel1.Top := 28;
  Panel1.Width := Form2.Width - 8;
  Panel1.Height := Form2.Height - 31;
  Panel1.Color := cl.clOption;
  Panel1.BevelColor := cl.clSecondaryText;

  Label1.Font.Color := cl.clText;
  Label1.Caption := 'Min y Max para escalado';
  Label1.Update;
  Label1.Left := (Form2.Width div 2) -
                 (Label1.Canvas.TextWidth(Label1.Caption) div 2);
  label1.Top := 4;

  Image2.Width := 24;
  Image2.Height := 24;
  Image2.Top := 1;
  Image2.Left := Form2.Width - Image2.Width - 2;
  Image2.Canvas.pen.Color := cl.clText;
  Image2.Canvas.Pen.Width := 2;
  Image2.Canvas.MoveTo(8,8);
  Image2.canvas.LineTo(Image2.Width - 8, Image2.Height - 8);
  Image2.Canvas.MoveTo(8, Image2.Height - 8);
  Image2.canvas.LineTo(Image2.Width - 8, 8);


  Label2.Font.Color := cl.clText;
  Label2.Top := (Panel1.Height div 2) - (Edit1.Height div 2) -
                (label2.Height div 2);
  Label2.Left := 8;
  Edit1.Left := Label2.Left + Label2.Width + 15;
  Edit1.Top := (Panel1.Height div 2) - (Edit1.Height - 5);
  Edit1.Color := cl.clHeadFont;
  Edit1.Font.Color := cl.clSecondaryText;
  Edit1.BorderStyle := bsNone;

  Panel2.BevelInner := bvNone;
  Panel2.BevelOuter := bvNone;
  Panel2.Color := cl.clHeadFont;
  Panel2.Height := Edit1.Height;
  Panel2.Width := Edit1.Width + 10;
  Panel2.Top := Edit1.Top - 2;
  Panel2.Left := Edit1.Left - 5;
  Panel2.OnPaint := @Panel2Paint;
  Panel2.SendToBack;

  Label3.Font.Color := cl.clText;
  Label3.Left := (Panel1.Width div 2) + 12;
  Label3.Top := (Panel1.Height div 2) - (Edit2.Height div 2) -
                (label3.Height div 2);
  Edit2.Left := Panel1.Width - (Edit2.Width + 16);
  Edit2.Top := (Panel1.Height div 2) - (Edit2.Height - 5);
  Edit2.Color := cl.clHeadFont;
  Edit2.Font.Color := cl.clSecondaryText;
  Edit2.BorderStyle := bsNone;

  Panel3.BevelInner := bvNone;
  Panel3.BevelOuter := bvNone;
  Panel3.Color := cl.clHeadFont;
  Panel3.Height := Edit2.Height;
  Panel3.Width := Edit2.Width + 10;
  Panel3.Top := Edit2.Top - 2;
  Panel3.Left := Edit2.Left - 5;
  Panel3.OnPaint := @Panel3Paint;
  Panel3.SendToBack;
  Panel3.Visible:=false;

  Edit1.Text := '';
  Edit2.Text := '';
  Edit1.TextHint := 'Ej: 2';
  Edit2.TextHint := 'Ej: 5';

  onBtn := False;
  Panel4.BevelInner := bvNone;
  Panel4.BevelOuter := bvNone;
  Panel4.Left := (Form2.Width div 2) - (Panel4.Width div 2);
  Panel4.Top := (panel3.Top) + Panel4.Height;
  Panel4.Height := 50;
  Panel4.Width := 120;
  Panel4.OnPaint := @Panel4Paint;
end;

procedure TForm2.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  move := true;
  Self.shift.X := X;
  Self.shift.Y := Y;
end;

procedure TForm2.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if move then
  begin
    Form2.Left := Form2.Left + (X - Self.shift.X);
    Form2.Top := Form2.Top + (Y - Self.shift.Y);
  end;
end;

procedure TForm2.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    move := false;
end;

procedure TForm2.Image2Click(Sender: TObject);
begin
  Form1.closeUs := true;
  Form2.Close;
end;

procedure TForm2.Image2MouseEnter(Sender: TObject);
begin
  Image2.canvas.Brush.color := cl.clOnSecondaryBtn;
  Image2.Canvas.FillRect(0,0, image2.width, image2.height);
  Image2.Canvas.pen.Color := cl.clText;
  Image2.Canvas.Pen.Width := 2;
  Image2.Canvas.MoveTo(8,8);
  Image2.canvas.LineTo(Image2.Width - 8, Image2.Height - 8);
  Image2.Canvas.MoveTo(8, Image2.Height - 8);
  Image2.canvas.LineTo(Image2.Width - 8, 8);
end;

procedure TForm2.Image2MouseLeave(Sender: TObject);
begin
  Image2.canvas.Brush.color := cl.clHeadFont;
  Image2.Canvas.FillRect(0,0, image2.width, image2.height);
  Image2.Canvas.pen.Color := cl.clText;
  Image2.Canvas.Pen.Width := 2;
  Image2.Canvas.MoveTo(8,8);
  Image2.canvas.LineTo(Image2.Width - 8, Image2.Height - 8);
  Image2.Canvas.MoveTo(8, Image2.Height - 8);
  Image2.canvas.LineTo(Image2.Width - 8, 8);
end;

procedure TForm2.Label1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  move := true;
  Self.shift.X := X;
  Self.shift.Y := Y;
end;

procedure TForm2.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if move then
  begin
    Form2.Left := Form2.Left + (X - Self.shift.X);
    Form2.Top := Form2.Top + (Y - Self.shift.Y);
  end;
end;

procedure TForm2.Label1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    move := false;
end;

procedure TForm2.Panel2Paint(Sender: TObject);
begin
  //Panel2.Canvas.Brush.Style := bsClear;
  //Panel2.Canvas.Pen.Color := cl.clOnSecondaryBtn;
  //Panel2.Canvas.Pen.Width := 1;
  //Panel2.Canvas.RoundRect(0,0,Panel2.Width,panel2.Height, 10,10);
end;

procedure TForm2.Panel3Paint(Sender: TObject);
begin
  //Panel3.Canvas.Brush.Style := bsClear;
  //Panel3.Canvas.Pen.Color := cl.clOnSecondaryBtn;
  //Panel3.Canvas.Pen.Width := 1;
  //Panel3.Canvas.RoundRect(0,0,Panel3.Width,panel3.Height, 10,10);
end;

procedure TForm2.Panel4Click(Sender: TObject);
begin
  Edit1Exit(Sender);
  Edit2Exit(Sender);
  Edit1.Text := '';
  Edit2.Text := '';
  ModalResult := mrOk;
end;

procedure TForm2.Panel4MouseEnter(Sender: TObject);
begin
  onBtn := true;
  Panel4.Invalidate;
end;

procedure TForm2.Panel4MouseLeave(Sender: TObject);
begin
  onBtn := false;
  Panel4.Invalidate;
end;

procedure TForm2.Panel4Paint(Sender: TObject);
var
  R: TRect;
begin
  //Panel4.Canvas.Brush.Color := Panel4.Parent.Color;
  //Panel4.CAnvas.FillRect(2,2,Panel4.Width-2,Panel4.Height-2);
  Panel4.Canvas.Pen.color := cl.clBorderButton;
  Panel4.Canvas.Pen.Width := 3;
  Panel4.Canvas.RoundRect(0,0,Panel4.Width,Panel4.Height,15,15);

  if onBtn then
    Panel4.Canvas.Brush.Color := cl.clOnButton
  else
    Panel4.Canvas.Brush.Color := cl.clButton;

  Panel4.CAnvas.Font.Color := cl.clBtnText; 
  Panel4.Canvas.Font.Name := 'Inter';
  Panel4.Canvas.Font.Size := 10;
  Panel4.Canvas.FOnt.Style := [fsBold];
  R := Rect(0, 0, Panel4.Width, Panel4.Height);
  Panel4.Canvas.TextRect(
    R,
    (R.Right  - Panel4.Canvas.TextWidth('Aceptar'))  div 2,
    (R.Bottom - Panel4.Canvas.TextHeight('Aceptar')) div 2,
    'Aceptar'
  );
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    minmax.X := 0;
    Exit;
  end;
  minmax.X := StrToFloat(Edit1.Text);
end;

procedure TForm2.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  if Key in ['0'..'9'] then
    Exit;

  if (Key = '-') and (Edit1.SelStart = 0) and (Pos('-', Edit1.Text) = 0) then
    Exit;

  if (Key = '.') and (Edit1.SelStart >= 0) and (Pos('.', Edit1.Text) = 0) then
    exit;

  if (Key = #127) or (Key = #08) or (Key = #03) or (Key = #04) then
    Exit;

  if (Key = #13) or (Key = #09) then
  begin
    //ShowMessage('Sig. Edit');
    Edit1Exit(Sender);
    //ShowMessage(FloatToStr(minmax.X));
    Edit2.SetFocus;
    Exit;
  end;

  Key := #0;
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
  if Edit2.Text = '' then
  begin
    minmax.Y := 1;
    Exit;
  end;
  minmax.Y := StrToFloat(Edit2.Text);
end;

procedure TForm2.Edit2KeyPress(Sender: TObject; var Key: char);
begin
 if Key in ['0'..'9'] then
    Exit;

  if (Key = '-') and (Edit2.SelStart = 0) and (Pos('-', Edit2.Text) = 0) then
    Exit;

  if (Key = '.') and (Edit2.SelStart >= 0) and (Pos('.', Edit2.Text) = 0) then
    exit;

  if (Key = #127) or (Key = #08) or (Key = #03) or (Key = #04) then
    Exit;

  if Key = #13 then
  begin
    //ShowMessage('Sig. Edit');
    Edit2Exit(Sender);
    Form1.closeUs := false;
    //ShowMessage(FloatToStr(minmax.Y));
    Edit1.Text := '';
    Edit2.Text := '';
    ModalResult := mrOk;
  end;

  Key := #0;
end;


initialization
  cl := TClPallete.Create;
  move := false;
  onBtn := False;

end.

