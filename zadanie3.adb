with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Zadanie3 is
   N, P         : Integer;
   Kopia, Odwr  : Integer;
begin
   Put ("Podaj liczbe n: ");
   Get (N);
   Put ("Podaj podstawe p: ");
   Get (P);

   if N < 0 or P < 2 then
      Put_Line ("n musi byc >= 0, a p >= 2.");
      return;
   end if;

   Kopia := N;
   Odwr  := 0;

   while Kopia > 0 loop
      Odwr  := Odwr * P + Kopia mod P;
      Kopia := Kopia / P;
   end loop;

   if Odwr = N then
      Put_Line ("Liczba jest palindromem w tej podstawie.");
   else
      Put_Line ("Liczba nie jest palindromem w tej podstawie.");
   end if;
end Zadanie3;
