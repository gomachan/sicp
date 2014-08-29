
#lang planet neil/sicp

(define (square x)
  (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x)
                     x)))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

(new-sqrt 9)

; 作用的順序の評価であるため、new-ifの引数である
; * good-enough? 
; * guess
; * new-sqrt-iter
; が評価されてしまう。
; となるとnew-sqrt-iterがと展開されていってしまうため、無限ループに陥る。

; 特殊形式ifは、p12に書いてあるとおり、述語式を最初に評価し、その結果によってどちらを利用するかを、決めるため、無限ループせず評価を行うことができる。