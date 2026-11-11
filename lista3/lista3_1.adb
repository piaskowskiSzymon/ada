with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Lista3_1 is
   function liczby_pierwsze (n : Natural) return Natural is
      type Sito is array (2 .. n) of Boolean;

      procedure wykonaj_sito (s : in out Sito) is
         j : Natural;
      begin
         for i in s'Range loop
            s (i) := True;
         end loop;
         for i in s'First .. s'Last loop
            if s (i) then
               j := i + i;
               while j <= n loop
                  s (j) := False;
                  j := j + i;
               end loop;
            end if;
         end loop;
      end wykonaj_sito;
      function licz_pierwsze (s : Sito) return Natural is
         c : Natural := 0;
      begin
         for i in s'First .. s'Last loop
            if s (i) then
               c := c + 1;
            end if;
         end loop;
         return c;
      end licz_pierwsze;
      s : Sito;
   begin
      wykonaj_sito (s);
      return licz_pierwsze (s);
   end liczby_pierwsze;

   n : Natural;

begin
   Put ("Podaj liczbe n: ");
   Get (n);

   Put_Line
     ("Liczba liczb pierwszych mniejszych lub rownych "
      & Natural'Image (n)
      & " wynosi: "
      & Natural'Image (liczby_pierwsze (n)));
exception
   when Constraint_Error | Data_Error =>
      Put_Line ("Bledne dane: podaj liczbe calkowita >= 0");
end Lista3_1;
