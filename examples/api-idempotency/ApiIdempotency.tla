--------------------------- MODULE ApiIdempotency ---------------------------
EXTENDS Naturals

Requests == {"r1", "r2"}
VARIABLES processed, effects
vars == <<processed, effects>>

Init == /\ processed = {}
        /\ effects = 0

Process(r) ==
  /\ r \in Requests \ processed
  /\ processed' = processed \cup {r}
  /\ effects' = effects + 1

Duplicate(r) ==
  /\ r \in processed
  /\ UNCHANGED vars

Next == \E r \in Requests : Process(r) \/ Duplicate(r)
Spec == Init /\ [][Next]_vars

TypeOK == /\ processed \subseteq Requests
          /\ effects \in 0..2
AtMostOnce == effects = Cardinality(processed)
=============================================================================
