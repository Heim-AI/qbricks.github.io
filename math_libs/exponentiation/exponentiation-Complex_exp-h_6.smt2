;;; generated by SMT-LIB2 driver
;;; SMT-LIB2: integer arithmetic
(declare-fun from_int (Int) Real)

(declare-sort t 0)

(declare-fun tzero () t)

(declare-fun tone () t)

(declare-fun infix_sldt (t t) t)

(declare-fun infix_asdt (t t) t)

(declare-fun inv (t) t)

;; Inverse
  (assert
  (forall ((x t)) (=> (not (= x tzero)) (= (infix_asdt x (inv x)) tone))))

;; div_def
  (assert
  (forall ((x t) (y t))
  (=> (not (= y tzero)) (= (infix_sldt x y) (infix_asdt x (inv y))))))

;; absorbinf_zero
  (assert (forall ((x t)) (= (infix_asdt x tzero) tzero)))

;; assoc_mul_div
  (assert
  (forall ((x t) (y t) (z t))
  (=> (not (= z tzero))
  (= (infix_sldt (infix_asdt x y) z) (infix_asdt x (infix_sldt y z))))))

(declare-fun r_to_t (Real) t)

(declare-fun i_to_t (Int) t)

;; i_to_t_def
  (assert (forall ((i Int)) (= (i_to_t i) (r_to_t (from_int i)))))

(declare-fun cpower (t Int) t)

;; cpower_inv
  (assert
  (forall ((e t) (i Int))
  (= (infix_asdt (cpower e i) (cpower e (- i))) tone)))

;; zero_cpower_pos
  (assert (forall ((n Int)) (=> (< 0 n) (= (cpower tzero n) tzero))))

(declare-fun exp (t) t)

(declare-fun x () t)

(declare-fun y () Int)

;; H
  (assert
  (ite (<= 0 y) (= (exp (infix_asdt x (i_to_t y))) (cpower (exp x) y))
  (= (exp (infix_asdt x (i_to_t (- y)))) (cpower (exp x) (- y)))))

(assert
;; h
  (not (= tone tzero)))
(check-sat)
