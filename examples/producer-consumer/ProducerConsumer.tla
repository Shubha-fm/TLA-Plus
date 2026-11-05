------------------------- MODULE ProducerConsumer -------------------------
EXTENDS Naturals

CONSTANT Capacity
ASSUME Capacity \in Nat \ {0}

VARIABLE items
vars == <<items>>

Init == items = 0

Produce == /\ items < Capacity
           /\ items' = items + 1

Consume == /\ items > 0
           /\ items' = items - 1

Next == Produce \/ Consume
Spec == Init /\ [][Next]_vars
TypeOK == items \in 0..Capacity
=============================================================================
