(use slib)
(require `trace)

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))

(trace sine)
(print (sine 12.15))

; 12.15
; 4.05
; 1.3499999999999999
; 0.44999999999999996
; 0.15
; 0.049999999999999996
; (p 0.049999999999999996)
; ...割愛
;
; a 5回
;
; b 
; わからず。
; ここをみて理解！わかりやすい。
; @see http://d.hatena.ne.jp/awacio/20100212/1265983080
; log(3,a)
