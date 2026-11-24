------------------------- MODULE SensorMajorityVote -------------------------
EXTENDS Naturals, FiniteSets

Sensors == {"s1", "s2", "s3"}
VARIABLES positive, negative, decision
vars == <<positive, negative, decision>>

Init ==
  /\ positive = {}
  /\ negative = {}
  /\ decision = "pending"

ReportPositive(s) ==
  /\ decision = "pending"
  /\ s \in Sensors \ (positive \cup negative)
  /\ positive' = positive \cup {s}
  /\ UNCHANGED <<negative, decision>>

ReportNegative(s) ==
  /\ decision = "pending"
  /\ s \in Sensors \ (positive \cup negative)
  /\ negative' = negative \cup {s}
  /\ UNCHANGED <<positive, decision>>

Accept ==
  /\ decision = "pending"
  /\ Cardinality(positive) >= 2
  /\ decision' = "accept"
  /\ UNCHANGED <<positive, negative>>

Reject ==
  /\ decision = "pending"
  /\ Cardinality(negative) >= 2
  /\ decision' = "reject"
  /\ UNCHANGED <<positive, negative>>

Next ==
  \/ \E s \in Sensors : ReportPositive(s) \/ ReportNegative(s)
  \/ Accept
  \/ Reject

Spec == Init /\ [][Next]_vars

TypeOK ==
  /\ positive \subseteq Sensors
  /\ negative \subseteq Sensors
  /\ decision \in {"pending", "accept", "reject"}

DisjointReports == positive \cap negative = {}
MajorityJustified ==
  /\ (decision = "accept" => Cardinality(positive) >= 2)
  /\ (decision = "reject" => Cardinality(negative) >= 2)
=============================================================================
