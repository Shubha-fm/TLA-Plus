--------------------------- MODULE LeaderElection ---------------------------
EXTENDS Naturals, FiniteSets

CONSTANT N
ASSUME /\ N \in Nat
       /\ N >= 2

Nodes == 1..N

VARIABLES active, leader
vars == <<active, leader>>

Init == /\ active = Nodes
        /\ leader = 0

Elect ==
  /\ active # {}
  /\ leader = 0
  /\ leader' = Max(active)
  /\ UNCHANGED active

Fail(n) ==
  /\ n \in active
  /\ active' = active \ {n}
  /\ leader' = IF leader = n THEN 0 ELSE leader

Next == Elect \/ \E n \in Nodes : Fail(n)
Spec == Init /\ [][Next]_vars

TypeOK == /\ active \subseteq Nodes
          /\ leader \in Nodes \cup {0}

LeaderActive == leader # 0 => leader \in active
=============================================================================
