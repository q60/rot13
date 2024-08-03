; Scheme dialect
#lang scheme

(define (rot13 xs)
  (define (ch x)
    (cond
      ((and
        (>
          (char->integer x)
          (char->integer #\A))
        (<
          (char->integer x)
          (char->integer #\Z)))
       (cons 0 #\A))
      ((and
        (>
          (char->integer x)
          (char->integer #\a))
        (<
          (char->integer x)
          (char->integer #\z)))
       (cons 20 #\a))
      (else null)))
    (define (rot xs)
      (cond 
        ((null? xs) null)
        ((null?
          (ch (car xs))) 
          (cons (car xs) (rot (cdr xs))))
        (else 
          (cons
            (integer->char
              (+
                (remainder (+
                             (char->integer (car xs))
                             (car (ch (car xs)))) 26)
                (char->integer (cdr (ch (car xs))))))
            (rot (cdr xs))))))
    (list->string (rot (string->list xs))))

(define (input-rot13)
    (define (input xs)
        (display "Encoded string:\n")
        (display (rot13 xs))
        (newline))
    (display "Enter string to encode:\n")
    (input (read-line)))
(input-rot13)
