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

(declare-fun infix_eqeq (ty uni uni) Bool)

(declare-sort t 0)

(declare-fun t1 () ty)

(declare-fun tzero () t)

(declare-fun tone () t)

(declare-fun infix_pldt (t t) t)

(declare-fun infix_asdt (t t) t)

(declare-fun inv (t) t)

;; Inverse
  (assert
  (forall ((x t)) (=> (not (= x tzero)) (= (infix_asdt x (inv x)) tone))))

(declare-fun infix_sldt (t t) t)

;; infix /._def
  (assert
  (forall ((x t) (y t))
  (=> (not (= y tzero)) (= (infix_sldt x y) (infix_asdt x (inv y))))))

(declare-fun from_int (Int) Real)

;; Monotonic
  (assert
  (forall ((x Int) (y Int)) (=> (<= x y) (<= (from_int x) (from_int y)))))

(declare-fun real_part (t) Real)

(declare-fun im_part (t) Real)

(declare-fun real_ (t) Bool)

(declare-fun t2tb (Real) uni)

;; t2tb_sort
  (assert (forall ((x Real)) (sort real (t2tb x))))

(declare-fun tb2t (uni) Real)

;; BridgeL
  (assert (forall ((i Real)) (! (= (tb2t (t2tb i)) i) :pattern ((t2tb i)) )))

;; BridgeR
  (assert
  (forall ((j uni)) (! (= (t2tb (tb2t j)) j) :pattern ((t2tb (tb2t j))) )))

;; real__def
  (assert
  (forall ((x t))
  (= (real_ x) (infix_eqeq real (t2tb (im_part x)) (t2tb 0.0)))))

(declare-fun infix_lseqdt (t t) Bool)

(declare-fun t2tb1 (t) uni)

;; t2tb_sort
  (assert (forall ((x t)) (sort t1 (t2tb1 x))))

(declare-fun tb2t1 (uni) t)

;; BridgeL
  (assert (forall ((i t)) (! (= (tb2t1 (t2tb1 i)) i) :pattern ((t2tb1 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort t1 j) (= (t2tb1 (tb2t1 j)) j)) :pattern ((t2tb1 (tb2t1 j))) )))

;; infix <=._def
  (assert
  (forall ((x t) (y t))
  (= (infix_lseqdt x y)
  (or (and (real_ x) (and (real_ y) (<= (real_part x) (real_part y))))
  (infix_eqeq t1 (t2tb1 x) (t2tb1 y))))))

(declare-fun infix_lsdt (t t) Bool)

;; infix <._def
  (assert
  (forall ((x t) (y t))
  (= (infix_lsdt x y)
  (and (infix_lseqdt x y) (not (infix_eqeq t1 (t2tb1 x) (t2tb1 y)))))))

(declare-fun infix_gtdt (t t) Bool)

;; infix >._def
  (assert
  (forall ((x t) (y t))
  (= (infix_gtdt x y)
  (and (infix_lseqdt y x) (not (infix_eqeq t1 (t2tb1 x) (t2tb1 y)))))))

;; Trans
  (assert
  (forall ((x t) (y t) (z t))
  (=> (infix_lseqdt y x) (=> (infix_lseqdt z y) (infix_lseqdt z x)))))

;; Trans
  (assert
  (forall ((x t) (y t) (z t))
  (=> (infix_gtdt x y) (=> (infix_gtdt y z) (infix_gtdt x z)))))

(declare-fun pi1 () t)

;; pi_def
  (assert
  (and (real_ pi1)
  (and (infix_lsdt tzero pi1)
  (and (infix_lsdt tone pi1) (infix_lsdt (infix_pldt tone tone) pi1)))))

;; inf_to_non_sup_eq
  (assert
  (forall ((x t) (y t))
  (=> (real_ x)
  (=> (real_ y) (=> (infix_lsdt x y) (not (infix_lseqdt y x)))))))

;; mult_div
  (assert
  (forall ((x t) (y t))
  (=> (infix_lseqdt tzero x)
  (=> (infix_lsdt tzero y) (infix_lseqdt tzero (infix_sldt x y))))))

;; leq_by_div_simpl
  (assert
  (forall ((a t) (b t) (c t))
  (=> (infix_lseqdt tzero a)
  (=> (and (infix_lsdt tzero b) (infix_lseqdt b c))
  (= (infix_sldt a c) (infix_sldt a b))))))

;; transitive_inf_inv_r
  (assert
  (forall ((a t) (b t) (c t))
  (=> (infix_lseqdt a b)
  (=> (infix_lseqdt b (infix_sldt tone c))
  (=> (infix_lsdt tone c) (and (infix_lseqdt a b) (infix_lsdt b tone)))))))

(declare-fun infix_mngt (ty ty) ty)

(assert
;; h
  (not false))
(check-sat)
