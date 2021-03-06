;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort uni 0)

(declare-sort ty 0)

(declare-fun sort (ty uni) Bool)

(declare-fun witness (ty) uni)

;; witness_sort
  (assert (forall ((a ty)) (sort a (witness a))))

(declare-fun int () ty)

(declare-fun real () ty)

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

(declare-sort t 0)

(declare-fun t1 () ty)

(declare-fun prefix_mndt (t) t)

(declare-fun infix_asdt (t t) t)

(declare-fun prefix_mnas (uni) uni)

;; prefix -*_sort
  (assert (forall ((x uni)) (sort real (prefix_mnas x))))

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

(declare-fun iterates (ty uni uni) Bool)

;; iterates_def
  (assert
  (forall ((im ty))
  (forall ((op uni) (neutral uni))
  (= (iterates im op neutral)
  (and (op_neutral_left im op neutral)
  (and (op_neutral_right im op neutral) (op_assoc im op)))))))

(declare-fun int_iterate (ty uni uni Int Int) uni)

;; int_iterate_sort
  (assert
  (forall ((im ty))
  (forall ((x uni) (x1 uni) (x2 Int) (x3 Int)) (sort im
  (int_iterate im x x1 x2 x3)))))

(declare-fun infix_pl_closure () (Array Int (Array Int Int)))

(declare-fun t2tb ((Array Int (Array Int Int))) uni)

;; t2tb_sort
  (assert
  (forall ((x (Array Int (Array Int Int)))) (sort
  (infix_mngt int (infix_mngt int int)) (t2tb x))))

(declare-fun tb2t (uni) (Array Int (Array Int Int)))

;; BridgeL
  (assert
  (forall ((i (Array Int (Array Int Int))))
  (! (= (tb2t (t2tb i)) i) :pattern ((t2tb i)) )))

;; BridgeR
  (assert
  (forall ((j uni)) (! (= (t2tb (tb2t j)) j) :pattern ((t2tb (tb2t j))) )))

(declare-fun t2tb1 ((Array Int Int)) uni)

;; t2tb_sort
  (assert
  (forall ((x (Array Int Int))) (sort (infix_mngt int int) (t2tb1 x))))

(declare-fun tb2t1 (uni) (Array Int Int))

