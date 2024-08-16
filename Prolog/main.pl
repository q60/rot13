:- initialization(main).

main :-
	write('Enter string to encode:'), nl,
	read_line([], Codes),
	write('Encoded string:'), nl,
	rot13(Codes, [], Result),
	print_line(Result), nl.

rot13([], Acc, Result) :- reverse(Acc, Result).
rot13([Char | Chars], Acc, Result) :-
	(
		((Char >= 65, Char =< 77); (Char >= 97, Char =< 109)) -> Rot is Char + 13
		;
		((Char >= 78, Char =< 90); (Char >= 110, Char =< 122)) -> Rot is Char - 13
		;
		Rot is Char
	),
	rot13(Chars, [Rot | Acc], Result).

read_line(Chars, Out) :-
	get_code(Char),
	(
		Char = 10 -> reverse(Chars, Out)
		;
		read_line([Char | Chars], Out)
	).

print_line([]) :- nl.
print_line([Code | Codes]) :-
	put_code(Code),
	print_line(Codes).
