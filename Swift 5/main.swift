// Swift 5

print("Enter string to encode: ", terminator: "")
if let inp = readLine() {
  let out = String(inp.map { (c) -> Character in
    if c.isASCII && c.isLetter {
      if let ascii_c = c.asciiValue {
        return Character(UnicodeScalar((ascii_c - (c.isLowercase ? 97 : 65) + 13) % 26 + (c.isLowercase ? 97 : 65)))
      }
    }
    return c
  })
  print("Encoded string: \(out)")
}
else {
  print("Input error. Aborting.")
}
