mod rot13 {
    pub trait Rot13 {
        fn rot13(&self) -> String;
        fn unrot13(&self) -> String;
    }


    pub fn transform_to_index(ch: char) -> (bool, u8) {
        if ch.is_uppercase() {
            (true, ch as u8 - 'A' as u8)
        } else if ch.is_lowercase() {
            (false, ch as u8 - 'a' as u8)
        } else {
            (false, ch as u8)
        }
    }

    
    pub fn transform_to_ascii(uppercase: bool, ch: u8) -> char {
        if uppercase {
            (ch + 'A' as u8) as char
        } else {
            (ch + 'a' as u8) as char
        }
    }


    impl Rot13 for String {
        fn rot13(&self) -> String {
            self.chars().map(|ch: char| {
                let indexed = transform_to_index(ch);
    
                if indexed.1 <= 26 {
                    transform_to_ascii(indexed.0, (indexed.1 + 13) % 26)
                } else {
                    indexed.1 as char
                }
            }).collect::<String>()
        }

        
        /// Encoding already encoded string by rot13 algorithm second time
        /// returns the initial string due to number of letters in alphabet
        /// (26 letters in total, and shifting by 13 will make pairs like
        /// ('a', 'n') or ('n', 'a'))
        fn unrot13(&self) -> String {
            self.rot13()
        }
    }
}


use rot13::Rot13;
use std::io::{stdin, BufRead};


fn main() {
    println!("Enter string to encode:");

    let line: String = stdin()
        .lock()
        .lines()
        .next()
        .unwrap()
        .unwrap()
        .rot13();

    println!("Encoded string: {}", line);
}
