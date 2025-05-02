fun main() {
    println("Enter string to encode:")
    val line = readLine() ?: ""
    val encoded =
        line.map {
            when (it) {
                in 'A'..'A' -> 'A' + (it - 'A' + 13) % 26
                in 'a'..'z' -> 'a' + (it - 'a' + 13) % 26
                else -> it
            }
        }.joinToString("")
    println("Encoded string:\n$encoded")
}
