----------------------- MODULE TrafficIncidentControl -----------------------
EXTENDS Naturals

VARIABLES incident, laneOpen, signal
vars == <<incident, laneOpen, signal>>

Init ==
  /\ incident = FALSE
  /\ laneOpen = TRUE
  /\ signal = "green"

DetectIncident ==
  /\ ~incident
  /\ incident' = TRUE
  /\ laneOpen' = FALSE
  /\ signal' = "red"

ClearIncident ==
  /\ incident
  /\ incident' = FALSE
  /\ UNCHANGED <<laneOpen, signal>>

Reopen ==
  /\ ~incident
  /\ ~laneOpen
  /\ laneOpen' = TRUE
  /\ signal' = "green"
  /\ UNCHANGED incident

Next == DetectIncident \/ ClearIncident \/ Reopen
Spec == Init /\ [][Next]_vars

TypeOK ==
  /\ incident \in BOOLEAN
  /\ laneOpen \in BOOLEAN
  /\ signal \in {"red", "green"}

IncidentBlocksTraffic == incident => (~laneOpen /\ signal = "red")
GreenOnlyWhenOpen == signal = "green" => laneOpen
=============================================================================
