with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Float_Text_IO;

procedure adaverage is
  type Tablica is array (Integer range <>) of Float;
  Arr : Tablica (1 .. Argument_Count);
  Avrg : Float := 0.0;
  Dom : Float := 0.0;
  Cnt : Integer := 0;
  MaxCnt : Integer := 0;
  Buf : Float := 0.0;
  Med : Float := 0.0;
  package FLT renames Ada.Float_Text_IO;
begin
  for i in 1 .. Argument_Count loop
    Arr (i) := Float'Value (Argument (i));
  end loop;

  for i in 1 .. Argument_Count loop
    Avrg := Avrg + Arr (i);
  end loop;
  Avrg := Avrg / Float(Argument_Count);

  for i in 1 .. Argument_Count loop
    for j in 1 .. Argument_Count loop
      if Arr (i) = Arr (j) then
        Cnt := Cnt + 1;
      end if;
    end loop;
    if Cnt > MaxCnt then
      MaxCnt := Cnt;
      Dom := Arr (i);
    end if;
    Cnt := 0;
  end loop;

  Buf := Float(Argument_Count);
  Buf := Buf / 2.0;
  Buf := Float'Rounding(Buf);
  if (Argument_Count mod 2) = 0 then
    Med := (Arr (Integer(Buf)) + Arr (Integer(Buf) + 1)) / 2.0;
  else
    Med := Arr (Integer(Buf));
  end if;
  
  New_Line(1);

  Put_Line("Average: ");
  Put("     ");
  FLT.Put(Item => Avrg, Fore => 2, Aft => 3, Exp => 0);
  New_Line(1);
  Put_Line("Dominant: ");
  Put("     ");
  FLT.Put(Item => Dom, Fore => 2, Aft => 3, Exp => 0);
  New_Line(1);
  Put_Line("Median: ");
  Put("     ");
  FLT.Put(Item => Med, Fore => 2, Aft => 3, Exp => 0);
  New_Line(1);
  
end adaverage;
