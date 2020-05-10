void main() {
  import std.stdio;
  import std.conv;

  writeln("Enter string to encode:");
  string to_encode = readln();
  char[] encoded;
  int _byte;
  foreach (int _char; to_encode) {
    if ((_char >= 65 && _char <= 77) || (_char >= 97 && _char <= 109)) {
      _byte = (_char + 13);
    } else if ((_char >= 78 && _char <= 90) || (_char >= 110 && _char <= 122)) {
      _byte = (_char - 13);
    } else {
      _byte = _char;
    }
    encoded ~= to!char(_byte);
  }
  writeln("Encoded string");
  writeln(encoded);
}
