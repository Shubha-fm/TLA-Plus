------------------------- MODULE CheckpointRecovery -------------------------
EXTENDS Naturals

CONSTANT MaxStep
ASSUME /\ MaxStep \in Nat
       /\ MaxStep > 0

VARIABLES progress, checkpoint, mode
vars == <<progress, checkpoint, mode>>

Init == /\ progress = 0
        /\ checkpoint = 0
        /\ mode = "running"

Step == /\ mode = "running"
        /\ progress < MaxStep
        /\ progress' = progress + 1
        /\ UNCHANGED <<checkpoint, mode>>

Save == /\ mode = "running"
        /\ checkpoint' = progress
        /\ UNCHANGED <<progress, mode>>

Crash == /\ mode = "running"
         /\ mode' = "failed"
         /\ UNCHANGED <<progress, checkpoint>>

Recover == /\ mode = "failed"
           /\ progress' = checkpoint
           /\ mode' = "running"
           /\ UNCHANGED checkpoint

Next == Step \/ Save \/ Crash \/ Recover
Spec == Init /\ [][Next]_vars

TypeOK == /\ progress \in 0..MaxStep
          /\ checkpoint \in 0..MaxStep
          /\ mode \in {"running", "failed"}
CheckpointNotAhead == checkpoint <= progress
=============================================================================
