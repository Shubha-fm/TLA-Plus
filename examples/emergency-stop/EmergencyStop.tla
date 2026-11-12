---------------------------- MODULE EmergencyStop ----------------------------
EXTENDS Naturals

VARIABLES mode, emergency
vars == <<mode, emergency>>

Init == /\ mode = "running"
        /\ emergency = FALSE

Trigger ==
  /\ ~emergency
  /\ emergency' = TRUE
  /\ mode' = "stopped"

Reset ==
  /\ emergency
  /\ emergency' = FALSE
  /\ UNCHANGED mode

Restart ==
  /\ ~emergency
  /\ mode = "stopped"
  /\ mode' = "running"
  /\ UNCHANGED emergency

Next == Trigger \/ Reset \/ Restart
Spec == Init /\ [][Next]_vars

TypeOK == /\ mode \in {"running", "stopped"}
          /\ emergency \in BOOLEAN
StoppedOnEmergency == emergency => mode = "stopped"
=============================================================================
