----------------------------- MODULE ParkingLot -----------------------------
EXTENDS Naturals, FiniteSets

CONSTANT Capacity
ASSUME /\ Capacity \in Nat
       /\ Capacity > 0

Cars == {"car1", "car2", "car3"}
VARIABLE parked
vars == <<parked>>

Init == parked = {}

Enter(c) ==
  /\ c \in Cars \ parked
  /\ Cardinality(parked) < Capacity
  /\ parked' = parked \cup {c}

Leave(c) ==
  /\ c \in parked
  /\ parked' = parked \ {c}

Next == \E c \in Cars : Enter(c) \/ Leave(c)
Spec == Init /\ [][Next]_vars

TypeOK == parked \subseteq Cars
CapacitySafe == Cardinality(parked) <= Capacity
=============================================================================
