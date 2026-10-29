with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Lista2_2 is

   function czy_pierwsza (A : Integer) return Boolean is
      N : Integer := A;
      I : Integer := 3;
   begin
      if N < 2 then
         return False;
      end if;
      if N = 2 then
         return True;
      end if;
      if N mod 2 = 0 then
         return False;
      end if;
      while I <= N / I loop
         if N mod I = 0 then
            return False;
         end if;
         I := I + 2;
      end loop;
      return True;
   end czy_pierwsza;

   A : Integer;
begin
   Put_Line ("Podaj liczbę całkowitą a sprawdzę czy jest liczbą pierwszą: ");
   Get (A);
   if czy_pierwsza (A) then
      Put_Line ("Liczba" & Integer'Image (A) & " jest liczbą pierwszą.");
   else
      Put_Line ("Liczba" & Integer'Image (A) & " nie jest liczbą pierwszą.");
   end if;
end Lista2_2;
