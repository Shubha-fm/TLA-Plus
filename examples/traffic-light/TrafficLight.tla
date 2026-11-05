--------------------------- MODULE TrafficLight ---------------------------
EXTENDS TLC

VARIABLE light
vars == <<light>>

Init == light = "Red"

Next == \/ /\ light = "Red"
           /\ light' = "Green"
        \/ /\ light = "Green"
           /\ light' = "Yellow"
        \/ /\ light = "Yellow"
           /\ light' = "Red"

Spec == Init /\ [][Next]_vars
TypeOK == light \in {"Red", "Yellow", "Green"}
NeverSkipYellow == light = "Green" => light' = "Yellow"
=============================================================================