;; BridgeL
  (assert
  (forall ((i (Array Int Int)))
  (! (= (tb2t1 (t2tb1 i)) i) :pattern ((t2tb1 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (= (t2tb1 (tb2t1 j)) j) :pattern ((t2tb1 (tb2t1 j))) )))

(declare-fun t2tb2 (Int) uni)

;; t2tb_sort
  (assert (forall ((x Int)) (sort int (t2tb2 x))))

(declare-fun tb2t2 (uni) Int)

;; BridgeL
  (assert
  (forall ((i Int)) (! (= (tb2t2 (t2tb2 i)) i) :pattern ((t2tb2 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (= (t2tb2 (tb2t2 j)) j) :pattern ((t2tb2 (tb2t2 j))) )))

;; infix +_closure_def
  (assert
  (forall ((y Int) (y1 Int))
  (= (tb2t2
     (infix_at int int
     (infix_at (infix_mngt int int) int (t2tb infix_pl_closure) (t2tb2 y))
     (t2tb2 y1))) (+ y y1))))

;; isum_iter
  (assert (iterates int (t2tb infix_pl_closure) (t2tb2 0)))

(declare-fun ind_isum ((Array Int Int) Int Int) Int)

;; ind_isum_def
  (assert
  (forall ((f (Array Int Int)) (i Int) (j Int))
  (= (ind_isum f i j) (tb2t2
                      (int_iterate int (t2tb infix_pl_closure) (t2tb1 f) i j)))))

(declare-fun power (Int Int) Int)

;; Power_one
  (assert (forall ((i Int)) (= (power i 1) i)))

(declare-fun fc () (Array Int Int))

;; fc_def
  (assert
  (forall ((k Int))
  (= (tb2t2 (infix_at int int (t2tb1 fc) (t2tb2 k))) (power 2 (+ k 1)))))

;; power_decomp
  (assert
  (forall ((i Int)) (=> (<= 1 i) (< (ind_isum fc 0 i) (power 2 (+ i 1))))))

(declare-sort matrix 1)

(declare-fun matrix1 (ty) ty)

(declare-fun rows (ty uni) Int)

(declare-fun columns (ty uni) Int)

(declare-fun valid_index (ty uni Int Int) Bool)

;; valid_index_def
  (assert
  (forall ((a ty))
  (forall ((a1 uni) (r Int) (c Int))
  (= (valid_index a a1 r c)
  (and (and (<= 0 r) (< r (rows a a1))) (and (<= 0 c) (< c (columns a a1))))))))

(declare-fun get (ty uni Int Int) uni)

;; get_sort
  (assert
  (forall ((a ty))
  (forall ((x uni) (x1 Int) (x2 Int)) (sort a (get a x x1 x2)))))

(declare-fun make_f (ty Int Int uni) uni)

;; make_f_sort
  (assert
  (forall ((a ty))
  (forall ((x Int) (x1 Int) (x2 uni)) (sort (matrix1 a) (make_f a x x1 x2)))))

(declare-fun infix_asdtdt (t (matrix t)) (matrix t))

(declare-fun result (t (matrix t)) (Array Int (Array Int t)))

(declare-fun t2tb3 (t) uni)

;; t2tb_sort
  (assert (forall ((x t)) (sort t1 (t2tb3 x))))

(declare-fun tb2t3 (uni) t)

;; BridgeL
  (assert (forall ((i t)) (! (= (tb2t3 (t2tb3 i)) i) :pattern ((t2tb3 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort t1 j) (= (t2tb3 (tb2t3 j)) j)) :pattern ((t2tb3 (tb2t3 j))) )))

(declare-fun t2tb4 ((Array Int (Array Int t))) uni)

;; t2tb_sort
  (assert
  (forall ((x (Array Int (Array Int t)))) (sort
  (infix_mngt int (infix_mngt int t1)) (t2tb4 x))))

(declare-fun tb2t4 (uni) (Array Int (Array Int t)))

;; BridgeL
  (assert
  (forall ((i (Array Int (Array Int t))))
  (! (= (tb2t4 (t2tb4 i)) i) :pattern ((t2tb4 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (infix_mngt int (infix_mngt int t1)) j)
     (= (t2tb4 (tb2t4 j)) j)) :pattern ((t2tb4 (tb2t4 j))) )))

(declare-fun t2tb5 ((Array Int t)) uni)

;; t2tb_sort
  (assert (forall ((x (Array Int t))) (sort (infix_mngt int t1) (t2tb5 x))))

(declare-fun tb2t5 (uni) (Array Int t))

;; BridgeL
  (assert
  (forall ((i (Array Int t)))
  (! (= (tb2t5 (t2tb5 i)) i) :pattern ((t2tb5 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (infix_mngt int t1) j) (= (t2tb5 (tb2t5 j)) j)) :pattern (
  (t2tb5 (tb2t5 j))) )))

(declare-fun t2tb6 ((matrix t)) uni)

;; t2tb_sort
  (assert (forall ((x (matrix t))) (sort (matrix1 t1) (t2tb6 x))))

(declare-fun tb2t6 (uni) (matrix t))

;; BridgeL
  (assert
  (forall ((i (matrix t))) (! (= (tb2t6 (t2tb6 i)) i) :pattern ((t2tb6 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (matrix1 t1) j) (= (t2tb6 (tb2t6 j)) j)) :pattern ((t2tb6
                                                                  (tb2t6 j))) )))

;; result_def
  (assert
  (forall ((s t) (m (matrix t)) (i Int) (j Int))
  (= (tb2t3
     (infix_at t1 int
     (infix_at (infix_mngt int t1) int (t2tb4 (result s m)) (t2tb2 i))
     (t2tb2 j))) (infix_asdt s (tb2t3 (get t1 (t2tb6 m) i j))))))

;; infix *.._def
  (assert
  (forall ((s t) (m (matrix t)))
  (= (infix_asdtdt s m) (tb2t6
                        (make_f t1 (rows t1 (t2tb6 m)) (columns t1 (t2tb6 m))
                        (t2tb4 (result s m)))))))

;; infix *.._spec
  (assert
  (forall ((s t) (m (matrix t)))
  (and (= (columns t1 (t2tb6 (infix_asdtdt s m))) (columns t1 (t2tb6 m)))
  (and (= (rows t1 (t2tb6 (infix_asdtdt s m))) (rows t1 (t2tb6 m)))
  (and
  (forall ((i Int) (j Int))
  (=> (valid_index t1 (t2tb6 (infix_asdtdt s m)) i j)
  (= (tb2t3 (get t1 (t2tb6 (infix_asdtdt s m)) i j)) (infix_asdt s
                                                     (tb2t3
                                                     (get t1 (t2tb6 m) i j))))))
  (forall ((i Int) (j Int))
  (= (valid_index t1 (t2tb6 (infix_asdtdt s m)) i j) (valid_index t1
  (t2tb6 m) i j))))))))

(declare-sort bitvec 0)

(declare-fun bitvec1 () ty)

(declare-fun getbv (bitvec Int) Int)

;; bounded_getbv
  (assert
  (forall ((a bitvec) (i Int)) (and (<= 0 (getbv a i)) (< (getbv a i) 2))))

(declare-fun make_bv ((Array Int Int) Int) bitvec)

;; assert_make_bv_no_bound
  (assert
  (forall ((f (Array Int Int)) (i Int))
  (= (getbv (make_bv f 0) i) (tb2t2 (infix_at int int (t2tb1 f) (t2tb2 i))))))

(assert
;; h
  (not false))
(check-sat)
