(println "Enter string to encode:")
(def to-encode
  (map int
    (seq (read-line))))

(println "Encoded string:")
(doseq [letter to-encode]
  (cond
    (or
      (and
        (>= letter 65)
        (<= letter 77))
      (and
        (>= letter 97)
        (<= letter 109)))
    (print
      (char
        (+ letter 13)))
    (or
      (and
        (>= letter 78)
        (<= letter 90))
      (and
        (>= letter 110)
        (<= letter 122)))
    (print
      (char
        (- letter 13)))
    :else
      (print
        (char letter))))
