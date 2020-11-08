Red [
  title: "rot13"
]

rotate: function [str][
  xs: parse str [collect
    [some
      [keep skip]]]
  ys: parse (uppercase str) [collect
    [some
      [keep skip]]]
  zs: ""
  i: 0
  foreach c xs [
    i: i + 1
    x: to-integer pick ys i
    y: to-integer c
    either (and~ (65 <= x) (90 >= x)) [
      append zs (to-char
        (to-integer
          y + (-13 * sign? (x - 77.5))))
    ][
      append zs (to-char y)
    ]
  ]
  return zs
]

print "Enter string to encode:"
print ["Encoded string:" newline (rotate input)]