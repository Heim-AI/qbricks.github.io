(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require HighOrd.
Require int.Int.

Axiom set : forall (a:Type), Type.
Parameter set_WhyType : forall (a:Type) {a_WT:WhyType a}, WhyType (set a).
Existing Instance set_WhyType.

Parameter mem: forall {a:Type} {a_WT:WhyType a}, a -> (set a) -> Prop.

Parameter infix_eqeq:
  forall {a:Type} {a_WT:WhyType a}, (set a) -> (set a) -> Prop.

Axiom infix_eqeq_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), (infix_eqeq s1 s2) -> forall (x:a),
  (mem x s1) -> mem x s2.

Axiom infix_eqeq_spec1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), (infix_eqeq s1 s2) -> forall (x:a),
  (mem x s2) -> mem x s1.

Axiom infix_eqeq_spec2 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), (forall (x:a), (mem x s1) <-> (mem x s2)) ->
  infix_eqeq s1 s2.

Axiom extensionality :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), (infix_eqeq s1 s2) -> (s1 = s2).

Parameter subset:
  forall {a:Type} {a_WT:WhyType a}, (set a) -> (set a) -> Prop.

Axiom subset_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), (subset s1 s2) -> forall (x:a), (mem x s1) ->
  mem x s2.

Axiom subset_spec1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), (forall (x:a), (mem x s1) -> mem x s2) ->
  subset s1 s2.

Axiom subset_refl :
  forall {a:Type} {a_WT:WhyType a}, forall (s:set a), subset s s.

Axiom subset_trans :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a) (s3:set a), (subset s1 s2) ->
  (subset s2 s3) -> subset s1 s3.

Parameter is_empty: forall {a:Type} {a_WT:WhyType a}, (set a) -> Prop.

Axiom is_empty_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), (is_empty s) -> forall (x:a), ~ (mem x s).

Axiom is_empty_spec1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), (forall (x:a), ~ (mem x s)) -> is_empty s.

Parameter empty: forall {a:Type} {a_WT:WhyType a}, set a.

Axiom empty_def : forall {a:Type} {a_WT:WhyType a}, is_empty (empty : set a).

Parameter add: forall {a:Type} {a_WT:WhyType a}, a -> (set a) -> set a.

Axiom add_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (s:set a), forall (y:a), (mem y (add x s)) ->
  (y = x) \/ (mem y s).

Axiom add_spec1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (s:set a), forall (y:a), (y = x) -> mem y (add x s).

Axiom add_spec2 :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (s:set a), forall (y:a), (mem y s) -> mem y (add x s).

Parameter remove: forall {a:Type} {a_WT:WhyType a}, a -> (set a) -> set a.

Axiom remove_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (s:set a), forall (y:a), (mem y (remove x s)) -> ~ (y = x).

Axiom remove_spec1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (s:set a), forall (y:a), (mem y (remove x s)) -> mem y s.

Axiom remove_spec2 :
  forall {a:Type} {a_WT:WhyType a},
  forall (x:a) (s:set a), forall (y:a), (~ (y = x) /\ (mem y s)) ->
  mem y (remove x s).

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
  forall (s1:set a) (s2:set a), forall (x:a), (mem x (union s1 s2)) ->
  (mem x s1) \/ (mem x s2).

Axiom union_spec1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), forall (x:a), (mem x s1) ->
  mem x (union s1 s2).

Axiom union_spec2 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), forall (x:a), (mem x s2) ->
  mem x (union s1 s2).

Parameter inter:
  forall {a:Type} {a_WT:WhyType a}, (set a) -> (set a) -> set a.

Axiom inter_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), forall (x:a), (mem x (inter s1 s2)) ->
  mem x s1.

Axiom inter_spec1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), forall (x:a), (mem x (inter s1 s2)) ->
  mem x s2.

Axiom inter_spec2 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), forall (x:a), ((mem x s1) /\ (mem x s2)) ->
  mem x (inter s1 s2).

Parameter diff:
  forall {a:Type} {a_WT:WhyType a}, (set a) -> (set a) -> set a.

Axiom diff_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), forall (x:a), (mem x (diff s1 s2)) ->
  mem x s1.

Axiom diff_spec1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), forall (x:a), (mem x (diff s1 s2)) ->
  ~ (mem x s2).

Axiom diff_spec2 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s1:set a) (s2:set a), forall (x:a), ((mem x s1) /\ ~ (mem x s2)) ->
  mem x (diff s1 s2).

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
  forall (s:set a), ((cardinal s) = 0%Z) -> is_empty s.

Axiom cardinal_empty1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), (is_empty s) -> ((cardinal s) = 0%Z).

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
  forall (p:a -> bool) (u:set a), forall (x:a), (mem x (filter p u)) ->
  ((p x) = true).

