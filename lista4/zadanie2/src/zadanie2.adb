with Ada.Text_Io;      use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Totient;

procedure Zadanie2 is
   N : Positive;
begin
   if Argument_Count = 0 then
      Put_Line ("Uzycie: zadanie2 liczba1 liczba2 ...");
      return;
   end if;

   for I in 1.. Argument_Count loop
      begin
         N := Positive'Value(Argument(I));
         Put_Line("Totient(" & Argument(I) & ") = " 
            & Positive'Image(Totient.Totient(N)));
      exception
         when Constraint_Error =>
            Put_Line("Błąd: " & Argument(I) & " nie jest liczbą całkowitą dodatnią");
      end;
   end loop;
end Zadanie2;
