-------------------------- MODULE DualSensorGate --------------------------
EXTENDS Naturals

VARIABLES sensorA, sensorB, gate
vars == <<sensorA, sensorB, gate>>

Init == /\ sensorA = FALSE
        /\ sensorB = FALSE
        /\ gate = "closed"

UpdateA(v) ==
  /\ v \in BOOLEAN
  /\ sensorA' = v
  /\ gate' = IF v /\ sensorB THEN "open" ELSE "closed"
  /\ UNCHANGED sensorB

UpdateB(v) ==
  /\ v \in BOOLEAN
  /\ sensorB' = v
  /\ gate' = IF sensorA /\ v THEN "open" ELSE "closed"
  /\ UNCHANGED sensorA

Next == \E v \in BOOLEAN : UpdateA(v) \/ UpdateB(v)
Spec == Init /\ [][Next]_vars

TypeOK == /\ sensorA \in BOOLEAN
          /\ sensorB \in BOOLEAN
          /\ gate \in {"closed", "open"}

OnlyOpenOnAgreement == gate = "open" => sensorA /\ sensorB
=============================================================================
