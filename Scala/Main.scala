import scala.io.StdIn.readLine
object Main {
  def rot13(toEncode: String) =
    toEncode.map({
      case char
        if (char.toUpper.toInt <= 77 && 65 <= char.toUpper.toInt)
        => (char + 13.toChar).toChar
      case char
        if (char.toUpper.toInt <= 90 && 77 <= char.toUpper.toInt)
        => (char - 13.toChar).toChar
      case char => char.toChar
    })
  def main(args: Array[String]): Unit = {
    println("Enter string to encode:")
    val toEncode: String = readLine()
    println(s"Encoded string:\n${rot13(toEncode)}")
  }
}
