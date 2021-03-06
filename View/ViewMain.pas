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
    Actions: TActionList;
    ActUppercase: TAction;
    ActLowercase: TAction;
    ActCapitalized: TAction;
    ActWhatsapp: TAction;
    LblTotWithSpaces: TLabel;
    LblTotLetters: TLabel;
    LblTotNumbers: TLabel;
    LblTotWithoutSpaces: TLabel;
    ActLetters: TAction;
    ActNumbers: TAction;
    ActNoBreaklines: TAction;
    ActCopyToText: TAction;
    CheckWpp55: TCheckBox;
    CheckWpp62: TCheckBox;
    ActEsc: TAction;
    BtnUppercase: TButton;
    BtnLowercase: TButton;
    BtnCapitalized: TButton;
    BtnWppLink: TButton;
    BtnLetters: TButton;
    BtnNumbers: TButton;
    BtnNoBreaklines: TButton;
    SpeedButton8: TButton;
    SpeedButton1: TButton;
    BtnCopyText: TButton;
    procedure ActCapitalizedExecute(Sender: TObject);
    procedure ActLowercaseExecute(Sender: TObject);
    procedure ActUppercaseExecute(Sender: TObject);
    procedure ActWhatsappExecute(Sender: TObject);
    procedure MemoTextChange(Sender: TObject);
    procedure ActLettersExecute(Sender: TObject);
    procedure ActNumbersExecute(Sender: TObject);
    procedure ActNoBreaklinesExecute(Sender: TObject);
    procedure ActCopyToTextExecute(Sender: TObject);
    procedure ActEscExecute(Sender: TObject);
  private
    function Capitalize(s: string): string;
    procedure FocusAndSelect;
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
  FocusAndSelect;
end;

procedure TWindowMain.ActLowercaseExecute(Sender: TObject);
begin
  MemoResult.Text := LowerCase(MemoText.Text);
  FocusAndSelect;
end;

procedure TWindowMain.ActCapitalizedExecute(Sender: TObject);
begin
  MemoResult.Text := Capitalize(MemoText.Text);
  FocusAndSelect;
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

  FocusAndSelect;
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

  FocusAndSelect;
end;

procedure TWindowMain.ActWhatsappExecute(Sender: TObject);
var
  Text, WppNumber: string;
begin
  MemoResult.Clear;

  for Text in MemoText.Lines do
  begin
    WppNumber := TUtils.ExtractNumbers(Text);

    if CheckWpp62.Checked then
      WppNumber := '62' + WppNumber;

    if CheckWpp55.Checked then
      WppNumber := '55' + WppNumber;

    MemoResult.Lines.Add('https://api.whatsapp.com/send?phone=' + WppNumber);
  end;

  FocusAndSelect;
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

  FocusAndSelect;
end;

procedure TWindowMain.ActCopyToTextExecute(Sender: TObject);
begin
  MemoText.Text := MemoResult.Text;
end;

//////////////////////////////////////////////////////////////

procedure TWindowMain.FocusAndSelect;
begin
  MemoResult.SetFocus;
  MemoResult.SelectAll;
end;

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

  LblTotWithSpaces.Caption := 'Total Caracteres (com espa�os): ' + TotWithSpaces.ToString;
  LblTotWithoutSpaces.Caption := 'Total Caracteres (sem espa�os): ' + TotWithoutSpaces.ToString;
  LblTotLetters.Caption := 'Total Letras: ' + TotLetters.ToString;
  LblTotNumbers.Caption := 'Total N�meros: ' + TotNumbers.ToString;
end;

procedure TWindowMain.ActEscExecute(Sender: TObject);
begin
  Close;
end;

end.
