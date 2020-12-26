program rot13;
var
	input: string;
	i: integer;

function ROT13(c: char): char;
begin
    if c in ['A'..'Z'] then
    	ROT13 := chr((ord(c) - ord('A') + 13) mod 26 + ord('A'))
    else if c in ['a'..'z'] then
    	ROT13 := chr((ord(c) - ord('a') + 13) mod 26 + ord('a'))
    else
    	ROT13 := c;
end;

begin
	write('Enter string to encode: ');
	read(input);

	write('Encoded string: ');
	for i := 1 to length(input) do
		write(ROT13(input[i]));

	writeln;
end.
