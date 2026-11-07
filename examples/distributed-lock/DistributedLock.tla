-------------------------- MODULE DistributedLock --------------------------
EXTENDS Naturals

Clients == {"c1", "c2", "c3"}
NoOwner == "none"
VARIABLE owner
vars == <<owner>>

Init == owner = NoOwner

Acquire(c) ==
  /\ c \in Clients
  /\ owner = NoOwner
  /\ owner' = c

Release(c) ==
  /\ c \in Clients
  /\ owner = c
  /\ owner' = NoOwner

Next == \E c \in Clients : Acquire(c) \/ Release(c)
Spec == Init /\ [][Next]_vars

TypeOK == owner \in Clients \cup {NoOwner}
=============================================================================
