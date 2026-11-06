--------------------------- MODULE ReadersWriters ---------------------------
EXTENDS FiniteSets

Readers == {"r1", "r2"}
VARIABLES readers, writing
vars == <<readers, writing>>

Init == /\ readers = {}
        /\ writing = FALSE

StartRead(r) ==
  /\ r \in Readers \ readers
  /\ ~writing
  /\ readers' = readers \cup {r}
  /\ UNCHANGED writing

EndRead(r) ==
  /\ r \in readers
  /\ readers' = readers \ {r}
  /\ UNCHANGED writing

StartWrite ==
  /\ readers = {}
  /\ ~writing
  /\ writing' = TRUE
  /\ UNCHANGED readers

EndWrite ==
  /\ writing
  /\ writing' = FALSE
  /\ UNCHANGED readers

Next == \/ \E r \in Readers : StartRead(r) \/ EndRead(r)
        \/ StartWrite
        \/ EndWrite

Spec == Init /\ [][Next]_vars
TypeOK == /\ readers \subseteq Readers
          /\ writing \in BOOLEAN

ExclusiveWrite == writing => readers = {}
=============================================================================
