--------------------- MODULE RailwayRouteReservation ---------------------
EXTENDS FiniteSets

Trains == {"t1", "t2"}
VARIABLES reserved, occupying
vars == <<reserved, occupying>>

Init == /\ reserved = "none"
        /\ occupying = "none"

Reserve(t) == /\ t \in Trains
              /\ reserved = "none"
              /\ occupying = "none"
              /\ reserved' = t
              /\ UNCHANGED occupying

Enter(t) == /\ t \in Trains
            /\ reserved = t
            /\ occupying = "none"
            /\ occupying' = t
            /\ UNCHANGED reserved

Exit(t) == /\ occupying = t
           /\ t \in Trains
           /\ occupying' = "none"
           /\ reserved' = "none"

Cancel(t) == /\ reserved = t
             /\ occupying = "none"
             /\ reserved' = "none"
             /\ UNCHANGED occupying

Next == \E t \in Trains :
          Reserve(t) \/ Enter(t) \/ Exit(t) \/ Cancel(t)

Spec == Init /\ [][Next]_vars
TypeOK == /\ reserved \in Trains \cup {"none"}
          /\ occupying \in Trains \cup {"none"}
EntryRequiresReservation ==
  occupying # "none" => occupying = reserved
=============================================================================
