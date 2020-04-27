! This a simple ROT13 encoder script.
USING: kernel
       math
       sequences
       combinators
       ascii
       strings
       io ;
IN: main

: shift_letter ( base char -- encoded )
    [ - 13 + 26 mod ]
    [ + ]
    bi ;

: check_letter ( char -- char )
    {
      { [ dup LETTER? ]
          [ CHAR: A shift_letter ] }
      { [ dup letter? ]
          [ CHAR: a shift_letter ] }
      [ ]
    } cond ;

: encode_string ( string -- string )
    [ check_letter ] map ;

: encoder ( -- )
    "Enter string to encode:" print flush
    readln encode_string
    "Encoded string:" print
    print ;

MAIN: encoder