Axiom filter_def1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (p:a -> bool) (u:set a), forall (x:a), (mem x (filter p u)) ->
  mem x u.

Axiom filter_def2 :
  forall {a:Type} {a_WT:WhyType a},
  forall (p:a -> bool) (u:set a), forall (x:a),
  (((p x) = true) /\ (mem x u)) -> mem x (filter p u).

Axiom filter_cardinal :
  forall {a:Type} {a_WT:WhyType a},
  forall (p:a -> bool) (u:set a), ((cardinal (filter p u)) <= (cardinal u))%Z.

Parameter map:
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b}, (a -> b) ->
  (set a) -> set b.

Axiom map_def1 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (f:a -> b) (u:set a), forall (y:b), (mem y (map f u)) ->
  exists x:a, (mem x u) /\ (y = (f x)).

Axiom map_def11 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (f:a -> b) (u:set a), forall (y:b),
  (exists x:a, (mem x u) /\ (y = (f x))) -> mem y (map f u).

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
  forall (s:set a) (s':set a), (is_empty s') -> ((union s s') = s).

Axiom union_empty_comm :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (s':set a), (is_empty s') -> ((union s s') = s).

Axiom set_subset :
  forall {a:Type} {a_WT:WhyType a},
  forall (s':set a) (s:set a), (forall (e:a), (mem e s') -> mem e s) ->
  subset s' s.

Axiom set_empty :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), (forall (e:a), ~ (mem e s)) -> (s = (empty : set a)).

Axiom set_empty1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), (forall (e:a), ~ (mem e s)) -> is_empty s.

Axiom set_equal :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (s':set a), (forall (e:a), (mem e s) -> mem e s') ->
  (forall (e:a), (mem e s') -> mem e s) -> (s = s').

Axiom get_empty :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), (s = (empty : set a)) -> forall (e:a), ~ (mem e s).

Axiom get_empty1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a), (s = (empty : set a)) -> is_empty s.

Axiom union_add :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (s':set a) (x:a), ~ (mem x s') ->
  ((union s (add x s')) = (add x (union s s'))).

Axiom union_add_comm :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (s':set a) (x:a), ~ (mem x s') ->
  ((add x (union s s')) = (union s (add x s'))).

Axiom remove_add1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (x:a), ~ (mem x s) -> ((remove x (add x s)) = s).

Axiom add_remove1 :
  forall {a:Type} {a_WT:WhyType a},
  forall (s:set a) (x:a), (mem x s) -> ((add x (remove x s)) = s).

(* Why3 assumption *)
Definition injective {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b}
    (s:set a) (f:a -> b) : Prop :=
  forall (a1:a) (b1:a), ~ (a1 = b1) -> ~ ((f a1) = (f b1)).

Axiom map_choose :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a), forall (f:a -> b), ((choose (map f s)) = (f (choose s))).

Axiom map_remove_choose :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (f:a -> b), (injective s f) ->
  ((map f (remove (choose s) s)) = (remove (choose (map f s)) (map f s))).

Parameter right_injections:
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b}, a -> (set b) ->
  set (a* b)%type.

Axiom right_injections_def :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (s:set b), (is_empty s) ->
  ((right_injections a1 s) = (empty : set (a* b)%type)).

Axiom right_injections_def1 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (s:set b), ~ (is_empty s) ->
  ((right_injections a1 s) =
   (add (a1, choose s) (right_injections a1 (remove (choose s) s)))).

Axiom right_injections_spec :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (s:set b),
  ((cardinal (right_injections a1 s)) = (cardinal s)).

