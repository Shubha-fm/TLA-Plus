------------------------ MODULE MedicalTriageQueue ------------------------
EXTENDS FiniteSets

Patients == {"p1", "p2", "p3"}
VARIABLES waiting, treating, completed
vars == <<waiting, treating, completed>>

Init == /\ waiting = Patients
        /\ treating = {}
        /\ completed = {}

Admit(p) ==
  /\ p \in waiting
  /\ treating = {}
  /\ waiting' = waiting \ {p}
  /\ treating' = {p}
  /\ UNCHANGED completed

Finish(p) ==
  /\ p \in treating
  /\ treating' = {}
  /\ completed' = completed \cup {p}
  /\ UNCHANGED waiting

Next == \E p \in Patients : Admit(p) \/ Finish(p)
Spec == Init /\ [][Next]_vars

TypeOK == /\ waiting \subseteq Patients
          /\ treating \subseteq Patients
          /\ completed \subseteq Patients

OneAtATime == Cardinality(treating) <= 1
NoLostPatients ==
  /\ waiting \cup treating \cup completed = Patients
  /\ waiting \cap treating = {}
  /\ waiting \cap completed = {}
  /\ treating \cap completed = {}
=============================================================================
