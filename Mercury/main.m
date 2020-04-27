:- module main.

:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.

:- implementation.
:- import_module list, char, string.
:- func rot13(char) = char.

main(!IO) :-
  io.read_char(DoneReadChar, !IO),
  (
    DoneReadChar = ok(Char),
    io.write_char(rot13(Char), !IO),
    main(!IO)
    ;
    DoneReadChar = eof
    ;
    DoneReadChar = error(ErrorCode),
    io.format("%s\n", [s(io.error_message(ErrorCode))], !IO)
  ).

rot13(Char) =
  (
    if      Char = 'a' then 'n'
    else if Char = 'b' then 'o'
    else if Char = 'c' then 'p'
    else if Char = 'd' then 'q'
    else if Char = 'e' then 'r'
    else if Char = 'f' then 's'
    else if Char = 'g' then 't'
    else if Char = 'h' then 'u'
    else if Char = 'i' then 'v'
    else if Char = 'j' then 'w'
    else if Char = 'k' then 'x'
    else if Char = 'l' then 'y'
    else if Char = 'm' then 'z'
    else if Char = 'n' then 'a'
    else if Char = 'o' then 'b'
    else if Char = 'p' then 'c'
    else if Char = 'q' then 'd'
    else if Char = 'r' then 'e'
    else if Char = 's' then 'f'
    else if Char = 't' then 'g'
    else if Char = 'u' then 'h'
    else if Char = 'v' then 'i'
    else if Char = 'w' then 'j'
    else if Char = 'x' then 'k'
    else if Char = 'y' then 'l'
    else if Char = 'z' then 'm'
    else if Char = 'A' then 'N'
    else if Char = 'B' then 'O'
    else if Char = 'C' then 'P'
    else if Char = 'D' then 'Q'
    else if Char = 'E' then 'R'
    else if Char = 'F' then 'S'
    else if Char = 'G' then 'T'
    else if Char = 'H' then 'U'
    else if Char = 'I' then 'V'
    else if Char = 'J' then 'W'
    else if Char = 'K' then 'X'
    else if Char = 'L' then 'Y'
    else if Char = 'M' then 'Z'
    else if Char = 'N' then 'A'
    else if Char = 'O' then 'B'
    else if Char = 'P' then 'C'
    else if Char = 'Q' then 'D'
    else if Char = 'R' then 'E'
    else if Char = 'S' then 'F'
    else if Char = 'T' then 'G'
    else if Char = 'U' then 'H'
    else if Char = 'V' then 'I'
    else if Char = 'W' then 'J'
    else if Char = 'X' then 'K'
    else if Char = 'Y' then 'L'
    else if Char = 'Z' then 'M'
    else Char
  ).
