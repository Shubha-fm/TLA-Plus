------------------------------ MODULE WaterTank ------------------------------
EXTENDS Naturals

CONSTANT Capacity
ASSUME /\ Capacity \in Nat
       /\ Capacity > 0

VARIABLES level, valve
vars == <<level, valve>>

Init == /\ level = 0
        /\ valve = "closed"

OpenValve ==
  /\ valve = "closed"
  /\ level < Capacity
  /\ valve' = "open"
  /\ UNCHANGED level

Fill ==
  /\ valve = "open"
  /\ level < Capacity
  /\ level' = level + 1
  /\ valve' = IF level + 1 = Capacity THEN "closed" ELSE "open"

CloseValve ==
  /\ valve = "open"
  /\ valve' = "closed"
  /\ UNCHANGED level

Drain ==
  /\ valve = "closed"
  /\ level > 0
  /\ level' = level - 1
  /\ UNCHANGED valve

Next == OpenValve \/ Fill \/ CloseValve \/ Drain
Spec == Init /\ [][Next]_vars

TypeOK == /\ level \in 0..Capacity
          /\ valve \in {"open", "closed"}
NoOverflow == level <= Capacity
ClosedAtFull == level = Capacity => valve = "closed"
=============================================================================
