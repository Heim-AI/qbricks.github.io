(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require HighOrd.
Require int.Int.

Axiom t : Type.
Parameter t_WhyType : WhyType t.
Existing Instance t_WhyType.

(* Why3 assumption *)
Definition terms := Z -> t.

Parameter tzero: t.

Parameter infix_pldt: t -> t -> t.

Parameter infix_mndt: t -> t -> t.

Parameter prefix_mndt: t -> t.

Axiom add_zero_left : forall (a:t), ((infix_pldt tzero a) = a).

Axiom add_zero_right : forall (a:t), ((infix_pldt a tzero) = a).

Axiom add_assoc :
  forall (a:t) (b:t) (c:t),
  ((infix_pldt (infix_pldt a b) c) = (infix_pldt a (infix_pldt b c))).

Axiom add_refl : forall (a:t) (b:t), ((infix_pldt a b) = (infix_pldt b a)).

Axiom add_tzero_left_c :
  forall (a:t) (b:t), ((infix_pldt a b) = a) -> (b = tzero).

Axiom opposite : forall (a:t), ((infix_mndt a a) = tzero).

Axiom substract :
  forall (a:t) (b:t), ((infix_mndt a b) = (infix_pldt a (prefix_mndt b))).

Axiom substraction :
  forall (a:t) (b:t),
  ((infix_mndt (infix_pldt a b) b) = a) /\
  ((infix_pldt (infix_mndt a b) b) = a).

Axiom minus_zero : forall (a:t), ((infix_mndt a tzero) = a).

Axiom unic :
  forall (a:t) (b:t) (c:t), ((infix_pldt a b) = (infix_pldt a c)) -> (b = c).

Axiom substract_comm :
  forall (a:t) (b:t),
  ((infix_mndt (infix_pldt a b) a) = b) /\
  ((infix_mndt (infix_pldt b a) a) = b).

Parameter sequal: t -> t -> bool.

Axiom sequal_spec : forall (a:t) (b:t), ((sequal a b) = true) <-> (a = b).

Axiom set : forall (a:Type), Type.
Parameter set_WhyType : forall (a:Type) {a_WT:WhyType a}, WhyType (set a).
Existing Instance set_WhyType.

Parameter mem: forall {a:Type} {a_WT:WhyType a}, a -> (set a) -> Prop.

Parameter infix_eqeq:
  forall {a:Type} {a_WT:WhyType a}, (set a) -> (set a) -> Prop.

Axiom infix_eqeq_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a),
  (infix_eqeq s1 s2) <-> forall (x:a), (mem x s1) <-> (mem x s2).

Axiom extensionality :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), (infix_eqeq s1 s2) -> (s1 = s2).

Parameter subset:
  forall {a:Type} {a_WT:WhyType a}, (set a) -> (set a) -> Prop.

Axiom subset_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a),
  (subset s1 s2) <-> forall (x:a), (mem x s1) -> mem x s2.

Axiom subset_refl :
  forall {a:Type} {a_WT:WhyType a}, forall (s:set a), subset s s.

Axiom subset_trans :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a) (s3:set a), (subset s1 s2) ->
  (subset s2 s3) -> subset s1 s3.

Parameter is_empty: forall {a:Type} {a_WT:WhyType a}, (set a) -> Prop.

Axiom is_empty_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), (is_empty s) <-> forall (x:a), ~ (mem x s).

Parameter empty: forall {a:Type} {a_WT:WhyType a}, set a.

Axiom empty_def : forall {a:Type} {a_WT:WhyType a}, is_empty (empty : set a).

Parameter add: forall {a:Type} {a_WT:WhyType a}, a -> (set a) -> set a.

Axiom add_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (s:set a), forall (y:a),
  (mem y (add x s)) <-> ((y = x) \/ (mem y s)).

Parameter remove: forall {a:Type} {a_WT:WhyType a}, a -> (set a) -> set a.

Axiom remove_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (s:set a), forall (y:a),
  (mem y (remove x s)) <-> (~ (y = x) /\ (mem y s)).

Axiom add_remove :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (s:set a), (mem x s) -> ((add x (remove x s)) = s).

