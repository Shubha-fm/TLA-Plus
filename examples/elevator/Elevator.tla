----------------------------- MODULE Elevator -----------------------------
EXTENDS Naturals

CONSTANT TopFloor
ASSUME TopFloor \in Nat \ {0}

VARIABLES floor, door
vars == <<floor, door>>

Init == /\ floor = 0
        /\ door = "closed"

MoveUp == /\ door = "closed"
          /\ floor < TopFloor
          /\ floor' = floor + 1
          /\ UNCHANGED door

MoveDown == /\ door = "closed"
            /\ floor > 0
            /\ floor' = floor - 1
            /\ UNCHANGED door

Open == /\ door = "closed"
        /\ door' = "open"
        /\ UNCHANGED floor

Close == /\ door = "open"
         /\ door' = "closed"
         /\ UNCHANGED floor

Next == MoveUp \/ MoveDown \/ Open \/ Close
Spec == Init /\ [][Next]_vars
TypeOK == /\ floor \in 0..TopFloor
          /\ door \in {"open", "closed"}
=============================================================================
