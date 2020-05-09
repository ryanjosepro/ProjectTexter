unit ViewMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  System.Actions, Vcl.ActnList;

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
    procedure ActCapitalizedExecute(Sender: TObject);
    procedure ActLowercaseExecute(Sender: TObject);
    procedure ActUppercaseExecute(Sender: TObject);
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
end;

procedure TWindowMain.ActLowercaseExecute(Sender: TObject);
begin
  MemoResult.Text := LowerCase(MemoText.Text);
end;

procedure TWindowMain.ActCapitalizedExecute(Sender: TObject);
begin
  MemoResult.Text := Capitalize(MemoText.Text);
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

end.
