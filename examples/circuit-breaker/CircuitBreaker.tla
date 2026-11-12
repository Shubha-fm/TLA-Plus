-------------------------- MODULE CircuitBreaker --------------------------
EXTENDS Naturals

CONSTANT FailureLimit
ASSUME /\ FailureLimit \in Nat
       /\ FailureLimit > 0

VARIABLES mode, failures
vars == <<mode, failures>>

Init == /\ mode = "closed"
        /\ failures = 0

RecordFailure ==
  /\ mode = "closed"
  /\ failures < FailureLimit
  /\ failures' = failures + 1
  /\ mode' = IF failures' = FailureLimit THEN "open" ELSE "closed"

ResetWindow ==
  /\ mode = "closed"
  /\ failures' = 0
  /\ UNCHANGED mode

StartProbe ==
  /\ mode = "open"
  /\ mode' = "halfOpen"
  /\ UNCHANGED failures

ProbeSuccess ==
  /\ mode = "halfOpen"
  /\ mode' = "closed"
  /\ failures' = 0

ProbeFailure ==
  /\ mode = "halfOpen"
  /\ mode' = "open"
  /\ failures' = FailureLimit

Next == RecordFailure \/ ResetWindow \/ StartProbe \/
        ProbeSuccess \/ ProbeFailure
Spec == Init /\ [][Next]_vars

TypeOK == /\ mode \in {"closed", "open", "halfOpen"}
          /\ failures \in 0..FailureLimit
OpenAfterLimit == failures = FailureLimit => mode # "closed"
=============================================================================
