(define (inc a)
    (+ a 1))

(define (dec a)
    (- a 1))

(define (+ a b)
    (if (= a 0)
        b
        (inc (+ (dec a) b))))


(print (+ 2 5))
;   (if (= 2 0)
;       5
;       (inc (+ (dec 2) 5)))
;           
;           (+ 1 5)
;           (if (= 1 0)
;               5
;               (inc (+ (dec 1) 5)))
;
;                   (+ 0 5)
;                   (if (= 0 0)
;                       5
;                       (inc (+ (dec 0) 5)))
;
;               (inc    5)
;       (inc    (inc    5))
;       (inc    6)
;       7
;
;再帰的プロセス

(define (+ a b)
    (if (= a 0)
        b
        (+ (dec a) (inc b))))

(print (+ 2 5))
;   (if (= 2 0)
;       5
;       (+ (dec 2) (inc 5)))
;           
;   (+ 1 6)
;       (if (= 1 0)
;           6
;           (+ (dec 1) (inc 6))
;
;   (+ 0 7)
;       (if (= 0 0)
;           7
;           (+ (dec 0) 6))
;   7
;
;反復的プロセス
