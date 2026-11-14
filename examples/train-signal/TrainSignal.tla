---------------------------- MODULE TrainSignal ----------------------------
EXTENDS Naturals

VARIABLES signal, occupied
vars == <<signal, occupied>>

Init == /\ signal = "red"
        /\ occupied = FALSE

ClearSignal ==
  /\ signal = "red"
  /\ ~occupied
  /\ signal' = "green"
  /\ UNCHANGED occupied

EnterBlock ==
  /\ signal = "green"
  /\ ~occupied
  /\ occupied' = TRUE
  /\ signal' = "red"

ExitBlock ==
  /\ occupied
  /\ occupied' = FALSE
  /\ UNCHANGED signal

StopSignal ==
  /\ signal = "green"
  /\ signal' = "red"
  /\ UNCHANGED occupied

Next == ClearSignal \/ EnterBlock \/ ExitBlock \/ StopSignal
Spec == Init /\ [][Next]_vars

TypeOK == /\ signal \in {"red", "green"}
          /\ occupied \in BOOLEAN
OccupiedImpliesRed == occupied => signal = "red"
=============================================================================
