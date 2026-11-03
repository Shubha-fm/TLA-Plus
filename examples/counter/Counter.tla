------------------------------ MODULE Counter ------------------------------
EXTENDS Naturals

CONSTANT Max
ASSUME Max \in Nat

VARIABLE count
vars == <<count>>

Init == count = 0
Inc == /\ count < Max
       /\ count' = count + 1
Reset == /\ count = Max
         /\ count' = 0
Next == Inc \/ Reset

Spec == Init /\ [][Next]_vars

TypeOK == count \in 0..Max
=============================================================================
