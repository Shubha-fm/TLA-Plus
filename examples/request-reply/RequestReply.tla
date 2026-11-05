--------------------------- MODULE RequestReply ---------------------------
EXTENDS Naturals

VARIABLES client, server
vars == <<client, server>>

Init == /\ client = "idle"
        /\ server = "ready"

SendRequest == /\ client = "idle"
               /\ server = "ready"
               /\ client' = "waiting"
               /\ server' = "busy"

Process == /\ client = "waiting"
           /\ server = "busy"
           /\ server' = "replied"
           /\ UNCHANGED client

ReceiveReply == /\ client = "waiting"
                /\ server = "replied"
                /\ client' = "done"
                /\ server' = "ready"

Reset == /\ client = "done"
         /\ client' = "idle"
         /\ UNCHANGED server

Next == SendRequest \/ Process \/ ReceiveReply \/ Reset
Spec == Init /\ [][Next]_vars

TypeOK == /\ client \in {"idle", "waiting", "done"}
          /\ server \in {"ready", "busy", "replied"}

ReplyHasRequester == server = "replied" => client = "waiting"
=============================================================================
