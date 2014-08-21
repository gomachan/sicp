
#lang planet neil/sicp

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(define ex1 (a-plus-abs-b 1 1))
(define ex2 (a-plus-abs-b 1 -1))
(= ex1 ex2)

; (if (> b 0) + -) => +か-
; (+か- a b)
; となるから bが1なら (+ a 1) -1なら (- a -1) みたいになるのでbの絶対値をたせる