----------------------------- MODULE ReplicaSync -----------------------------
EXTENDS Naturals

CONSTANT MaxVersion
ASSUME /\ MaxVersion \in Nat
       /\ MaxVersion > 0

VARIABLES primary, replica, synced
vars == <<primary, replica, synced>>

Init == /\ primary = 0
        /\ replica = 0
        /\ synced = TRUE

Write == /\ primary < MaxVersion
         /\ primary' = primary + 1
         /\ synced' = FALSE
         /\ UNCHANGED replica

Replicate == /\ replica < primary
             /\ replica' = primary
             /\ synced' = TRUE
             /\ UNCHANGED primary

Next == Write \/ Replicate
Spec == Init /\ [][Next]_vars

TypeOK == /\ primary \in 0..MaxVersion
          /\ replica \in 0..MaxVersion
          /\ synced \in BOOLEAN

ReplicaNotAhead == replica <= primary
SyncAccurate == synced => replica = primary
=============================================================================
