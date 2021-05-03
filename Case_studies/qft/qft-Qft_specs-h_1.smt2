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

(declare-fun prefix_mndt (t) t)

(declare-fun infix_pldt (t t) t)

(declare-fun infix_asdt (t t) t)

(declare-fun inv (t) t)

;; Mul_distr_l
  (assert
  (forall ((x t) (y t) (z t))
  (= (infix_asdt x (infix_pldt y z)) (infix_pldt (infix_asdt x y)
                                     (infix_asdt x z)))))

;; Unitary
  (assert (forall ((x t)) (= (infix_asdt tone x) x)))

;; NonTrivialRing
  (assert (not (= tzero tone)))

(declare-fun infix_mndt (t t) t)

;; infix -._def
  (assert
  (forall ((x t) (y t)) (= (infix_mndt x y) (infix_pldt x (prefix_mndt y)))))

(declare-fun infix_sldt (t t) t)

;; infix /._def
  (assert
  (forall ((x t) (y t))
  (=> (not (= y tzero)) (= (infix_sldt x y) (infix_asdt x (inv y))))))

(declare-fun from_int (Int) Real)

;; opposite
  (assert (forall ((a t)) (= (infix_mndt a a) tzero)))

(declare-fun im () t)

;; im_Def
  (assert (= (infix_asdt im im) (prefix_mndt tone)))

(declare-fun r_to_t (Real) t)

;; r_to_t_zero
  (assert (= (r_to_t 0.0) tzero))

;; r_to_t_add
  (assert
  (forall ((i Real) (j Real))
  (= (infix_pldt (r_to_t i) (r_to_t j)) (r_to_t (+ i j)))))

;; twice_half
  (assert
  (= (infix_asdt (infix_pldt tone tone)
     (infix_sldt tone (infix_pldt tone tone))) tone))

(declare-fun pi1 () t)

(declare-fun mod1 (Int Int) Int)

(declare-fun infix_mngt (ty ty) ty)

(declare-fun infix_at (ty ty uni uni) uni)

;; infix @_sort
  (assert
  (forall ((a ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort b (infix_at b a x x1)))))

(declare-fun int_iterate (ty uni uni Int Int) uni)

;; int_iterate_sort
  (assert
  (forall ((im1 ty))
  (forall ((x uni) (x1 uni) (x2 Int) (x3 Int)) (sort im1
  (int_iterate im1 x x1 x2 x3)))))

(declare-fun ind_isum ((Array Int Int) Int Int) Int)

(declare-fun infix_pl_closure () (Array Int (Array Int Int)))

(declare-fun t2tb ((Array Int Int)) uni)

;; t2tb_sort
  (assert
  (forall ((x (Array Int Int))) (sort (infix_mngt int int) (t2tb x))))

(declare-fun tb2t (uni) (Array Int Int))

;; BridgeL
  (assert
  (forall ((i (Array Int Int)))
  (! (= (tb2t (t2tb i)) i) :pattern ((t2tb i)) )))

;; BridgeR
  (assert
  (forall ((j uni)) (! (= (t2tb (tb2t j)) j) :pattern ((t2tb (tb2t j))) )))

(declare-fun t2tb1 (Int) uni)

;; t2tb_sort
  (assert (forall ((x Int)) (sort int (t2tb1 x))))

(declare-fun tb2t1 (uni) Int)

