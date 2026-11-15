--------------------------- MODULE RailwaySwitch ---------------------------
EXTENDS Naturals

VARIABLES route, locked, train
vars == <<route, locked, train>>

Init == /\ route = "A"
        /\ locked = FALSE
        /\ train = "away"

SelectRoute(r) ==
  /\ r \in {"A", "B"}
  /\ ~locked
  /\ train = "away"
  /\ route' = r
  /\ UNCHANGED <<locked, train>>

LockRoute ==
  /\ ~locked
  /\ train = "away"
  /\ locked' = TRUE
  /\ UNCHANGED <<route, train>>

Enter ==
  /\ locked
  /\ train = "away"
  /\ train' = "passing"
  /\ UNCHANGED <<route, locked>>

Exit ==
  /\ train = "passing"
  /\ train' = "away"
  /\ UNCHANGED <<route, locked>>

Unlock ==
  /\ train = "away"
  /\ locked
  /\ locked' = FALSE
  /\ UNCHANGED <<route, train>>

Next == (\/ \E r \in {"A", "B"} : SelectRoute(r))
        \/ LockRoute \/ Enter \/ Exit \/ Unlock

Spec == Init /\ [][Next]_vars
TypeOK == /\ route \in {"A", "B"}
          /\ locked \in BOOLEAN
          /\ train \in {"away", "passing"}

TrainRequiresLock == train = "passing" => locked
=============================================================================
