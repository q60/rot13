with Ada.Text_IO;     
with Ada.Strings.Unbounded;  
with Ada.Text_IO.Unbounded_IO;

procedure ROT13 is
    package SU renames Ada.Strings.Unbounded;
    package IO renames Ada.Text_IO;
    package TU renames Ada.Text_IO.Unbounded_IO;

    Str: SU.Unbounded_String;
    Char: Character;
    Tmp: Integer;
begin
    IO.Put ("Enter string to encode: ");
    Str := TU.Get_Line;
    
    for I in 1 .. SU.Length (Str) loop
        Char := SU.Element (Str, I);
        if 'a' <= Char and Char <= 'z'  then
            Tmp := (Character'Pos (Char) - Character'Pos ('a') + 13) mod 26 + Character'Pos('a');
            SU.Replace_Element (Str, I, Character'Val (Tmp));
        end if;
        if 'A' <= Char and Char <= 'Z'  then
            Tmp := (Character'Pos (Char) - Character'Pos ('A') + 13) mod 26 + Character'Pos('A');
            SU.Replace_Element (Str, I, Character'Val (Tmp));
        end if;
    end loop;
    
    IO.Put ("Encoded string: ");
    TU.Put_Line (Str);
end ROT13;