;; BridgeL
  (assert
  (forall ((i Int)) (! (= (tb2t1 (t2tb1 i)) i) :pattern ((t2tb1 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (= (t2tb1 (tb2t1 j)) j) :pattern ((t2tb1 (tb2t1 j))) )))

(declare-fun t2tb2 ((Array Int (Array Int Int))) uni)

;; t2tb_sort
  (assert
  (forall ((x (Array Int (Array Int Int)))) (sort
  (infix_mngt int (infix_mngt int int)) (t2tb2 x))))

(declare-fun tb2t2 (uni) (Array Int (Array Int Int)))

;; BridgeL
  (assert
  (forall ((i (Array Int (Array Int Int))))
  (! (= (tb2t2 (t2tb2 i)) i) :pattern ((t2tb2 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (= (t2tb2 (tb2t2 j)) j) :pattern ((t2tb2 (tb2t2 j))) )))

;; infix +_closure_def
  (assert
  (forall ((y Int) (y1 Int))
  (= (tb2t1
     (infix_at int int
     (infix_at (infix_mngt int int) int (t2tb2 infix_pl_closure) (t2tb1 y))
     (t2tb1 y1))) (+ y y1))))

;; ind_isum_def
  (assert
  (forall ((f (Array Int Int)) (i Int) (j Int))
  (= (ind_isum f i j) (tb2t1
                      (int_iterate int (t2tb2 infix_pl_closure) (t2tb f) i j)))))

(declare-fun ind_iproduct ((Array Int Int) Int Int) Int)

(declare-fun infix_as_closure () (Array Int (Array Int Int)))

;; infix *_closure_def
  (assert
  (forall ((y Int) (y1 Int))
  (= (tb2t1
     (infix_at int int
     (infix_at (infix_mngt int int) int (t2tb2 infix_as_closure) (t2tb1 y))
     (t2tb1 y1))) (* y y1))))

;; ind_iproduct_def
  (assert
  (forall ((f (Array Int Int)) (i Int) (j Int))
  (= (ind_iproduct f i j) (tb2t1
                          (int_iterate int (t2tb2 infix_as_closure) (t2tb f)
                          i j)))))

(declare-fun power (Int Int) Int)

;; Power_one
  (assert (forall ((i Int)) (= (power i 1) i)))

(declare-fun i_to_t (Int) t)

;; i_to_t_def
  (assert (forall ((i Int)) (= (i_to_t i) (r_to_t (from_int i)))))

;; i_to_t_ttwo
  (assert (= (i_to_t 2) (infix_pldt tone tone)))

(declare-fun power_ (Int Int) Int)

;; power__def
  (assert
  (forall ((e Int) (i Int))
  (ite (<= 0 i) (= (power_ e i) (power e i)) (= (power_ e i) 0))))

(declare-sort angle 0)

(declare-fun angle1 () ty)

(declare-fun ang_exp (angle) t)

(declare-fun exp (t) t)

;; exp_h_pi
  (assert
  (= (exp (infix_sldt (infix_asdt im pi1) (infix_pldt tone tone))) im))

;; exp_two_pi
  (assert
  (= (exp (infix_asdt (infix_asdt im pi1) (infix_pldt tone tone))) tone))

(declare-fun real_to_ang (t) angle)

(declare-fun int_to_ang (Int Int) angle)

;; pow_inv_2_one
  (assert
  (forall ((i Int))
  (=> (= i 1)
  (= (i_to_t (power_ 2 i)) (infix_sldt tone (infix_pldt tone tone))))))

;; ang_minus_one_from_real
  (assert
  (= (int_to_ang 1 1) (real_to_ang (infix_sldt tone (infix_pldt tone tone)))))

(declare-sort bitvec 0)

(declare-fun bitvec1 () ty)

(declare-fun value (bitvec) (Array Int Int))

(declare-fun length (bitvec) Int)

(declare-fun in_range (bitvec Int) Bool)

;; in_range_def
  (assert
  (forall ((bv1 bitvec) (r Int))
  (= (in_range bv1 r) (and (<= 0 r) (< r (length bv1))))))

(declare-fun make_bv ((Array Int Int) Int) bitvec)

(declare-fun bv_to_int (bitvec) Int)

(declare-fun result (bitvec) (Array Int Int))

;; result_def
  (assert
  (forall ((bv1 bitvec) (k Int))
  (= (tb2t1 (infix_at int int (t2tb (result bv1)) (t2tb1 k))) (ite (in_range
                                                              bv1 k)
                                                              (* (tb2t1
                                                                 (infix_at
                                                                 int 
                                                                 int
                                                                 (t2tb
                                                                 (value bv1))
                                                                 (t2tb1 k))) 
                                                              (power 2
                                                              (- (- (length
                                                                    bv1) 1) k)))
                                                              1))))

;; bv_to_int_def
  (assert
  (forall ((bv1 bitvec))
  (= (bv_to_int bv1) (ind_isum (result bv1) 0 (length bv1)))))

(declare-fun int_to_bv (Int Int) bitvec)

(declare-fun fc (Int Int) (Array Int Int))

;; fc_def
  (assert
  (forall ((n Int) (i Int) (j Int))
  (= (tb2t1 (infix_at int int (t2tb (fc n i)) (t2tb1 j))) (- 1 (tb2t1
                                                               (infix_at 
                                                               int int
                                                               (t2tb
                                                               (value
                                                               (int_to_bv i
                                                               n)))
                                                               (t2tb1 j)))))))

;; product_int_to_bv_inv
  (assert
  (forall ((n Int) (i Int))
  (=> (and (<= 0 i) (< i (power 2 n)))
  (= (ind_iproduct (fc n i) 0 n) (ite (= i 0) 1 0)))))

(declare-fun bv_inversion (bitvec) bitvec)

(declare-fun result1 (bitvec) (Array Int Int))

;; result_def
  (assert
  (forall ((bv1 bitvec) (k Int))
  (= (tb2t1 (infix_at int int (t2tb (result1 bv1)) (t2tb1 k))) (tb2t1
                                                               (infix_at 
                                                               int int
                                                               (t2tb
                                                               (value bv1))
                                                               (t2tb1
                                                               (- (- 
                                                               (length bv1) k) 1)))))))

;; bv_inversion_def
  (assert
  (forall ((bv1 bitvec))
  (= (bv_inversion bv1) (make_bv (result1 bv1) (length bv1)))))

(declare-fun x () bitvec)

(declare-fun y () bitvec)

(declare-fun n () Int)

;; H
  (assert (< 0 n))

;; H
  (assert
  (= (ang_exp (int_to_ang (* (bv_to_int x) (bv_to_int (bv_inversion y))) n)) 
  (ang_exp
  (int_to_ang
  (mod1 (* (bv_to_int x) (bv_to_int (bv_inversion y))) (power_ 2 n)) 
  n))))

(assert
;; h
  (not false))
(check-sat)
