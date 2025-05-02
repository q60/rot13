class Main {
  static private function ch(xs: String): String {
    var encoded: String = "";
    var x, y:       Int;
    for (i in 0...xs.length) {
      x = xs.toUpperCase().charCodeAt(i);
      y = xs.charCodeAt(i);
      if (x <= 90 && x >= 65) {
        encoded += String.fromCharCode(Std.int(y + (-13 * ((x - 77.5) /
                                       Math.abs(x - 77.5)))));
      } else {
        encoded += String.fromCharCode(y);
      }
    }
    return encoded;
  }
  static public function main(): Void {
    Sys.println("Enter string to encode:");
    var toEncode: String = Sys.stdin().readLine();
    Sys.println('Encoded string:\n${ch(toEncode)}');
  }
}