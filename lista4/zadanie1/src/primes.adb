with Ada.Unchecked_Deallocation;
with Ada.Numerics.Long_Elementary_Functions;
use Ada.Numerics.Long_Elementary_Functions;

package body Primes is

   type Bool_Array is array (Natural range <>) of Boolean;
   type Bool_Access is access Bool_Array;

   procedure Free is new Ada.Unchecked_Deallocation (Bool_Array, Bool_Access);

   --  Sito Eratostenesa: S (K) = True, gdy K jest pierwsze (K <= N)
   function Sieve (N : Positive) return Bool_Access is
      S : constant Bool_Access := new Bool_Array'(0 .. N => True);
      I : Natural := 2;
      J : Natural;
   begin
      S (0) := False;
      S (1) := False;

      while I <= N / I loop
         --  rownowazne I * I <= N
         if S (I) then
            J := I * I;
            while J <= N loop
               S (J) := False;
               exit when J > N - I;   
               J := J + I;
            end loop;
         end if;
         I := I + 1;
      end loop;
      return S;
   end Sieve;

   --  Gorne ograniczenie na N-ta liczbe pierwsza
   function Bound (N : Positive) return Positive is
      X : constant Long_Float := Long_Float (N);
   begin
      if N < 6 then
         return 15;
      end if;
      return Positive (X * (Log (X) + Log (Log (X)))) + 1;
   end Bound;

   function IsPrime (N : Positive) return Boolean is
      I : Natural := 3;
   begin
      if N = 1 then
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
   end IsPrime;

   function PrimeNumbers (N : Positive) return Positive is
      S     : Bool_Access := Sieve (N);
      Count : Natural := 0;
   begin
      for I in 2 .. N loop
         if S (I) then
            Count := Count + 1;
         end if;
      end loop;
      Free (S);
      return
        Count;     
   end PrimeNumbers;

   function Prime (N : Positive) return Positive is
      G     : constant Positive := Bound (N);
      S     : Bool_Access := Sieve (G);
      Count : Natural := 0;
   begin
      for I in 2 .. G loop
         if S (I) then
            Count := Count + 1;
            if Count = N then
               Free (S);
               return I;
            end if;
         end if;
      end loop;
      Free (S);
      raise Program_Error; 
   end Prime;

end Primes;
