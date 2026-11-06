-------------------------- MODULE CountingSemaphore --------------------------
EXTENDS Naturals, FiniteSets

CONSTANT Capacity
ASSUME /\ Capacity \in Nat
       /\ Capacity > 0

Clients == {"a", "b", "c"}
VARIABLE holding
vars == <<holding>>

Init == holding = {}

Acquire(c) ==
  /\ c \in Clients \ holding
  /\ Cardinality(holding) < Capacity
  /\ holding' = holding \cup {c}

Release(c) ==
  /\ c \in holding
  /\ holding' = holding \ {c}

Next == \E c \in Clients : Acquire(c) \/ Release(c)
Spec == Init /\ [][Next]_vars

TypeOK == holding \subseteq Clients
CapacityBound == Cardinality(holding) <= Capacity
=============================================================================
