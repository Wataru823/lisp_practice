;; 1. 要素が数のリストに対し，それぞれに 1 を足したリストを返す関数 ADD1 を定義しなさい．
(defun add1 (x)
    (mapcar #'(lambda (n) (+ n 1)) x))
(print (add1 '(1 2 3)))

;; 2. 要素が数のリストに対し，それぞれの数が 5 よりも大きいかどうかを判定し，
;; その真偽をリストで返す関数 GREATER-THAN-FIVE-P を定義しなさい．
(defun greater-than-five-p (x)
    (mapcar #'(lambda (n) (> n 5)) x))
(print (greater-than-five-p '(1 3 5 7 1 9)))

;; 3. (ON OFF ON ON) のようなリストを受取り，各要素を逆転させ (OFF ON
;; OFF OFF) のようにする関数 FLIP を作りなさい．
(defun flip (x)
    (mapcar #'(lambda (p) (if (equal p 'on) 'off 'on)) x))
(print (flip '(off on off)))

;; 4. 数のリストを受取り，1 と 5 の間の数のみをリストにして返す関数 PICK を定義しなさい
(defun pick (x)
    (remove-if-not #'(lambda (n) (if (and (> n 1) (< n 5)) n)) x))
(print (pick '(1 3 7 3 5 6)))

;; 5. 英単語列のリストを受取り，その中にあるtheの個数を返す関数COUNT-THEを定義しなさい
(defun count-the (x)
    (length (remove-if-not #'(lambda (n) (equal n 'the)) x)))
(print (count-the '(the dog is cute. it is the cat.)))

;; 6. 関数 REMOVE-IF-NOT と関数 MEMBER(以前定義した MEM と同じもの)
;; を使い，2 つの集合の積を求める関数 MY-INTERSECTIon を定義しなさい
(defun my-interesection (x y)
    (remove-if-not #'(lambda (n) (MEMBER n y)) x))
(print (my-interesection '(a b c d) '(a c e)))


;; 7. 数のリスト X と数 K を受取り，X の数のうちで K と大体同じもの (最初のみ)
;; を返す関数 ROUGHLY-EQUAL を定義しなさい．ただし，大体同じとは± 10 の範
;; 囲 (端点を含めず) にあるものとする
(defun roughly-equal (x k)
    (find-if #'(lambda (n) (and (> n (- k 10)) (< n (+ k 10)))) x))
(print (roughly-equal '(1 3 4 6 0 5 7 1) 15))


;; 8. 次の関数 foo は何をするものか？
;; (defun foo (x) (mapcar #'(lambda (e) e) x))
;; (print (foo '(1 2 3)))
;; リストをそのまま返す関数


