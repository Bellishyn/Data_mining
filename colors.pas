unit colors;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Graphics;

type
  TClPallete = Class
  private
    FClHeadFont:          TColor;
    FClOption:            TColor;
    FClSecondaryBtn:      TColor;
    FClTertiaryBtn:       TColor;
    FClText:              TColor;
    FClSecondaryText:     TColor;
    FClButton:            TColor;
    FClOnButton:          TColor;
    FClBorderButton:      TColor;
    FClSndTrdBordeBtn:    TColor;
    FClUnderline:         Tcolor;
    FClOnSecondaryBtn:    Tcolor;
    FClOnTertiaryBtn:     TColor;
    FClTable:             TColor;
    FClBtnText:           TColor;
    FClFigure:            TColor;
    FClLink:              TCOlor;
    FClSelect:            TColor;

  public
    constructor Create;
    destructor Destroy; override;

    property clHeadFont: TColor read FClHeadFont;
    property clOption: TColor read FClOption;
    property clSecondaryBtn: TColor read FClSecondaryBtn;
    property clOnSecondaryBtn: TColor read FClOnSecondaryBtn;
    property clText: TColor read FClText;
    property clSecondaryText: TColor read FClSecondaryText;
    property clButton: TColor read FClButton;
    property clOnButton: TColor read FClOnButton;
    property clBorderButton: TColor read FClBorderButton;
    property clUnderline: TColor read FClUnderline;
    property clTable: TColor read FClTable;
    property clBtnText: TColor read FClBtnText;
    property clOnTertiaryBtn: TColor read FClOnTertiaryBtn;
    property clSndTrdBordeBtn: TColor read FClSndTrdBordeBtn;
    property clTertiaryBtn: TColor read FClTertiaryBtn;
    property clFigure: TColor read FClFigure;
    property clLink: TColor read FClLink;
    property clSelect: TColor read FClSelect;
  end;
var
  color: TCLPallete;
implementation

constructor TClPallete.Create;
begin
  inherited;
  FClHeadFont       := RGBToColor(1,4,9);
  FClOption         := RGBToColor(13,17,23);
  FClSecondaryBtn   := RGBToColor(21,25,31);
  FClTertiaryBtn    := RGBToColor(33,40,48);
  FClText           := RGBToColor(240,246,252);
  FClSecondaryText  := RGBToColor(145,152,161);
  FClButton         := RGBToColor(32,122,49);
  FClOnButton       := RGBToColor(41,144,59);
  FClBorderButton   := RGBToColor(68,152,84);
  FClSndTrdBordeBtn := RGBToColor(61,68,77);
  FClUnderline      := RGBToColor(247,129,102);
  FClOnSecondaryBtn := RGBToColor(30,36,42);
  FClOnTertiaryBtn  := RGBToColor(38,44,54);
  FClTable          := RGBToColor(21,27,35);
  FClBtnText        := RGBToColor(255,255,255);
  FClFigure         := RGBToColor(200,206,213);
  FClLink           := RGBToColor(31,111,235);
  FClSelect         := RGBToColor(68,147,248);
end;

destructor TClPallete.Destroy;
begin
  inherited;
end;

initialization
 color := TClPallete.Create;

finalization
 color.Free;

end.

