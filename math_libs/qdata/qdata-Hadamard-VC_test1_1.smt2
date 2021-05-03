(set-logic AUFNIRA)
;;; generated by SMT-LIB2 driver
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

(declare-fun tone () t)

(declare-fun prefix_mndt (t) t)

(declare-fun infix_sldt (t t) t)

(declare-fun infix_pldt (t t) t)

(declare-fun infix_asdt (t t) t)

(declare-fun infix_lseqdt (t t) Bool)

(declare-fun prefix_mnas (Real) Real)

(declare-fun infix_lseqas (Real Real) Bool)

(declare-fun infix_lsas (Real Real) Bool)

;; infix <*_def
  (assert
  (forall ((x Real) (y Real))
  (= (infix_lsas x y) (and (infix_lseqas x y) (not (= x y))))))

;; Refl
  (assert (forall ((x Real)) (infix_lseqas x x)))

;; Trans
  (assert
  (forall ((x Real) (y Real) (z Real))
  (=> (infix_lseqas x y) (=> (infix_lseqas y z) (infix_lseqas x z)))))

;; Comm
  (assert (forall ((x t) (y t)) (= (infix_asdt x y) (infix_asdt y x))))

;; NonTrivialRing
  (assert (not (= tzero tone)))

(declare-fun inv (t) t)

;; div_def
  (assert
  (forall ((x t) (y t))
  (=> (not (= y tzero)) (= (infix_sldt x y) (infix_asdt x (inv y))))))

;; absorbinf_zero
  (assert (forall ((x t)) (= (infix_asdt x tzero) tzero)))

(declare-fun real_part (t) Real)

(declare-fun im_part (t) Real)

(declare-fun real_ (t) Bool)

;; real__def
  (assert (forall ((x t)) (= (real_ x) (= (im_part x) 0.0))))

;; Inf_eq_def
  (assert
  (forall ((x t) (y t))
  (= (infix_lseqdt x y)
  (or
  (and (real_ x) (and (real_ y) (infix_lseqas (real_part x) (real_part y))))
  (= x y)))))

;; zeroLessOne
  (assert (infix_lseqdt tzero tone))

;; compat_order_mult
  (assert
  (forall ((x t) (y t) (z t))
  (=> (infix_lseqdt x y)
  (=> (real_ x)
  (=> (real_ y)
  (=> (real_ z)
  (=> (infix_lseqdt tzero z) (infix_lseqdt (infix_asdt x z)
  (infix_asdt y z)))))))))

(declare-fun set (ty) ty)

(declare-fun mem (ty uni uni) Bool)

(declare-fun infix_eqeq (ty uni uni) Bool)

;; infix ==_spec
  (assert
  (forall ((a ty))
  (forall ((s1 uni) (s2 uni))
  (and
  (=> (infix_eqeq a s1 s2) (forall ((x uni)) (= (mem a x s1) (mem a x s2))))
  (=> (forall ((x uni)) (=> (sort a x) (= (mem a x s1) (mem a x s2))))
  (infix_eqeq a s1 s2))))))

(declare-fun infix_mngt (ty ty) ty)

(declare-fun infix_at (ty ty uni uni) uni)

;; infix @_sort
  (assert
  (forall ((a ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort b (infix_at b a x x1)))))

(declare-fun map1 (ty ty uni uni) uni)

;; map_sort
  (assert
  (forall ((a ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set b) (map1 b a x x1)))))

(declare-fun op_neutral_left (ty uni uni) Bool)

;; op_neutral_left_def
  (assert
  (forall ((im ty))
  (forall ((op uni) (neutral uni))
  (= (op_neutral_left im op neutral)
  (forall ((e uni))
  (=> (sort im e)
  (= (infix_at im im (infix_at (infix_mngt im im) im op neutral) e) e)))))))

(declare-fun op_neutral_right (ty uni uni) Bool)

;; op_neutral_right_def
  (assert
  (forall ((im ty))
  (forall ((op uni) (neutral uni))
  (= (op_neutral_right im op neutral)
  (forall ((e uni))
  (=> (sort im e)
  (= (infix_at im im (infix_at (infix_mngt im im) im op e) neutral) e)))))))

(declare-fun op_assoc (ty uni) Bool)

