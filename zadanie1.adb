with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Hello is
	A, B, Temp : Integer;
begin
	Put ("Podaj pierwszą liczbę: ");
	Get(A);
	Put("Podaj drugą liczbę: ");
	Get(B);
	
	while B /= 0 loop
		Temp := B;
		B := A mod B;
		A := Temp;
	end loop;

	Put("NWD to: ");
	Put(abs A, width => 0);
	New_Line;

end Hello;