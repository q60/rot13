package main

import "core:os"
import "core:fmt"
import "core:strings"

main :: proc() {
		fmt.println("Enter string to encode:")
		buf: [0x100]byte
		size, err := os.read(os.stdin, buf[:])
		if err == 0 {
				text := string(buf[0:size-1])

				for i in 0..<len(text) {
						switch text[i] {
						case 'a'..='m', 'A'..='M':
								buf[i] += 13
						case 'n'..='z', 'N'..='Z':
								buf[i] -= 13
						}
				}
				fmt.println("Encoded string:")
				fmt.println(text)
		}
}
