------------------------- MODULE BoundedMessageDedup -------------------------
EXTENDS FiniteSets

Messages == {"m1", "m2", "m3"}
VARIABLES received, applied
vars == <<received, applied>>

Init == /\ received = {}
        /\ applied = {}

Receive(m) ==
  /\ m \in Messages
  /\ received' = received \cup {m}
  /\ UNCHANGED applied

Apply(m) ==
  /\ m \in received \ applied
  /\ applied' = applied \cup {m}
  /\ UNCHANGED received

Next == \E m \in Messages : Receive(m) \/ Apply(m)
Spec == Init /\ [][Next]_vars

TypeOK == /\ received \subseteq Messages
          /\ applied \subseteq Messages
OnlyReceivedApplied == applied \subseteq received
=============================================================================
