(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require HighOrd.
Require int.Int.
Require map.Map.

(* Why3 assumption *)
Definition matrix (a:Type) := Z -> Z -> a.

Parameter rows: forall {a:Type} {a_WT:WhyType a}, (Z -> Z -> a) -> Z.

Axiom rows_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (m:Z -> Z -> a), (0%Z < (rows m))%Z.

Parameter columns: forall {a:Type} {a_WT:WhyType a}, (Z -> Z -> a) -> Z.

Axiom columns_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (m:Z -> Z -> a), (0%Z < (columns m))%Z.

(* Why3 assumption *)
Definition valid_index {a:Type} {a_WT:WhyType a} (a1:Z -> Z -> a) (r:Z)
    (c:Z) : Prop :=
  ((0%Z <= r)%Z /\ (r < (rows a1))%Z) /\
  ((0%Z <= c)%Z /\ (c < (columns a1))%Z).

Parameter get:
  forall {a:Type} {a_WT:WhyType a}, (Z -> Z -> a) -> Z -> Z -> a.

Axiom get_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (a1:Z -> Z -> a) (r:Z) (c:Z), (valid_index a1 r c) ->
  ((get a1 r c) = ((a1 r) c)).

Parameter make: forall {a:Type} {a_WT:WhyType a}, Z -> Z -> a -> Z -> Z -> a.

Axiom make_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (r:Z) (c:Z) (v:a), ((0%Z <= r)%Z /\ (0%Z <= c)%Z) ->
  ((rows (make r c v)) = r) /\
  (((columns (make r c v)) = c) /\
   forall (i:Z) (j:Z),
   (((0%Z <= i)%Z /\ (i < r)%Z) /\ ((0%Z <= j)%Z /\ (j < c)%Z)) ->
   ((((make r c v) i) j) = v)).

Parameter set:
  forall {a:Type} {a_WT:WhyType a}, (Z -> Z -> a) -> Z -> Z -> a ->
  Z -> Z -> a.

Axiom set_def :
  forall {a:Type} {a_WT:WhyType a},
  forall (a1:Z -> Z -> a) (r:Z) (c:Z) (v:a), (valid_index a1 r c) ->
  ((set a1 r c v) = (map.Map.set a1 r (map.Map.set (a1 r) c v))).

Axiom set_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (a1:Z -> Z -> a) (r:Z) (c:Z) (v:a), (valid_index a1 r c) ->
  ((rows (set a1 r c v)) = (rows a1)) /\
  (((columns (set a1 r c v)) = (columns a1)) /\
   ((forall (i:Z) (j:Z), (valid_index a1 i j) ->
     (((i = r) /\ (j = c)) -> ((((set a1 r c v) i) j) = v)) /\
     (~ ((i = r) /\ (j = c)) -> ((((set a1 r c v) i) j) = ((a1 i) j)))) /\
    (((get (set a1 r c v) r c) = v) /\
     ((forall (i:Z) (j:Z), (valid_index (set a1 r c v) i j) -> ~ (i = r) ->
       ((get (set a1 r c v) i j) = (get a1 i j))) /\
      forall (i:Z) (j:Z), (valid_index (set a1 r c v) i j) -> ~ (j = c) ->
      ((get (set a1 r c v) i j) = (get a1 i j)))))).

(* Why3 assumption *)
Inductive ref (a:Type) :=
  | mk_ref : a -> ref a.
Axiom ref_WhyType : forall (a:Type) {a_WT:WhyType a}, WhyType (ref a).
Existing Instance ref_WhyType.
Arguments mk_ref {a}.

(* Why3 assumption *)
Definition contents {a:Type} {a_WT:WhyType a} (v:ref a) : a :=
  match v with
  | mk_ref x => x
  end.

Parameter power: Z -> Z -> Z.

Axiom Assoc :
  forall (x:Z) (y:Z) (z:Z), (((x * y)%Z * z)%Z = (x * (y * z)%Z)%Z).

Axiom Unit_def_l : forall (x:Z), ((1%Z * x)%Z = x).

Axiom Unit_def_r : forall (x:Z), ((x * 1%Z)%Z = x).

Axiom Power_0 : forall (x:Z), ((power x 0%Z) = 1%Z).

Axiom Power_s :
  forall (x:Z) (n:Z), (0%Z <= n)%Z ->
  ((power x (n + 1%Z)%Z) = (x * (power x n))%Z).

Axiom Power_s_alt :
  forall (x:Z) (n:Z), (0%Z < n)%Z ->
  ((power x n) = (x * (power x (n - 1%Z)%Z))%Z).

Axiom Power_1 : forall (x:Z), ((power x 1%Z) = x).

Axiom Power_sum :
  forall (x:Z) (n:Z) (m:Z), (0%Z <= n)%Z -> (0%Z <= m)%Z ->
  ((power x (n + m)%Z) = ((power x n) * (power x m))%Z).

Axiom Power_mult :
  forall (x:Z) (n:Z) (m:Z), (0%Z <= n)%Z -> (0%Z <= m)%Z ->
  ((power x (n * m)%Z) = (power (power x n) m)).

Axiom Power_comm1 :
  forall (x:Z) (y:Z), ((x * y)%Z = (y * x)%Z) -> forall (n:Z),
  (0%Z <= n)%Z -> (((power x n) * y)%Z = (y * (power x n))%Z).

Axiom Power_comm2 :
  forall (x:Z) (y:Z), ((x * y)%Z = (y * x)%Z) -> forall (n:Z),
  (0%Z <= n)%Z -> ((power (x * y)%Z n) = ((power x n) * (power y n))%Z).

Axiom growing_mult :
  forall (n:Z) (m:Z), (0%Z <= n)%Z -> (1%Z <= m)%Z -> (n <= (n * m)%Z)%Z.

Axiom strict_growing_mult :
  forall (n:Z) (m:Z), (1%Z < n)%Z -> (1%Z < m)%Z -> (n < (n * m)%Z)%Z.

Axiom positive_diff : forall (n:Z) (m:Z), (n < m)%Z -> (0%Z < (m - n)%Z)%Z.

Axiom init_exp :
  forall (k:Z),
  ((power k 0%Z) = 1%Z) /\
  (((power k 1%Z) = k) /\ ((power k 2%Z) = (k * k)%Z)).

Axiom sum_exp :
  forall (k:Z) (n:Z) (m:Z), (0%Z <= k)%Z -> (0%Z <= n)%Z -> (0%Z <= m)%Z ->
  ((power k (n + m)%Z) = ((power k n) * (power k m))%Z) /\
  (((power k (n + m)%Z) = ((power k m) * (power k n))%Z) /\
   (((power k (n + 1%Z)%Z) = (k * (power k n))%Z) /\
    (((k * (power k n))%Z = ((power k n) * k)%Z) /\
     ((((power k n) * k)%Z = ((power k 1%Z) * (power k n))%Z) /\
      (((power k 1%Z) * (power k n))%Z = ((power k n) * (power k 1%Z))%Z))))).

Axiom positive_exp :
  forall (k:Z) (n:Z), (0%Z < k)%Z -> (0%Z <= n)%Z ->
  (1%Z <= (power k n))%Z /\
  ((0%Z < (power k n))%Z /\ ((power k n) <= (power k (n + 1%Z)%Z))%Z).

Axiom t : Type.
Parameter t_WhyType : WhyType t.
Existing Instance t_WhyType.

Parameter tzero: t.

(* Why3 assumption *)
Definition is_a_bra (m:Z -> Z -> t) : Prop :=
  ((rows m) = 1%Z) /\ exists s:Z, ((columns m) = (power 2%Z s)).

(* Why3 assumption *)
Definition is_a_ket (m:Z -> Z -> t) : Prop :=
  ((columns m) = 1%Z) /\ exists s:Z, ((rows m) = (power 2%Z s)).

Parameter m: Z -> Z -> t.

Axiom H : is_a_bra m.

Axiom H1 : (0%Z < (columns m))%Z.

(* Why3 goal *)
Theorem VC_bra_to_ket : (0%Z <= (columns m))%Z /\ (0%Z <= 1%Z)%Z.
Proof.


Qed.

