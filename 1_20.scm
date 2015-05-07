(use gauche.test)
(use slib)
(require `trace)

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

; 正規順序評価
((gcd 206 40)
 (gcd 40 (remainer 206 40))
 (if (= (remainder 206 40) 0)) ; 1
 (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
 (if (= (remainder 40 (remainder 206 40)) 0)) ; 2
 (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
 (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)) ; 4
 (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
 (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)) ; 7
 (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; 4

; 18

; 作用的順序

(gcd 206 40)
(gcd 40 (remainder 206 40)) ; 1
 (gcd 40 6)
(gcd 6 (remainder 40 6)) ; 1
 (gcd 6 4)
 (gcd 4 (remainder 6 4))) ; 1
(gcd 4 2)
(gcd 2 (remainder 4 2)) ; 1
(gcd 2 0)
2

; 4
