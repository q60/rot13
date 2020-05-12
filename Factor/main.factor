! This a simple ROT13 encoder script.
USING: kernel
       math
       sequences
       combinators
       ascii
       strings
       io ;
IN: main

: shift-letter ( base char -- encoded )
    [ - 13 + 26 mod ]
    [ + ]
    bi ;

: check-letter ( char -- char )
    {
      { [ dup LETTER? ]
          [ CHAR: A shift-letter ] }
      { [ dup letter? ]
          [ CHAR: a shift-letter ] }
      [ ]
    } cond ;

: encode-string ( string -- string )
    [ check-letter ] map ;

: encoder ( -- )
    "Enter string to encode:" print flush
    readln encode-string
    "Encoded string:" print
    print ;

MAIN: encoder
