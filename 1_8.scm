; 1.8
; ここからgaucheに乗り換えw
; (x/y^2 + 2*y)/3
(define (cube x)
        (* (* x x) x))

(define (square x)
        (* x x))

(define (improve guess x)
        (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (new-good-enough? guess before)
  (< (abs (- guess before)) 0.001))

(define (cbrt-iter guess x before)
    (if (new-good-enough? guess before)
        guess
        (cbrt-iter (improve guess x)
                   x
                   guess)))

(define (cbrt x)
        (cbrt-iter 1.0 x 0.0))

(print (cbrt (cube 3)))
