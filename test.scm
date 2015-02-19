(use gauche.test)
(test-start "commons")

(define (cube n)
  (* n n n ))

(test "cube" 27 (lambda () (cube 3)))
