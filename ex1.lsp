;; 1. 次の式を評価するとどうなるか
(print (cons 5 (list 6 7)))
;; (5 6 7)

(print (cons 5 '(list 6 7)))
;; (5 (list 6 7))

(print (list 3 'from 9 'gives (- 9 3)))
;; (list 3 from 9 gives 6)
;; (- 9 3) は9 - 3

(print (+ (length '(1 a 2 b)) (third '(1 a 2 b))))
;; (+ 4 2) -> 6

(print (rest '(cons is short for construct)))
;; (is short for construct)

;; リストを操作する関数
;; - FIRST 引数リストの最左要素を返す
;; - CAR （内部的にはconsセルの左側を返す）
;; - SECOND 引数リストの2番目の要素を返す
;; - THIRD 引数リストの3番目の要素を返す
;; - REST 引数リストの最左要素を除いたリストを返す
;;   CDR （内部的にはconsセルの右側を返す）
;; - CONS 次スライドで詳説
;; - LIST 次スライドで詳説


;; 2. 以下のエラーを直せ
;; (print (third (the quick brown fox))) -> ' を加える
(print (third '(the quick brown fox))) ;; -> brown

;; (print (list 2 and 2 is 4))
(print (list 2 'and 2 'is 4)) ;; -> (2 and 2 is 4)

;; (print (+ 1 '(length (list t t t t))))
(print (+ 1 (length (list t t t t)))) ;; -> 5

;; (print (cons 'Patrick (Seymour marvin)))
(print (cons 'Patrick '(Seymour marvin))) ;; -> (Patrick Seymour marvin)

;; (print (cons 'Patrick (list Seymour marvin)))
(print (cons 'Patrick (list 'Seymour 'marvin))) ;; -> (Patrick Seymour marvin)


;; 3. 次の式を評価するとどうなるか
(print (cons 'grapes '(of wrath)))   ;; -> (grapes of wrath)
(print (list t 'is 'not nil))        ;; -> (t is not nil)
(print (first '(list moose goose)))  ;; -> list
(print (first (list 'moose 'goose))) ;; -> moose
;; (print (('sweet 'home))) ;; -> エラー
;; (print (cons 'home ('sweet 'home)))  ;; -> エラー


;; 4. 前の距離計の値，今の距離計の値，消費したガソリンの量の３つの値の入力に対して，
;; その燃費を計算する関数 kilometer-per-literを定義しなさい

(defun kilometer-per-liter (x y z)
    (/ (- y x) z))

;; 5. リストを受け取り，そのリストの長さをリストの先頭の要素として加える関数 addlength を定義しなさい

(defun addlength (x)
    (cons (length x) x))
;; (print (addlength (list 1 2 3 5)))

;; 6. 次の関数において (scrabble 'tea) および (scrabble 'word) がどうなるか？
(defun scrabble (word)
    (list word 'is 'a 'word))
;; (print (scrabble 'tea))  ;; -> (tea is a word)
;; (print (scrabble 'word)) ;; -> (word is a word)

;; 7. 次の関数において (stooge 'moe 'curly 'larry) がどうなるか？
(defun stooge (larry moe curly)
    (list larry (list 'moe curly) curly 'larry))
(print (stooge 'moe 'curly 'larry)) ;; -> (moe (moe larry) larry larry)

;; 8. 以下の関数において，次式を評価するとどうなるか？
(defun mystery (x)
    (list (second x) (first x)))

(print (mystery '(dancing bear)))       ;; -> (bear dancing)
;; (print (mystery 'dancing 'bear))        ;; -> エラー
(print (mystery '(zowie)))              ;; -> (nil zowie)
(print (mystery (list 'first 'second))) ;; -> (second first)

