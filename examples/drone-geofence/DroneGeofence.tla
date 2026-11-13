--------------------------- MODULE DroneGeofence ---------------------------
EXTENDS Naturals

CONSTANT Limit
ASSUME /\ Limit \in Nat
       /\ Limit > 0

VARIABLES position, flying
vars == <<position, flying>>

Init == /\ position = 0
        /\ flying = FALSE

TakeOff ==
  /\ ~flying
  /\ flying' = TRUE
  /\ UNCHANGED position

MoveForward ==
  /\ flying
  /\ position < Limit
  /\ position' = position + 1
  /\ UNCHANGED flying

MoveBack ==
  /\ flying
  /\ position > 0
  /\ position' = position - 1
  /\ UNCHANGED flying

Land ==
  /\ flying
  /\ position = 0
  /\ flying' = FALSE
  /\ UNCHANGED position

Next == TakeOff \/ MoveForward \/ MoveBack \/ Land
Spec == Init /\ [][Next]_vars

TypeOK == /\ position \in 0..Limit
          /\ flying \in BOOLEAN
InsideGeofence == position <= Limit
=============================================================================
