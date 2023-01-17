;; 1. 数が要素のリストを受け取り，すべての要素の和を返す関数add-upを定義しなさい．
;; 例 (add-up ’(2 5 8)) ⇒ 15
(defun add-up (x)
    (if (null x) 0 (+ (first x) (add-up (rest x)))))
(print (add-up (list 1 2 3)))


;; 2. 非負の整数を受け取り，その数だけ‘HA’を並べたリストを返す関数laughを定義しなさい．
;; 例 (laugh 3) ⇒ (HA HA HA)
;; (laugh 0) ⇒ NIL
(defun laugh (x)
    (if (= x 0) nil (cons 'HA (laugh (- x 1)))))
;; (defun laugh (n)
;;     (if (zerop n) nil (cons  'HA (laugh (ｰ n 1)))))
(print (laugh 3))


;; 3. 正の整数を受け取り，その数から１までカウントダウンしたリストを返す
;; 関数count-downを定義しなさい．
;; 例 (count-down 5) ⇒ (5 4 3 2 1)
(defun count-down (n)
    (if (zerop n) nil (cons n (count-down (- n 1)))))
(print (count-down 3))


;; 4. 要素が整数のリストを受け取り，各々の数を二乗したリストを返す関数sq-listを定義しなさい．
;; 例 (sq-list ’(3 6 −5)) ⇒ (9 36 25)
(defun sq-list (n)
    (if (null n) nil (cons (* (first n) (first n)) (sq-list (rest n)))))
(print (sq-list '(3 6 -5)))


;; 5. 整数要素のリストを受け取り，その中に奇数があればＴを返す関数anyoddpを定義しなさい
(defun anyoddp (x)
    (if (null x) nil (or (ODDP (first x)) (anyoddp (rest x)))))
;; (defun anyoddp (x)
;;     (cond ((null x) NIL)
;;           ((oddp (first x)) T)
;;           (t (anyoddp (rest x)))))
(print (anyoddp '(2 4 1)))


;; 6. リストを受け取り，数の要素だけを選んでリストとして返す関数ex-numを定義しなさい．
;; 例 (ex-num ’(3 apples and 1 banana)) ⇒ (3 1)
(defun ex-num (x)
    (cond ((null x) NIL)
          ((numberp (first x)) (cons (first x) (ex-num (rest x))))
          (t (ex-num (rest x)))))
(print (ex-num '(3 apples and 1 banana)))


;; 7. 整数要素のリストを受け取り，リスト中の奇数の個数を返す関数cound-oddを定義しなさい
;; 例 (count-odd ’(4 5 6 7 8)) ⇒ 2
(defun count-odd (x)
    (cond ((null x) 0)
          ((oddp (first x)) (+ 1 (count-odd (rest x))))
          (t (count-odd (rest x)))))
(print (count-odd '(4 5 6 7 8)))

