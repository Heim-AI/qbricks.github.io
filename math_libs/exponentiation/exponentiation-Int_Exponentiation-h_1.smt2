;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
(set-option :produce-models true)
;;; SMT-LIB2: integer arithmetic
(declare-sort uni 0)

(declare-sort ty 0)

(declare-fun sort (ty uni) Bool)

(declare-fun witness (ty) uni)

(declare-fun int () ty)

(declare-fun infix_mngt (ty ty) ty)

(declare-fun infix_at (ty ty uni uni) uni)

(declare-fun set (ty) ty)

(declare-fun mem (ty uni uni) Bool)

(declare-fun infix_eqeq (ty uni uni) Bool)

(declare-fun op_neutral_left (ty uni uni) Bool)

(declare-fun op_neutral_right (ty uni uni) Bool)

(declare-fun op_assoc (ty uni) Bool)

(declare-fun iterates (ty uni uni) Bool)

(declare-fun int_iterate (ty uni uni Int Int) uni)

(declare-fun infix_pl_closure () (Array Int (Array Int Int)))

(declare-fun t2tb ((Array Int (Array Int Int))) uni)

(declare-fun tb2t (uni) (Array Int (Array Int Int)))

(declare-fun t2tb1 ((Array Int Int)) uni)

(declare-fun tb2t1 (uni) (Array Int Int))

(declare-fun t2tb2 (Int) uni)

(declare-fun tb2t2 (uni) Int)

(declare-fun ind_isum ((Array Int Int) Int Int) Int)

(declare-fun power (Int Int) Int)

(declare-fun fc () (Array Int Int))

(assert
;; h
  (not false))
(push)
(check-sat)
(get-model)
;; isum_iter
  (assert (iterates int (t2tb infix_pl_closure) (t2tb2 0)))

(push)
(check-sat)
(get-model)
;; power_decomp_minus_one
  (assert
  (forall ((i Int)) (=> (<= 1 i) (< (ind_isum fc 1 i) (power 2 (- i 1))))))

;; fc_def
  (assert
  (forall ((k Int))
  (= (tb2t2 (infix_at int int (t2tb1 fc) (t2tb2 k))) (power 2 (- k 1)))))

;; power_plus_one
  (assert (forall ((e Int) (i Int)) (= (power e (+ i 1)) (* e (power e i)))))

;; Power_one
  (assert (forall ((i Int)) (= (power i 1) i)))

;; ind_isum_def
  (assert
  (forall ((f (Array Int Int)) (i Int) (j Int))
  (= (ind_isum f i j) (tb2t2
                      (int_iterate int (t2tb infix_pl_closure) (t2tb1 f) i j)))))

;; infix +_closure_def
  (assert
  (forall ((y Int) (y1 Int))
  (= (tb2t2
     (infix_at int int
     (infix_at (infix_mngt int int) int (t2tb infix_pl_closure) (t2tb2 y))
     (t2tb2 y1))) (+ y y1))))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (= (t2tb2 (tb2t2 j)) j) :pattern ((t2tb2 (tb2t2 j))) )))

;; BridgeL
  (assert
  (forall ((i Int)) (! (= (tb2t2 (t2tb2 i)) i) :pattern ((t2tb2 i)) )))

;; t2tb_sort
  (assert (forall ((x Int)) (sort int (t2tb2 x))))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (= (t2tb1 (tb2t1 j)) j) :pattern ((t2tb1 (tb2t1 j))) )))

;; BridgeL
  (assert
  (forall ((i (Array Int Int)))
  (! (= (tb2t1 (t2tb1 i)) i) :pattern ((t2tb1 i)) )))

;; t2tb_sort
  (assert
  (forall ((x (Array Int Int))) (sort (infix_mngt int int) (t2tb1 x))))

;; BridgeR
  (assert
  (forall ((j uni)) (! (= (t2tb (tb2t j)) j) :pattern ((t2tb (tb2t j))) )))

;; BridgeL
  (assert
  (forall ((i (Array Int (Array Int Int))))
  (! (= (tb2t (t2tb i)) i) :pattern ((t2tb i)) )))

;; t2tb_sort
  (assert
  (forall ((x (Array Int (Array Int Int)))) (sort
  (infix_mngt int (infix_mngt int int)) (t2tb x))))

;; int_iterate_sort
  (assert
  (forall ((im ty))
  (forall ((x uni) (x1 uni) (x2 Int) (x3 Int)) (sort im
  (int_iterate im x x1 x2 x3)))))

;; iterates_def
  (assert
  (forall ((im ty))
  (forall ((op uni) (neutral uni))
  (= (iterates im op neutral)
  (and (op_neutral_left im op neutral)
  (and (op_neutral_right im op neutral) (op_assoc im op)))))))

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

;; op_neutral_right_def
  (assert
  (forall ((im ty))
  (forall ((op uni) (neutral uni))
  (= (op_neutral_right im op neutral)
  (forall ((e uni))
  (=> (sort im e)
  (= (infix_at im im (infix_at (infix_mngt im im) im op e) neutral) e)))))))

;; op_neutral_left_def
  (assert
  (forall ((im ty))
  (forall ((op uni) (neutral uni))
  (= (op_neutral_left im op neutral)
  (forall ((e uni))
  (=> (sort im e)
  (= (infix_at im im (infix_at (infix_mngt im im) im op neutral) e) e)))))))

;; infix ==_spec
  (assert
  (forall ((a ty))
  (forall ((s1 uni) (s2 uni))
  (and
  (=> (infix_eqeq a s1 s2) (forall ((x uni)) (= (mem a x s1) (mem a x s2))))
  (=> (forall ((x uni)) (=> (sort a x) (= (mem a x s1) (mem a x s2))))
  (infix_eqeq a s1 s2))))))

;; infix @_sort
  (assert
  (forall ((a ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort b (infix_at b a x x1)))))

;; witness_sort
  (assert (forall ((a ty)) (sort a (witness a))))

(push)
(check-sat)
(get-model)