;; op_assoc_def
  (assert
  (forall ((im ty))
  (forall ((op uni))
  (and
  (=> (op_assoc im op)
  (forall ((a uni) (b uni) (c uni))
  (= (infix_at im im
     (infix_at (infix_mngt im im) im op
     (infix_at im im (infix_at (infix_mngt im im) im op a) b)) c) (infix_at
                                                                  im im
                                                                  (infix_at
                                                                  (infix_mngt
                                                                  im im) im
                                                                  op a)
                                                                  (infix_at
                                                                  im im
                                                                  (infix_at
                                                                  (infix_mngt
                                                                  im im) im
                                                                  op b) c)))))
  (=>
  (forall ((a uni) (b uni) (c uni))
  (=> (sort im a)
  (=> (sort im b)
  (=> (sort im c)
  (= (infix_at im im
     (infix_at (infix_mngt im im) im op
     (infix_at im im (infix_at (infix_mngt im im) im op a) b)) c) (infix_at
                                                                  im im
                                                                  (infix_at
                                                                  (infix_mngt
                                                                  im im) im
                                                                  op a)
                                                                  (infix_at
                                                                  im im
                                                                  (infix_at
                                                                  (infix_mngt
                                                                  im im) im
                                                                  op b) c)))))))
  (op_assoc im op))))))

(declare-fun neutral (ty uni uni) Bool)

;; neutral_def
  (assert
  (forall ((im ty))
  (forall ((op uni) (neut uni))
  (= (neutral im op neut)
  (and (op_neutral_left im op neut)
  (and (op_neutral_right im op neut) (op_assoc im op)))))))

(declare-fun abs1 (Int) Int)

;; abs_def
  (assert
  (forall ((x Int)) (ite (<= 0 x) (= (abs1 x) x) (= (abs1 x) (- x)))))

(declare-fun cpower (t Int) t)

;; Cpower_zero
  (assert (forall ((i t)) (= (cpower i 0) tone)))

;; Cpower_plus_one
  (assert
  (forall ((i t))
  (forall ((n Int)) (= (cpower i n) (infix_asdt i (cpower i (- n 1)))))))

;; cpower_sum
  (assert
  (forall ((x t) (n Int) (m Int))
  (=> (<= 0 m) (= (cpower x (+ n m)) (infix_asdt (cpower x n) (cpower x m))))))

(declare-fun set1 (ty ty uni uni uni) uni)

;; set_sort
  (assert
  (forall ((a ty) (b ty))
  (forall ((x uni) (x1 uni) (x2 uni)) (sort (infix_mngt a b)
  (set1 b a x x1 x2)))))

(declare-fun rows (ty uni) Int)

(declare-fun columns (ty uni) Int)

(declare-fun valid_index (ty uni Int Int) Bool)

;; valid_index_def
  (assert
  (forall ((a ty))
  (forall ((a1 uni) (r Int) (c Int))
  (= (valid_index a a1 r c)
  (and (and (<= 0 r) (< r (rows a a1))) (and (<= 0 c) (< c (columns a a1))))))))

(declare-fun squarert_two () t)

;; squarertTwo
  (assert (= (cpower squarert_two 2) (infix_pldt tone tone)))

;; coeffs
  (assert
  (= (infix_sldt (prefix_mndt tone) squarert_two) (prefix_mndt
                                                  (infix_sldt tone
                                                  squarert_two))))

(declare-fun is_binary ((Array Int Int) Int Int) Bool)

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

;; is_binary_def
  (assert
  (forall ((t2 (Array Int Int)) (i Int) (j Int))
  (= (is_binary t2 i j)
  (forall ((k Int))
  (=> (and (<= i k) (< k j))
  (and (<= 0 (tb2t1 (infix_at int int (t2tb t2) (t2tb1 k))))
  (< (tb2t1 (infix_at int int (t2tb t2) (t2tb1 k))) 2)))))))

(declare-fun kronecker_neutral () (Array Int (Array Int t)))

(declare-fun add_mat ((Array Int (Array Int t))
  (Array Int (Array Int t))) (Array Int (Array Int t)))

(declare-fun infix_asdtdt (t
  (Array Int (Array Int t))) (Array Int (Array Int t)))

(declare-fun t2tb2 (t) uni)

;; t2tb_sort
  (assert (forall ((x t)) (sort t1 (t2tb2 x))))

