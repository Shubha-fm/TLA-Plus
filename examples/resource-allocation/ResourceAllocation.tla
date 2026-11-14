-------------------------- MODULE ResourceAllocation --------------------------
EXTENDS FiniteSets

Clients == {"c1", "c2"}
Resources == {"cpu", "gpu"}
Free == "none"

VARIABLE allocation
vars == <<allocation>>

Init == allocation = [r \in Resources |-> Free]

Acquire(c, r) ==
  /\ c \in Clients
  /\ r \in Resources
  /\ allocation[r] = Free
  /\ \A other \in Resources : allocation[other] # c
  /\ allocation' = [allocation EXCEPT ![r] = c]

Release(c, r) ==
  /\ c \in Clients
  /\ r \in Resources
  /\ allocation[r] = c
  /\ allocation' = [allocation EXCEPT ![r] = Free]

Next == \E c \in Clients : \E r \in Resources :
          Acquire(c, r) \/ Release(c, r)
Spec == Init /\ [][Next]_vars

TypeOK == allocation \in [Resources -> Clients \cup {Free}]
OneResourcePerClient ==
  \A c \in Clients :
    Cardinality({r \in Resources : allocation[r] = c}) <= 1
=============================================================================