Axiom right_injections_spec1 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (s:set b), forall (a':a), forall (b1:b),
  (mem (a', b1) (right_injections a1 s)) -> (a' = a1).

Axiom right_injections_spec2 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (s:set b), forall (a':a), forall (b1:b),
  (mem (a', b1) (right_injections a1 s)) -> mem b1 s.

Axiom right_injections_spec3 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (s:set b), forall (a':a), forall (b1:b),
  ((a' = a1) /\ (mem b1 s)) -> mem (a', b1) (right_injections a1 s).

Axiom right_injections_spec4 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (s:set b),
  ((right_injections a1 s) = (map (fun (b1:b) => (a1, b1)) s)).

Parameter left_injections:
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b}, (set a) -> b ->
  set (a* b)%type.

Axiom left_injections_def :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b), (is_empty s) ->
  ((left_injections s b1) = (empty : set (a* b)%type)).

Axiom left_injections_def1 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b), ~ (is_empty s) ->
  ((left_injections s b1) =
   (add (choose s, b1) (left_injections (remove (choose s) s) b1))).

Axiom left_injections_spec :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b), forall (a1:a), forall (b':b),
  (mem (a1, b') (left_injections s b1)) -> mem a1 s.

Axiom left_injections_spec1 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b), forall (a1:a), forall (b':b),
  (mem (a1, b') (left_injections s b1)) -> (b' = b1).

Axiom left_injections_spec2 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b), forall (a1:a), forall (b':b),
  ((mem a1 s) /\ (b' = b1)) -> mem (a1, b') (left_injections s b1).

Axiom left_injections_spec3 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b), ((cardinal (left_injections s b1)) = (cardinal s)).

Axiom left_injections_spec4 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b),
  ((left_injections s b1) = (map (fun (a1:a) => (a1, b1)) s)).

Axiom right_injections_l :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (s:set b),
  ((cardinal (right_injections a1 s)) = (cardinal s)).

Axiom right_injections_l1 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (s:set b), forall (a':a), forall (b1:b),
  (mem (a', b1) (right_injections a1 s)) -> (a' = a1).

Axiom right_injections_l2 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (s:set b), forall (a':a), forall (b1:b),
  (mem (a', b1) (right_injections a1 s)) -> mem b1 s.

Axiom right_injections_l3 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (s:set b), forall (a':a), forall (b1:b),
  ((a' = a1) /\ (mem b1 s)) -> mem (a', b1) (right_injections a1 s).

Axiom right_injections_l4 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (s:set b),
  ((right_injections a1 s) = (map (fun (b1:b) => (a1, b1)) s)).

Axiom left_injections_l :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b), forall (a1:a), forall (b':b),
  (mem (a1, b') (left_injections s b1)) -> mem a1 s.

Axiom left_injections_l1 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b), forall (a1:a), forall (b':b),
  (mem (a1, b') (left_injections s b1)) -> (b' = b1).

Axiom left_injections_l2 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b), forall (a1:a), forall (b':b),
  ((mem a1 s) /\ (b' = b1)) -> mem (a1, b') (left_injections s b1).

Axiom left_injections_l3 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b), ((cardinal (left_injections s b1)) = (cardinal s)).

Axiom left_injections_l4 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b),
  ((left_injections s b1) = (map (fun (a1:a) => (a1, b1)) s)).

Axiom disjoint_injections :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b) (c:b), ~ (b1 = c) ->
  is_empty (inter (right_injections b1 s) (right_injections c s)).

Axiom disjoint_injections1 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s:set a) (b1:b) (c:b), ~ (b1 = c) ->
  is_empty (inter (left_injections s b1) (left_injections s c)).

Axiom induction :
  forall {a:Type} {a_WT:WhyType a},
  forall (p:(set a) -> bool) (t:set a),
  (forall (s:set a), (is_empty s) -> ((p s) = true)) ->
  (forall (s:set a), ((p s) = true) -> forall (t1:a), ~ (mem t1 s) ->
   ((p (add t1 s)) = true)) ->
  ((p t) = true).

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
  ((cardinal (cartesian_product s1 s2)) = ((cardinal s1) * (cardinal s2))%Z).

Axiom cartesian_product_spec1 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b), forall (a1:a), forall (b1:b),
  (mem (a1, b1) (cartesian_product s1 s2)) -> mem a1 s1.

Axiom cartesian_product_spec2 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b), forall (a1:a), forall (b1:b),
  (mem (a1, b1) (cartesian_product s1 s2)) -> mem b1 s2.

Axiom cartesian_product_spec3 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b), forall (a1:a), forall (b1:b),
  ((mem a1 s1) /\ (mem b1 s2)) -> mem (a1, b1) (cartesian_product s1 s2).

Axiom cartesian_product_spec4 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b), forall (o:(a* b)%type),
  (mem o (cartesian_product s1 s2)) -> forall (x:a) (x1:b), (o = (x, x1)) ->
  mem x s1.

Axiom cartesian_product_spec5 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b), forall (o:(a* b)%type),
  (mem o (cartesian_product s1 s2)) -> forall (x:a) (x1:b), (o = (x, x1)) ->
  mem x1 s2.

Axiom cartesian_product_spec6 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b), forall (o:(a* b)%type),
  (exists x:a, exists x1:b, (o = (x, x1)) /\ ((mem x s1) /\ (mem x1 s2))) ->
  mem o (cartesian_product s1 s2).

(* Why3 assumption *)
Definition commute {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b}
    (o:(a* b)%type) : (b* a)%type :=
  match o with
  | (a1, b1) => (b1, a1)
  end.

Axiom commute_inj :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (a':a) (b1:b) (b':b), ~ (a1 = a') ->
  ~ ((commute (a1, b1)) = (commute (a', b'))).

Axiom commute_inj1 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (a1:a) (a':a) (b1:b) (b':b), ~ (b1 = b') ->
  ~ ((commute (a1, b1)) = (commute (a', b'))).

Axiom commute_inj_gen :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b),
  injective (cartesian_product s1 s2) (fun (y0:(a* b)%type) => (commute y0)).

(* Why3 assumption *)
Definition commute_product {a:Type} {a_WT:WhyType a}
    {b:Type} {b_WT:WhyType b} (s1:set a) (s2:set b) : set (b* a)%type :=
  map (fun (y0:(a* b)%type) => (commute y0)) (cartesian_product s1 s2).

Axiom commute_product_spec :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b),
  ((commute_product s1 s2) = (cartesian_product s2 s1)).

(* Why3 assumption *)
Definition commute_product_el {a:Type} {a_WT:WhyType a}
    {b:Type} {b_WT:WhyType b} (s1:set a) (s2:set b) : set (b* a)%type :=
  map (fun (y0:(a* b)%type) => (commute y0)) (cartesian_product s1 s2).

Axiom commute_product_el_spec :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b), forall (o:(a* b)%type), forall (x:a) (x1:b),
  (o = (x, x1)) -> (mem o (cartesian_product s1 s2)) -> mem x s1.

Axiom commute_product_el_spec1 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b), forall (o:(a* b)%type), forall (x:a) (x1:b),
  (o = (x, x1)) -> (mem o (cartesian_product s1 s2)) -> mem x1 s2.

Axiom commute_product_el_spec2 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b), forall (o:(a* b)%type), forall (x:a) (x1:b),
  (o = (x, x1)) -> ((mem x s1) /\ (mem x1 s2)) ->
  mem o (cartesian_product s1 s2).

Axiom commute_product_el_spec3 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b), forall (o:(a* b)%type), forall (x:a) (x1:b),
  (o = (x, x1)) -> ((mem x s1) /\ (mem x1 s2)) ->
  mem (x1, x) (commute_product_el s1 s2).

Axiom commute_product_el_spec4 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b), forall (o:(a* b)%type), forall (x:a) (x1:b),
  (o = (x, x1)) -> (mem (x1, x) (commute_product_el s1 s2)) -> mem x s1.

Axiom commute_product_el_spec5 :
  forall {a:Type} {a_WT:WhyType a} {b:Type} {b_WT:WhyType b},
  forall (s1:set a) (s2:set b), forall (o:(a* b)%type), forall (x:a) (x1:b),
  (o = (x, x1)) -> (mem (x1, x) (commute_product_el s1 s2)) -> mem x1 s2.

Axiom a : Type.
Parameter a_WhyType : WhyType a.
Existing Instance a_WhyType.

Axiom b : Type.
Parameter b_WhyType : WhyType b.
Existing Instance b_WhyType.

Parameter s1: set a.

Parameter s2: set b.

Parameter s3: set b.

Parameter o: (a* b)%type.

Axiom H : forall (x:a) (x1:b), (o = (x, x1)) -> mem x s1.

Axiom H1 : forall (x:a) (x1:b), (o = (x, x1)) -> mem x1 (union s2 s3).

Axiom Hinst :
  ((cardinal (cartesian_product s1 (union s2 s3))) =
   ((cardinal s1) * (cardinal (union s2 s3)))%Z).

Axiom Hinst1 :
  forall (a1:a), forall (b1:b),
  (mem (a1, b1) (cartesian_product s1 (union s2 s3))) -> mem a1 s1.

Axiom Hinst2 :
  forall (a1:a), forall (b1:b),
  (mem (a1, b1) (cartesian_product s1 (union s2 s3))) -> mem b1 (union s2 s3).

Axiom Hinst3 :
  forall (a1:a), forall (b1:b), ((mem a1 s1) /\ (mem b1 (union s2 s3))) ->
  mem (a1, b1) (cartesian_product s1 (union s2 s3)).

Axiom Hinst4 :
  forall (o1:(a* b)%type), (mem o1 (cartesian_product s1 (union s2 s3))) ->
  forall (x:a) (x1:b), (o1 = (x, x1)) -> mem x s1.

Axiom Hinst5 :
  forall (o1:(a* b)%type), (mem o1 (cartesian_product s1 (union s2 s3))) ->
  forall (x:a) (x1:b), (o1 = (x, x1)) -> mem x1 (union s2 s3).

Axiom Hinst6 :
  forall (o1:(a* b)%type),
  (exists x:a, exists x1:b,
   (o1 = (x, x1)) /\ ((mem x s1) /\ (mem x1 (union s2 s3)))) ->
  mem o1 (cartesian_product s1 (union s2 s3)).

(* Why3 goal *)
Theorem h : exists x:a, exists x1:b, ((x, x1) = o).
Proof.


Qed.

