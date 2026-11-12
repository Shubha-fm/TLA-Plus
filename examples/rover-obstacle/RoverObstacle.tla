--------------------------- MODULE RoverObstacle ---------------------------
EXTENDS Naturals

CONSTANT EndPosition
ASSUME /\ EndPosition \in Nat
       /\ EndPosition > 0

VARIABLES pos, obstacle, mode
vars == <<pos, obstacle, mode>>

Init == /\ pos = 0
        /\ obstacle = FALSE
        /\ mode = "moving"

DetectObstacle ==
  /\ mode = "moving"
  /\ ~obstacle
  /\ obstacle' = TRUE
  /\ mode' = "stopped"
  /\ UNCHANGED pos

ClearObstacle ==
  /\ mode = "stopped"
  /\ obstacle
  /\ obstacle' = FALSE
  /\ UNCHANGED <<pos, mode>>

Resume ==
  /\ mode = "stopped"
  /\ ~obstacle
  /\ pos < EndPosition
  /\ mode' = "moving"
  /\ UNCHANGED <<pos, obstacle>>

Advance ==
  /\ mode = "moving"
  /\ ~obstacle
  /\ pos < EndPosition
  /\ pos' = pos + 1
  /\ mode' = IF pos' = EndPosition THEN "arrived" ELSE "moving"
  /\ UNCHANGED obstacle

Next == DetectObstacle \/ ClearObstacle \/ Resume \/ Advance
Spec == Init /\ [][Next]_vars

TypeOK == /\ pos \in 0..EndPosition
          /\ obstacle \in BOOLEAN
          /\ mode \in {"moving", "stopped", "arrived"}
StopOnObstacle == obstacle => mode = "stopped"
NoOverrun == pos <= EndPosition
=============================================================================
