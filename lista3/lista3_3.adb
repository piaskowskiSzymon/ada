with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Long_Elementary_Functions; use Ada.Numerics.Long_Elementary_Functions;

procedure Lista3_3 is
   type Sito is array (Natural range<>) of Boolean;

   function Granica(N : Positive) return Positive is
   begin 
      if N <   6 then
         return 15;
      end if;
      return Positive (Long_Float'Floor(Long_Float (N) * (Log( Long_Float (N)) + Log (Log(Long_Float(N)))))) + 1;
   end Granica;
   procedure Wykonaj_Sito(S : in out Sito) is
      J : Natural;
   begin
      for I in 2 .. S'Last loop
         S (I) := True;
      end loop;
      for I in 2 .. S'Last loop
         if S(I) then
            J := I + I;
            while J <= S'Last loop
               S (J) := False;
               J := J + I;
            end loop;
         end if;
      end loop;
   end Wykonaj_Sito;
   function Licz_Pierwsze(S : Sito; M : Positive) return Natural is 
      C : Natural := 0;
   begin
      for I in 2 .. S'Last loop
         if S(I) then
            C := C + 1;
            if C = M then
               return I;
            end if;
         end if;
      end loop;
      return 0;
   end Licz_Pierwsze;
   function N_ta_Liczba_Pierwsza(N : Positive) return Natural is
      G : constant Positive := Granica(N);
      S : Sito (0 .. G);
   begin
      Wykonaj_Sito (S);
      return Licz_Pierwsze(S, N);
   end N_ta_Liczba_Pierwsza;

   N : Integer;

begin
   Put("Podaj n a otrzymasz n-tą liczbę pierwszą: ");
   Get(N);

   if N < 1 then
      Put_Line("Błędne dane n musi być >=1");
      return;
   end if;

   Put_Line("n-ta liczba pierwsza wynosi: " & Natural'Image(N_ta_Liczba_Pierwsza(N)));

exception
   when Data_Error =>
      Put_Line ("Bledne dane: oczekiwano liczby calkowitej.");
end Lista3_3;