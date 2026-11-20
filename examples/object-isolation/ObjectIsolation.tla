--------------------------- MODULE ObjectIsolation ---------------------------
EXTENDS Naturals

Objects == {"o1", "o2"}
VARIABLES version, assessed
vars == <<version, assessed>>

Init == /\ version = [o \in Objects |-> 0]
        /\ assessed = [o \in Objects |-> -1]

Update(o) ==
  /\ o \in Objects
  /\ version[o] < 2
  /\ version' = [version EXCEPT ![o] = @ + 1]
  /\ assessed' = [assessed EXCEPT ![o] = -1]

Assess(o) ==
  /\ o \in Objects
  /\ assessed[o] # version[o]
  /\ assessed' = [assessed EXCEPT ![o] = version[o]]
  /\ UNCHANGED version

Next == \E o \in Objects : Update(o) \/ Assess(o)
Spec == Init /\ [][Next]_vars

TypeOK == /\ version \in [Objects -> 0..2]
          /\ assessed \in [Objects -> {-1, 0, 1, 2}]

AssessmentNotFuture ==
  \A o \in Objects : assessed[o] <= version[o]
=============================================================================
