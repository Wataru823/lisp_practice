;; 1. (setf line '(a b c)) としてから、次の式を評価するとどうなるか?
(setf line '(a b c)) ;; setf: 代入

(print (append line (list (first line)))) ;; (a b c a)
(print (append (last line) line)) ;; (c a b c)
(print (list (first line) (last line))) ;; (a (c))
(print (cons (last line) line)) ;; ((c) a b c)
(print (append line '(d e f))) ;; (a b c d e f)

;; - consは新たなconsセルを1つ用意し，引数をくっつける
;; リストの先頭に要素を足す時に適している．
;; - listは任意個の引数をその数だけの新たなconsセルで結合する
;; 各consセルの左部（first部）は対応する引数を指す
;; 最後のconsセルの右部（rest部）はnilを指す（第2回講義資料を参照）
;; - appendは第一引数のリストをコピーすることで２つのリストを結合する


;; 2. リストを受けとり、リスト内の要素を逆順にしたものを返す関数 REV を定義しなさい。
;; 例: (rev '(1 2 3 4 5)) ⇒ (5 4 3 2 1)
(defun rev (x)
    (if (null x) nil (append (rev (rest x)) (list (first x)))))
(print (rev '(1 2 3 4 5)))


;; 3. 第1引数で与えられた要素を第2引数のリストから除いたリストを返す
(defun rm (x y)
    (cond ((null y) nil )
          ((equal x (first y)) (rm x (rest y)))
          (t (cons (first y) (rm x (rest y))))))
(print (rm '1 '(1 2 1 4)))


;; 4. 第2引数のリスト中に第1引数のオブジェクトが含まれているかどうかを調べる
;; （真のときの返り値はそのオブジェクト以降のリスト）
(defun mem (x y)
    (cond ((null y) nil)
          ((equal x (first y)) y)
          (t (mem x (rest y)))))
(print (mem t '(1 2 'aa t 1 2 'b)))

;; 5. 前ページの関数memを使って，リストＬにおいてＸがＹより先に現れていれば真値（nil以外）を返す関数
;; (beforep 'd 'b '(a b c d e)) ´ ⇒ nil

;; (defun beforep (x y L)
;;     (cond ((null L) nil)
;;           ((equal x (first L)) t)
;;           ((equal y (first L)) nil)
;;           (t (beforep x y (rest L)))))
(defun beforep (x y l)
    (mem y (mem x l)))
(print (beforep 'b 'd '(a b c d e)))


;; 6. リスト中の重複している要素を 1 つにする関数 RMDUP を定義しなさい。
;; 例: (rmdup '(b a n a n a)) ⇒ (b a n)
(defun rmdup (x)
    (cond ((null x) nil)
          ((mem (first x) (rest x)) (cons (first x) (rmdup (rm (first x) (rest x)))))
          (t (cons (first x) (rmdup (rest x))))))
(print (rmdup '(b a n a n a)))
; 順番が変わってよければ
;; (defun rmdup (x)
;; (cond ((null x) nil)
;; ((mem (first x) (rest x)) (rmdup (rest x)))
;; (t (cons (first x) (rmdup (rest x))))))
; こんな解もある
;; (defun rmdup (x)
;; (if x (cons (first x)
;; (rmdup (rm (first x) (rest x))))))


;; 7. 2 つの集合の和、積、差を求める関数をそれぞれ定義しなさい。
;; 例: (wa '(a b c) '(b d e)) ⇒ (a b c d e)
;; (seki '(a b c) '(b d e)) ⇒ (b)
;; (sa '(a b c d e) '(b d)) ⇒ (a c e)
(defun wa (x y)
    (rmdup (append x y)))
(print (wa '(a b c) '(b d e)))

(defun seki (x y)
    (cond ((null x) nil)
          ((mem (first x) y) (cons (first x) (seki (rest x) y)))
          (t (seki (rest x) y))))
(print (seki '(a b c) '(b d e)))

(defun sa (x y)
    (cond ((null x) nil)
          ((mem (first x) y) (sa (rest x) y))
          (t (cons (first x) (sa (rest x) y)))))
(print (sa '(a b c d e) '(b d)))


;; 表形式のデータ
;; 8. キーを与えてそのエントリを取り出す関数 LOOKUP を定義しなさい。
(setf x '((one eins) (two zwei) (three drei) (four vier)))
;; として (lookup 'three x) ⇒ (three drei), (lookup 'ten x) ⇒ nil

(defun lookup (key table)
    (cond ((null table) nil)
          ((equal key (first (first table))) (first table))
          (t (lookup key (rest table)))))
(print (lookup 'three x))


;; 木構造のデータ
;; 9. 任意の深さに入れ子になっているリスト中にあるすべての数の和を求める関数 SUM-TREE を定義しなさい。
;; 例: (sum-tree '((2 pens) ((or 4 5) books))) ⇒ 11
(defun sum-tree (x)
    (cond ((numberp x) x)
          ((atom x) 0)
          ((listp x) (+ (sum-tree (first x)) (sum-tree (rest x))))))
(print (sum-tree '((2 pens) ((or 4 5) books))))


;; 10. 任意の深さに入れ子になっているリストからすべてのシンボルを抜き出す関数 FLAT を定義しなさい。
;; 例: (flat '(a (i ((u)) (e) o))) ⇒ (a i u e o)
(defun flat (x)
    (cond ((null x) nil)
          ((atom x) (list x))
          ((listp x) (append (flat (first x)) (flat (rest x))))))
(print (flat '(a (i ((u)) (e) o))))


;; 11. 任意の深さに入れ子になっているリスト中のすべてのシンボルをシンボル z におきかえる関数 SLEEPY を定義しなさい。
;; 例: (sleepy '(a (i ((u)) (e) o))) ⇒ (z (z ((z)) (z) z)))
(defun sleepy (x)
    (cond ((null x) nil)
          ((atom x) 'z)
          ((listp x) (cons (sleepy (first x)) (sleepy (rest x))))))
(print (sleepy '(a (i ((u)) (e) o))))


;; 12. (format t “*”) を使って引数で与えられた数の * を横一列に出力する関数drawline
(format t "~%")
(defun drawline (x)
    (cond ((= x 0) nil)
          (t (format t "*") (drawline (- x 1)))))
;; (defun drawline (n)
;;     (if (= n 0) nil
;;         (let nil (format t "*") (drawline (- n 1)))))
(print (drawline 5))

;; 13. 関数drawline を使って横ｍ個，縦ｎ個の * を描く関数drawbox
(format t "~%~%")
(defun drawbox (m n)
    (cond ((= n 0) nil)
          (t (drawline m) (format t "~%") (drawbox m (- n 1)))))
(print (drawbox 3 4))
