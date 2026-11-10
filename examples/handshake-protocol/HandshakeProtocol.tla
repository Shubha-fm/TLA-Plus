------------------------- MODULE HandshakeProtocol -------------------------
EXTENDS Naturals

VARIABLES client, server
vars == <<client, server>>

Init == /\ client = "idle"
        /\ server = "listening"

SendHello == /\ client = "idle"
             /\ server = "listening"
             /\ client' = "helloSent"
             /\ UNCHANGED server

Acknowledge == /\ client = "helloSent"
               /\ server = "listening"
               /\ server' = "ackSent"
               /\ UNCHANGED client

Complete == /\ client = "helloSent"
            /\ server = "ackSent"
            /\ client' = "connected"
            /\ server' = "connected"

Disconnect == /\ client = "connected"
              /\ server = "connected"
              /\ client' = "idle"
              /\ server' = "listening"

Next == SendHello \/ Acknowledge \/ Complete \/ Disconnect
Spec == Init /\ [][Next]_vars

TypeOK == /\ client \in {"idle", "helloSent", "connected"}
          /\ server \in {"listening", "ackSent", "connected"}

ConnectionAgreement == client = "connected" <=> server = "connected"
=============================================================================
