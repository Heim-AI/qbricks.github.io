(set-logic AUFNIRA)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2: real arithmetic
;;; SMT-LIB2: integer arithmetic
(declare-sort uni 0)

(declare-sort ty 0)

(declare-fun sort (ty uni) Bool)

(declare-fun witness (ty) uni)

;; witness_sort
  (assert (forall ((a ty)) (sort a (witness a))))

(declare-fun int () ty)

(declare-fun real () ty)

(declare-sort t 0)

(declare-fun t1 () ty)

(declare-fun tzero () t)

(declare-fun infix_pldt (t t) t)

;; Unit_def_l
  (assert (forall ((x t)) (= (infix_pldt tzero x) x)))

(declare-fun im_part (t) Real)

;; Im_part_add
  (assert
  (forall ((i t) (j t))
  (= (im_part (infix_pldt i j)) (+ (im_part i) (im_part j)))))

(declare-fun real_ (t) Bool)

;; real__def
  (assert (forall ((x t)) (= (real_ x) (= (im_part x) 0.0))))

(declare-fun infix_lseqdt (t t) Bool)

(declare-fun infix_lsdt (t t) Bool)

(declare-fun infix_gteqdt (t t) Bool)

;; inf_st
  (assert
  (forall ((x t) (y t))
  (= (infix_lsdt x y) (and (infix_lseqdt x y) (not (= x y))))))

;; sup_eq
  (assert (forall ((x t) (y t)) (= (infix_gteqdt x y) (infix_lseqdt y x))))

;; Refl
  (assert (forall ((x t)) (infix_gteqdt x x)))

(declare-fun pi1 () t)

;; pi_def
  (assert (and (real_ pi1) (infix_lsdt tzero pi1)))

;; inf_to_non_sup_eq
  (assert
  (forall ((x t) (y t))
  (=> (real_ x)
  (=> (real_ y) (=> (infix_lsdt x y) (not (infix_gteqdt y x)))))))

(declare-fun infix_mngt (ty ty) ty)

(declare-fun matrix (ty) ty)

(declare-fun get (ty uni Int Int) uni)

;; get_sort
  (assert
  (forall ((a ty))
  (forall ((x uni) (x1 Int) (x2 Int)) (sort a (get a x x1 x2)))))

(assert
;; h
  (not false))
(check-sat)
