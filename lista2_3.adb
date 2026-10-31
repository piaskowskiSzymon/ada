with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Lista2_3 is
   procedure rozklad (Liczba : Integer) is
      N         : Integer := Liczba;
      I         : Integer := 2;
      Mnozenie  : Boolean := True;
      Wykladnik : Integer := 0;
   begin
      if N < 2 then
         Put_Line ("Nie można rozłożyć na czynniki pierwsze");
         return;
      end if;
      while I * I <= N loop
         Wykladnik := 0;
         while N mod I = 0 loop
            Wykladnik := Wykladnik + 1;
            N := N / I;
         end loop;
         if Wykladnik > 0 then
            if Mnozenie = False then
               Put (" *");
            end if;
            if Wykladnik = 1 then
               Put (I'Img);
            else
               Put (I'Img & " ^" & Wykladnik'Img);
            end if;
            Mnozenie := False;
         end if;
         I := I + 1;
      end loop;
      if N > 1 then
         if Mnozenie = false then
            Put (" *");
         end if;
         Put (N'Img);
      end if;
      New_Line;

   end rozklad;
   N : Integer;
begin
   Put_Line ("Podaj liczbe do rozkładu na czynniki pierwsze");
   Get (N);
   rozklad (N);
end Lista2_3;
