----------------------- MODULE RoundRobinScheduler -----------------------
EXTENDS Naturals

CONSTANT N
ASSUME /\ N \in Nat
       /\ N >= 2

Tasks == 1..N
VARIABLES current, executed
vars == <<current, executed>>

Init == /\ current = 1
        /\ executed = {}

Run ==
  /\ current \in Tasks
  /\ executed' = executed \cup {current}
  /\ current' = IF current = N THEN 1 ELSE current + 1

Next == Run
Spec == Init /\ [][Next]_vars

TypeOK == /\ current \in Tasks
          /\ executed \subseteq Tasks
=============================================================================
