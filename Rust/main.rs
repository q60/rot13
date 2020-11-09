mod rot13 {
    pub const ASCII_LATIN_LENGTH: u8 = 26;

    pub fn rotate_by_basis(ch: char, basis: char) -> char {
        (((ch as u8 - basis as u8 + 13) % ASCII_LATIN_LENGTH) + basis as u8) as char
    }

    pub trait Rot13 {
        fn rot13(&self) -> String;
    }

    impl<T> Rot13 for T where T: AsRef<str> {
        fn rot13(&self) -> String {
            self.as_ref().chars().map(
                | ch: char | -> char {
                    // using return statements since without them
                    // there is no return inside `if`
                    if ch.is_ascii() {
                        if ch.is_uppercase() {
                            return rotate_by_basis(ch, 'A');
                        }
                        else if ch.is_lowercase() {
                            return rotate_by_basis(ch, 'a');
                        }
                    }

                    return ch;
                }
            ).collect::<String>()
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
