unit MyUtils;

interface

uses
  RegularExpressions;

type
  TUtils = class
  public
    class function ExtractLetters(Text: string): string;
    class function ExtractNumbers(Text: string): string;
  end;

implementation

class function TUtils.ExtractLetters(Text: string): string;
begin
  Result := TRegEx.Replace(Text, '[\W\d]', '');
end;

class function TUtils.ExtractNumbers(Text: string): string;
begin
  Result := TRegEx.Replace(Text, '\D', '');
end;

end.
