REBOL [
  Title: "rot13"
]

rotate: func [str][
  xs: collect [foreach c str  [keep c]]
  ys: collect [foreach c (uppercase str) [keep c]]
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