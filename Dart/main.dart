import 'dart:io';

void main() {
  stdout.writeln("Enter string to encode:");
  String toEncode = stdin.readLineSync();
  String encoded  = "";
  toEncode.runes.forEach(
    (int rune) {
      int charNormal = String
        .fromCharCode(rune)
        .codeUnitAt(0);
      int charUpper  = String
        .fromCharCode(rune)
        .toUpperCase()
        .codeUnitAt(0);
      if (charUpper <= 77 && 65 <= charUpper) {
        encoded += String.fromCharCode(charNormal + 13);
      } else if (charUpper <= 90 && 77 <= charUpper) {
        encoded += String.fromCharCode(charNormal - 13);
      } else {
        encoded += String.fromCharCode(charNormal);
      }
    }
  );
  stdout.writeln("Encoded string:\n$encoded");
}
