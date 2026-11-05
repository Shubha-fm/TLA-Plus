----------------------------- MODULE SimpleQueue -----------------------------
EXTENDS Sequences, Naturals

CONSTANT Capacity
ASSUME Capacity \in Nat \ {0}

VARIABLE queue
vars == <<queue>>

Init == queue = <<>>

Enqueue == /\ Len(queue) < Capacity
           /\ queue' = Append(queue, "job")

Dequeue == /\ Len(queue) > 0
           /\ queue' = Tail(queue)

Next == Enqueue \/ Dequeue
Spec == Init /\ [][Next]_vars
TypeOK == /\ queue \in Seq({"job"})
          /\ Len(queue) <= Capacity
=============================================================================
