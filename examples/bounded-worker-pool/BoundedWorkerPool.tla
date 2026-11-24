------------------------- MODULE BoundedWorkerPool -------------------------
EXTENDS Naturals, FiniteSets

CONSTANT Capacity
ASSUME /\ Capacity \in Nat
       /\ Capacity > 0

Jobs == {"j1", "j2", "j3"}
VARIABLES waiting, running, finished
vars == <<waiting, running, finished>>

Init == /\ waiting = Jobs
        /\ running = {}
        /\ finished = {}

Start(j) ==
  /\ j \in waiting
  /\ Cardinality(running) < Capacity
  /\ waiting' = waiting \ {j}
  /\ running' = running \cup {j}
  /\ UNCHANGED finished

Complete(j) ==
  /\ j \in running
  /\ running' = running \ {j}
  /\ finished' = finished \cup {j}
  /\ UNCHANGED waiting

Next == \E j \in Jobs : Start(j) \/ Complete(j)
Spec == Init /\ [][Next]_vars

TypeOK == /\ waiting \subseteq Jobs
          /\ running \subseteq Jobs
          /\ finished \subseteq Jobs

PoolCapacity == Cardinality(running) <= Capacity
JobPartition ==
  /\ waiting \cup running \cup finished = Jobs
  /\ waiting \cap running = {}
  /\ waiting \cap finished = {}
  /\ running \cap finished = {}
=============================================================================
