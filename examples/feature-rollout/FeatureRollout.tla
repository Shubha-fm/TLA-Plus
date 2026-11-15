--------------------------- MODULE FeatureRollout ---------------------------
EXTENDS Naturals

CONSTANT MaxStage
ASSUME /\ MaxStage \in Nat
       /\ MaxStage > 0

VARIABLES stage, healthy, enabled
vars == <<stage, healthy, enabled>>

Init == /\ stage = 0
        /\ healthy = TRUE
        /\ enabled = FALSE

Enable ==
  /\ ~enabled
  /\ healthy
  /\ enabled' = TRUE
  /\ UNCHANGED <<stage, healthy>>

Advance ==
  /\ enabled
  /\ healthy
  /\ stage < MaxStage
  /\ stage' = stage + 1
  /\ UNCHANGED <<healthy, enabled>>

DetectFailure ==
  /\ enabled
  /\ healthy
  /\ healthy' = FALSE
  /\ enabled' = FALSE
  /\ UNCHANGED stage

Rollback ==
  /\ ~healthy
  /\ stage' = 0
  /\ healthy' = TRUE
  /\ UNCHANGED enabled

Disable ==
  /\ enabled
  /\ enabled' = FALSE
  /\ UNCHANGED <<stage, healthy>>

Next == Enable \/ Advance \/ DetectFailure \/ Rollback \/ Disable
Spec == Init /\ [][Next]_vars

TypeOK == /\ stage \in 0..MaxStage
          /\ healthy \in BOOLEAN
          /\ enabled \in BOOLEAN

NoEnableWhenUnhealthy == enabled => healthy
=============================================================================
