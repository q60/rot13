cat("Enter string to encode:\n")
to_encode <- readLines("stdin", n = 1)

zip <- matrix(
    c(
      gtools::asc(to_encode),
      gtools::asc(toupper(to_encode))),
    ncol = 2)

encoded <- ""

for (row in 1:nrow(zip)) {
    zip[row,1] -> k
    zip[row,2] -> v
    if (v >= 65 && v <= 77) {
        encoded <- paste(encoded, gtools::chr(k+13), sep = "")
    } else if (v >= 78 && v <= 90) {
        encoded <- paste(encoded, gtools::chr(k-13), sep = "")
    } else {
        encoded <- paste(encoded, gtools::chr(k), sep = "")
    }
}
cat("Encoded string:\n")
cat(encoded, "\n")
