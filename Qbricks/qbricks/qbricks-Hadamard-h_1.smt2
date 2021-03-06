;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: real arithmetic
;;; SMT-LIB2: integer arithmetic
(declare-sort t 0)

(declare-fun tzero () t)

(declare-fun tone () t)

(declare-fun prefix_mndt (t) t)

(declare-fun infix_pldt (t t) t)

(declare-fun infix_asdt (t t) t)

;; Inv_def_l
  (assert (forall ((x t)) (= (infix_pldt (prefix_mndt x) x) tzero)))

(declare-fun im () t)

(declare-fun r_to_t (Real) t)

;; r_to_t_zero
  (assert (= (r_to_t 0.0) tzero))

;; r_to_t_one
  (assert (= (r_to_t 1.0) tone))

;; r_to_t_add
  (assert
  (forall ((i Real) (j Real))
  (= (infix_pldt (r_to_t i) (r_to_t j)) (r_to_t (+ i j)))))

(declare-fun real_part (t) Real)

(declare-fun im_part (t) Real)

;; Complex_decomp
  (assert
  (forall ((i t))
  (= i (infix_pldt (r_to_t (real_part i))
       (infix_asdt im (r_to_t (im_part i)))))))

;; Unic_decomp
  (assert
  (forall ((i t))
  (forall ((x Real) (y Real))
  (=> (= i (infix_pldt (r_to_t x) (infix_asdt im (r_to_t y))))
  (and (= x (real_part i)) (= y (im_part i)))))))

(declare-fun real_ (t) Bool)

;; real__def
  (assert (forall ((x t)) (= (real_ x) (= (im_part x) 0.0))))

(declare-fun pi1 () t)

;; pi_def
  (assert (real_ pi1))

(declare-sort d_frac 0)

(declare-fun num (d_frac) Int)

(declare-fun den (d_frac) Int)

(declare-fun d_omega_int (Int Int) t)

(declare-fun dyadic (Int Int) d_frac)

(declare-fun d_omega (d_frac) t)

;; d_omega_def
  (assert
  (forall ((o d_frac)) (= (d_omega o) (d_omega_int (num o) (den o)))))

;; equal_dyadic
  (assert
  (forall ((d1 d_frac) (d2 d_frac))
  (= (= d1 d2) (= (d_omega d1) (d_omega d2)))))

(declare-fun div_two_i (Int Int) d_frac)

(declare-fun div_two (d_frac) d_frac)

;; div_two_def
  (assert (forall ((o d_frac)) (= (div_two o) (div_two_i (num o) (den o)))))

;; d_up
  (assert
  (forall ((k Int) (n Int))
  (=> (<= 0 n) (= (dyadic k n) (dyadic (* 2 k) (+ n 1))))))

;; div_two_dyadic
  (assert
  (forall ((k Int) (n Int))
  (=> (<= 0 n) (= (div_two (dyadic k n)) (dyadic k (+ n 1))))))

;; neutral_d_omega
  (assert (= (d_omega (dyadic 0 0)) tone))

;; d_omega10
  (assert (= (d_omega (dyadic 1 0)) tone))

;; d_omega11
  (assert (= (d_omega (dyadic 1 1)) (prefix_mndt tone)))

(assert
;; h
  (not false))
(check-sat)
