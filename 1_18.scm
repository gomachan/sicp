(use gauche.test)
(use slib)
(require `trace)

(define (double a)
  (+ a a))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (* a b)
  (*-iter a b 0))

(define (*-iter a b c)
  (cond ((= b 0) c)
    ((even? b) (*-iter (double a) (halve b) c))
    ((*-iter a (- b 1) (+ a c)))))

(test-start "halveを用いたeven?")

(test "0の時はtrue" #t (lambda() (even? 0)))
(test "1の時はfalse" #f (lambda() (even? 1)))
(test "2の時はtrue" #t (lambda() (even? 2)))

(test-start "乗算手続きの反復的プロセス")

(test "2x3は6" 6 (lambda() (* 2 3)))
(test "0x0は0" 0 (lambda() (* 0 0)))
(test "0x10は0" 0 (lambda() (* 0 10)))
(test "3x11は33" 33 (lambda() (* 3 11)))

