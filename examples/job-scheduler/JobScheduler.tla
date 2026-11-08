----------------------------- MODULE JobScheduler -----------------------------
EXTENDS FiniteSets

Jobs == {"j1", "j2", "j3"}
VARIABLES pending, running, finished
vars == <<pending, running, finished>>

Init == /\ pending = Jobs
        /\ running = {}
        /\ finished = {}

Start(j) ==
  /\ j \in pending
  /\ running = {}
  /\ pending' = pending \ {j}
  /\ running' = {j}
  /\ UNCHANGED finished

Finish(j) ==
  /\ j \in running
  /\ running' = running \ {j}
  /\ finished' = finished \cup {j}
  /\ UNCHANGED pending

Next == \E j \in Jobs : Start(j) \/ Finish(j)
Spec == Init /\ [][Next]_vars

TypeOK == /\ pending \subseteq Jobs
          /\ running \subseteq Jobs
          /\ finished \subseteq Jobs

AtMostOneRunning == Cardinality(running) <= 1
NoLostJobs == pending \cup running \cup finished = Jobs
DisjointStates ==
  /\ pending \cap running = {}
  /\ pending \cap finished = {}
  /\ running \cap finished = {}
=============================================================================
