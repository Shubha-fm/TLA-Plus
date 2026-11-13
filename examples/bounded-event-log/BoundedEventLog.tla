-------------------------- MODULE BoundedEventLog --------------------------
EXTENDS Naturals, Sequences

CONSTANT Capacity
ASSUME /\ Capacity \in Nat
       /\ Capacity > 0

Events == {"start", "stop"}
VARIABLE log
vars == <<log>>

Init == log = <<>>

AppendEvent(e) ==
  /\ e \in Events
  /\ Len(log) < Capacity
  /\ log' = Append(log, e)

Clear ==
  /\ Len(log) > 0
  /\ log' = <<>>

Next == Clear \/ \E e \in Events : AppendEvent(e)
Spec == Init /\ [][Next]_vars

TypeOK == log \in Seq(Events)
WithinCapacity == Len(log) <= Capacity
=============================================================================
