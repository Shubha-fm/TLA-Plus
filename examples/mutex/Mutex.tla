------------------------------- MODULE Mutex -------------------------------
EXTENDS Naturals, FiniteSets

Proc == {"p1", "p2"}

VARIABLE pc
vars == <<pc>>

Init == pc = [p \in Proc |-> "idle"]

Request(p) == /\ pc[p] = "idle"
              /\ pc' = [pc EXCEPT ![p] = "waiting"]

Enter(p) == /\ pc[p] = "waiting"
            /\ \A q \in Proc \ {p} : pc[q] # "critical"
            /\ pc' = [pc EXCEPT ![p] = "critical"]

Exit(p) == /\ pc[p] = "critical"
           /\ pc' = [pc EXCEPT ![p] = "idle"]

Next == \E p \in Proc : Request(p) \/ Enter(p) \/ Exit(p)
Spec == Init /\ [][Next]_vars
TypeOK == pc \in [Proc -> {"idle", "waiting", "critical"}]
MutualExclusion == ~\E p, q \in Proc : p # q /\ pc[p] = "critical" /\ pc[q] = "critical"
=============================================================================
