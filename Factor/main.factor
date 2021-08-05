USING: kernel
       io
       ascii
       math
       math.order
       sequences ;
IN: main

: rot13 ( str -- rot13 )
    [ dup ch>upper dup
      [ ascii? ] [ Letter? ] bi and
        [ 65 77 between?
          [ 13 + ]
          [ 13 - ] if ]
        [ drop ] if ] map
    ;

: main ( -- )
    "Enter string to encode:" print flush
    readln
    "Encoded string:" print
    rot13 print
    ;

MAIN: main
