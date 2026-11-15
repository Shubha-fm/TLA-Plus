--------------------------- MODULE WarehouseRobot ---------------------------
EXTENDS Naturals

CONSTANT LastCell
ASSUME /\ LastCell \in Nat
       /\ LastCell > 0

VARIABLES pos, load
vars == <<pos, load>>

Init == /\ pos = 0
        /\ load = FALSE

MoveForward ==
  /\ pos < LastCell
  /\ pos' = pos + 1
  /\ UNCHANGED load

MoveBackward ==
  /\ pos > 0
  /\ pos' = pos - 1
  /\ UNCHANGED load

PickUp ==
  /\ pos = LastCell
  /\ ~load
  /\ load' = TRUE
  /\ UNCHANGED pos

DropOff ==
  /\ pos = 0
  /\ load
  /\ load' = FALSE
  /\ UNCHANGED pos

Next == MoveForward \/ MoveBackward \/ PickUp \/ DropOff
Spec == Init /\ [][Next]_vars

TypeOK == /\ pos \in 0..LastCell
          /\ load \in BOOLEAN
=============================================================================