Axiom remove_add :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (s:set a), ((remove x (add x s)) = (remove x s)).

Axiom subset_remove :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (s:set a), subset (remove x s) s.

Parameter union:
  forall {a:Type} {a_WT:WhyType a}, (set a) -> (set a) -> set a.

Axiom union_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), forall (x:a),
  (mem x (union s1 s2)) <-> ((mem x s1) \/ (mem x s2)).

Parameter inter:
  forall {a:Type} {a_WT:WhyType a}, (set a) -> (set a) -> set a.

Axiom inter_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), forall (x:a),
  (mem x (inter s1 s2)) <-> ((mem x s1) /\ (mem x s2)).

Parameter diff:
  forall {a:Type} {a_WT:WhyType a}, (set a) -> (set a) -> set a.

Axiom diff_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), forall (x:a),
  (mem x (diff s1 s2)) <-> ((mem x s1) /\ ~ (mem x s2)).

Axiom subset_diff :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), subset (diff s1 s2) s1.

Parameter choose: forall {a:Type} {a_WT:WhyType a}, (set a) -> a.

Axiom choose_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), ~ (is_empty s) -> mem (choose s) s.

Parameter cardinal: forall {a:Type} {a_WT:WhyType a}, (set a) -> Z.

Axiom cardinal_nonneg :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), (0%Z <= (cardinal s))%Z.

Axiom cardinal_empty :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), ((cardinal s) = 0%Z) <-> (is_empty s).

Axiom cardinal_add :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a), forall (s:set a), ~ (mem x s) ->
  ((cardinal (add x s)) = (1%Z + (cardinal s))%Z).

Axiom cardinal_remove :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a), forall (s:set a), (mem x s) ->
  ((cardinal s) = (1%Z + (cardinal (remove x s)))%Z).

Axiom cardinal_subset :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), (subset s1 s2) ->
  ((cardinal s1) <= (cardinal s2))%Z.

Axiom subset_eq :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), (subset s1 s2) ->
  ((cardinal s1) = (cardinal s2)) -> infix_eqeq s1 s2.

Axiom cardinal1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), ((cardinal s) = 1%Z) -> forall (x:a), (mem x s) ->
  (x = (choose s)).

Parameter filter:
  forall {a:Type} {a_WT:WhyType a}, (a -> bool) -> (set a) -> set a.

Axiom filter_def :
  forall {a:Type} {a_WT:WhyType a},
  forall (p:a -> bool) (u:set a), forall (x:a),
  (mem x (filter p u)) <-> (((p x) = true) /\ (mem x u)).

Axiom filter_cardinal :
  forall {a:Type} {a_WT:WhyType a},
  forall (p:a -> bool) (u:set a), ((cardinal (filter p u)) <= (cardinal u))%Z.

Parameter map:
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b}, (a -> b) ->
  (set a) -> set b.

Axiom map_def1 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (f:a -> b) (u:set a), forall (y:b),
  (mem y (map f u)) <-> exists x:a, (mem x u) /\ (y = (f x)).

Axiom map_def2 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (f:a -> b) (u:set a), forall (x:a), (mem x u) -> mem (f x) (map f u).

Axiom map_cardinal :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (f:a -> b) (u:set a), ((cardinal (map f u)) <= (cardinal u))%Z.

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

