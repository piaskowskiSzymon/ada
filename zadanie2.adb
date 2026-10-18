with Ada.Text_IO;                      use Ada.Text_IO;
with Ada.Float_Text_IO;                use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
procedure Zadanie2 is
   A, B, C     : Float;
   Delta_Wart  : Float;
   X, X1, X2   : Float;
begin
   Put ("Podaj a: ");
   Get (A);
   Put ("Podaj b: ");
   Get (B);
   Put ("Podaj c: ");
   Get (C);

   if A = 0.0 then
      Put_Line ("To nie jest równanie kwadratowe (a = 0).");
      return;
   end if;

   Delta_Wart := B * B - 4.0 * A * C;

   if Delta_Wart < 0.0 then
      Put_Line ("Brak rozwiązań w zbiorze liczb rzeczywistych.");
   elsif Delta_Wart = 0.0 then
      X := -B / (2.0 * A);
      Put ("Jedno rozwiązanie: x = ");
      Put (X, Fore => 1, Aft => 4, Exp => 0);
      New_Line;
   else
      X1 := (-B - Sqrt (Delta_Wart)) / (2.0 * A);
      X2 := (-B + Sqrt (Delta_Wart)) / (2.0 * A);
      Put ("Dwa rozwiązania: x1 = ");
      Put (X1, Fore => 1, Aft => 4, Exp => 0);
      Put (", x2 = ");
      Put (X2, Fore => 1, Aft => 4, Exp => 0);
      New_Line;
   end if;
end Zadanie2;
