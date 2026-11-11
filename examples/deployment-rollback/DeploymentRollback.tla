------------------------ MODULE DeploymentRollback ------------------------
EXTENDS Naturals

CONSTANT MaxVersion
ASSUME /\ MaxVersion \in Nat
       /\ MaxVersion > 0

VARIABLES active, candidate, stage
vars == <<active, candidate, stage>>

Init == /\ active = 0
        /\ candidate = 0
        /\ stage = "idle"

Prepare ==
  /\ stage = "idle"
  /\ active < MaxVersion
  /\ candidate' = active + 1
  /\ stage' = "testing"
  /\ UNCHANGED active

PassTests ==
  /\ stage = "testing"
  /\ active' = candidate
  /\ stage' = "idle"
  /\ UNCHANGED candidate

FailTests ==
  /\ stage = "testing"
  /\ stage' = "rollback"
  /\ UNCHANGED <<active, candidate>>

Rollback ==
  /\ stage = "rollback"
  /\ candidate' = active
  /\ stage' = "idle"
  /\ UNCHANGED active

Next == Prepare \/ PassTests \/ FailTests \/ Rollback
Spec == Init /\ [][Next]_vars

TypeOK == /\ active \in 0..MaxVersion
          /\ candidate \in 0..MaxVersion
          /\ stage \in {"idle", "testing", "rollback"}
ActiveNotAhead == active <= candidate
RollbackPreservesActive == stage = "rollback" => active < candidate
=============================================================================