Axiom union_exchange :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (s':set a), ~ (is_empty s') ->
  ((union (add (choose s') s) (remove (choose s') s')) = (union s s')).

Axiom inter_empty :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (s':set a), (is_empty s) -> is_empty (inter s s').

Axiom inter_empty_comm :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (s':set a), (is_empty s') -> is_empty (inter s s').

Axiom union_empty :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (s':set a), (is_empty s) -> ((union s s') = s').

Axiom union_comm :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (s':set a), (is_empty s) -> ((union s s') = (union s' s)).

Axiom union_empty_comm :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (s':set a), (is_empty s') -> ((union s s') = s).

Axiom union_add :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (s':set a) (x:a), ~ (mem x s') ->
  ((union s (add x s')) = (add x (union s s'))).

Axiom union_add_comm :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (s':set a) (x:a), ~ (mem x s') ->
  ((add x (union s s')) = (union s (add x s'))).

(* Why3 assumption *)
Definition injective {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b}
    (s:set a) (f:a -> b) : Prop :=
  forall (a1:a) (b1:a), ~ (a1 = b1) -> ~ ((f a1) = (f b1)).

Parameter apply:
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b}, (set a) ->
  (a -> b) -> set b.

Axiom apply_def :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (f:a -> b),
  ((is_empty s) -> ((apply s f) = (empty : set b))) /\
  (~ (is_empty s) ->
   ((apply s f) = (add (f (choose s)) (apply (remove (choose s) s) f)))).

Axiom apply_spec :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (f:a -> b), (injective s f) -> forall (a1:a),
  (mem a1 s) <-> (mem (f a1) (apply s f)).

Axiom apply_choose :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a), forall (f:a -> b),
  ((choose (apply s f)) = (f (choose s))).

Axiom apply_remove_choose :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (f:a -> b), (injective s f) ->
  ((apply (remove (choose s) s) f) =
   (remove (choose (apply s f)) (apply s f))).

Parameter right_injections:
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b}, a -> (set b) ->
  set (a* b)%type.

Axiom right_injections_def :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (s:set b),
  ((is_empty s) -> ((right_injections a1 s) = (empty : set (a* b)%type))) /\
  (~ (is_empty s) ->
   ((right_injections a1 s) =
    (add (a1, choose s) (right_injections a1 (remove (choose s) s))))).

Axiom right_injections_spec :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (s:set b),
  ((cardinal (right_injections a1 s)) = (cardinal s)) /\
  ((forall (a':a), forall (b1:b),
    (mem (a', b1) (right_injections a1 s)) <-> ((a' = a1) /\ (mem b1 s))) /\
   ((right_injections a1 s) = (apply s (fun (b1:b) => (a1, b1))))).

Parameter left_injections:
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b}, (set a) -> b ->
  set (a* b)%type.

Axiom left_injections_def :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b),
  ((is_empty s) -> ((left_injections s b1) = (empty : set (a* b)%type))) /\
  (~ (is_empty s) ->
   ((left_injections s b1) =
    (add (choose s, b1) (left_injections (remove (choose s) s) b1)))).

Axiom left_injections_spec :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b),
  (forall (a1:a), forall (b':b),
   (mem (a1, b') (left_injections s b1)) <-> ((mem a1 s) /\ (b' = b1))) /\
  (((cardinal (left_injections s b1)) = (cardinal s)) /\
   ((left_injections s b1) = (apply s (fun (a1:a) => (a1, b1))))).

Axiom right_injections_l :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (s:set b),
  ((cardinal (right_injections a1 s)) = (cardinal s)) /\
  ((forall (a':a), forall (b1:b),
    (mem (a', b1) (right_injections a1 s)) <-> ((a' = a1) /\ (mem b1 s))) /\
   ((right_injections a1 s) = (apply s (fun (b1:b) => (a1, b1))))).

Axiom left_injections_l :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b),
  (forall (a1:a), forall (b':b),
   (mem (a1, b') (left_injections s b1)) <-> ((mem a1 s) /\ (b' = b1))) /\
  (((cardinal (left_injections s b1)) = (cardinal s)) /\
   ((left_injections s b1) = (apply s (fun (a1:a) => (a1, b1))))).

Axiom disjoint_injections :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b) (c:b), ~ (b1 = c) ->
  (is_empty (inter (right_injections b1 s) (right_injections c s))) /\
  (is_empty (inter (left_injections s b1) (left_injections s c))).

Axiom induction :
  forall {a:Type} {a_WT:WhyType a},
  forall (p:(set a) -> bool) (t1:set a),
  (forall (s:set a), (is_empty s) -> ((p s) = true)) ->
  (forall (s:set a), ((p s) = true) -> forall (t2:a), ~ (mem t2 s) ->
   ((p (add t2 s)) = true)) ->
  ((p t1) = true).

Axiom cardinal_sum :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (s':set a),
  ((cardinal (union s s')) =
   (((cardinal s) + (cardinal s'))%Z - (cardinal (inter s s')))%Z).

Axiom cardinal_sum_empty_inter :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (s':set a), ((inter s s') = (empty : set a)) ->
  ((cardinal (union s s')) = ((cardinal s) + (cardinal s'))%Z).

Parameter cartesian_product:
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b}, (set a) ->
  (set b) -> set (a* b)%type.

Axiom cartesian_product_spec :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b),
  ((cardinal (cartesian_product s1 s2)) = ((cardinal s1) * (cardinal s2))%Z) /\
  ((forall (a1:a), forall (b1:b),
    (mem (a1, b1) (cartesian_product s1 s2)) <-> ((mem a1 s1) /\ (mem b1 s2))) /\
   forall (o:(a* b)%type),
   (mem o (cartesian_product s1 s2)) <->
   match o with
   | (a1, b1) => (mem a1 s1) /\ (mem b1 s2)
   end).

Axiom cartesian_product_union :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b) (s3:set b),
  ((cartesian_product s1 (union s2 s3)) =
   (union (cartesian_product s1 s2) (cartesian_product s1 s3))).

