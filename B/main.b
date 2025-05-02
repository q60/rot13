main() {
  auto char, _lock;
  _lock = 0;
  printf("Enter string to encode:*n");
  input:
    char = getchar();
    if (_lock == 0) {
      _lock = printf("Encoded string:*n");
    }
    if (char != '*n') {
      if (((char >= 65) + (char <= 77)) == 2) {
        putchar(char + 13);
      } else if (((char >= 97) + (char <= 109)) == 2) {
        putchar(char + 13);
      } else if (((char >= 78) + (char <= 90)) == 2) {
        putchar(char - 13);
      } else if (((char >= 110) + (char <= 122)) == 2) {
        putchar(char - 13);
      } else {
        putchar(char);
      }
      goto input;
    }
  putchar('*n');
}