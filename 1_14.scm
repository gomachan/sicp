(use slib)
(require `trace)

; 両替の場合の数の計算
(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  ; ちょうど0なら場合の数は1
  (cond ((= amount 0) 1)
        ; 0より少ないまたは硬貨の額面の金額が0なら場合の数は0
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        ; 最初の種類の硬貨以外を使う金額amountの両替の場合の数
        ; +
        ; 最初の硬貨の額面金額をdenominationとした時のn種類の硬貨を使う金額amount-denominationの両替の場合の数
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(trace count-change)

(print (count-change 11))

; @see https://pbs.twimg.com/media/B0okDbfCQAETEp5.jpg:large
