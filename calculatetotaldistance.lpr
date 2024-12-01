program CalculateTotalDistance;

{$mode delphi}{$H+}

uses
  SysUtils, Classes, Generics.Collections;

var
  LeftList, RightList: TList<Int64>;
  Line: string;
  Tokens: TArray<string>;
  i: Integer;
  TotalDistance: Int64;
  Lines: TStringList;

begin
  LeftList := TList<Int64>.Create;
  RightList := TList<Int64>.Create;
  Lines := TStringList.Create;
  try
    Lines.LoadFromFile('input.txt');
    for Line in Lines do
      if not Line.Trim.IsEmpty then
      begin
        Tokens := Line.Trim.Split([' ', #9], TStringSplitOptions.ExcludeEmpty);
        LeftList.Add(StrToInt64(Tokens[0]));
        RightList.Add(StrToInt64(Tokens[1]));
      end;

    LeftList.Sort;
    RightList.Sort;

    TotalDistance := 0;
    for i := 0 to LeftList.Count - 1 do
      TotalDistance := TotalDistance + Abs(LeftList[i] - RightList[i]);

    WriteLn('The total distance is: ', TotalDistance);
  finally
    LeftList.Free;
    RightList.Free;
    Lines.Free;
  end;
end.

