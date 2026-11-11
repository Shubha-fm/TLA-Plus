---------------------------- MODULE FileLocking ----------------------------
EXTENDS FiniteSets

Processes == {"p1", "p2", "p3"}
VARIABLES readers, writer
vars == <<readers, writer>>

Init == /\ readers = {}
        /\ writer = "none"

OpenRead(p) ==
  /\ p \in Processes \ readers
  /\ writer = "none"
  /\ readers' = readers \cup {p}
  /\ UNCHANGED writer

CloseRead(p) ==
  /\ p \in readers
  /\ readers' = readers \ {p}
  /\ UNCHANGED writer

OpenWrite(p) ==
  /\ p \in Processes
  /\ readers = {}
  /\ writer = "none"
  /\ writer' = p
  /\ UNCHANGED readers

CloseWrite(p) ==
  /\ writer = p
  /\ writer' = "none"
  /\ UNCHANGED readers

Next == \E p \in Processes :
          OpenRead(p) \/ CloseRead(p) \/ OpenWrite(p) \/ CloseWrite(p)
Spec == Init /\ [][Next]_vars

TypeOK == /\ readers \subseteq Processes
          /\ writer \in Processes \cup {"none"}
ExclusiveWriter == writer # "none" => readers = {}
=============================================================================
