(use slib)
(require `trace)

(define (expt-recur b n)
  (if (= n 0)
    1
    (* b (expt b (- n 1)))))

(define (expt-iterative b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
    product
    (expt-iter b
               (- counter 1)
               (* b product))))

(define (square n)
  (* n n))

; かしこい逐次平方君
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

; moduloとremainder
; どちらも割った数のあまりを返す。
; @see http://temping-amagramer.blogspot.jp/2008/06/schememodulo-remainder.html
; moduloは２つの数の符号が異なる場合は正数の方へよった挙動をする
; remainderはその逆。
