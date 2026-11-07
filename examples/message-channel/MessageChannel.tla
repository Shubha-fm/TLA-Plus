--------------------------- MODULE MessageChannel ---------------------------
EXTENDS Naturals, Sequences

CONSTANT Capacity
ASSUME /\ Capacity \in Nat
       /\ Capacity > 0

Messages == {"A", "B"}
VARIABLE channel
vars == <<channel>>

Init == channel = <<>>

Send(m) ==
  /\ m \in Messages
  /\ Len(channel) < Capacity
  /\ channel' = Append(channel, m)

Receive ==
  /\ Len(channel) > 0
  /\ channel' = Tail(channel)

Next == (\/ \E m \in Messages : Send(m)) \/ Receive
Spec == Init /\ [][Next]_vars

TypeOK == channel \in Seq(Messages)
Bounded == Len(channel) <= Capacity
=============================================================================
