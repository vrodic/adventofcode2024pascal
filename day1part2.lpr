program day1part2;

{$mode delphi}{$H+} // Enable Delphi mode and long strings

uses
  SysUtils, Classes, Generics.Collections;

var
  LeftList: TList<Int64>;
  RightFreq: TDictionary<Int64, Int64>;
  Line: string;
  Tokens: TArray<string>;
  LeftNum, RightNum: Int64;
  i: Integer;
  TotalSimilarityScore: Int64;
  Lines: TStringList;

begin
  LeftList := TList<Int64>.Create;
  RightFreq := TDictionary<Int64, Int64>.Create;
  Lines := TStringList.Create;
  try
    Lines.LoadFromFile('input.txt');
    for Line in Lines do
      if not Line.Trim.IsEmpty then
      begin
        Tokens := Line.Trim.Split([' ', #9], TStringSplitOptions.ExcludeEmpty);

        LeftNum := StrToInt64(Tokens[0]);
        RightNum := StrToInt64(Tokens[1]);
        LeftList.Add(LeftNum);
        if RightFreq.ContainsKey(RightNum) then
          RightFreq[RightNum] := RightFreq[RightNum] + 1
        else
          RightFreq.Add(RightNum, 1);
      end;

    TotalSimilarityScore := 0;
    for i := 0 to LeftList.Count - 1 do
    begin
      LeftNum := LeftList[i];
      if RightFreq.ContainsKey(LeftNum) then
        TotalSimilarityScore := TotalSimilarityScore + LeftNum * RightFreq[LeftNum]
      else
        TotalSimilarityScore := TotalSimilarityScore + 0;
    end;

    WriteLn('The similarity score is: ', TotalSimilarityScore);
  finally
    LeftList.Free;
    RightFreq.Free;
    Lines.Free;
  end;
end.

