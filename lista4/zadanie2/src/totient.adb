package body Totient is
   function Totient (N : Positive) return Positive is
      Wynik : Positive := N;
      M     : Positive := N;
      P     : Positive := 2;
   begin
      while P <= M / P loop
         if M mod P = 0 then
            Wynik := Wynik / P * (P - 1);
            while M mod p = 0 loop
               M := M / P;
            end loop;
         end if;
         P := P + 1;
      end loop;
      if M > 1 then
         Wynik := Wynik / M * (M - 1);
      end if;
      return Wynik;
   end;

end Totient;
