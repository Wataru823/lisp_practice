;; 1. 整数を受け取り，それが奇数のときは１を加えて偶数にする関数make-evenを
;; 定義しなさい．偶数の入力に対しては，そのままの数を返すものとする

(defun make-even (n)
    (if (ODDP n) (+ 1 n) n))
;; (print (make-even 11))

;; (defun make-even (n)
;;     (cond ((ODDP n) (+ 1 n))
;;         (t n)))

;; 述語 ー 真偽を返す関数
;;  NUMBERP 引数が数値なら真
;;  SYMBOLP 引数が記号なら真
;;  ZEROP 引数が数値0（または0.0）なら真
;;  ODDP 引数が奇数なら真
;;  EVENP 引数が偶数なら真
;;  > 第1引数（数値）が第2引数より大きければ真
;;  < 第1引数（数値）が第2引数より小さければ真
;;  EQUAL 第1引数と第2引数が同じなら真
;;  NOT 引数が真なら偽，引数が偽なら真


;; 2. ２つのリストを受け取り，最初のリストの長さが第2のリストの長さより長ければＴを，
;; そうでなければＮＩＬを返す関数 longer を定義しなさい
(defun longer (x y)
    (if (> (length x) (length y)) T nil))
;; (defun longer (x y)
;;     (cond ((> (length x) (length y)) T)
;;         ( t NIL)))
;; (defun longer (x y)
;;     (> (length x) (length y)))
;; (print (longer (list 1 2 3) (list 1 2)))


;; 3. ２つの整数を受け取り，それを昇順のリストにして返す関数 ordered を定義しなさい．
;; 例 (ordered 5 3) ⇒ (3 5)
(defun ordered (x y)
    (if (> x y) (list y x) (list x y)))
;; (defun ordered (x y)
;;     (cond ((< x y) (list x y))
;;         (t (list y x))))
;; (print (ordered 2 1))


;; 4. x, min, max という３つの数を受け取り，xがmaxより大きければmaxを返し，xがminより
;; 小さければminを返し，xがminとmaxの間にあればxを返す関数 constrain を定義しなさい
;; 例 (constrain 3 -30 30) ⇒ 3
(defun constrain (x min max)
    (cond ((> x max) max)
          ((< x min) min)
          (t x)))
;; (defun constrain (x min max)
;;     (if (< x min) min
;;         (if (> x max) max x)))
;; (print (constrain 1 2 3))


;; 7. 次式を評価するとどうなるか？
(print (and 'a 'b 'c)) ;; -> c
(print (or 'a 'b 'c)) ;; -> a
(print (or nil 'nagashima t)) ;; -> nagashima
(print (and 'a 'b nil)) ;; -> nil
(print (and (equal 'abc 'abc) 'yes)) ;; -> yes
(print (or (equal 'abc 'abc) 'yes)) ;; -> t
;; AND ｰ 引数を左から順々に評価していき，NILとなった段階で評価を止め，NIL
;; を返す．すべてがNILにならなければ，最後の値がAND全体の値となる．
;; OR － 引数を左から順々に評価していき，NIL以外の値となった段階で評価を止め，
;; その値を返す．評価する引数がなくなったらNILを返す


;; 5. 整数を受け取り，それが正の奇数のときは二乗し，負の奇数のときは2倍し，
;; それ以外のときは2で割る関数を定義しなさい
(defun foo (x)
    (cond ((AND (ODDP x) (> x 0)) (* x x))
          ((AND (ODDP x) (< x 0)) (* x 2))
          (t (/ x 2))))
;; (print (foo 4))


;; 6. 2つの整数を受け取り，両数とも0のとき，あるいは両数とも正のとき，あるいは両数とも
;; 負のときはTを返し，それ以外のときはNILを返す関数 same-sign を定義しなさい
(defun same-sign (x y)
    (if (or (and (= x 0) (= y 0))
             (and (> x 0) (> y 0))
             (and (< x 0) (< y 0))) t nil))
;; (defun same-sign (x y)
;;     (cond ((and (= x 0) (= y 0)) T)
;;           ((and (> x 0) (> y 0)) T)
;;           ((and (< x 0) (< y 0)) T)
;;           (t nil)))
;; (defun same-sign (x y)
;;     (cond ((and (zerop x) (zerop y)) T)
;;           ((> (* x y) 0) T)))
;; (print (same-sign 1 -1))


