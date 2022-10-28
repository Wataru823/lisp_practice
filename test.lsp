(print 'hello)

(print (+ 1 2))
(print (- 1 2))
(print (* 1 2))
(print (/ 1 2))

;; べき乗
(print (expt 3 4))
(print (expt 33 33))

;; 二つの引数が等しいか
(print (equal 1 1))
(print (equal 1 2))
(print (equal 'a 'a))

;; アトムであるか
(print (atom '(a b c d)))
(print (atom 'a))

;; 数値であるか
(print (numberp 1))
(print (numberp 'a))

;; シンボルであるか
(print (symbolp 1))
(print (symbolp 'a))

;; 0であるか
(print (zerop 1))
(print (zerop 0))

;; 奇数か
(print (oddp 1))
(print (oddp 2))

;; 偶数か
(print (evenp 1))
(print (evenp 2))

;; first, car: 最初の要素を返す
(print (first '(a b c d)))
(print (car '(a b c d)))
(print (car '(a b)))

;; rest, cdr: 最初の要素以外を返す
(print (rest '(a b c d)))
(print (cdr '(a b c d)))
(print (cdr '(a b)))

;; second: 2番目の要素を返す
(print (second '(a b c d)))
(print (first (rest '(a b c d)))) ;; firstとrestの組み合わせでも表現できる

;; third: 3番目の要素を返す
(print (third '(a b c d)))
(print (second (rest '(a b c d)))) ;; secondとrestの組み合わせでも表現できる

;; fourth: 4番目の要素を返す
(print (fourth '(a b c d)))
(print (third (rest '(a b c d)))) ;; thirdとrestの組み合わせでも表現できる

;; cons: 2つの引数からリストを作る
(print (cons 'a 'b))
(print (cons 'a 'nil))
(print (cons 'a ()))
(print (cons 'a '(b c)))

;; list: 引数のリストを作る(3つ以上の引数でも可)
(print (list 'a 'b 'c))
(print (cons 'a (cons 'b 'c)))
(print (cons 'a (cons 'b (cons 'c 'nil))))
(print '(a b c))

;; append: リストを連結する
(print (append '(a b) '(c d)))

;; length: リストの長さを返す
(print (length '(a b c)))

;; defun: 関数の定義
(defun factorial(n)
  (if (= n 0) 1
    (* n (factorial (- n 1)))))
(print (factorial 5))
