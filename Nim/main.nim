import strutils

proc rot13(charToEncode: char): char =
  case toUpperAscii(charToEncode)
    of 'A'..'M': chr(
      ord(charToEncode) + 13)
    of 'N'..'Z': chr(
      ord(charToEncode) - 13)
    else: charToEncode

echo "Enter string to encode:"
var textToEncode = readLine(stdin)
echo "Encoded string:"
for charToEncode in text_to_encode:
  stdout.write rot13(charToEncode)
echo ""
