const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('Enter string to encode:\n', (text) => {
  var encoded = "";

  for (i in text) {
    c = text[i].charCodeAt()
    if ('A'.charCodeAt() <= c && c <= 'Z'.charCodeAt()) {
      c = (c - 'A'.charCodeAt() + 13) % 26 + 'A'.charCodeAt()
    } else if ('a'.charCodeAt() <= c && c <= 'z'.charCodeAt()) {
      c = (c - 'a'.charCodeAt() + 13) % 26 + 'a'.charCodeAt()
    }
      encoded += String.fromCharCode(c)
	}
    console.log("Encoded string:")
    console.log(encoded)

  rl.close();
});
