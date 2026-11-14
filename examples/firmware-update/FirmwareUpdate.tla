--------------------------- MODULE FirmwareUpdate ---------------------------
EXTENDS Naturals

CONSTANT MaxVersion
ASSUME /\ MaxVersion \in Nat
       /\ MaxVersion > 0

VARIABLES active, candidate, stage
vars == <<active, candidate, stage>>

Init == /\ active = 0
        /\ candidate = 0
        /\ stage = "idle"

Download ==
  /\ stage = "idle"
  /\ active < MaxVersion
  /\ candidate' = active + 1
  /\ stage' = "downloaded"
  /\ UNCHANGED active

Verify ==
  /\ stage = "downloaded"
  /\ stage' = "verified"
  /\ UNCHANGED <<active, candidate>>

Install ==
  /\ stage = "verified"
  /\ active' = candidate
  /\ stage' = "idle"
  /\ UNCHANGED candidate

Cancel ==
  /\ stage \in {"downloaded", "verified"}
  /\ candidate' = active
  /\ stage' = "idle"
  /\ UNCHANGED active

Next == Download \/ Verify \/ Install \/ Cancel
Spec == Init /\ [][Next]_vars

TypeOK == /\ active \in 0..MaxVersion
          /\ candidate \in 0..MaxVersion
          /\ stage \in {"idle", "downloaded", "verified"}
NoDowngrade == active <= candidate
PendingIsNewer == stage # "idle" => candidate > active
=============================================================================
