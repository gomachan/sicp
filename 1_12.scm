(use slib)
(require `trace)

(define (pascal-factor x y)
  (cond ((or (< x 1) (< y 1)) 0)
        ((> x y) 0)
        ((= x 1) 1)
        (else (+ (pascal-factor (- x 1) (- y 1) ) (pascal-factor x (- y 1)))) 
  )
)
(trace pascal-factor)

(print (pascal-factor 3 5))
