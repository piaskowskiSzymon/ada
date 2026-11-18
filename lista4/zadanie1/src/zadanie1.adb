with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Strings;
with Ada.Strings.Fixed;
with Primes;

procedure Zadanie1 is
   function Str (X : Positive) return String
   is (Ada.Strings.Fixed.Trim (Positive'Image (X), Ada.Strings.Left));

begin
   if Argument_Count /= 2 then
      Put_Line ("Uzycie: primes_app pn|pr|ip liczba");
      Set_Exit_Status (Failure);
      return;
   end if;

   declare
      Komenda : constant String := Argument (1);
      N       : constant Positive := Positive'Value (Argument (2));
   begin
      if Komenda = "pn" then
         Put_Line (Str (Primes.PrimeNumbers (N)));
      elsif Komenda = "pr" then
         Put_Line (Str (Primes.Prime (N)));
      elsif Komenda = "ip" then
         Put_Line (if Primes.IsPrime (N) then "true" else "false");
      else
         Put_Line ("Nieznana komenda: " & Komenda);
         Set_Exit_Status (Failure);
      end if;
   end;
end Zadanie1;
