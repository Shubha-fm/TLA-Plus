---------------------------- MODULE LeaseManager ----------------------------
EXTENDS Naturals

CONSTANT LeaseLength
ASSUME /\ LeaseLength \in Nat
       /\ LeaseLength > 0

Clients == {"a", "b"}
VARIABLES owner, remaining
vars == <<owner, remaining>>

Init == /\ owner = "none"
        /\ remaining = 0

Acquire(c) ==
  /\ c \in Clients
  /\ owner = "none"
  /\ owner' = c
  /\ remaining' = LeaseLength

Tick ==
  /\ owner # "none"
  /\ remaining > 0
  /\ remaining' = remaining - 1
  /\ owner' = IF remaining' = 0 THEN "none" ELSE owner

Release(c) ==
  /\ owner = c
  /\ c \in Clients
  /\ owner' = "none"
  /\ remaining' = 0

Renew(c) ==
  /\ owner = c
  /\ c \in Clients
  /\ remaining' = LeaseLength
  /\ UNCHANGED owner

Next == Tick \/ \E c \in Clients :
          Acquire(c) \/ Release(c) \/ Renew(c)
Spec == Init /\ [][Next]_vars

TypeOK == /\ owner \in Clients \cup {"none"}
          /\ remaining \in 0..LeaseLength
LeaseConsistency == (owner = "none") <=> (remaining = 0)
=============================================================================
