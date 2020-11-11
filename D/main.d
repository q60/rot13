import std.stdio;
import std.conv;
import std.math;
import std.ascii;

void main() {
  writeln("Enter string to encode:");
  const string to_encode = readln();
  char[] encoded;
  for (int i = 0; i < to_encode.length; i++) {
    char x = toUpper(to_encode[i]);
    char y = to_encode[i];
    if (x >= 65 && x <= 90) {
      encoded ~= to!char(round(y + (-13 * (abs(x - 77.5)/(x - 77.5)))));
    } else {
      encoded ~= y;
    }
  }
  writef("Encoded string:\n%s", encoded);
}
