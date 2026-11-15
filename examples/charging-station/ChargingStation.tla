-------------------------- MODULE ChargingStation --------------------------
EXTENDS Naturals, FiniteSets

Vehicles == {"v1", "v2", "v3"}
CONSTANT Ports
ASSUME /\ Ports \in Nat
       /\ Ports > 0

VARIABLE charging
vars == <<charging>>

Init == charging = {}

PlugIn(v) ==
  /\ v \in Vehicles \ charging
  /\ Cardinality(charging) < Ports
  /\ charging' = charging \cup {v}

Unplug(v) ==
  /\ v \in charging
  /\ charging' = charging \ {v}

Next == \E v \in Vehicles : PlugIn(v) \/ Unplug(v)
Spec == Init /\ [][Next]_vars

TypeOK == charging \subseteq Vehicles
PortBound == Cardinality(charging) <= Ports
=============================================================================
