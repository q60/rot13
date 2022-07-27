#lang racket

(begin
  (displayln "Enter string to encode:")
  (define to-encode
    (read-line
     (current-input-port)))

  (define (rotate byte)
    (begin
      (define char-to-encode (char->integer byte))
      (cond
        [(or
          (and (<= char-to-encode 77) (>= char-to-encode 65))
          (and (<= char-to-encode 109) (>= char-to-encode 97)))
         (display (integer->char (+ char-to-encode 13)))]
        [(or
          (and (<= char-to-encode 90) (>= char-to-encode 78))
          (and (<= char-to-encode 122) (>= char-to-encode 110)))
         (display (integer->char (- char-to-encode 13)))]
        [else
         (display (integer->char char-to-encode))])))

  (displayln "Encoded string:")
  (define (encode-rot13 to-encode)
    (begin
      (define to-encode-list (string->list to-encode))
      (for-each
       (λ (byte) (rotate byte))
       to-encode-list)
      (newline)))
  (encode-rot13 to-encode))
