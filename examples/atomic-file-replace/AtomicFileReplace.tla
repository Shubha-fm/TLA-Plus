------------------------- MODULE AtomicFileReplace -------------------------
EXTENDS Naturals

CONSTANT MaxVersion
ASSUME /\ MaxVersion \in Nat
       /\ MaxVersion > 0

VARIABLES current, staged, state
vars == <<current, staged, state>>

Init == /\ current = 0
        /\ staged = 0
        /\ state = "idle"

Stage ==
  /\ state = "idle"
  /\ current < MaxVersion
  /\ staged' = current + 1
  /\ state' = "staged"
  /\ UNCHANGED current

Commit ==
  /\ state = "staged"
  /\ current' = staged
  /\ state' = "idle"
  /\ UNCHANGED staged

Abort ==
  /\ state = "staged"
  /\ staged' = current
  /\ state' = "idle"
  /\ UNCHANGED current

Next == Stage \/ Commit \/ Abort
Spec == Init /\ [][Next]_vars

TypeOK == /\ current \in 0..MaxVersion
          /\ staged \in 0..MaxVersion
          /\ state \in {"idle", "staged"}
StagedNotOlder == current <= staged
=============================================================================
