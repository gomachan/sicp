
#lang planet neil/sicp

(define (square x)
  (* x x))

(define (sqrt-iter guess x before)
  (if (new-good-enough? guess before)
      guess
      (sqrt-iter (improve guess x)
                 x
                 guess)))

(define (sqrt x)
  (sqrt-iter 1.0 x 0.0))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (new-good-enough? guess before)
  (< (abs (- guess before)) 0.001))

(define a 0.01)
(define b (square a))

(good-enough? a (* b 0.01))

; 精度よりも小さい値だとsquareするとさらに小さくなっていってしまうので正しく検知できない。

(define x 100000000)
(define y (square x)) 

(good-enough? x (+ y 0.1))

; 10^15から小数点を無視するようになってしまう。
; これは浮動小数点演算の表現できるのが15桁までということによる。
; 符号部 指数部 仮数部
;  1bit 11bit 52bit

(sqrt 2.0e-4)