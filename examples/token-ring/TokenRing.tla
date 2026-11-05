----------------------------- MODULE TokenRing -----------------------------
EXTENDS Naturals

CONSTANT N
ASSUME N \in Nat \ {0}

Nodes == 1..N
VARIABLE holder
vars == <<holder>>

Init == holder = 1
Pass == /\ holder \in Nodes
        /\ holder' = IF holder = N THEN 1 ELSE holder + 1

Next == Pass
Spec == Init /\ [][Next]_vars
TypeOK == holder \in Nodes
=============================================================================
