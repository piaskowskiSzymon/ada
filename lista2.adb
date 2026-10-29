with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_Io; use Ada.Integer_Text_IO;

procedure Lista2 is

   function Euklides (X, Y : Integer) return Integer is
      A    : Integer := X;
      B    : Integer := Y;
      Temp : Integer;
   begin
      while B /= 0 loop
         Temp := B;
         B := A mod B;
         A := Temp;
      end loop;
      return A;
   end Euklides;

   A, B : Integer;
begin
   Put_Line ("Podaj pierwszą liczbę całkowitą: ");
   Get (A);
   Put_Line ("Podaj drugą liczbę całkowitą: ");
   Get (B);
   Put_Line
     ("Największy wspólny dzielnik "
      & Integer'Image (A)
      & " i "
      & Integer'Image (B)
      & " to: "
      & Integer'Image (Euklides (A, B)));

end Lista2;
