unit ViewMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  System.Actions, Vcl.ActnList, MyUtils;

type
  TWindowMain = class(TForm)
    MemoText: TMemo;
    MemoResult: TMemo;
    LblText: TLabel;
    LblResult: TLabel;
    BtnUppercase: TSpeedButton;
    Actions: TActionList;
    BtnLowercase: TSpeedButton;
    BtnCapitalized: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    ActUppercase: TAction;
    ActLowercase: TAction;
    ActCapitalized: TAction;
    ActWhatsapp: TAction;
    LblTotWithSpaces: TLabel;
    LblTotLetters: TLabel;
    LblTotNumbers: TLabel;
    LblTotWithoutSpaces: TLabel;
    SpeedButton1: TSpeedButton;
    ActLetters: TAction;
    ActNumbers: TAction;
    ActNoBreaklines: TAction;
    SpeedButton2: TSpeedButton;
    ActCopyToText: TAction;
    procedure ActCapitalizedExecute(Sender: TObject);
    procedure ActLowercaseExecute(Sender: TObject);
    procedure ActUppercaseExecute(Sender: TObject);
    procedure ActWhatsappExecute(Sender: TObject);
    procedure MemoTextChange(Sender: TObject);
    procedure ActLettersExecute(Sender: TObject);
    procedure ActNumbersExecute(Sender: TObject);
    procedure ActNoBreaklinesExecute(Sender: TObject);
    procedure ActCopyToTextExecute(Sender: TObject);
  private
    function Capitalize(s: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WindowMain: TWindowMain;

implementation

{$R *.dfm}

procedure TWindowMain.ActUppercaseExecute(Sender: TObject);
begin
  MemoResult.Text := UpperCase(MemoText.Text);
  MemoResult.SelectAll;
end;

procedure TWindowMain.ActLowercaseExecute(Sender: TObject);
begin
  MemoResult.Text := LowerCase(MemoText.Text);
  MemoResult.SelectAll;
end;

procedure TWindowMain.ActCapitalizedExecute(Sender: TObject);
begin
  MemoResult.Text := Capitalize(MemoText.Text);
  MemoResult.SelectAll;
end;

procedure TWindowMain.ActLettersExecute(Sender: TObject);
var
  Text: string;
begin
  MemoResult.Clear;

  for Text in MemoText.Lines do
  begin
    MemoResult.Lines.Add(TUtils.ExtractLetters(Text));
  end;

  MemoResult.SelectAll;
end;

procedure TWindowMain.ActNumbersExecute(Sender: TObject);
var
  Text: string;
begin
  MemoResult.Clear;

  for Text in MemoText.Lines do
  begin
    MemoResult.Lines.Add(TUtils.ExtractNumbers(Text));
  end;

  MemoResult.SelectAll;
end;

procedure TWindowMain.ActWhatsappExecute(Sender: TObject);
var
  Text: string;
begin
  MemoResult.Clear;

  for Text in MemoText.Lines do
  begin
    MemoResult.Lines.Add('https://api.whatsapp.com/send?phone=' + TUtils.ExtractNumbers(Text));
  end;

  MemoResult.SelectAll;
end;

procedure TWindowMain.ActNoBreaklinesExecute(Sender: TObject);
var
  Text: string;
begin
  MemoResult.Clear;

  for Text in MemoText.Lines do
  begin
    MemoResult.Text := MemoResult.Text + ' ' + Text;
  end;

  MemoResult.SelectAll;
end;

procedure TWindowMain.ActCopyToTextExecute(Sender: TObject);
begin
  MemoText.Text := MemoResult.Text;
end;

//////////////////////////////////////////////////////////////

function TWindowMain.Capitalize(s: string): string;
var
  flag: Boolean;
  i: Byte;
  t: string;
begin
  flag := True;
  s := AnsiLowerCase(s);
  t := EmptyStr;
  for i := 1 to Length(s) do
  begin
    if flag then
      t := t + AnsiUpperCase(s[i])
    else
      t := t + s[i];
    flag := (s[i] = ' ')
  end;
  Result := t;
end;

procedure TWindowMain.MemoTextChange(Sender: TObject);
var
  Line: string;
  TotWithSpaces, TotWithoutSpaces, TotLetters, TotNumbers: integer;
begin
  for Line in MemoText.Lines do
  begin
    TotWithSpaces := TotWithSpaces + Line.Length;

    TotWithoutSpaces := TotWithoutSpaces + Line.Replace(' ', '').Length;

    TotLetters := TotLetters + TUtils.ExtractLetters(Line).Length;

    TotNumbers := TotNumbers + TUtils.ExtractNumbers(Line).Length;
  end;

  LblTotWithSpaces.Caption := 'Total Caracteres (com espaços): ' + TotWithSpaces.ToString;
  LblTotWithoutSpaces.Caption := 'Total Caracteres (sem espaços): ' + TotWithoutSpaces.ToString;
  LblTotLetters.Caption := 'Total Letras: ' + TotLetters.ToString;
  LblTotNumbers.Caption := 'Total Números: ' + TotNumbers.ToString;
end;

end.
