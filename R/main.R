print("Enter string to encode:")
encoded <- ""

for (char in gtools::asc(to_encode)) {
  if ((char >= 65) && (char <= 77)) {
    encoded <- paste(encoded, gtools::chr(char+13), sep = "")
  } else if ((char >= 97) && (char <= 109)) {
    encoded <- paste(encoded, gtools::chr(char+13), sep = "")
  } else if ((char >= 78) && (char <= 90)) {
    encoded <- paste(encoded, gtools::chr(char-13), sep = "")
  } else if ((char >= 110) && (char <= 122)) {
    encoded <- paste(encoded, gtools::chr(char-13), sep = "")
  } else {
    encoded <- paste(encoded, gtools::chr(char), sep = "")
  }
}
print("Encoded string:")
print(encoded)