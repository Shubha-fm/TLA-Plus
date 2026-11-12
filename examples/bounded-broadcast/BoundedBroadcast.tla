--------------------------- MODULE BoundedBroadcast ---------------------------
EXTENDS Naturals, FiniteSets

Nodes == {"n1", "n2", "n3"}
VARIABLES published, delivered
vars == <<published, delivered>>

Init == /\ published = FALSE
        /\ delivered = {}

Publish == /\ ~published
           /\ published' = TRUE
           /\ UNCHANGED delivered

Deliver(n) ==
  /\ published
  /\ n \in Nodes \ delivered
  /\ delivered' = delivered \cup {n}
  /\ UNCHANGED published

Next == Publish \/ \E n \in Nodes : Deliver(n)
Spec == Init /\ [][Next]_vars

TypeOK == /\ published \in BOOLEAN
          /\ delivered \subseteq Nodes
OnlyAfterPublish == delivered # {} => published
=============================================================================
