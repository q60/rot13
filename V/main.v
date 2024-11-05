import os

fn main() {
  mut encoded := ""
  println("Enter string to encode:")
  encode := os.input("")
  for v in encode {
    mut tmp := v
    if 'A'.bytes()[0] <= v && v <= 'Z'.bytes()[0] {
      tmp = (v - 'A'.bytes()[0] + 13) % 26 + 'A'.bytes()[0]
    } else if 'a'.bytes()[0] <= v && v <= 'z'.bytes()[0] {
      tmp = (v - 'a'.bytes()[0] + 13) % 26 + 'a'.bytes()[0]
    }
    encoded += tmp.ascii_str()
  }
  println("Encoded string:")
  println(encoded)
}
