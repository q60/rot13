:- module main.

:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.
:- pred encode(io::di, io::uo) is det.

:- implementation.
:- import_module list, char, string, int.
:- func rot13(int) = char.

main(!IO) :-
  io.write_string("Enter string to encode:\n", !IO),
  encode(!IO).

encode(!IO) :-
  io.read_char(Status, !IO),
  (
    if Status = ok(Char)
    then
    (
      if Char \= '\n'
      then
        io.write_char(rot13(to_int(Char)), !IO),
        encode(!IO)
      else io.nl(!IO)
    )
    else io.write_string("Read error.\n", !IO)
  ).

rot13(Char) =
  (
    if Char >= 65, Char =< 77; Char >= 97, Char =< 109
    then det_from_int(Char + 13)
    else if Char >= 78, Char =< 90; Char >= 110, Char =< 122
    then det_from_int(Char - 13)
    else det_from_int(Char)
  ).
