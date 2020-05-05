package main

import (
  "bufio"
  "fmt"
  "os"
)

func main() {
  var encode, encoded string
  fmt.Println("Enter string to encode: ")
  scanner := bufio.NewScanner(os.Stdin)
  scanner.Scan()
  encode = scanner.Text()
  for _, v := range encode {
    if 'A' <= v && v <= 'Z' {
      v = (v-'A'+13)%26 + 'A'
    } else if 'a' <= v && v <= 'z' {
        v = (v-'a'+13)%26 + 'a'
      }
    encoded += string(v)
  }
  fmt.Println("Encoded string: ")
  fmt.Println(encoded)
}
