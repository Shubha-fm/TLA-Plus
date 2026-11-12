------------------------- MODULE SatelliteSeparation -------------------------
EXTENDS Integers

CONSTANTS MaxPosition, MinSeparation
ASSUME /\ MaxPosition \in Nat
       /\ MinSeparation \in Nat
       /\ MinSeparation > 0
       /\ MaxPosition >= MinSeparation

VARIABLES p1, p2
vars == <<p1, p2>>

Init == /\ p1 = 0
        /\ p2 = MaxPosition

Distance == IF p1 <= p2 THEN p2 - p1 ELSE p1 - p2

MoveFirst ==
  /\ p1 < MaxPosition
  /\ (IF p1 + 1 <= p2 THEN p2 - (p1 + 1)
      ELSE (p1 + 1) - p2) >= MinSeparation
  /\ p1' = p1 + 1
  /\ UNCHANGED p2

MoveSecond ==
  /\ p2 > 0
  /\ (IF p1 <= p2 - 1 THEN (p2 - 1) - p1
      ELSE p1 - (p2 - 1)) >= MinSeparation
  /\ p2' = p2 - 1
  /\ UNCHANGED p1

Next == MoveFirst \/ MoveSecond
Spec == Init /\ [][Next]_vars

TypeOK == /\ p1 \in 0..MaxPosition
          /\ p2 \in 0..MaxPosition
SafeSeparation == Distance >= MinSeparation
=============================================================================