(declare-fun tb2t2 (uni) t)

;; BridgeL
  (assert (forall ((i t)) (! (= (tb2t2 (t2tb2 i)) i) :pattern ((t2tb2 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort t1 j) (= (t2tb2 (tb2t2 j)) j)) :pattern ((t2tb2 (tb2t2 j))) )))

(declare-fun t2tb3 ((Array Int (Array Int t))) uni)

;; t2tb_sort
  (assert
  (forall ((x (Array Int (Array Int t)))) (sort
  (infix_mngt int (infix_mngt int t1)) (t2tb3 x))))

(declare-fun tb2t3 (uni) (Array Int (Array Int t)))

;; BridgeL
  (assert
  (forall ((i (Array Int (Array Int t))))
  (! (= (tb2t3 (t2tb3 i)) i) :pattern ((t2tb3 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (infix_mngt int (infix_mngt int t1)) j)
     (= (t2tb3 (tb2t3 j)) j)) :pattern ((t2tb3 (tb2t3 j))) )))

(declare-fun t2tb4 ((Array Int t)) uni)

;; t2tb_sort
  (assert (forall ((x (Array Int t))) (sort (infix_mngt int t1) (t2tb4 x))))

(declare-fun tb2t4 (uni) (Array Int t))

;; BridgeL
  (assert
  (forall ((i (Array Int t)))
  (! (= (tb2t4 (t2tb4 i)) i) :pattern ((t2tb4 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (infix_mngt int t1) j) (= (t2tb4 (tb2t4 j)) j)) :pattern (
  (t2tb4 (tb2t4 j))) )))

;; infix *.._spec
  (assert
  (forall ((s t) (m (Array Int (Array Int t))))
  (and (= (columns t1 (t2tb3 (infix_asdtdt s m))) (columns t1 (t2tb3 m)))
  (and (= (rows t1 (t2tb3 (infix_asdtdt s m))) (rows t1 (t2tb3 m)))
  (and
  (forall ((i Int) (j Int))
  (=> (valid_index t1 (t2tb3 (infix_asdtdt s m)) i j)
  (= (tb2t2
     (infix_at t1 int
     (infix_at (infix_mngt int t1) int (t2tb3 (infix_asdtdt s m)) (t2tb1 i))
     (t2tb1 j))) (infix_asdt s
                 (tb2t2
                 (infix_at t1 int
                 (infix_at (infix_mngt int t1) int (t2tb3 m) (t2tb1 i))
                 (t2tb1 j)))))))
  (forall ((i Int) (j Int))
  (= (valid_index t1 (t2tb3 (infix_asdtdt s m)) i j) (valid_index t1
  (t2tb3 m) i j))))))))

;; scalar_columns
  (assert
  (forall ((m (Array Int (Array Int t))) (a t))
  (= (columns t1 (t2tb3 (infix_asdtdt a m))) (columns t1 (t2tb3 m)))))

;; scalar_rows
  (assert
  (forall ((m (Array Int (Array Int t))) (a t))
  (= (rows t1 (t2tb3 (infix_asdtdt a m))) (rows t1 (t2tb3 m)))))

;; add_scal
  (assert
  (forall ((m (Array Int (Array Int t))) (n (Array Int (Array Int t))) (a t))
  (=> (= (rows t1 (t2tb3 m)) (rows t1 (t2tb3 n)))
  (=> (= (columns t1 (t2tb3 m)) (columns t1 (t2tb3 n)))
  (= (infix_asdtdt a (add_mat m n)) (add_mat (infix_asdtdt a m)
                                    (infix_asdtdt a n)))))))

(declare-fun bvlength ((Array Int Int) Int) Bool)

;; bvlength_def
  (assert
  (forall ((bv1 (Array Int Int)) (i Int))
  (= (bvlength bv1 i) (is_binary bv1 1 (+ i 1)))))

;; set_bvlength
  (assert
  (forall ((bv1 (Array Int Int)) (i Int))
  (=>
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k i))
  (and (<= 0 (tb2t1 (infix_at int int (t2tb bv1) (t2tb1 k))))
  (< (tb2t1 (infix_at int int (t2tb bv1) (t2tb1 k))) 2)))) (bvlength bv1 i))))

