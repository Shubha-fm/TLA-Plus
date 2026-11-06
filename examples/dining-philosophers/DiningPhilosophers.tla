------------------------ MODULE DiningPhilosophers ------------------------
EXTENDS Naturals

CONSTANT N
ASSUME /\ N \in Nat
       /\ N >= 2

Philosophers == 1..N
Left(p) == p
Right(p) == IF p = N THEN 1 ELSE p + 1

VARIABLES eating, forks
vars == <<eating, forks>>

Init == /\ eating = {}
        /\ forks = {}

StartEating(p) ==
  /\ p \in Philosophers
  /\ p \notin eating
  /\ Left(p) \notin forks
  /\ Right(p) \notin forks
  /\ eating' = eating \cup {p}
  /\ forks' = forks \cup {Left(p), Right(p)}

StopEating(p) ==
  /\ p \in eating
  /\ eating' = eating \ {p}
  /\ forks' = forks \ {Left(p), Right(p)}

Next == \E p \in Philosophers : StartEating(p) \/ StopEating(p)
Spec == Init /\ [][Next]_vars

TypeOK == /\ eating \subseteq Philosophers
          /\ forks \subseteq Philosophers

NoAdjacentEating ==
  \A p \in Philosophers :
    ~(p \in eating /\ (IF p = N THEN 1 ELSE p + 1) \in eating)

ForkAccounting ==
  forks = UNION { {Left(p), Right(p)} : p \in eating }
=============================================================================