Axiom cartesian_union_product :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set a) (s3:set b),
  ((cartesian_product (union s1 s2) s3) =
   (union (cartesian_product s1 s3) (cartesian_product s2 s3))).

Axiom cartesian_product_cardone_r :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b), ((cardinal s1) = 1%Z) ->
  (infix_eqeq (cartesian_product s1 s2) (right_injections (choose s1) s2)) /\
  (infix_eqeq (cartesian_product s1 s2)
   (apply s2 (fun (e2:b) => (choose s1, e2)))).

Axiom cartesian_product_cardone_l :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b), ((cardinal s2) = 1%Z) ->
  (infix_eqeq (cartesian_product s1 s2) (left_injections s1 (choose s2))) /\
  (infix_eqeq (cartesian_product s1 s2)
   (apply s1 (fun (e1:a) => (e1, choose s2)))).

(* Why3 assumption *)
Definition sterms (a:Type) := a -> t.

Parameter ssum: forall {a:Type} {a_WT:WhyType a}, (set a) -> (a -> t) -> t.

Axiom Ssum_def_empty :
  forall {a:Type} {a_WT:WhyType a},
  forall (f:a -> t), ((ssum (empty : set a) f) = tzero).

Parameter summable: forall {a:Type} {a_WT:WhyType a}, (set a) -> Prop.

Axiom ssum_empty :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (t1:a -> t), ((cardinal s) = 0%Z) -> ((ssum s t1) = tzero).

Axiom Ssum_add :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), forall (f:a -> t), forall (x:a), ~ (mem x s) ->
  ((ssum (add x s) f) = (infix_pldt (ssum s f) (f x))).

Axiom ssum_add :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (f:a -> t) (x:a), ~ (mem x s) ->
  ((ssum (add x s) f) = (infix_pldt (ssum s f) (f x))).

Axiom ssum_remove :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (f:a -> t) (x:a), (mem x s) ->
  ((ssum (remove x s) f) = (infix_mndt (ssum s f) (f x))).

Axiom ssum_def_choose :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (f:a -> t), ~ (is_empty s) ->
  ((ssum s f) = (infix_pldt (f (choose s)) (ssum (remove (choose s) s) f))).

Axiom choose_any :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (f:a -> t) (t1:a), (mem t1 s) ->
  ((ssum s f) = (infix_pldt (f t1) (ssum (remove t1 s) f))).

Axiom ssum_plus_ssum :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (f:a -> t) (g:a -> t),
  ((ssum s1 (fun (k:a) => (infix_pldt (f k) (g k)))) =
   (infix_pldt (ssum s1 (fun (k:a) => (f k))) (ssum s1 (fun (k:a) => (g k))))).

Axiom ssum_plus_ssum_com :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (f:a -> t) (g:a -> t),
  ((infix_pldt (ssum s1 (fun (k:a) => (f k))) (ssum s1 (fun (k:a) => (g k))))
   = (ssum s1 (fun (k:a) => (infix_pldt (f k) (g k))))).

Axiom ssum_transitivity :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a) (f:a -> t),
  ((ssum (union s1 s2) f) =
   (infix_mndt (infix_pldt (ssum s1 f) (ssum s2 f)) (ssum (inter s1 s2) f))).

