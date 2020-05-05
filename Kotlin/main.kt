fun main() {
  println("Enter string to encode:")
  val line = readLine()
  var encoded = buildString { }
  if (line != null) {
    for (c in line.toCharArray()) {
      var chr: Char = c
      if (c in 'A'..'Z') {
        chr = 'A' + (c - 'A' + 13) % 26
      } else if (c in 'a'..'z') {
        chr = 'a' + (c - 'a' + 13) % 26
      }
      encoded += chr
    }
  }
  println("Encoded string:")
  println(encoded)
}
