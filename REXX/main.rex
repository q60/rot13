say "Enter string to encode:"
parse pull str

say "Encoded string:"
say translate(str, "nopqrstuvwxyzabcdefghijjlmNOPQRSTUVWXYZABCDEFGHIJKLM",,
                   "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
