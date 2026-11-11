--------------------------- MODULE BoundedPipeline ---------------------------
EXTENDS Naturals

CONSTANT Total
ASSUME /\ Total \in Nat
       /\ Total > 0

VARIABLES waiting, processing, completed
vars == <<waiting, processing, completed>>

Init == /\ waiting = Total
        /\ processing = 0
        /\ completed = 0

Start ==
  /\ waiting > 0
  /\ processing = 0
  /\ waiting' = waiting - 1
  /\ processing' = 1
  /\ UNCHANGED completed

Finish ==
  /\ processing = 1
  /\ processing' = 0
  /\ completed' = completed + 1
  /\ UNCHANGED waiting

Next == Start \/ Finish
Spec == Init /\ [][Next]_vars

TypeOK == /\ waiting \in 0..Total
          /\ processing \in 0..1
          /\ completed \in 0..Total
Conservation == waiting + processing + completed = Total
=============================================================================
