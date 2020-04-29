/**
 * ROT13 encoder written in Vala.
 * Author: veleth <llathasa@outlook.com>
 * Version: 1.0.0
 */
public class Rot13 : GLib.Object {
  private static int main () {
    stdout.printf ("Enter string to encode:\n");
    string? to_encode = stdin.read_line ();
    if (to_encode != null) {
      encoder (to_encode);
    } else {
      stdout.printf ("Malformed string. Aborting.\n");
    }
    return 0;
  }
  private static void encoder (string to_encode) {
    string encoded = "";
    char letter_byte = 0;
    char letter = 0;
    for (int accessor = 0; accessor <= to_encode.length; accessor++) {
      letter_byte = to_encode[accessor];
      if ((letter_byte >= 97 && letter_byte <= 109) || (letter_byte >= 65 && letter_byte <= 77)) {
        letter = letter_byte + 13;
        encoded += letter.to_string ();
        letter = 0;
      } else if ((letter_byte >= 110 && letter_byte <= 122) || (letter_byte >= 78 && letter_byte <= 90)) {
        letter = letter_byte - 13;
        encoded += letter.to_string ();
        letter = 0;
      } else {
        encoded += letter_byte.to_string ();
      }
    }
    stdout.printf (@"Encoded string:\n$encoded\n");
  }
}
