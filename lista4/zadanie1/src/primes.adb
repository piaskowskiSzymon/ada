with Ada.Numerics.Long_Elementary_Functions;
use Ada.Numerics.Long_Elementary_Functions;

package body Primes is

   type Bool_Array is array (Natural range <>) of Boolean;

   function Sieve (N : Positive) return Bool_Array is
      S : Bool_Array (0 .. N) := (0 | 1 => False, others => True);
      I : Positive := 2;
      J : Positive;
   begin
      while I <= N / I loop
         if S (I) then
            J := I;
            while J <= N / I loop
               S (I * J) := False;
               J := J + 1;
            end loop;
         end if;
         I := I + 1;
      end loop;
      return S;
   end Sieve;

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
      S     : constant Bool_Array := Sieve (N);
      Count : Natural := 0;
   begin
      for I in 2 .. N loop
         if S (I) then
            Count := Count + 1;
         end if;
      end loop;
      return Count;
   end PrimeNumbers;

   function Prime (N : Positive) return Positive is
      S     : constant Bool_Array := Sieve(Bound (N));
      Count : Natural := 0;
   begin
      for I in S'Range loop
         if S (I) then
            Count := Count + 1;
            if Count = N then
               return I;
            end if;
         end if;
      end loop;
      raise Program_Error;
   end Prime;

end Primes;
