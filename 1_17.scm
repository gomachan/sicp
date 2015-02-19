(use gauche.test)
(use slib)
(require `trace)

(define (square n)
  (* n n))

; かしこい逐次平方君
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))


(define (double a)
  (+ a a))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (double (halve n)) n))

(define (* a b)
  (cond ((= b 0) a)
    ((even? b) (* (double a) (halve b)))
    ((* a (- b 1)))))

(test-start "halveを用いたeven?")

(test "0の時はtrue" #t (lambda() (even? 0)))
(test "1の時はfalse" #t (lambda() (even? 1)))
(test "2の時はtrue" #t (lambda() (even? 2)))

(test-start "乗算手続きの設計・実装")

(test "2x3は6" 6 (lambda() (* 2 3)))
(test "0x0は0" 0 (lambda() (* 0 0)))
(test "0x10は0" 0 (lambda() (* 0 10)))
(test "3x11は33" 33 (lambda() (* 3 11)))