;; get_bvlength
  (assert
  (forall ((bv1 (Array Int Int)) (i Int))
  (=> (bvlength bv1 i)
  (forall ((k Int))
  (=> (and (<= 1 k) (<= k i))
  (and (<= 0 (tb2t1 (infix_at int int (t2tb bv1) (t2tb1 k))))
  (< (tb2t1 (infix_at int int (t2tb bv1) (t2tb1 k))) 2)))))))

(declare-fun length ((Array Int Int)) Int)

;; set_bv_to
  (assert
  (forall ((bv1 (Array Int Int)) (i Int))
  (=> (< 0 i)
  (=>
  (forall ((j Int))
  (=> (and (<= 1 j) (<= j i))
  (and (<= 0 (tb2t1 (infix_at int int (t2tb bv1) (t2tb1 j))))
  (<= (tb2t1 (infix_at int int (t2tb bv1) (t2tb1 j))) 1)))) (bvlength bv1 i)))))

(declare-fun make_bv ((Array Int Int) Int) (Array Int Int))

(declare-fun bin_and (Int Int) Int)

(declare-fun bin_andv ((Array Int Int) (Array Int Int)) (Array Int Int))

(declare-fun result ((Array Int Int) (Array Int Int)) (Array Int Int))

;; result_def
  (assert
  (forall ((bv1 (Array Int Int)) (bv2 (Array Int Int)) (i Int))
  (= (tb2t1 (infix_at int int (t2tb (result bv1 bv2)) (t2tb1 i))) (ite 
                                                                  (and
                                                                  (<= 1 i)
                                                                  (<= i 
                                                                  (length
                                                                  bv1)))
                                                                  (bin_and
                                                                  (tb2t1
                                                                  (infix_at
                                                                  int 
                                                                  int
                                                                  (t2tb bv1)
                                                                  (t2tb1 i)))
                                                                  (tb2t1
                                                                  (infix_at
                                                                  int 
                                                                  int
                                                                  (t2tb bv2)
                                                                  (t2tb1 i))))
                                                                  0))))

;; bin_andv_def
  (assert
  (forall ((bv1 (Array Int Int)) (bv2 (Array Int Int)))
  (=> (= (length bv1) (length bv2))
  (= (bin_andv bv1 bv2) (make_bv (result bv1 bv2) (length bv1))))))

(declare-fun fc ((Array Int Int) (Array Int Int)) (Array Int Int))

;; fc_def
  (assert
  (forall ((bv1 (Array Int Int)) (bv2 (Array Int Int)) (i Int))
  (= (tb2t1 (infix_at int int (t2tb (fc bv1 bv2)) (t2tb1 i))) (bin_and
                                                              (tb2t1
                                                              (infix_at 
                                                              int int
                                                              (t2tb bv1)
                                                              (t2tb1 i)))
                                                              (tb2t1
                                                              (infix_at 
                                                              int int
                                                              (t2tb bv2)
                                                              (t2tb1 i)))))))

;; bin_andv_spec
  (assert
  (forall ((bv1 (Array Int Int)) (bv2 (Array Int Int)))
  (=> (= (length bv1) (length bv2))
  (and (= (length (bin_andv bv1 bv2)) (length bv1))
  (and (= (bin_andv bv1 bv2) (make_bv (fc bv1 bv2) (length bv1)))
  (and (bvlength (bin_andv bv1 bv2) (length bv1))
  (forall ((i Int))
  (=> (and (<= 1 i) (<= i (length (bin_andv bv1 bv2))))
  (= (tb2t1 (infix_at int int (t2tb (bin_andv bv1 bv2)) (t2tb1 i))) (ite 
                                                                    (and
                                                                    (= 
                                                                    (tb2t1
                                                                    (infix_at
                                                                    int 
                                                                    int
                                                                    (t2tb
                                                                    bv1)
                                                                    (t2tb1 i))) 1)
                                                                    (= 
                                                                    (tb2t1
                                                                    (infix_at
                                                                    int 
                                                                    int
                                                                    (t2tb
                                                                    bv2)
                                                                    (t2tb1 i))) 1))
                                                                    1 0))))))))))

(assert
;; VC_test1
 ;; File "qdata/../qdata.mlw", line 889, characters 15-20
  (not false))
(check-sat)
