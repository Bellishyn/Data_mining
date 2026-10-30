unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, ExtCtrls,
  CheckLst, ValEdit, MaskEdit, StdCtrls, Buttons, ActnList, ComCtrls, ColorBox,
  GraphMath, AnchorDockPanel, Types, rangeMinMax, colors, LazLogger,
  LvlGraphCtrl, TAGraph, TALegendPanel, TASeries, TAFuncSeries, TASources,
  LCLType, Menus, Math, StrUtils;

type
  TRanges = record
    value: Real;
    index: Integer;
  end;

  TArrReal = Array of Real;

  { TForm1 }
  TForm1 = class(TForm)
    AnchorDockPanel1: TAnchorDockPanel;
    AnchorDockPanel2: TAnchorDockPanel;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Chart2: TChart;
    Chart2ColorMapSeries1: TColorMapSeries;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ListChartSource1: TListChartSource;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    PaintBox3: TPaintBox;
    PaintBox4: TPaintBox;
    PaintBox5: TPaintBox;
    PaintBox6: TPaintBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    StringGrid5: TStringGrid;
    StringGrid6: TStringGrid;
    Timer1: TTimer;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    TrackBar4: TTrackBar;

    procedure Button1Click(Sender: TObject);
    procedure Chart2ColorMapSeries1Calculate(const AX, AY: Double; out
      AZ: Double);
    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure Image2Paint(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure PaintBox1Click(Sender: TObject);
    procedure PaintBox1MouseEnter(Sender: TObject);
    procedure PaintBox1MouseLeave(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure PaintBox2Click(Sender: TObject);
    procedure PaintBox2MouseEnter(Sender: TObject);
    procedure PaintBox2MouseLeave(Sender: TObject);
    procedure PaintBox2Paint(Sender: TObject);
    procedure PaintBox3Click(Sender: TObject);
    procedure PaintBox3MouseEnter(Sender: TObject);
    procedure PaintBox3MouseLeave(Sender: TObject);
    procedure PaintBox3Paint(Sender: TObject);
    procedure PaintBox4Click(Sender: TObject);
    procedure PaintBox4MouseEnter(Sender: TObject);
    procedure PaintBox4MouseLeave(Sender: TObject);
    procedure PaintBox4Paint(Sender: TObject);
    procedure PaintBox5Click(Sender: TObject);
    procedure PaintBox5Paint(Sender: TObject);
    procedure PaintBox6Click(Sender: TObject);
    procedure PaintBox6MouseEnter(Sender: TObject);
    procedure PaintBox6MouseLeave(Sender: TObject);
    procedure PaintBox6Paint(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel1Paint(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel2Paint(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel3Paint(Sender: TObject);
    procedure Panel4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel4MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Panel4Paint(Sender: TObject);
    procedure Panel5Paint(Sender: TObject);
    procedure Panel6Paint(Sender: TObject);
    procedure Panel7Paint(Sender: TObject);
    procedure Panel8Paint(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure StringGrid1TopLeftChanged(Sender: TObject);
    procedure StringGrid2Click(Sender: TObject);
    procedure StringGrid2TopLeftChanged(Sender: TObject);
    procedure StringGrid3Click(Sender: TObject);
    procedure StringGrid4Click(Sender: TObject);
    procedure StringGrid5Click(Sender: TObject);
    procedure StringGrid6Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar1Click(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar2Click(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar3Click(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure TrackBar4Click(Sender: TObject);
  private
    FcloseUs: Boolean;
    FProgreso: Integer;
    FOptSelct: Integer;

    procedure changeSizeTableSG1;
    procedure changeSizeTableSG2;
    procedure minMax;
    function  findMinMax(var data: Array of Real): TFloatPoint;
    procedure robustScaling;
    procedure copyArray(const a: Array of Real; bg, en: Integer;
              var b: Array of Real);
    procedure topDownMerge(const a: Array of Real; bg, middle, en: Integer;
                  var b: Array of Real);
    procedure topDownSplitMerge(var a: Array of Real; bg, en: Integer;
                  var b: Array of Real);
    procedure topDownMergeSort(var a: Array of Real; var b: Array of Real;
              n: Integer);
    function  findQuartiles(const list: Array of Real): TArrReal;
    procedure saveFile(const fname: String; const StringGrid: TStringGrid);
    procedure spearman;
    procedure pearson;
    function  AVG(const data: Array of Real; n: Integer): Real;
    function  standarDesviation(const data: Array of Real; n: Integer;
              average: Real): Real;
    function  skewness(const a: Array of Real; average: Real;
              strdv: Real): Real;
    function  bias(const a: Array of Real; average: Real): Real;
    function  kurtosisPearson(const a: Array of Real; average: Real;
              strdv: Real): Real;
    function  kurtosis(const a: Array of Real; average: Real;
              strdv: Real): Real;
    procedure precalcultedata;
    function  covariance(const a: Array of Real; const avgA: Real;
              const b: Array of Real; const avgB: Real): Real;
    procedure copyCol(var a: Array of Real; col: Integer);
    procedure calculateCM;
    procedure asignMatrix;
    procedure setColorsC2;
    //procedure saveCrr(const name: String; var arg: Array of Real);
  public
    property  closeUs: Boolean read FcloseUs write FcloseUs;
  end;

var
  Form1: TForm1;
  cl: TClPallete;
  Result: TModalResult;
  norm, oncbNorm: Boolean;
  optCB: Integer;
  onBtn: Boolean;
  correlationP, percentageCrrP: Array of TArrReal;
  correlationS, percentageCrrS: Array of TArrReal;
  stdDtn, average: Array of Real;
  outlier: Boolean;
  xy1: TPoint;
  bclick: Boolean;
  m1: Array of Array of Real;
  upd:Boolean;
  prct: Integer;

const
  ColsSG  = 4;
  RowsSG  = 6;
  WidthW  = 1253;
  HeightW = 746;
  cbNorm  = 'Normalización';
  cbopt1  = 'Min-Max';
  cbopt2  = 'Robust Scaling';
  cboptH  = 'Seleccione una normalización';
  cboptX  = 'Seleccione una columna';
  save    = 'Guardar';
  outlrs  = 'Outlier';
  colX    = 'Columna-X';
  colY    = 'Columna-Y';
  colm    = 'Columna';
  prcCrr  = 'Correlación';

implementation

{$R *.lfm}

{ TForm1 }

//
//
//
{.............Funcionalidad.............}
//
//
//
function TForm1.kurtosisPearson(const a: Array of Real; average: Real;
          strdv: Real): Real;
var
  i: Integer;
  s, trd, desv: Real;
begin
  trd := 0;
  s := strdv * strdv * strdv * strdv * Length(a);
  for i := 0 to Length(a) - 1 do
  begin
    desv := a[i] - average;
    desv := desv * desv * desv * desv;
    trd := trd + desv;
  end;

  Result := trd / s;
end;

function TForm1.kurtosis(const a: Array of Real; average: Real;
          strdv: Real): Real;
var
  i: Integer;
  s, trd, desv: Real;
begin
  trd := 0;
  s := strdv * strdv * strdv * strdv * Length(a);
  for i := 0 to Length(a) - 1 do
  begin
    desv := a[i] - average;
    desv := desv * desv * desv * desv;
    trd := trd + desv;
  end;

  Result := trd / s - 3;
end;

function TForm1.bias(const a: Array of Real; average: Real): Real;
var
  realavg: Real;
  i, size: Integer;
begin
  size := Length(a);
  i :=  Length(a) div 2;
  if (size mod 2) = 0 then
    realavg := (a[i] + a[i - 1]) / 2
  else
    realavg := a[i];

  Result := average - realavg;
end;

function TForm1.skewness(const a: Array of Real; average: Real;
              strdv: Real): Real;
var
  i: Integer;
  s, trd, desv: Real;
begin
  trd := 0;
  s := strdv * strdv * strdv * Length(a);
  for i := 0 to Length(a) - 1 do
  begin
    desv := a[i] - average;
    desv := desv * desv * desv;
    trd := trd + desv;
  end;

  Result := trd / s;
end;

procedure TForm1.setColorsC2;
var
  i: Integer;
  t, r, g, b: Real;
begin
  ListChartSource1.BeginUpdate;
  try
    ListChartSource1.Clear;

    for i := 0 to 100 do
    begin
      t := i / 100;
      r := 0;
      g := 200 * t;
      b := 150 * (1 - t);

      ListChartSource1.Add(t, 0, '', RGBToColor(Round(r), Round(g), Round(b)));
    end;
  finally
    ListChartSource1.EndUpdate;
  end;

  Chart2ColorMapSeries1.ColorSource := ListChartSource1;
  Chart2ColorMapSeries1.StepX := 1;
  Chart2ColorMapSeries1.StepY := 1;

  Chart2.Invalidate;
end;

procedure TForm1.asignMatrix;
var
  i, j, k: Integer;
  minVal, maxVal, rango: Double;
begin
  k := 0;
  SetLength(m1, Length(correlationP), StringGrid1.RowCount - 1);

  for i := 0 to StringGrid1.ColCount - 1 do
  begin
    if StringGrid1.Cells[i, 0] <> '0' then
      Continue;

    for j := 1 to StringGrid1.RowCount - 1 do
    begin
      m1[k, j - 1] := StrToFloat(StringGrid1.Cells[i, j]);
    end;
    Inc(k);
  end;

  for k := 0 to Length(m1) - 1 do
  begin
    minVal := m1[k, 0];
    maxVal := m1[k, 0];
    for j := 1 to High(m1[k]) do
    begin
      if m1[k, j] < minVal then minVal := m1[k, j];
      if m1[k, j] > maxVal then maxVal := m1[k, j];
    end;

    rango := maxVal - minVal;

    for j := 0 to High(m1[k]) do
    begin
      if rango <> 0 then
        m1[k, j] := (m1[k, j] - minVal) / rango
      else
        m1[k, j] := 0;
      //Memo1.Append(Format('%.4f', [m1[k, j]]));
    end;
  end;
end;

procedure TForm1.calculateCM;
begin
  asignMatrix;

  Chart2.Extent.UseXMin := True;
  Chart2.Extent.XMin := 0;
  Chart2.Extent.UseXMax := True;
  Chart2.Extent.XMax := 1;

  Chart2.Extent.UseYMin := True;
  Chart2.Extent.YMin := 0;
  Chart2.Extent.UseYMax := True;
  Chart2.Extent.YMax := 1;
  setColorsC2;
end;

function TForm1.covariance(const a: Array of Real; const avgA: Real;
          const b: Array of Real; const avgB: Real): Real;
var
  i: Integer;
  covA, covB: Real;
  cov: Real = 0;
begin
  for i := 0 to Length(a) - 1 do
  begin
    covA  := a[i] - avgA;
    covB  := b[i] - avgB;
    cov   := cov + covA * covB;
  end;
  Result  := cov / Length(a);
end;

function TForm1.AVG(const data: Array of Real; n:Integer): Real;
var
  i: Integer;
  value: Real = 0;
  average: Real = 0;
begin
  for i := 0 to n - 1 do
    value := value + data[i];
    //Memo1.Append(FloatToStr(data[i]));

  //Memo1.Append(FloatToStr(value));
  average := value / n;
  //ShowMessage(Format('value: %f, avg: %f', [value, average]));
  Result := average;
end;

function TForm1.standarDesviation(const data: Array of Real;
          n: Integer; average: Real): Real;
var
  i: Integer;
  sum: Real = 0;
begin
  for i := 0 to n - 1 do
    sum := sum + Sqr(data[i] - average);

  Result := Sqrt(sum / n);
end;

procedure TForm1.copyCol(var a: Array of Real; col: Integer);
var
  j: Integer;
begin
  for j := 0 to StringGrid1.RowCount - 2 do
  begin
    a[j] := StrToFloat(StringGrid1.Cells[col, j + 1]);
    //Memo1.Append(FloatToStr(a[j]));
  end;
end;

procedure TForm1.spearman;
var
  i, j, n: Integer;
  a: Array of Array of Real = nil;
  b: Array of Array of TRanges = nil;
  c: Array of Real = nil;
begin
  n := 0;
  SetLength(c, StringGrid1.RowCount - 1);
  for i := 0 to StringGrid1.RowCount - 1 do
    c[i] := 0;

  for i := 0 to StringGrid1.ColCount - 2 do
  begin
    if StringGrid1.Cells[i,0] = '0' then
      Continue;
    SetLength(a, n + 1, StringGrid1.RowCount - 1);
    copyCol(a[n], i);
    SetLength(b, n + 1, StringGrid1.RowCount - 1);
    for j := 0 to StringGrid1.RowCount - 1 do
      b[n, i].value := a[n, i];
    Inc(n);
  end;

end;

procedure TForm1.pearson;
var
  i, j, k, n, m: Integer;
  crr, cov: Real;
  a: Array of Real = nil;
  b: Array of Real = nil;
  //strg: String = '';
begin
  SetLength(a, StringGrid1.RowCount - 1);
  SetLength(b, StringGrid1.RowCount - 1);
  n := 0;
  m := 0;
  for i := 0 to StringGrid1.ColCount - 2 do
  begin
    if StringGrid1.Cells[i, 0] <> '0' then
      Continue;

    copyCol(a, i);

    SetLength(correlationP, n + 1);
    SetLength(percentageCrrP, n + 1);
    m := 1;
    k := 1;
    SetLength(correlationP[n], m);
    SetLength(percentageCrrP[n], m);
    correlationP[n][0] := i;
    percentageCrrP[n][0] := i;
    for j := i + 1 to StringGrid1.ColCount - 2 do
    begin
      if StringGrid1.Cells[j,0] <> '0' then
        Continue;

      copyCol(b, j);

      cov   := covariance(a, average[n], b, average[n + k]);
      crr   := cov / (stdDtn[n] * stdDtn[k]);

      if (crr > 0) or (crr < 0) then
      begin
        SetLength(correlationP[n], m + 1);
        SetLength(percentageCrrP[n], m + 1);
        correlationP[n, m] := j;
        percentageCrrP[n, m ] := crr;

        //Memo1.Append(IntToStr(trunc(correlationP[n,0])));
        Inc(m);
      end;
      Inc(k);
    end;
    Inc(n);
  end;
end;

procedure TForm1.copyArray(const a: Array of Real; bg, en: Integer;
          var b: Array of Real);
var
  k: Integer;
begin
  for k := bg to en - 1 do
  begin
    b[k] := a[k];
  end;
end;

procedure TForm1.topDownMerge(const a: Array of Real; bg, middle, en: Integer;
          var b: Array of Real);
var
  i, j, k: Integer;
begin
  i := bg;
  j := middle;
  for k := bg to en - 1 do
  begin
    if (i >= middle) then
    begin
      b[k] := a[j]; Inc(j);
    end
    else if (j >= en) or (a[i] <= a[j]) then
    begin
      b[k] := a[i]; Inc(i);
    end
    else
    begin
      b[k] := a[j]; Inc(j);
    end;
  end;
end;

procedure TForm1.topDownSplitMerge(var a: Array of Real; bg, en: Integer;
          var b: Array of Real);
var
  middle: Integer;
begin
  if (en - bg) <= 1 then Exit;
  middle := (bg + en) div 2;
  topDownSplitMerge(b, bg, middle, a);
  topDownSplitMerge(b, middle, en, a);
  topDownMerge(b, bg, middle, en, a);
end;

procedure TForm1.topDownMergeSort(var a: Array of Real; var b: Array of Real;
          n: Integer);
begin
  copyArray(a, 0, n, b);
  topDownSplitMerge(a, 0, n, b);
  //ShowMessage('Ordenado correctamente.');
end;

function TForm1.findQuartiles(const list: Array of Real): TArrReal;
var
  val1, val2, val3, size: Integer;
  q1, q2, q3: Real;
begin
  size := Length(list);
  if size < 5 then
  begin
    Result := nil;
    Exit;
  end;

  val1 := Trunc(size / 4);
  val2 := size div 2;
  val3 := trunc(size / 4 * 3);

  if (size mod 2) = 0 then
    q2 := (list[val2] + list[val2 - 1]) / 2
  else
    q2 := list[val2];

  if ((size div 2) mod 2) = 0 then
  begin
    q1 := (list[val1] + list[val1 - 1]) / 2;
    q3 := (list[val3] + list[val3 - 1]) / 2;
  end
  else
  begin
    q1 := list[val1];
    q3 := list[val3];
  end;

  //ShowMessage(Format('%.3f, %.3f, %.3f', [q1, q2, q3]));

  SetLength(Result, 3);
  Result[0] := q1;
  Result[1] := q2;
  Result[2] := q3;
end;

procedure TForm1.RobustScaling;
var
  data: Array of Real = nil;
  b: Array of Real = nil;
  aux, IQR: Real;
  i, j: Integer;
  quartiles: TArrReal;
begin
  if OpenDialog1.FileName = '' then
  begin
    FOptSelct := 0;
    ShowMessage('Error: no hay ningun archivo cargado.');
    Exit;
  end;

  SetLength(data, StringGrid1.RowCount - 1);
  SetLength(b, StringGrid1.RowCount - 1);
  for i := 0 to StringGrid1.ColCount - 1 do
  begin
    if (StringGrid1.Cells[i, 0] <> '0') then
      Continue;
    for j := 1 to StringGrid1.RowCount - 1 do
    begin
      data[j-1] := StrToFloat(StringGrid1.Cells[i,j]);
    end;

    topDownMergeSort(data, b, Length(data));
    quartiles := findQuartiles(data);
    IQR := quartiles[2] - quartiles[0];
    if IQR = 0 then
     Continue;
    for j := 1 to StringGrid1.RowCount - 1 do
    begin
      aux := (StrToFloat(StringGrid1.Cells[i,j]) - quartiles[1]) / IQR;
      StringGrid2.Cells[i,j] := FloatToStr(aux);
    end;
  end;

  norm := True;
  Label1.Caption := 'Dimensión de la tabla: ' + IntToStr(StringGrid2.ColCount) +
  'x' + IntToStr(StringGrid2.RowCount);
  Form1.ChangeSizeTableSG2;
end;

function Tform1.findMinMax(var data: Array of Real): TFloatPoint;
var
  i: Integer;
  mm: TFloatPoint;
begin
  if StringGrid1.Cells[0,0] = '' then
  begin
    Exit;
  end;

  mm.X := StrtoFloat(StringGrid1.Cells[0,1]);
  mm.Y := mm.X;

  //ShowMessage(FloatToStr(mm.x) + ' , ' + FloatToStr(mm.Y));
  for i := 0 to StringGrid1.ColCount-1 do
  begin
    if (data[i] < mm.X) then
       mm.X := data[i];
    if (data[i] > mm.Y) then
       mm.Y := data[i];
  end;
  //ShowMessage(IntToStr(i) + ', ' + IntToStr(j) + ': Min' + FloatToStr(mm.X) +
  //' Max' + FloatToStr(mm.Y));
  Result := mm;
end;

procedure TForm1.MinMax;
var
  i, j: Integer;
  aux: Real;
  mm, scale: TFloatPoint;
  data: Array of Real = nil;
begin
  if OpenDialog1.FileName = '' then
  begin
    FOptSelct := 0;
    ShowMessage('Error: no hay ningun archivo cargado.');
    Exit;
  end;

  if FOptSelct = 0 then
  begin
    ShowMessage('El archivo contine celdas vacías.');
    Exit;
  end;

  Result := Form2.ShowModal;
  if Self.closeUs then
  begin
    //ShowMessage('Ventana cerrada.');
    Exit;
  end;

  if Result = mrOk then
  begin
    scale.X := Form2.minmax.X;
    scale.Y := Form2.minmax.Y;
  end;
  //ShowMessage(FloatToStr(scale.X) + ', ' + FloatToStr(scale.Y));

  SetLength(data, StringGrid1.RowCount - 1);
  scale.X := Form2.minmax.X;
  scale.Y := Form2.minmax.Y;

  for i := 0 to StringGrid1.ColCount - 1 do
  begin
    StringGrid1.Cells[i, 0] := StringGrid1.Cells[i, 0];
    if (StringGrid1.Cells[i,0] = '0') then
    begin
      for j := 1 to StringGrid1.RowCount - 1 do
      begin
        data[j-1] := StrToFloat(StringGrid1.Cells[i,j]);
        //Memo1.Append(FloatToStr(data[j-1]));
      end;

      mm := findMinMax(data);
      if mm.Y = mm.X then
      begin
        ShowMessage('No se puede normalizar: el valor mínimo y el máximo son iguales.');
        exit;
      end;
      for j := 1 to  StringGrid1.RowCount - 1 do
      begin
        aux := ((StrToFloat(StringGrid1.Cells[i,j]) - mm.X) /
        (mm.Y - mm.X)) * (scale.Y - scale.X) + scale.X;
        StringGrid2.Cells[i,j] := FloatToStr(aux);
      end;
    end
    else
    begin
      for j := 1 to StringGrid1.RowCount - 1 do
      begin
        StringGrid2.Cells[i,j] := StringGrid1.Cells[i,j];
      end;
    end;
  end;

  norm := True;
  Label1.Caption := 'Dimensión de la tabla: ' + IntToStr(StringGrid2.ColCount) +
  'x' + IntToStr(StringGrid2.RowCount);
  Form1.ChangeSizeTableSG2;
end;

procedure TForm1.saveFile(const fName: String; const StringGrid: TStringGrid);
var
  F: TextFile;
  i, j: Integer;
  line: String;
begin
  AssignFile(F, fName);
  Rewrite(F);

  line := '';
  for i := 0 to StringGrid.RowCount - 1 do
  begin
    for j := 0 to StringGrid.ColCount - 1 do
    begin
      if j = 0 then
        line := line + StringGrid.Cells[j,i]
      else
        line := line + ',' + StringGrid.Cells[j,i];
    end;
    WriteLn(F, line);
    line := '';
  end;
  CloseFile(F);

  ShowMessage('¡El Archivo de ha guardado exitosamente!');
end;

procedure TForm1.precalcultedata;
var
  a: Array of Real = nil;
  i: Integer;
  k: Integer;
begin
  SetLength(a, StringGrid1.RowCount - 1);
  k := 0;
  for i := 0 to StringGrid1.ColCount - 1 do
  begin
    if StringGrid1.Cells[i, 0] <> '0' then
      Continue;

    SetLength(average, k + 1);
    SetLength(stdDtn, k + 1);

    copyCol(a, i);
    average[k] := AVG(a, Length(a));
    stdDtn[k]  := standarDesviation(a, Length(a), average[k]);

    Inc(k);
  end;

  pearson;
end;

//
//
//
{.............Interfaz.............}
//
//
//
procedure TForm1.ChangeSizeTableSG1;
var
  heightSG1, widthSG1, valTB1: Integer;
  scale: Real;
begin
  valTB1 := 0;
  Label3.Visible := False;
  scale := Round(0.625 * Form1.Height);

  if Form1.Height > HeightW then
  begin
    heightSG1 := Trunc(Form1.Height - scale) div StringGrid1.DefaultRowHeight;
    if heightSG1 > StringGrid1.RowCount then
      heightSG1 := StringGrid1.RowCount;

    Memo1.Left      := Panel2.Left + Panel2.Width + 20;
    Memo1.Width     := Trunc(StringGrid1.Width * 0.05) + 288;
    chart1.Height   := (Form1.Height - 242) div 2;
    chart2.Height   := (Form1.Height - 242) div 2;
    Chart2.Top      := Chart1.Top + Chart1.Height + 70;
  end
  else
  begin
    Memo1.Left      := Panel2.Left + Panel2.Width + 20;
    Memo1.Width     := Trunc(StringGrid1.Width * 0.05) + 288;
    chart1.Height   := (Form1.Height - 242) div 2;
    chart2.Height   := (Form1.Height - 242) div 2;
    Chart2.Top      := Chart1.Top + Chart1.Height + 70;
    heightSG1 := RowsSG;
  end;

  if Form1.Width > WidthW then
  begin
    widthSG1 := (Form1.Width div 2) div StringGrid1.DefaultColWidth - 2;
    if widthSG1 > StringGrid1.ColCount then
      widthSG1 := StringGrid1.ColCount;
    Memo1.Left      := Panel2.Left + Panel2.Width + 20;
    Memo1.Width     := Trunc(StringGrid1.Width * 0.05) + 288;
    Chart1.Width    := trunc(Chart1.Height * 1.6);
    Chart1.Left     := Form1.Width - (Chart1.Width + 50);
    Chart2.Width    := trunc(Chart2.Height * 1.6);
    Chart2.Left     := Form1.Width - (Chart2.Width + 50);
  end
  else
  begin
    Memo1.Left      := Panel2.Left + Panel2.Width + 20;
    Memo1.Width     := Trunc(StringGrid1.Width * 0.05) + 288;
    Chart1.Width    := trunc(Chart1.Height * 1.6);
    Chart1.Left     := Memo1.Left + memo1.Width + 30;
    Chart2.Width    := trunc(Chart2.Height * 1.6);
    Chart2.Left     := Memo1.Left + memo1.Width + 30;
    widthSG1 := ColsSG;
  end;

  StringGrid1.BeginUpdate;
  try
    StringGrid1.Height := heightSG1 * StringGrid1.DefaultRowHeight;
    StringGrid1.Width  := widthSG1  * StringGrid1.DefaultColWidth;
  finally
    StringGrid1.EndUpdate;
  end;

  if StringGrid1.ColCount > widthSG1 then
  begin
    TrackBar1.Visible := True;
    TrackBar1.Min := StringGrid1.FixedCols;
    TrackBar1.Max := StringGrid1.ColCount - StringGrid1.VisibleColCount;
    valTB1 := 22;
  end
  else
    TrackBar1.Visible := False;

  if StringGrid1.RowCount > heightSG1 then
  begin
    TrackBar2.Visible := True;
    TrackBar2.Min := StringGrid1.FixedRows;
    TrackBar2.Max := StringGrid1.RowCount - heightSG1;
  end
  else
    TrackBar2.Visible := False;

  TrackBar2.Left   := StringGrid1.Left + StringGrid1.Width - 4;
  TrackBar2.Height := StringGrid1.Height;
  TrackBar1.Top    := StringGrid1.Top + StringGrid1.Height;
  TrackBar1.Width  := StringGrid1.Width;

  AnchorDockPanel1.Left := StringGrid1.Left + StringGrid1.Width;
  AnchorDockPanel1.Top  := StringGrid1.Top + StringGrid1.Height;
  AnchorDockPanel1.Visible := TrackBar1.Visible and TrackBar2.Visible;

  Panel2.Height := StringGrid1.Height + 50 + valTB1;
  Panel2.Width  := widthSG1 * StringGrid1.DefaultColWidth + 16 + valTB1;


  Label3.Top := StringGrid1.Top + StringGrid1.Height + valTB1;
  //Image2.Left := Panel2.Left + Panel2.Height + 10;

  //Image2.Visible := True;
  Label3.Visible := True;
  Panel3.SendToBack;
  PaintBox2.Left  := Memo1.Left;


  PaintBox3.Left  := Chart1.Left - 10;
  PaintBox4.Left  := PaintBox3.Left + PaintBox3.Width + 20;
  PaintBox5.Left  := Chart1.Left - 10;
  PaintBox6.Left := PaintBox4.Left + PaintBox4.Width + 10;

  Panel5.Left := PaintBox3.Left - 30;
  Panel6.Left := PaintBox4.Left - 20;
  Panel7.Left := PaintBox2.Left - 10;
  Panel8.Left := PaintBox6.Left - 30;

  if upd then
  begin
    upd:=false;
    changeSizeTableSG1;
  end;
  //ShowMessage(Format('SizeSG: %d', [Panel2.Height]));
end;

procedure TForm1.ChangeSizeTableSG2;
var
  heightSG2, widthSG2, valTB2: Integer;
  scale: Real;
begin
  Panel3.Top := (Panel2.Height + Panel2.Top) + 70;
  Image2.Top := Panel3.Top - (Image2.Height + 5);
  Image2.Left := 8;
  panel4.Top := Image2.Top + Image2.Height;

  if not(norm) then
  begin
    Exit;
  end;

  valTB2 := 0;
  Label1.Visible := False;
  scale := Round(0.625 * Form1.Height);

  if Form1.Height > HeightW then
  begin
    heightSG2 := Trunc(Form1.Height - scale) div StringGrid2.DefaultRowHeight;
    if heightSG2 > StringGrid2.RowCount then
      heightSG2 := StringGrid2.RowCount;
  end
  else
    heightSG2 := RowsSG;

  if Form1.Width > WidthW then
  begin
    widthSG2 := round(Form1.Width / 2) div StringGrid2.DefaultColWidth - 2;
    if widthSG2 > StringGrid2.ColCount then
      widthSG2 := StringGrid2.ColCount;
  end
  else
    widthSG2 := ColsSG;

  StringGrid2.BeginUpdate;
  try
    StringGrid2.Height := heightSG2 * StringGrid2.DefaultRowHeight;
    StringGrid2.Width  := widthSG2  * StringGrid2.DefaultColWidth;
  finally
    StringGrid2.EndUpdate;
  end;

  if StringGrid2.ColCount > widthSG2 then
  begin
    TrackBar3.Visible := True;
    TrackBar3.Min := StringGrid2.FixedCols;
    TrackBar3.Max := StringGrid2.ColCount - StringGrid2.VisibleColCount;
    valTB2 := 22;
  end
  else
    TrackBar3.Visible := False;

  if StringGrid1.RowCount > heightSG2 then
  begin
    TrackBar4.Visible := True;
    TrackBar4.Min := StringGrid2.FixedRows;
    TrackBar4.Max := StringGrid2.RowCount - heightSG2;
  end
  else
    TrackBar4.Visible := False;

  TrackBar4.Left   := StringGrid2.Left + StringGrid2.Width - 4;
  TrackBar4.Height := StringGrid2.Height;
  TrackBar3.Top    := StringGrid2.Top + StringGrid2.Height;
  TrackBar3.Width  := StringGrid2.Width;

  AnchorDockPanel2.Left := StringGrid2.Left + StringGrid2.Width;
  AnchorDockPanel2.Top  := StringGrid2.Top + StringGrid2.Height;
  AnchorDockPanel2.Visible := TrackBar3.Visible and TrackBar4.Visible;

  Panel3.Height := StringGrid2.Height + 50 + valTB2;
  Panel3.Width  := widthSG2 * StringGrid2.DefaultColWidth + 16 + valTB2;

  Label1.Top := StringGrid2.Top + StringGrid2.Height + valTB2;

  StringGrid2.Visible := True;
  Label1.Visible := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  //Inicialización de la ventana principal    <<< Form1 >>>
  Form1.Color := cl.clOption;
  Form1.Width := WidthW;
  Form1.Height := HeightW;
  Form1.Left := (Screen.Width div 2) - (Form1.Width div 2);
  FOrm1.Top := (Screen.Height div 2) - (Form1.Height div 2);


  FProgreso       := 0;
  Timer1.Interval := 20; 
  Timer1.Enabled := True;
  Timer1.Enabled  := True;


  //Incializacion de scroll                   <<< Trackbar1 Trackbar2 >>>
  Trackbar1.Visible := false;
  Trackbar1.left := StringGrid1.left; 
  TrackBar1.Top := StringGrid1.Top + StringGrid1.Height;

  Trackbar2.Visible := false;
  Trackbar2.top := StringGrid1.top;   
  TrackBar2.Left := StringGrid1.Left + StringGrid1.Width;

  TrackBar1.Color := cl.clText;
  TrackBar1.Font.Color := cl.clSecondaryText;
  TrackBar2.Color := cl.clSecondaryText;
  TrackBar2.Font.Color := cl.clSecondaryText;

  TrackBar3.Visible := false;
  Trackbar4.Visible := false;
  TrackBar3.Color := cl.clText;
  TrackBar3.Font.Color := cl.clSecondaryText;
  TrackBar4.Color := cl.clSecondaryText;
  TrackBar4.Font.Color := cl.clSecondaryText;


  //Inicialozacion de union de scrolls        <<< AnchorDockPanel1 >>
  AnchorDockPanel1.Color := cl.clSecondaryBtn;
  AnchorDockPanel1.Visible := false;
  AnchorDockPanel1.Left := StringGrid1.Left + StringGrid1.Width;
  AnchorDockPanel1.Top := StringGrid1.Top + StringGrid1.Height;
  AnchorDockPanel1.Height := TrackBar1.Height;
  AnchorDockPanel1.Width := TrackBar2.Width ;


  AnchorDockPanel2.Color := cl.clSecondaryBtn;
  AnchorDockPanel2.Visible := false;
  AnchorDockPanel2.Left := StringGrid1.Left + StringGrid1.Width;
  AnchorDockPanel2.Top := StringGrid1.Top + StringGrid1.Height;
  AnchorDockPanel2.Height := TrackBar3.Height;
  AnchorDockPanel2.width := TrackBar4.Width;


  //Inicialización del menú de opciones       <<< Label1 >>>
  Panel1.Color := cl.clHeadFont;
  //Panel1.BevelColor := cl.clSecondaryText;
  Panel1.Left := 0;
  Panel1.Top := 0;
  Panel1.Height := 46;
  Panel1.Width := Form1.Width;
  Panel1.OnPaint := @Panel1Paint;


  //Inicialización de "Cargar Archivo"        <<< Image1 Label2 >>>
  Image1.Canvas.Brush.Color := cl.clHeadFont;
  Image1.Canvas.FillRect(0, 0, Image1.Width, Image1.Height);
  Label2.Font.Color := cl.ClText;
  Label2.Font.Name := 'Inter';
  Label2.Left := (Image1.Left + Image1.Width) div 2 - (Label2.Width div 2);


  //Initialización de la tabla                <<< StringGrid1 >>>
  StringGrid1.ColCount := 4;
  StringGrid1.RowCount := 6;
  StringGrid1.Width := StringGrid1.DefaultColWidth * 4;
  StringGrid1.Height := StringGrid1.DefaultRowHeight * 6;
  StringGrid1.Color := cl.clTable;
  StringGrid1.GridLineColor := cl.clHeadFont;
  StringGrid1.BorderStyle := bsNone;
  StringGrid1.BorderColor := cl.clOption;
  StringGrid1.Font.Color := cl.clText;
  StringGrid1.GridLineWidth := 10;
  Form1.ChangeSizeTableSG1;


  //Inicializacion etiqueta dimension tabla   <<< Label3 >>>
  Label3.Font.Color := cl.clSecondaryText;
  label3.Left := StringGrid1.Left;
  Label3.Top := StringGrid1.Top + StringGrid1.Height + 26;
  Label3.Caption := 'Dimensión de la tabla: ' + IntToStr(StringGrid1.ColCount) +
  'x' + IntToStr(StringGrid1.RowCount);


  Label1.Font.Color := cl.clSecondaryText;
  label1.Left := StringGrid1.Left;
  Label1.Top := StringGrid2.Top + StringGrid2.Height + 26;
  Label1.Caption := 'Dimensión de la tabla: ' + IntToStr(StringGrid2.ColCount) +
  'x' + IntToStr(StringGrid2.RowCount);


  //inicializacion panel tabla 1              <<< Panel2 >>
  Panel2.Width := StringGrid1.width + 16;
  Panel2.Color := cl.clOption;
  Panel2.BevelInner := bvNone;
  panel2.BevelOuter := bvNone;
  Panel2.OnPaint := @Panel2Paint;


  //Inicialización tabla 2                    <<< StringGrid2 >>
  StringGrid2.ColCount := 4;
  StringGrid2.RowCount := 6;
  StringGrid2.BorderStyle := bsNone;
  StringGrid2.Width := StringGrid2.DefaultColWidth * 4;
  StringGrid2.Height := StringGrid2.DefaultRowHeight * 6;
  StringGrid2.Color := cl.clTable;
  StringGrid2.GridLineColor := cl.clHeadFont;
  StringGrid2.BorderColor := cl.clOption;
  StringGrid2.Font.Color := cl.clText;
  StringGrid2.GridLineWidth := 10;
  StringGrid2.Visible := False;


  //Inicialización panel tabla 2              << Panel3 >>
  Panel3.Top := ((Form1.Height - Panel1.Height) div 2) + Panel1.Height + 10;
  Panel3.Parent := Self;
  Panel3.Width := StringGrid2.width + 16;
  Panel3.Height := StringGrid2.Height;
  Panel3.Color := cl.clOption;
  Panel3.BevelInner := bvNone;
  panel3.BevelOuter := bvNone;
  Panel3.OnPaint := @Panel3Paint;


  //Inicialización tipo de normalización      <<< Image2 Panel4 >>>
  Image2.Visible := True;
  Image2.Top := Panel3.Top - (Image2.Height + 5);
  Image2.Left := 8;
  Image2.Height := 45;
  Image2.Width := Round(Canvas.TextWidth(cbNorm) / 3) * 5 + 40;
  Image2.Canvas.Brush.color := Form1.COlor;
  Image2.Canvas.FillRect(0,0,Image2.Width, Image2.height);
  Image2.Canvas.Brush.color := cl.clTertiaryBtn;
  Image2.Canvas.FillRect(3,3,Image2.Width-3, Image2.height-3);
  Image2.Canvas.pen.color := cl.clSndTrdBordeBtn;
  Image2.Canvas.pen.Width := 1;
  Image2.Canvas.RoundRect(0,0, image2.Width, image2.Height, 20,20);
  Image2.OnPaint := @Image2Paint;

  panel4.Top := Image2.Top + Image2.Height;
  Panel4.BevelInner := bvNone;
  Panel4.BevelOuter := bvNone;
  Panel4.Left := 20;
  panel4.Width := 400;
  Panel4.Height := 120;
  Panel4.OnPaint := @Panel4Paint;
  Panel4.Visible := False;

  norm := False;

  onBtn := False;
  PaintBox1.Left := Image1.Left + Image1.Width;
  PaintBox1.top := Image1.Top;
  PaintBox1.Width := 100;
  PaintBox1.OnPaint := @PaintBox1Paint;

  PaintBox2.Height := 45;
  PaintBox2.Width := Canvas.TextWidth(colX) + 100;
  PaintBox2.OnPaint := @PaintBox2Paint;

  PaintBox3.Height := 45;
  PaintBox3.Width := Canvas.TextWidth(colX) + 100;
  PaintBox3.OnPaint := @PaintBox3Paint;

  PaintBox4.Left := PaintBox3.Left + PaintBox3.Width + 20;
  PaintBox4.Height := 45;
  PaintBox4.Width := Canvas.TextWidth(colX) + 100;
  PaintBox4.OnPaint := @PaintBox4Paint;

  PaintBox5.Width := PaintBox5.Canvas.TextWidth(outlrs) + 50;

  PaintBox6.Left := PaintBox4.Left + PaintBox4.Width;
  PaintBox6.Top := PaintBox3.Top;
  PaintBox6.Height := 45;
  PaintBox6.Width := PaintBox6.Canvas.TextWidth('%<') + 50;
  PaintBox6.OnPaint := @PaintBox6Paint;


  Panel5.Top := PaintBox3.Top + PaintBox3.Height;
  Panel5.Left := (PaintBox3.Left - Panel5.Width div 2) - 30;
  Panel5.BevelInner := bvNone;
  Panel5.BevelOuter := bvNone;
  Panel5.Width := 200;
  Panel5.Height := 80;
  Panel5.OnPaint := @Panel5Paint;


  StringGrid3.Top := 40;
  StringGrid3.Left := 0;
  StringGrid3.BorderStyle := bsNone;
  StringGrid3.BorderColor := cl.clSndTrdBordeBtn;
  StringGrid3.Color := cl.clHeadFont;
  StringGrid3.GridLineColor := cl.clSndTrdBordeBtn;
  StringGrid3.BorderColor := cl.clSndTrdBordeBtn;
  StringGrid3.Font.Color := cl.clText;
  StringGrid3.GridLineWidth := 1;
  StringGrid3.ColCount := 1;
  StringGrid3.DefaultRowHeight := 40;
  StringGrid3.DefaultColWidth := 200;


  Panel6.Top := PaintBox4.Top + PaintBox4.Height;
  Panel6.Left := (PaintBox4.Left - Panel6.Width div 2) - 20;
  Panel6.BevelInner := bvNone;
  Panel6.BevelOuter := bvNone;
  Panel6.Width := 200;
  Panel6.Height := 80;


  StringGrid4.Top := 40;
  StringGrid4.Left := 0;
  StringGrid4.BorderStyle := bsNone;
  StringGrid4.BorderColor := cl.clSndTrdBordeBtn;
  StringGrid4.Color := cl.clHeadFont;
  StringGrid4.GridLineColor := cl.clSndTrdBordeBtn;
  StringGrid4.BorderColor := cl.clSndTrdBordeBtn;
  StringGrid4.Font.Color := cl.clText;
  StringGrid4.GridLineWidth := 1;
  StringGrid4.ColCount := 1;
  StringGrid4.DefaultRowHeight := 40;
  StringGrid4.DefaultColWidth := 200;

  bClick := false;

  Panel5.Visible:=false;
  Panel6.Visible:=false;
  setColorsC2;

  Panel7.Visible:=false;
  Panel7.Top := PaintBox2.Top + PaintBox2.Height;
  Panel7.Left := PaintBox2.Left - 30;
  Panel7.BevelInner := bvNone;
  Panel7.BevelOuter := bvNone;
  Panel7.Width := 200;
  Panel7.Height := 80;

  StringGrid5.Top := 40;
  StringGrid5.Left := 0;
  StringGrid5.BorderStyle := bsNone;
  StringGrid5.BorderColor := cl.clSndTrdBordeBtn;
  StringGrid5.Color := cl.clHeadFont;
  StringGrid5.GridLineColor := cl.clSndTrdBordeBtn;
  StringGrid5.BorderColor := cl.clSndTrdBordeBtn;
  StringGrid5.Font.Color := cl.clText;
  StringGrid5.GridLineWidth := 1;
  StringGrid5.ColCount := 1;
  StringGrid5.DefaultRowHeight := 40;
  StringGrid5.DefaultColWidth := 200;


  Panel8.Visible:=false;
  Panel8.Top := PaintBox2.Top + PaintBox2.Height;
  Panel8.Left := PaintBox6.Left - 30;
  Panel8.BevelInner := bvNone;
  Panel8.BevelOuter := bvNone;
  Panel8.Width := 120;
  Panel8.Height := 40 * 12;

  StringGrid6.Top := 40;
  StringGrid6.Left := 0;
  StringGrid6.BorderStyle := bsNone;
  StringGrid6.BorderColor := cl.clSndTrdBordeBtn;
  StringGrid6.Color := cl.clHeadFont;
  StringGrid6.GridLineColor := cl.clSndTrdBordeBtn;
  StringGrid6.BorderColor := cl.clSndTrdBordeBtn;
  StringGrid6.Font.Color := cl.clText;
  StringGrid6.GridLineWidth := 1;
  StringGrid6.ColCount := 1;
  StringGrid6.RowCount := 11;
  StringGrid6.Height := 40 * 11;
  StringGrid6.Width := panel8.Width;
  StringGrid6.DefaultRowHeight := 40;
  StringGrid6.DefaultColWidth := Panel8.Width;
  StringGrid6.Cells[0,0] := Format('>%d%s', [0, #37]);
  for i := 1 to 9 do
  begin
    StringGrid6.Cells[0,i] := Format('>=%d%s', [i * 10, #37]);
  end;
  StringGrid6.Cells[0,10] := Format('=%d%s', [100, #37]);


  StringGrid3.Visible:=false;
  StringGrid4.Visible:=false;
  StringGrid5.Visible:=false;

  //UpDown1.Color := UpDown1.Parent.Parent.Color;
  //UpDown1.Left := Panel5.Width - UpDown1.Width - 2;
  //UpDown1.Top := Panel5.Height - UpDown1.Height - 2;
  //panel
  //ShowMessage(Format('%f', [AVG([1,2,3,4,5,6,7,8,9], 9)]));
  //ShowMessage(Format('par:%d impar:%d', [(9 div 2), (10 div 2)]));
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Panel1.Width := Form1.Width;
  upd:=true;
  Form1.ChangeSizeTableSG1;
  Form1.ChangeSizeTableSG2;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Panel1.Width := Form1.Width;
  Form1.ChangeSizeTableSG1;
  Form1.ChangeSizeTableSG2;
end;

procedure TForm1.FormClick(Sender: TObject);
begin
  if oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    Exit;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.FileName = '' then
    exit;

  pearson();
end;

procedure TForm1.Chart2ColorMapSeries1Calculate(const AX, AY: Double; out
  AZ: Double);
var
  fila, col: Integer;
  numFilas, numCols: Integer;
begin
  numFilas := Length(m1);
  if numFilas = 0 then
  begin
    AZ := 0;
    Exit;
  end;

  numCols := Length(m1[0]);
  if numCols = 0 then
  begin
    AZ := 0;
    Exit;
  end;

  fila := Round(AX * (numFilas - 1));
  col := Round(AY * (numCols - 1));

  if (fila >= 0) and (fila < numFilas) and
     (col >= 0) and (col < numCols) then
    AZ := m1[fila, col]
  else
    AZ := 0;
end;

procedure TForm1.FormWindowStateChange(Sender: TObject);
begin
  Panel1.Width := Form1.Width;
  upd:=true;
  Form1.ChangeSizeTableSG1;
  Form1.ChangeSizeTableSG2;
end;

procedure TForm1.Image1Click(Sender: TObject);
var
  i: Integer;
begin
  if oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    Exit;
  end;
  if OpenDialog1.Execute then
  begin
    StringGrid1.LoadFromCSVFile(OpenDialog1.FileName);
    StringGrid2.LoadFromCSVFile(OpenDialog1.FileName);
    upd:=true;
    Form1.ChangeSizeTableSG1;
    ChangeSizeTableSG2;
    Label3.Caption := 'Dimensión de la tabla: ' + IntToStr(StringGrid1.ColCount) +
    'x' + IntToStr(StringGrid1.RowCount);
    precalcultedata;
    StringGrid3.Visible:=true;
    StringGrid3.ColCount := 1;
    StringGrid3.DefaultRowHeight := 40;
    StringGrid3.DefaultColWidth := 200;
    StringGrid3.RowCount := IfThen(Length(correlationP) > 10, 10,
                            Length(correlationP));
    StringGrid3.Width := Panel5.Width;
    StringGrid3.Height := IfThen(Length(correlationP) > 10, 10 * 40,
                            Length(correlationP) * 40);
    for i := 0 to High(correlationP) do
      StringGrid3.Cells[0,i] := IntToStr(Trunc(correlationP[i,0]));
    Panel5.Height := 40 * (Length(correlationP) + 1);
    Panel5.Invalidate;
    StringGrid5.ColCount := 1;

    StringGrid5.Visible:=true;
    StringGrid5.DefaultRowHeight := 40;
    StringGrid5.DefaultColWidth := 200;
    StringGrid5.RowCount := IfThen(Length(correlationP) > 10, 10,
                            Length(correlationP));
    StringGrid5.Width := Panel7.Width;
    StringGrid5.Height := IfThen(Length(correlationP) > 10, 10 * 40,
                            Length(correlationP) * 40);
    for i := 0 to High(correlationP) do
      StringGrid5.Cells[0, i] := IntToStr(Trunc(correlationP[i, 0]));
    Panel7.Height := 40 * (Length(correlationP) + 1);
    Panel7.Invalidate;
    calculateCM;
    //ShowMessage(Format('%d', [Length(correlationP)]));
  end;
  PaintBox1.Enabled := true;
end;

procedure TForm1.Image1MouseEnter(Sender: TObject);
begin
  if oncbNorm then
  begin
    Exit;
  end;
  Image1.Canvas.Brush.Color := cl.clOnSecondaryBtn;
  Image1.Canvas.FillRect(0, 0, Image1.Width, Image1.Height);
  Label2.Font.Color := cl.clText;
end;

procedure TForm1.Image1MouseLeave(Sender: TObject);
begin
  Image1.Canvas.Brush.Color := cl.clHeadFont;
  Image1.Canvas.FillRect(0, 0, Image1.Width, Image1.Height);
  Label2.Font.Color := cl.clText;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  If oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    onBtn := false;
    exit;
  end;
  onBtn := True;
  PaintBox3.Invalidate;
  oncbNorm := True;
  Panel4.Visible := True;
  Image2.Canvas.Brush.color := Form1.COlor;
  Image2.Canvas.FillRect(0,0,Image2.Width, Image2.height);
  Image2.Canvas.Brush.color := cl.clTertiaryBtn;
  Image2.Canvas.FillRect(3,3,Image2.Width-3, Image2.height-3);
  Image2.Canvas.pen.color := cl.clSelect;
  Image2.Canvas.pen.Width :=3;
  image2.Canvas.RoundRect(1,1, image2.Width-1, image2.Height-1, 20-2,20-2);
  Image2.OnPaint := @Image2Paint;
end;

procedure TForm1.Image2MouseEnter(Sender: TObject);
begin
  if oncbNorm then
    exit;
  Image2.Canvas.Brush.color := Form1.COlor;
  Image2.Canvas.FillRect(0,0,Image2.Width, Image2.height);
  Image2.Canvas.Brush.color := cl.clOnTertiaryBtn;
  Image2.Canvas.FillRect(3,3,Image2.Width-3, Image2.height-3);
  Image2.Canvas.pen.color := cl.clSndTrdBordeBtn;
  Image2.Canvas.pen.Width :=1;
  image2.Canvas.RoundRect(0,0, image2.Width, image2.Height, 20,20);
  Image2.OnPaint := @Image2Paint;
end;

procedure TForm1.Image2MouseLeave(Sender: TObject);
begin
  if oncbNorm then
    exit;
  Image2.Canvas.Brush.color := Form1.COlor;
  Image2.Canvas.FillRect(0,0,Image2.Width, Image2.height);
  Image2.Canvas.Brush.color := cl.clTertiaryBtn;
  Image2.Canvas.FillRect(3,3,Image2.Width-3, Image2.height-3);
  Image2.Canvas.pen.color := cl.clSndTrdBordeBtn;
  Image2.Canvas.pen.Width := 1;
  image2.Canvas.RoundRect(0,0, image2.Width, image2.Height, 20,20);
  Image2.OnPaint := @Image2Paint;
end;

procedure TForm1.Image2Paint(Sender: TObject);
var
  R: TRect;
  trg: Array[1..3] of TPoint;
begin
  Image2.Canvas.Font.Name := 'Inter';
  Image2.Canvas.Brush.Color := cl.clTertiaryBtn;
  Image2.Canvas.Font.Color := cl.clText;
  Image2.Font.Size := 10;
  Image2.canvas.Font.Style := [fsBold];

  R.Left   := (Image2.Width  div 2) - (Image2.Canvas.TextWidth(cbNorm)  div 2) -
              13;
  R.Top    := (Image2.Height div 2) - (Image2.Canvas.TextHeight(cbNorm) div 2) +
              1;
  R.Right  := R.Left + Image2.Canvas.TextWidth(cbNorm);
  R.Bottom := R.Top  + Image2.Canvas.TextHeight(cbNorm);

  Image2.Canvas.TextRect(R, R.Left, R.Top, cbNorm);

  trg[1] := Point(Round(Canvas.TextWidth(cbNorm) / 3) * 4 + 37,
            Image2.Height div 2);
  trg[2] := Point(Round(Canvas.TextWidth(cbNorm) / 3) * 4 + 47,
            Image2.Height div 2);
  trg[3] := Point(Round(Canvas.TextWidth(cbNorm) / 3) * 4 + 42,
            Image2.Height div 2 + 5);

  Image2.Canvas.Brush.Color := cl.clFigure;
  Image2.Canvas.Pen.Color := cl.clFigure;
  Image2.Canvas.Pen.Width := 1;
  Image2.Canvas.Polygon([trg[1], trg[2], trg[3]]);
end;

procedure TForm1.Label2Click(Sender: TObject);
var i : Integer;
begin
  if oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    Exit;
  end;
  if OpenDialog1.Execute then
  begin
    StringGrid1.LoadFromCSVFile(OpenDialog1.FileName);
    StringGrid2.LoadFromCSVFile(OpenDialog1.FileName);
    upd:=true;
    Form1.ChangeSizeTableSG1;
    Form1.ChangeSizeTableSG2;
    Label3.Caption := 'Dimensión de la tabla: ' + IntToStr(StringGrid1.ColCount) +
    'x' + IntToStr(StringGrid1.RowCount);
    precalcultedata;
    StringGrid3.Visible:=true;
    StringGrid3.ColCount := 1;
    StringGrid3.DefaultRowHeight := 40;
    StringGrid3.DefaultColWidth := 200;
    StringGrid3.RowCount := IfThen(Length(correlationP) > 10, 10,
                            Length(correlationP));
    StringGrid3.Width := Panel5.Width;
    StringGrid3.Height := IfThen(Length(correlationP) > 10, 10 * 40,
                            Length(correlationP) * 40);
    for i := 0 to High(correlationP) do
      StringGrid3.Cells[0,i] := IntToStr(Trunc(correlationP[i,0]));

    Panel5.Height := 40 * (Length(correlationP) + 1);
    Panel5.Invalidate;

    StringGrid5.Visible:=true;
    StringGrid5.ColCount := 1;
    StringGrid5.DefaultRowHeight := 40;
    StringGrid5.DefaultColWidth := 200;
    StringGrid5.RowCount := IfThen(Length(correlationP) > 10, 10,
                            Length(correlationP));
    StringGrid5.Width := Panel7.Width;
    StringGrid5.Height := IfThen(Length(correlationP) > 10, 10 * 40,
                            Length(correlationP) * 40);
    for i := 0 to High(correlationP) do
      StringGrid5.Cells[0, i] := IntToStr(Trunc(correlationP[i, 0]));
    Panel7.Height := 40 * (Length(correlationP) + 1);
    Panel7.Invalidate;
    calculateCM;
    //ShowMessage(Format('%d', [Length(correlationP)]));
  end;
  PaintBox1.Enabled := true;
end;

procedure TForm1.Label2MouseEnter(Sender: TObject);
begin
  if oncbNorm then
  begin
    Exit;
  end;
  Image1.Canvas.Brush.Color := cl.clOnSecondaryBtn;
  Image1.Canvas.FillRect(0, 0, Image1.Width, Image1.Height);
end;

procedure TForm1.Label2MouseLeave(Sender: TObject);
begin
  Image1.Canvas.Brush.Color := cl.clHeadFont;
  Image1.Canvas.FillRect(0, 0, Image1.Width, Image1.Height);
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  if oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    Exit;
  end;
end;

procedure TForm1.PaintBox1Click(Sender: TObject);
begin
  if oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    Exit;
  end;
  case optCB of
  1, 2: begin saveFile('ST2-Standardized.txt', StringGrid2); end;
  else
    ShowMessage('Seleccione un tipo de normalización.');
  end;
end;

procedure TForm1.PaintBox1MouseEnter(Sender: TObject);
begin
  if oncbNorm then
  begin
    Exit;
  end;
  if OpenDialog1.FileName = '' then
  begin
    PaintBox1.Enabled := false;
    Exit;
  end;
  PaintBox1.Enabled := true;
  onBtn := True;
  PaintBox1.Invalidate;
end;

procedure TForm1.PaintBox1MouseLeave(Sender: TObject);
begin
  if OpenDialog1.FileName = '' then
  begin
    PaintBox1.Enabled := false;
    Exit;
  end;
  PaintBox1.Enabled := true;
  onBtn := False;
  PaintBox1.Invalidate;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
var
  R: TRect;
begin
  if onBtn then
  begin
    PaintBox1.Canvas.Brush.Color := cl.clOnSecondaryBtn;
    PaintBox1.Canvas.Brush.Color := cl.clOnSecondaryBtn;
  end
  else
  begin
    PaintBox1.Canvas.Pen.COlor := Cl.clHeadFont;
    PaintBox1.Canvas.Brush.Color := cl.clHeadFont;
  end;
  PaintBox1.Canvas.FillRect(0, 0, PaintBox1.Width, PaintBox1.Height);
  PaintBox1.Canvas.Brush.Style := bsClear;
  PaintBox1.canvas.Font.Color := cl.clText;
  PaintBox1.Canvas.Font.Name := 'Inter';
  //PaintBox1.Canvas.Font.Size := 8;
  R := Rect(0, 0, PaintBox1.Width, PaintBox1.Height);
  PaintBox1.Canvas.TextRect(
    R,
    (R.Right - PaintBox1.Canvas.TextWidth(save)) div 2,
    (R.Bottom - PaintBox1.Canvas.TextHeight(save)) div 2,
    save
  );
  PaintBox1.Canvas.Brush.Style := bsSolid;
end;

procedure TForm1.PaintBox2Click(Sender: TObject);
begin
  oncbNorm := not oncbNorm;
  bclick := not bclick;
  if bclick then
  begin
    Panel7.Visible := true;
  end else
  begin
    Panel7.Visible := false;
  end;
  If oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    PaintBox2.Invalidate;
    onBtn := false;
    exit;
  end;
  PaintBox2.Invalidate;
end;

procedure TForm1.PaintBox2MouseEnter(Sender: TObject);
begin
  If oncbNorm then
    exit;
  onBtn := True;
  PaintBox2.Invalidate;
end;

procedure TForm1.PaintBox2MouseLeave(Sender: TObject);
begin
  onBtn := false;
  PaintBox2.Invalidate;
end;

procedure TForm1.PaintBox2Paint(Sender: TObject);
var
  R: TRect;
  trg: Array[1..3] of TPoint;
begin
  PaintBox2.Canvas.Brush.Color := Form1.Color;
  PaintBox2.Canvas.FillRect(0, 0, PaintBox2.Width, PaintBox2.Height);

  if onBtn then
  begin
    PaintBox2.Canvas.Brush.Color := cl.clOnTertiaryBtn;
  end else
  begin
    PaintBox2.Canvas.Brush.Color := cl.clTertiaryBtn;
  end;

  if bclick then
  begin
    PaintBox2.Canvas.Pen.Width := 3;
    PaintBox2.Canvas.Pen.Color := cl.clSelect;
  end
  else
  begin
    PaintBox2.Canvas.Pen.Color := cl.clSndTrdBordeBtn;
    PaintBox2.Canvas.Pen.Width := 1;
  end;
  PaintBox2.Canvas.FillRect(3, 3, PaintBox2.Width - 3, PaintBox2.Height - 3);

  PaintBox2.Canvas.RoundRect(0, 0, PaintBox2.Width, PaintBox2.Height, 20, 20);
  PaintBox2.Canvas.Font.Name := 'Inter';
  PaintBox2.Canvas.Brush.Color := cl.clTertiaryBtn;
  PaintBox2.Canvas.Font.Color := cl.clText;
  PaintBox2.Font.Size := 10;
  PaintBox2.Canvas.Font.Style := [fsBold];

  R.Left   := (PaintBox2.Width  div 2) -
              (PaintBox2.Canvas.TextWidth(colm)  div 2) - 13;
  R.Top    := (PaintBox2.Height div 2) -
              (PaintBox2.Canvas.TextHeight(colm) div 2) + 1;
  R.Right  := R.Left + PaintBox2.Canvas.TextWidth(colm);
  R.Bottom := R.Top  + PaintBox2.Canvas.TextHeight(colm);

  PaintBox2.Canvas.TextRect(R, R.Left, R.Top, colm);

  trg[1] := Point(Canvas.TextWidth(colm) + 65, PaintBox2.Height div 2);
  trg[2] := Point(Canvas.TextWidth(colm) + 75, PaintBox2.Height div 2);
  trg[3] := Point(Canvas.TextWidth(colm) + 70, PaintBox2.Height div 2 + 5);

  PaintBox2.Canvas.Brush.Color := cl.clFigure;
  PaintBox2.Canvas.Pen.Color := cl.clFigure;
  PaintBox2.Canvas.Pen.Width := 1;
  PaintBox2.Canvas.Polygon([trg[1], trg[2], trg[3]]);
end;

procedure TForm1.PaintBox3Click(Sender: TObject);
begin
  oncbNorm := not oncbNorm;
  bclick := not bclick;
  if bclick then
  begin
    Panel5.Visible := true;
  end else
  begin
    Panel5.Visible := false;
  end;
  If oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    PaintBox3.Invalidate;
    onBtn := false;
    exit;
  end;
  PaintBox3.Invalidate;
end;

procedure TForm1.PaintBox3MouseEnter(Sender: TObject);
begin
  If oncbNorm then
    exit;
  onBtn := True;
  PaintBox3.Invalidate;
end;

procedure TForm1.PaintBox3MouseLeave(Sender: TObject);
begin
  onBtn := False;
  PaintBox3.Invalidate;
end;

procedure TForm1.PaintBox3Paint(Sender: TObject);
var
  R: TRect;
  trg: Array[1..3] of TPoint;
begin
  PaintBox3.Canvas.Brush.color := Form1.COlor;
  PaintBox3.Canvas.FillRect(0, 0, PaintBox3.Width, PaintBox3.height);

  if onBtn then
  begin
    PaintBox3.Canvas.Brush.color := cl.clOnTertiaryBtn;
  end else
  begin
    PaintBox3.Canvas.Brush.color := cl.clTertiaryBtn;
  end;

  if bclick then
  begin
    PaintBox3.Canvas.pen.Width := 3;
    PaintBox3.Canvas.pen.color := cl.clSelect;
  end
  else
  begin
    PaintBox3.Canvas.pen.color := cl.clSndTrdBordeBtn;
    PaintBox3.Canvas.pen.Width := 1;
  end;
  PaintBox3.Canvas.FillRect(3, 3, PaintBox3.Width-3, PaintBox3.height-3);


  PaintBox3.Canvas.RoundRect(0,0, PaintBox3.Width, PaintBox3.Height, 20,20);
  PaintBox3.Canvas.Font.Name := 'Inter';
  PaintBox3.Canvas.Brush.Color := cl.clTertiaryBtn;
  PaintBox3.Canvas.Font.Color := cl.clText;
  PaintBox3.Font.Size := 10;
  PaintBox3.canvas.Font.Style := [fsBold];

  R.Left   := (PaintBox3.Width  div 2) -
              (PaintBox3.Canvas.TextWidth(colX)  div 2) - 13;
  R.Top    := (PaintBox3.Height div 2) -
              (PaintBox3.Canvas.TextHeight(colX) div 2) + 1;
  R.Right  := R.Left + PaintBox3.Canvas.TextWidth(colX);
  R.Bottom := R.Top  + PaintBox3.Canvas.TextHeight(colX);

  PaintBox3.Canvas.TextRect(R, R.Left, R.Top, colX);

  trg[1] := Point(Canvas.TextWidth(colX) + 65, PaintBox3.Height div 2);
  trg[2] := Point(Canvas.TextWidth(colX) + 75, PaintBox3.Height div 2);
  trg[3] := Point(Canvas.TextWidth(colX) + 70, PaintBox3.Height div 2 + 5);

  PaintBox3.Canvas.Brush.Color := cl.clFigure;
  PaintBox3.Canvas.Pen.Color := cl.clFigure;
  PaintBox3.Canvas.Pen.Width := 1;
  PaintBox3.Canvas.Polygon([trg[1], trg[2], trg[3]]);
end;

procedure TForm1.PaintBox4Click(Sender: TObject);
begin
  oncbNorm := not oncbNorm;
  bclick := not bclick;
  if bclick then
  begin
    Panel6.Visible := true;
  end else
  begin
    Panel6.Visible := false;
  end;
  If oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    PaintBox4.Invalidate;
    onBtn := false;
    exit;
  end;
  PaintBox4.Invalidate;
end;

procedure TForm1.PaintBox4MouseEnter(Sender: TObject);
begin
  If oncbNorm then
    exit;
  onBtn := True;
  PaintBox4.Invalidate;
end;

procedure TForm1.PaintBox4MouseLeave(Sender: TObject);
begin
  If oncbNorm then
    exit;
  onBtn := false;
  PaintBox4.Invalidate;
end;

procedure TForm1.PaintBox4Paint(Sender: TObject);
  var
  R: TRect;
  trg: Array[1..3] of TPoint;
begin
  PaintBox4.Canvas.Brush.color := Form1.COlor;
  PaintBox4.Canvas.FillRect(0, 0, PaintBox4.Width, PaintBox4.height);

  if onBtn then
  begin
    PaintBox4.Canvas.Brush.color := cl.clOnTertiaryBtn;
  end else
  begin
    PaintBox4.Canvas.Brush.color := cl.clTertiaryBtn;
  end;

  if bclick then
  begin
    PaintBox4.Canvas.pen.Width := 3;
    PaintBox4.Canvas.pen.color := cl.clSelect;
  end
  else
  begin
    PaintBox4.Canvas.pen.color := cl.clSndTrdBordeBtn;
    PaintBox4.Canvas.pen.Width := 1;
  end;

  PaintBox4.Canvas.FillRect(3, 3, PaintBox4.Width-3, PaintBox4.height-3);
  PaintBox4.Canvas.RoundRect(0,0, PaintBox3.Width, PaintBox4.Height, 20,20);
  PaintBox4.Canvas.Font.Name := 'Inter';
  PaintBox4.Canvas.Brush.Color := cl.clTertiaryBtn;
  PaintBox4.Canvas.Font.Color := cl.clText;
  PaintBox4.Font.Size := 10;
  PaintBox4.canvas.Font.Style := [fsBold];

  R.Left   := (PaintBox4.Width  div 2) -
              (PaintBox4.Canvas.TextWidth(colY)  div 2) - 13;
  R.Top    := (PaintBox4.Height div 2) -
              (PaintBox4.Canvas.TextHeight(colY) div 2) + 1;
  R.Right  := R.Left + PaintBox4.Canvas.TextWidth(colY);
  R.Bottom := R.Top  + PaintBox4.Canvas.TextHeight(colY);

  PaintBox4.Canvas.TextRect(R, R.Left, R.Top, colY);

  trg[1] := Point(Canvas.TextWidth(colY) + 65, PaintBox4.Height div 2);
  trg[2] := Point(Canvas.TextWidth(colY) + 75, PaintBox4.Height div 2);
  trg[3] := Point(Canvas.TextWidth(colY) + 70, PaintBox4.Height div 2 + 5);

  PaintBox4.Canvas.Brush.Color := cl.clFigure;
  PaintBox4.Canvas.Pen.Color := cl.clFigure;
  PaintBox4.Canvas.Pen.Width := 1;
  PaintBox4.Canvas.Polygon([trg[1], trg[2], trg[3]]);
end;

procedure TForm1.PaintBox5Click(Sender: TObject);
begin
  if outlier then
    outlier := False
  else
    outlier := True;
  PaintBox5.Invalidate;
end;

procedure TForm1.PaintBox5Paint(Sender: TObject);
var
  R: TRect;
begin
  PaintBox5.Canvas.Brush.Color := PaintBox5.Parent.Color;
  PaintBox5.Canvas.FillRect(0, 0, PaintBox5.Width, PaintBox5.Height);
  if outlier then
  begin
    PaintBox5.Canvas.Brush.Color := cl.clOnButton;
  end else
  begin
    PaintBox5.Canvas.Brush.Color := cl.clButton;
  end;
  PaintBox5.Canvas.Pen.Color := cl.clBorderButton;
  PaintBox5.Canvas.Pen.Width := 3;
  PaintBox5.Canvas.RoundRect(2, 2, PaintBox5.Width-2, PaintBox5.Height - 2, 15, 15);

  PaintBox5.Canvas.Brush.Style := bsClear;
  PaintBox5.Canvas.Font.Name := 'Inter';
  PaintBox5.Canvas.Font.Color := cl.clBtnText;
  PaintBox5.Canvas.Font.Style := [fsBold];
  R := Rect(0, 0, PaintBox5.Width, PaintBox5.Height);
  PaintBox5.Canvas.TextRect(
    R,
    (R.Right - PaintBox5.Canvas.TextWidth(outlrs)) div 2,
    (R.Bottom - PaintBox5.Canvas.TextHeight(outlrs)) div 2,
    outlrs
  );
  PaintBox5.Canvas.Brush.Style := bsSolid;
end;

procedure TForm1.PaintBox6Click(Sender: TObject);
begin
  oncbNorm := not oncbNorm;
  bclick := not bclick;
  if bclick then
  begin
    Panel5.Visible := false;
    Panel6.Visible := false;
    Panel8.Visible := true;
  end else
  begin
    Panel8.Visible := false;
  end;
  If oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    PaintBox6.Invalidate;
    onBtn := false;
    exit;
  end;

  PaintBox6.Invalidate;
end;

procedure TForm1.PaintBox6MouseEnter(Sender: TObject);
begin
  If oncbNorm then
    exit;
  onBtn := True;
  PaintBox6.Invalidate;
end;

procedure TForm1.PaintBox6MouseLeave(Sender: TObject);
begin
  onBtn := false;
  PaintBox6.Invalidate;
end;

procedure TForm1.PaintBox6Paint(Sender: TObject);
var
  R: TRect;
  trg: Array[1..3] of TPoint;
begin
  PaintBox6.Canvas.Brush.color := Form1.COlor;
  PaintBox6.Canvas.FillRect(0, 0, PaintBox6.Width, PaintBox6.height);

  if onBtn then
  begin
    PaintBox6.Canvas.Brush.color := cl.clOnTertiaryBtn;
  end else
  begin
    PaintBox6.Canvas.Brush.color := cl.clTertiaryBtn;
  end;

  if bclick then
  begin
    PaintBox6.Canvas.pen.Width := 3;
    PaintBox6.Canvas.pen.color := cl.clSelect;
  end
  else
  begin
    PaintBox6.Canvas.pen.color := cl.clSndTrdBordeBtn;
    PaintBox6.Canvas.pen.Width := 1;
  end;
  PaintBox6.Canvas.FillRect(3, 3, PaintBox6.Width-3, PaintBox6.height-3);


  PaintBox6.Canvas.RoundRect(0,0, PaintBox6.Width, PaintBox6.Height, 20,20);
  PaintBox6.Canvas.Font.Name := 'Inter';
  PaintBox6.Canvas.Brush.Color := cl.clTertiaryBtn;
  PaintBox6.Canvas.Font.Color := cl.clText;
  PaintBox6.Font.Size := 8;
  PaintBox6.canvas.Font.Style := [fsBold];

  R.Left   := (PaintBox6.Width  div 2) -
              (PaintBox6.Canvas.TextWidth('%<')  div 2) - 9;
  R.Top    := (PaintBox6.Height div 2) -
              (PaintBox6.Canvas.TextHeight('%<') div 2) + 1;
  R.Right  := R.Left + PaintBox6.Canvas.TextWidth('%<');
  R.Bottom := R.Top  + PaintBox6.Canvas.TextHeight('%<');

  PaintBox6.Canvas.TextRect(R, R.Left, R.Top, '>%');

  trg[1] := Point(Canvas.TextWidth('%<') + 25, PaintBox6.Height div 2);
  trg[2] := Point(Canvas.TextWidth('%<') + 35, PaintBox6.Height div 2);
  trg[3] := Point(Canvas.TextWidth('%<') + 30, PaintBox6.Height div 2 + 5);

  PaintBox6.Canvas.Brush.Color := cl.clFigure;
  PaintBox6.Canvas.Pen.Color := cl.clFigure;
  PaintBox6.Canvas.Pen.Width := 1;
  PaintBox6.Canvas.Polygon([trg[1], trg[2], trg[3]]);
end;

procedure TForm1.Panel1Click(Sender: TObject);
begin
  if oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    Exit;
  end;
end;

procedure TForm1.Panel1Paint(Sender: TObject);
begin
  Panel1.Canvas.Brush.Style := bsClear;
  Panel1.Canvas.Pen.Color := cl.clSecondaryText;
  Panel1.Canvas.Pen.Width := 1;
  Panel1.Canvas.RoundRect(0, 0, Panel1.ClientWidth, Panel1.ClientHeight, 10, 10);
end;

procedure TForm1.Panel2Click(Sender: TObject);
begin
  if oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    Exit;
  end;
end;

procedure TForm1.Panel2Paint(Sender: TObject);
begin
  Panel2.Canvas.Pen.Color := cl.clSecondaryText;
  Panel2.Canvas.Pen.Width := 1;
  Panel2.Canvas.RoundRect(0, 0, Panel2.ClientWidth, Panel2.ClientHeight, 10, 10);
end;

procedure TForm1.Panel3Click(Sender: TObject);
begin
  if oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    Exit;
  end;
end;

procedure TForm1.Panel3Paint(Sender: TObject);
begin
  panel3.Canvas.Pen.Color := cl.clSecondaryText;
  Panel3.Canvas.Pen.Width := 1;
  Panel3.Canvas.RoundRect(0, 0, Panel3.ClientWidth, Panel3.ClientHeight, 10, 10);
end;

procedure TForm1.Panel4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  optH: Integer;
begin
  optH := Panel4.Height div 3;
  if (Y >= optH) and (Y < optH * 2) then
    FOptSelct := 1
  else if (Y >= optH * 2) and (Y <= optH * 3) then
    FOptSelct := 2;
  Panel4.Visible := False;
  Panel4.Invalidate;
  oncbNorm := false;
  Image2MouseLeave(Sender);

  case FOptSelct of
  1: begin minMax; end;
  2: begin robustScaling; end;
  end;
end;

procedure TForm1.Panel4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  optH, newOptCB: Integer;
begin
  optH := Panel4.Height div 3;

  if (Y < opth) then
  begin
    newOptCB := 0;
  end
  else if (Y >= optH) and (Y < optH * 2) then
    newOptCB := 1
  else if (Y >= optH * 2) and (Y <= optH * 3) then
    newOptCB := 2;


  if newOptCB <> optCB then
  begin
    optCB := newOptCB;
    Panel4.Invalidate;
  end;
end;

procedure TForm1.Panel4Paint(Sender: TObject);
var
  R: TRect;
begin
  Panel4.Canvas.Brush.Color := cl.clHeadFont;
  Panel4.Canvas.FillRect(0, 0, Panel4.Width, Panel4.Height);

  Panel4.canvas.Pen.Color := cl.clSndTrdBordeBtn;
  Panel4.Canvas.Pen.Width := 1;
  case optCB of
  0:
    begin
      Panel4.Canvas.Brush.Color := cl.clHeadFont;
      Panel4.canvas.RoundRect(0,0,Panel4.Width, Panel4.Height, 20, 20);
      Panel4.canvas.Rectangle(0, (Panel4.Height div 3),
                              Panel4.Width, (Panel4.Height div 3)*2);
    end;
  1:
    begin
      Panel4.Canvas.Brush.Color := cl.clHeadFont;
      Panel4.canvas.RoundRect(0,0,Panel4.Width, Panel4.Height,
                              20, 20);
      Panel4.Canvas.Brush.Color := cl.clSecondaryBtn;
      Panel4.canvas.Rectangle(0, (Panel4.Height div 3),
                              Panel4.Width, (Panel4.Height div 3)*2);
    end;
  2:
    begin
      Panel4.Canvas.Brush.Color := cl.clHeadFont;
      Panel4.canvas.RoundRect(0,0,Panel4.Width, Panel4.Height,
                              20, 20);

      Panel4.canvas.Pen.Color := cl.clSndTrdBordeBtn;
      Panel4.Canvas.Brush.Color := cl.clSecondaryBtn;
      Panel4.canvas.RoundRect(0,(Panel4.Height div 2),Panel4.Width,Panel4.Height,
                              20, 20);

      Panel4.canvas.Pen.Color := cl.clSndTrdBordeBtn;
      Panel4.Canvas.Brush.Color := cl.clHeadFont;
      Panel4.canvas.Rectangle(0, (Panel4.Height div 3),
                              Panel4.Width, (Panel4.Height div 3)*2);
    end
  end;

  Panel4.Canvas.Font.Name := 'Inter';
  Panel4.Canvas.Font.Color := cl.clText;
  Panel4.canvas.Font.Style := [fsBold];
  Panel4.Canvas.Font.Size := 8;
  R.Left   := 20;
  R.Top    := (panel4.Height div 3) * 0 + (panel4.Height div 6) -
              (Image2.Canvas.TextHeight(cboptH)  div 2);
  R.Right  := R.Left + panel4.Canvas.TextWidth(cboptH);
  R.Bottom := R.Top  + panel4.Canvas.TextHeight(cboptH);
  Panel4.Canvas.TextRect(R, R.Left, R.Top, cboptH);

  Panel4.Canvas.Font.Style := [];
  R.Left   := (Panel4.Width  div 7);
  R.Top    := (panel4.Height div 3) * 1 + (panel4.Height div 6) -
              (Image2.Canvas.TextHeight(cbopt1)  div 2);
  R.Right  := R.Left + panel4.Canvas.TextWidth(cbopt1);
  R.Bottom := R.Top  + panel4.Canvas.TextHeight(cbopt1);
  Panel4.Canvas.TextRect(R, R.Left, R.Top, cbopt1);

  Panel4.Canvas.Font.Style := [];
  R.Left   := (Panel4.Width  div 7);
  R.Top    := (panel4.Height div 3) * 2 + (panel4.Height div 6) -
              (Image2.Canvas.TextHeight(cbopt2)  div 2);
  R.Right  := R.Left + panel4.Canvas.TextWidth(cbopt2);
  R.Bottom := R.Top  + panel4.Canvas.TextHeight(cbopt2);
  Panel4.Canvas.TextRect(R, R.Left, R.Top, cbopt2);

  case FOptSelct of
  1:
    begin                                  
      Panel4.Canvas.Pen.Color := cl.clText;
      Panel4.Canvas.Pen.Width := 2;
      Panel4.Canvas.MoveTo(21, 59);
      Panel4.Canvas.LineTo(26, 64);
      Panel4.Canvas.MoveTo(26, 64);
      Panel4.Canvas.LineTo(36, 54);
    end;
  2:
    begin
      Panel4.Canvas.Pen.Color := cl.clText;
      Panel4.Canvas.Pen.Width := 2;
      Panel4.Canvas.MoveTo(21, 99);
      Panel4.Canvas.LineTo(26, 104);
      Panel4.Canvas.MoveTo(26, 104);
      Panel4.Canvas.LineTo(36, 94);
    end;
  end;
end;

procedure TForm1.Panel5Paint(Sender: TObject);
var
  R: TRect;
begin
  Panel5.Canvas.Brush.Color := Form1.Color;
  panel5.Canvas.Brush.Style := bsSolid;
  Panel5.Canvas.FillRect(0, 0, Panel5.Width, Panel5.Height);

  Panel5.canvas.Pen.Color := cl.clSndTrdBordeBtn;
  Panel5.Canvas.Pen.Width := 1;
  Panel5.Canvas.Brush.Color := cl.clHeadFont;
  Panel5.canvas.RoundRect(0,0,Panel5.Width, Panel5.Height, 20, 20);
  Panel5.Canvas.Line(0, 40, Panel5.Width, 40);

  Panel5.Canvas.Brush.Style := bsClear;
  Panel5.Canvas.Font.Name := 'Inter';
  Panel5.Canvas.Font.Color := cl.clText;
  Panel5.canvas.Font.Style := [fsBold];
  Panel5.Canvas.Font.Size := 8;
  R.Left   := 20;
  R.Top    := (Panel5.Height div 2) * 0 + 20 -
              (Panel5.Canvas.TextHeight(cboptX) div 2);
  R.Right  := R.Left + Panel5.Canvas.TextWidth(cboptX);
  R.Bottom := R.Top  + Panel5.Canvas.TextHeight(cboptX);
  Panel5.Canvas.TextRect(R, R.Left, R.Top, cboptX);
end;

procedure TForm1.Panel6Paint(Sender: TObject);
var
  r: TRect;
begin
  Panel6.Canvas.Brush.Color := Form1.Color;
  Panel6.Canvas.Brush.Style := bsSolid;
  Panel6.Canvas.FillRect(0, 0, Panel6.Width, Panel6.Height);

  Panel6.Canvas.Pen.Color := cl.clSndTrdBordeBtn;
  Panel6.Canvas.Pen.Width := 1;
  Panel6.Canvas.Brush.Color := cl.clHeadFont;
  Panel6.Canvas.RoundRect(0, 0, Panel6.Width, Panel6.Height, 20, 20);
  Panel6.Canvas.Line(0, 40, Panel6.Width, 40);

  Panel6.Canvas.Brush.Style := bsClear;
  Panel6.Canvas.Font.Name := 'Inter';
  Panel6.Canvas.Font.Color := cl.clText;
  Panel6.Canvas.Font.Style := [fsBold];
  Panel6.Canvas.Font.Size := 8;
  R.Left   := 20;
  R.Top    := (Panel6.Height div 2) * 0 + 20 -
              (Panel6.Canvas.TextHeight(cboptX) div 2);
  R.Right  := R.Left + Panel6.Canvas.TextWidth(cboptX);
  R.Bottom := R.Top  + Panel6.Canvas.TextHeight(cboptX);
  Panel6.Canvas.TextRect(R, R.Left, R.Top, cboptX);
end;

procedure TForm1.Panel7Paint(Sender: TObject);
var
  R: TRect;
begin
  Panel7.Canvas.Brush.Color := Form1.Color;
  Panel7.Canvas.Brush.Style := bsSolid;
  Panel7.Canvas.FillRect(0, 0, Panel7.Width, Panel7.Height);

  Panel7.Canvas.Pen.Color := cl.clSndTrdBordeBtn;
  Panel7.Canvas.Pen.Width := 1;
  Panel7.Canvas.Brush.Color := cl.clHeadFont;
  Panel7.Canvas.RoundRect(0, 0, Panel7.Width, Panel7.Height, 20, 20);
  Panel7.Canvas.Line(0, 40, Panel7.Width, 40);

  Panel7.Canvas.Brush.Style := bsClear;
  Panel7.Canvas.Font.Name := 'Inter';
  Panel7.Canvas.Font.Color := cl.clText;
  Panel7.Canvas.Font.Style := [fsBold];
  Panel7.Canvas.Font.Size := 8;

  R.Left   := 20;
  R.Top    := (Panel7.Height div 2) * 0 + 20 -
              (Panel7.Canvas.TextHeight(cboptX) div 2);
  R.Right  := R.Left + Panel7.Canvas.TextWidth(cboptX);
  R.Bottom := R.Top  + Panel7.Canvas.TextHeight(cboptX);
  Panel7.Canvas.TextRect(R, R.Left, R.Top, cboptX);
end;

procedure TForm1.Panel8Paint(Sender: TObject);
var
  r: TRect;
begin
  Panel8.Canvas.Brush.Color := Form1.Color;
  Panel8.Canvas.Brush.Style := bsSolid;
  Panel8.Canvas.FillRect(0, 0, Panel8.Width, Panel8.Height);

  Panel8.Canvas.Pen.Color := cl.clSndTrdBordeBtn;
  Panel8.Canvas.Pen.Width := 1;
  Panel8.Canvas.Brush.Color := cl.clHeadFont;
  Panel8.Canvas.RoundRect(0, 0, Panel8.Width, Panel8.Height, 20, 20);
  Panel8.Canvas.Line(0, 40, Panel8.Width, 40);

  Panel8.Canvas.Brush.Style := bsClear;
  Panel8.Canvas.Font.Name := 'Inter';
  Panel8.Canvas.Font.Color := cl.clText;
  Panel8.Canvas.Font.Style := [fsBold];
  Panel8.Canvas.Font.Size := 8;
  R.Left   := 20;
  R.Top    := (Panel8.Height div 2) * 0 + 20 -
              (Panel8.Canvas.TextHeight(prcCrr) div 2);
  R.Right  := R.Left + Panel8.Canvas.TextWidth(prcCrr);
  R.Bottom := R.Top  + Panel8.Canvas.TextHeight(prcCrr);
  Panel8.Canvas.TextRect(R, R.Left, R.Top, prcCrr);
end;

procedure TForm1.StringGrid1Click(Sender: TObject);
begin
  Panel4.Visible := false;
  oncbNorm := false;
  Image2MouseLeave(Sender);
end;

procedure TForm1.StringGrid1TopLeftChanged(Sender: TObject);
begin
  if oncbNorm then
  begin
    Exit;
  end;
  Trackbar1.Position := StringGrid1.LeftCol;
  TrackBar2.Position := StringGrid1.TopRow;
  if not(StringGrid2.Visible) then
    exit;
  Trackbar3.Position := StringGrid1.LeftCol;
  TrackBar4.Position := StringGrid1.TopRow;
end;

procedure TForm1.StringGrid2Click(Sender: TObject);
begin
  Panel4.Visible := false;
  oncbNorm := false;
  Image2MouseLeave(Sender);
end;

procedure TForm1.StringGrid2TopLeftChanged(Sender: TObject);
begin
  if oncbNorm then
  begin
    Exit;
  end;
  Trackbar3.Position := StringGrid2.LeftCol;
  TrackBar4.Position := StringGrid2.TopRow;
  Trackbar1.Position := StringGrid2.LeftCol;
  TrackBar2.Position := StringGrid2.TopRow;
end;

procedure TForm1.StringGrid3Click(Sender: TObject);
var
  i, j, k, value: Integer;
  prc: Real;
begin
  prc := prct / 10;
  value := StrToInt(StringGrid3.Cells[StringGrid3.Col, StringGrid3.Row]);
  k := 0;
  for i := 0 to StringGrid3.Row do begin
    if trunc(correlationP[i,0]) = value then begin
      for j := 1 to Length(correlationP[i]) - 1 do begin
        case prct of
        0: begin
            if (percentageCrrP[i,j] > 0) or (percentageCrrP[i,j] < 0) then
            begin
              StringGrid4.RowCount := k + 1;
              StringGrid4.Cells[0,k] := IntToStr(trunc(correlationP[i, j]));
              Inc(k);
            end;
          end;
        1, 2, 3, 4, 5, 6, 7, 8, 9: begin
            if (percentageCrrP[i,j] >= prc) or (percentageCrrP[i,j] <= -prc) then
            begin
              StringGrid4.RowCount := k + 1;
              StringGrid4.Cells[0,k] := IntToStr(trunc(correlationP[i, j]));
              Inc(k);
            end;
          end;
        10: begin
            if (percentageCrrP[i,j] >= 1) or (percentageCrrP[i,j] <= -1) then
            begin
              StringGrid4.RowCount := k + 1;
              StringGrid4.Cells[0,k] := IntToStr(trunc(correlationP[i, j]));
              Inc(k);
            end;
          end;
        end;
      end;
    end else begin
      for j := 1 to Length(correlationP[i]) - 1 do begin
        if Trunc(correlationP[i,j]) = value then
        begin
          case prct of
          0: begin
              if (percentageCrrP[i,j] > 0) or (percentageCrrP[i,j] < 0) then
              begin
                StringGrid4.RowCount := k + 1;
                StringGrid4.Cells[0,k] := IntToStr(trunc(correlationP[i, 0]));
                Inc(k);
              end;
            end;
          1, 2, 3, 4, 5, 6, 7, 8, 9: begin
              if (percentageCrrP[i,j] >= prc) or (percentageCrrP[i,j] <= -prc) then
              begin
                StringGrid4.RowCount := k + 1;
                StringGrid4.Cells[0,k] := IntToStr(trunc(correlationP[i, 0]));
                Inc(k);
              end;
            end;
          10: begin
              if (percentageCrrP[i,j] >= 1) or (percentageCrrP[i,j] <= -1) then
              begin
                StringGrid4.RowCount := k + 1;
                StringGrid4.Cells[0,k] := IntToStr(trunc(correlationP[i, 0]));
                Inc(k);
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  //for i := 0 to StringGrid4.RowCount - 1 do begin
  //  Memo1.Append(StringGrid4.Cells[0,i]);
  //end;

  Panel6.Height := 40 * StringGrid4.RowCount;
  StringGrid4.DefaultRowHeight := 40;
  StringGrid4.DefaultColWidth := 200;
  StringGrid4.Width := Panel6.Width;
  StringGrid4.Height := IfThen(Length(correlationP) > 10, 10 * 40,
                          Length(correlationP) * 40);
  xy1.X := StrtoInt(StringGrid3.Cells[StringGrid3.Col, StringGrid3.Row]);

  StringGrid4.Visible:=true;
  onBtn:=false;
  bclick:=false;
  Panel5.Visible := false;
  PaintBox3.Invalidate;
end;

procedure TForm1.StringGrid4Click(Sender: TObject);
var
  i: Integer;
begin
  Chart1LineSeries1.Clear;
  Chart1LineSeries1.ShowPoints := true;
  Chart1LineSeries1.ShowLines := false;
  xy1.Y := StrToInt(StringGrid4.Cells[StringGrid4.Col, StringGrid4.Row]);
  for i := 1 to StringGrid1.RowCount - 1 do begin
    Chart1LineSeries1.AddXY(StrToFloat(StringGrid1.Cells[xy1.X,i]),
    StrToFloat(StringGrid1.Cells[xy1.Y, i]));
  end;

  onBtn:=false;   
  bclick:=false;
  Panel6.Visible := false;
  PaintBox4.Invalidate;
end;

procedure TForm1.StringGrid5Click(Sender: TObject);
var
  i, value: Integer;
  data: Array of Real = nil;
  b: Array of Real = nil;
  mmax: TFloatPoint;
  average, stddesv, biascol, sknss, krtP, krt: Real;
begin
  SetLength(data, StringGrid1.RowCount - 1);
  SetLength(b,    StringGrid1.RowCount - 1);
  value := StrToInt(StringGrid5.Cells[StringGrid5.Col, StringGrid5.Row]);
  copyCol(data, value);
  topDownMergeSort(data, b, Length(data));

  mmax.X := data[0];
  mmax.y := data[High(data)];

  average := AVG(data, Length(data));
  stddesv := standarDesviation(data, Length(data), average);

  biascol := bias(data, average);
  sknss := skewness(data, average, stddesv);
  krtP := kurtosisPearson(data, average, stddesv);
  krt := kurtosis(data, average, stddesv);

  Memo1.Clear;
  Memo1.Append(Format('Estadisticos: Columna %d', [value]));
  Memo1.Append('');
  Memo1.Append('Mínimo - Máximo');
  Memo1.Append(Format('>>> %.4f - %.4f', [mmax.X, mmax.Y]));
  Memo1.Append('');
  Memo1.Append(Format('>>> Media:               %.4f', [average]));
  Memo1.Append('');
  Memo1.Append(Format('>>> Desviación estandar: %.4f', [stddesv]));
  Memo1.Append('');
  Memo1.Append('Sesgos');
  Memo1.Append(Format('>>> Sesgo de estimación: %.4f', [biascol]));
  Memo1.Append(Format('>>> Sesgo de asimetría:  %.4f', [sknss]));
  Memo1.Append('');
  Memo1.Append('Curtosis');
  Memo1.Append(Format('>>> Kurtosis de Pearson: %.4f', [krtP]));
  Memo1.Append(Format('>>> Kurtosis en exceso:  %.4f', [krt]));
  PaintBox2.OnClick(Sender);
end;

procedure TForm1.StringGrid6Click(Sender: TObject);
begin
  prct := StringGrid6.Row;
  //ShowMessage(IntToStr(prct));
  Panel8.Visible:=false;
  if OpenDialog1.FileName = '' then
    Exit;
  StringGrid3Click(Sender);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if FProgreso < 100 then
  begin
    Inc(FProgreso, 4);
    if FProgreso > 100 then
      FProgreso := 100;
    Panel4.Invalidate;
  end
  else
    Timer1.Enabled := False;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  if oncbNorm then
  begin
    Exit;
  end;
  StringGrid1.LeftCol := Trackbar1.Position;
  if TrackBar3.Visible then
  begin
    TrackBar3.Position := TrackBar1.Position;
    StringGrid2.LeftCol := Trackbar1.Position;
  end;
end;

procedure TForm1.TrackBar1Click(Sender: TObject);
begin
  if oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    Exit;
  end;
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
  if oncbNorm then
  begin
    Exit;
  end;
  StringGrid1.TopRow := Trackbar2.Position;
  if TrackBar4.Visible then
  begin
    TrackBar4.Position := TrackBar2.Position;
    StringGrid2.TopRow := Trackbar2.Position;
  end;
end;

procedure TForm1.TrackBar2Click(Sender: TObject);
begin
  if oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    Exit;
  end;
end;

procedure TForm1.TrackBar3Change(Sender: TObject);
begin
  if oncbNorm then
  begin
    Exit;
  end;
  StringGrid2.LeftCol := Trackbar3.Position;
  TrackBar1.Position := TrackBar3.Position;
  StringGrid1.LeftCol := Trackbar1.Position;
end;

procedure TForm1.TrackBar3Click(Sender: TObject);
begin
  if oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    Exit;
  end;
end;

procedure TForm1.TrackBar4Change(Sender: TObject);
begin
  if oncbNorm then
  begin
    Exit;
  end;
  StringGrid2.TopRow := Trackbar4.Position;
  TrackBar2.Position := TrackBar4.Position;
  StringGrid1.TopRow := Trackbar4.Position;
end;

procedure TForm1.TrackBar4Click(Sender: TObject);
begin
  if oncbNorm then
  begin
    Panel4.Visible := false;
    oncbNorm := false;
    Image2MouseLeave(Sender);
    Exit;
  end;
end;

initialization
  cl        := TClPallete.Create;
  oncbNorm  := False;
  optCB     := 0;
  onBtn     := False;
  outlier   := False;
  prct      := 0;
end.

