--------------------------- MODULE RailwayCrossing ---------------------------
EXTENDS Naturals

VARIABLES train, gate
vars == <<train, gate>>

Init == /\ train = "far"
        /\ gate = "open"

Approach ==
  /\ train = "far"
  /\ train' = "approaching"
  /\ UNCHANGED gate

CloseGate ==
  /\ train = "approaching"
  /\ gate = "open"
  /\ gate' = "closed"
  /\ UNCHANGED train

EnterCrossing ==
  /\ train = "approaching"
  /\ gate = "closed"
  /\ train' = "crossing"
  /\ UNCHANGED gate

ExitCrossing ==
  /\ train = "crossing"
  /\ train' = "passed"
  /\ UNCHANGED gate

OpenGate ==
  /\ train = "passed"
  /\ gate = "closed"
  /\ gate' = "open"
  /\ UNCHANGED train

Reset ==
  /\ train = "passed"
  /\ gate = "open"
  /\ train' = "far"
  /\ UNCHANGED gate

Next == Approach \/ CloseGate \/ EnterCrossing \/ ExitCrossing \/ OpenGate \/ Reset
Spec == Init /\ [][Next]_vars

TypeOK == /\ train \in {"far", "approaching", "crossing", "passed"}
          /\ gate \in {"open", "closed"}

CrossingProtected == train = "crossing" => gate = "closed"
=============================================================================
