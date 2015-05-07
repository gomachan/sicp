(use gauche.test)
(use slib)
(require `trace)

(define (even? n)
    (= (remainder n 2) 0))

(define (fib n)
    (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
    (cond ((= count 0) b)
          ((even? count)
           (fib-iter a
                     b
                     (+ (* p p) (* q q))
                     (+ (* q q) (* 2 p q))
                     (/ count 2)))
          (else (fib-iter (+ (* b q) (* a q) (* a p))
                          (+ (* b p) (* a q))
                          p
                          q
                          (- count 1)))))

; a' <- bq + aq + ap
; b' <- bp + aq

; a'' <- b'q + a'q + a'p
; b'' <- b'p + a'q

; a'' <- bq' + aq' + ap'
; b'' <- bp' + aq'

(test-start "対数的ステップ数で計算するFibonacci")

(test "0の時は0" 0 (lambda() (fib 0)))
(test "1の時は1" 1 (lambda() (fib 1)))
(test "2の時は1" 1 (lambda() (fib 2)))
(test "3の時は2" 2 (lambda() (fib 3)))
(test "4の時は3" 3 (lambda() (fib 4)))
(test "5の時は5" 5 (lambda() (fib 5)))