Axiom ssum_disjoint_transitivity :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a) (t1:a -> t),
  ((inter s1 s2) = (empty : set a)) ->
  ((ssum (union s1 s2) t1) = (infix_pldt (ssum s1 t1) (ssum s2 t1))).

Axiom ssum_eq :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (f:a -> t) (g:a -> t),
  (forall (x:a), (mem x s) -> ((f x) = (g x))) -> ((ssum s f) = (ssum s g)).

Axiom ssum_apply :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set b) (f:b -> a) (t1:a -> t), (injective s f) ->
  ((ssum (apply s f) t1) = (ssum s (fun (b1:b) => (t1 (f b1))))).

Parameter to_fset: Z -> Z -> set Z.

Axiom to_fset_spec :
  forall (i:Z) (j:Z),
  ((i <= j)%Z -> ((cardinal (to_fset i j)) = (j - i)%Z)) /\
  (((j < i)%Z -> ((cardinal (to_fset i j)) = 0%Z)) /\
   forall (k:Z), (mem k (to_fset i j)) <-> ((i <= k)%Z /\ (k < j)%Z)).

Axiom to_fset_unit_ext :
  forall (i:Z) (j:Z), (i < j)%Z ->
  ((to_fset i j) = (add i (to_fset (i + 1%Z)%Z j))).

