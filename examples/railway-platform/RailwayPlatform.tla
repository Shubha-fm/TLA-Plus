-------------------------- MODULE RailwayPlatform --------------------------
EXTENDS FiniteSets

Trains == {"t1", "t2", "t3"}
VARIABLES waiting, occupying, departed
vars == <<waiting, occupying, departed>>

Init == /\ waiting = Trains
        /\ occupying = {}
        /\ departed = {}

Enter(t) ==
  /\ t \in waiting
  /\ occupying = {}
  /\ waiting' = waiting \ {t}
  /\ occupying' = {t}
  /\ UNCHANGED departed

Leave(t) ==
  /\ t \in occupying
  /\ occupying' = {}
  /\ departed' = departed \cup {t}
  /\ UNCHANGED waiting

Next == \E t \in Trains : Enter(t) \/ Leave(t)
Spec == Init /\ [][Next]_vars

TypeOK == /\ waiting \subseteq Trains
          /\ occupying \subseteq Trains
          /\ departed \subseteq Trains

PlatformCapacity == Cardinality(occupying) <= 1
TrainAccounting ==
  /\ waiting \cup occupying \cup departed = Trains
  /\ waiting \cap occupying = {}
  /\ waiting \cap departed = {}
  /\ occupying \cap departed = {}
=============================================================================
