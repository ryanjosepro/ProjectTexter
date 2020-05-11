unit MyUtils;

interface

type
  TUtils = class
  public
    class function ExtractNumberInString(sChaine: String): String;
  end;

implementation

class function TUtils.ExtractNumberInString(sChaine: String): String;
var
  I: Integer;
begin
  Result := '' ;
  for I := 1 to length( sChaine ) do
  begin
    if sChaine[I] in ['0'..'9'] then
    begin
      Result := Result + sChaine[I];
    end;
  end;
end;

end.
