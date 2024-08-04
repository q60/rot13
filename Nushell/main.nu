#!/usr/bin/env -S nu

# Encode text using ROT-13
def main [] {
  print "Enter string to encode:"
  input
  | tr '[a-mn-zA-MN-Z]' '[n-za-mN-ZA-M]'
  | $"Encoded string:\n($in)"
}