Axiom to_fset_ext :
  forall (i:Z) (i':Z) (j:Z), ((i <= i')%Z /\ (i' <= j)%Z) ->
  ((to_fset i j) = (union (to_fset i i') (to_fset i' j))).

Parameter sum: (Z -> t) -> Z -> Z -> t.

Axiom sum_def :
  forall (f:Z -> t) (i:Z) (j:Z),
  ((j <= i)%Z -> ((sum f i j) = tzero)) /\
  (~ (j <= i)%Z -> ((sum f i j) = (infix_pldt (f i) (sum f (i + 1%Z)%Z j)))).

Axiom sum_to_ssum :
  forall (f:Z -> t) (i:Z) (j:Z), ((sum f i j) = (ssum (to_fset i j) f)).

Axiom Sum_def_empty :
  forall (f:Z -> t) (i:Z) (j:Z), (j <= i)%Z -> ((sum f i j) = tzero).

Axiom Sum_def_non_empty :
  forall (f:Z -> t) (i:Z) (j:Z), (i < j)%Z ->
  ((sum f i j) = (infix_pldt (f i) (sum f (i + 1%Z)%Z j))).

Axiom sum_right_extension :
  forall (f:Z -> t) (i:Z) (j:Z), (i < j)%Z ->
  ((sum f i j) = (infix_pldt (sum f i (j - 1%Z)%Z) (f (j - 1%Z)%Z))).

Axiom sum_transitivity :
  forall (f:Z -> t) (i:Z) (k:Z) (j:Z), ((i <= k)%Z /\ (k <= j)%Z) ->
  ((sum f i j) = (infix_pldt (sum f i k) (sum f k j))).

(* Why3 assumption *)
Definition tterms := Z -> Z -> t.

Parameter sum_sum: (Z -> Z -> t) -> Z -> Z -> Z -> Z -> t.

Axiom sum_sum_def :
  forall (f:Z -> Z -> t) (i:Z) (j:Z) (k:Z) (l:Z),
  ((j <= i)%Z -> ((sum_sum f i j k l) = tzero)) /\
  (~ (j <= i)%Z ->
   ((sum_sum f i j k l) =
    (infix_pldt (sum ((fun (y0:Z -> t) (y1:Z) => (y0 y1)) (f i)) k l)
     (sum_sum f (i + 1%Z)%Z j k l)))).

Axiom sum_sum_spec :
  forall (f:Z -> Z -> t) (i:Z) (j:Z) (k:Z) (l:Z),
  ((sum_sum f i j k l) =
   (sum (fun (m:Z) => (sum (fun (n:Z) => ((f m) n)) k l)) i j)).

Parameter f: Z -> Z -> t.

Parameter i: Z.

Parameter j: Z.

Parameter k: Z.

Parameter l: Z.

Axiom H : ~ (j <= i)%Z.

Axiom H1 :
  ((cartesian_product (to_fset i j) (to_fset k l)) =
   (union (cartesian_product (to_fset i (i + 1%Z)%Z) (to_fset k l))
    (cartesian_product (to_fset (i + 1%Z)%Z j) (to_fset k l)))).

Axiom H2 :
  is_empty
  (inter (cartesian_product (to_fset i (i + 1%Z)%Z) (to_fset k l))
   (cartesian_product (to_fset (i + 1%Z)%Z j) (to_fset k l))).

Axiom H3 :
  ((ssum (cartesian_product (to_fset i j) (to_fset k l))
    (fun (o:(Z* Z)%type) => match o with
                            | (a, b) => (f a) b
                            end))
   =
   (infix_pldt
    (ssum (cartesian_product (to_fset i (i + 1%Z)%Z) (to_fset k l))
     (fun (o:(Z* Z)%type) => match o with
                             | (a, b) => (f a) b
                             end))
    (ssum (cartesian_product (to_fset (i + 1%Z)%Z j) (to_fset k l))
     (fun (o:(Z* Z)%type) => match o with
                             | (a, b) => (f a) b
                             end)))).

Axiom H4 :
  ((sum_sum f (i + 1%Z)%Z j k l) =
   (ssum (cartesian_product (to_fset (i + 1%Z)%Z j) (to_fset k l))
    (fun (o:(Z* Z)%type) => match o with
                            | (a, b) => (f a) b
                            end))).

Axiom H5 : (k <= l)%Z -> ((cardinal (to_fset k l)) = (l - k)%Z).

Axiom H6 : (l < k)%Z -> ((cardinal (to_fset k l)) = 0%Z).

Axiom H7 :
  forall (k1:Z), (mem k1 (to_fset k l)) <-> ((k <= k1)%Z /\ (k1 < l)%Z).

Axiom H8 :
  (i <= (i + 1%Z)%Z)%Z ->
  ((cardinal (to_fset i (i + 1%Z)%Z)) = ((i + 1%Z)%Z - i)%Z).

Axiom H9 : ((i + 1%Z)%Z < i)%Z -> ((cardinal (to_fset i (i + 1%Z)%Z)) = 0%Z).

Axiom H10 :
  forall (k1:Z),
  (mem k1 (to_fset i (i + 1%Z)%Z)) <-> ((i <= k1)%Z /\ (k1 < (i + 1%Z)%Z)%Z).

Axiom H11 :
  infix_eqeq (cartesian_product (to_fset i (i + 1%Z)%Z) (to_fset k l))
  (right_injections (choose (to_fset i (i + 1%Z)%Z)) (to_fset k l)).

Axiom H12 :
  infix_eqeq (cartesian_product (to_fset i (i + 1%Z)%Z) (to_fset k l))
  (apply (to_fset k l) (fun (e2:Z) => (choose (to_fset i (i + 1%Z)%Z), e2))).

Axiom H13 :
  ((ssum (cartesian_product (to_fset i (i + 1%Z)%Z) (to_fset k l))
    (fun (o:(Z* Z)%type) => match o with
                            | (a, b) => (f a) b
                            end))
   =
   (ssum (right_injections i (to_fset k l))
    (fun (o:(Z* Z)%type) => match o with
                            | (a, b) => (f a) b
                            end))).

(* Why3 assumption *)
Definition o : (Z* Z)%type -> t :=
  fun (o1:(Z* Z)%type) => match o1 with
                          | (a, b) => (f a) b
                          end.

(* Why3 assumption *)
Definition o1 : Z -> (Z* Z)%type := (fun (y0:Z) (y1:Z) => (y0, y1)) i.

Axiom H14 : (k <= l)%Z -> ((cardinal (to_fset k l)) = (l - k)%Z).

Axiom H15 : (l < k)%Z -> ((cardinal (to_fset k l)) = 0%Z).

Axiom H16 :
  forall (k1:Z), (mem k1 (to_fset k l)) <-> ((k <= k1)%Z /\ (k1 < l)%Z).

(* Why3 goal *)
Theorem VC_sum_sum_to_ssum : injective (to_fset k l) o1.
Proof.


Qed.

