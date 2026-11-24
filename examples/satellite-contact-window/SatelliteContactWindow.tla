----------------------- MODULE SatelliteContactWindow -----------------------
EXTENDS Naturals

CONSTANT MaxPackets
ASSUME /\ MaxPackets \in Nat
       /\ MaxPackets > 0

VARIABLES contact, pending, sent
vars == <<contact, pending, sent>>

Init ==
  /\ contact = FALSE
  /\ pending = MaxPackets
  /\ sent = 0

OpenWindow ==
  /\ ~contact
  /\ contact' = TRUE
  /\ UNCHANGED <<pending, sent>>

Transmit ==
  /\ contact
  /\ pending > 0
  /\ pending' = pending - 1
  /\ sent' = sent + 1
  /\ UNCHANGED contact

CloseWindow ==
  /\ contact
  /\ contact' = FALSE
  /\ UNCHANGED <<pending, sent>>

Next == OpenWindow \/ Transmit \/ CloseWindow
Spec == Init /\ [][Next]_vars

TypeOK ==
  /\ contact \in BOOLEAN
  /\ pending \in 0..MaxPackets
  /\ sent \in 0..MaxPackets

PacketConservation == pending + sent = MaxPackets
=============================================================================
