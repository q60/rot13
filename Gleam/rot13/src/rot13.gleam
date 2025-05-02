import gleam/erlang
import gleam/io
import gleam/list
import gleam/result
import gleam/string

pub fn main() {
  case erlang.get_line("Enter string to encode:\n") {
    Ok(text) ->
      "Encoded string:\n"
      <> text
      |> string.to_utf_codepoints()
      |> encode([])
      |> string.from_utf_codepoints()
    Error(_) -> "Error reading line"
  }
  |> io.println()
}

fn encode(
  codepoints: List(UtfCodepoint),
  result: List(Result(UtfCodepoint, Nil)),
) -> List(UtfCodepoint) {
  case codepoints {
    [current, ..rest] -> encode(rest, [rotate(current), ..result])
    [] ->
      result
      |> result.all()
      |> result.unwrap([])
      |> list.reverse()
  }
}

fn rotate(codepoint: UtfCodepoint) -> Result(UtfCodepoint, Nil) {
  let char_int: Int = string.utf_codepoint_to_int(codepoint)

  case char_int {
    x if x >= 65 && x <= 77 || x >= 97 && x <= 109 -> x + 13
    x if x >= 78 && x <= 90 || x >= 110 && x <= 122 -> x - 13
    x -> x
  }
  |> string.utf_codepoint()
}
