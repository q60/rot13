;;; implementation in chicken scheme

;; for read-line
(import (chicken io))

;; i merged addition of 13 and subtraction of corresponding a
;; but otherwise algorithm is straightforward
(define (char-rot13 c)
  (cond
    [(and (char<=? #\a c) (char<=? c #\z))
      (integer->char (+ (remainder (- (char->integer c) 84) 26) 97))]
    [(and (char<=? #\A c) (char<=? c #\Z))
      (integer->char (+ (remainder (- (char->integer c) 52) 26) 65))]
    [else c]))

(display "Enter string to encode:\n")
(let ([line (read-line)])
  (display "Encoded string:\n")
  (do ([i 0 (+ i 1)])
    ((= i (string-length line)))
    (string-set! line i
                 (char-rot13 (string-ref line i))))
  (display line) (newline))
