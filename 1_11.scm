(use slib)
(require `trace)

(define (recursive n)
  (if (< n 3)
    n
    (+ 
      (recursive (- n 1))
      (* 2 (recursive (- n 2)))
      (* 3 (recursive (- n 3)))
    )
  )
)
(trace recursive)

(define (iterative n)
  (define (iter a b c s)
    (cond ((= s 2) a)
      ((= s 1) b)
      ((= s 0) c)
      (else (iter (+ a (* 2 b) (* 3 c)) a b (- s 1)))
    )
  )
  (iter 2 1 0 n)
)
(trace iterative)

(print (recursive 6))
(print (iterative 6))
