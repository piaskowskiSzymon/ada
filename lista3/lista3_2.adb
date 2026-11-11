with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Lista3_2 is
   type Wynik_Typ is range 0 .. 2 ** 63 - 1;

   function Newton (N, K : Natural) return Wynik_Typ is
      Kk : Natural := K;
   begin
      if K > N then
         return 0;
      end if;

      if Kk > N - K then
         Kk := N - K;
      end if;

      declare
         T    : array (0 .. Kk) of Wynik_Typ := (0 => 1, others => 0);
         Gora : Natural;
      begin
         for I in 1 .. N loop
            Gora := Natural'Min (I, Kk);
            for J in reverse 1 .. Gora loop
               T (J) := T (J) + T (J - 1);
            end loop;
         end loop;
         return T (Kk);
      end;

   end Newton;

   N, K : Integer;

begin
   Put_Line ("Podaj górną liczbę dwumianu Newtona n: ");
   Get (N);
   Put_Line ("Podaj dolną liczbę dwumianu Newtona k: ");
   Get (K);
   
   if N < 0 or K < 0 then
      Put_Line ("Wprowadź liczby naturalne.");
      return;
   end if;

   if K > N then
      Put_Line ("Nie można obliczyć dwumianu Newtona, ponieważ k > n.");
      return;
   end if;
   Put_Line ("Wynik: " & Wynik_Typ'Image (Newton (N, K)));
exception
   when Data_Error =>
      Put_Line ("Wprowadź liczby naturalne.");
end Lista3_2;
