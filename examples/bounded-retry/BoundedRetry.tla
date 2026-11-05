--------------------------- MODULE BoundedRetry ---------------------------
EXTENDS Naturals

CONSTANT MaxRetries
ASSUME MaxRetries \in Nat

VARIABLES status, retries
vars == <<status, retries>>

Init == /\ status = "pending"
        /\ retries = 0

Fail == /\ status = "pending"
        /\ retries < MaxRetries
        /\ status' = "pending"
        /\ retries' = retries + 1

Succeed == /\ status = "pending"
           /\ status' = "success"
           /\ UNCHANGED retries

GiveUp == /\ status = "pending"
          /\ retries = MaxRetries
          /\ status' = "failed"
          /\ UNCHANGED retries

Next == Fail \/ Succeed \/ GiveUp
Spec == Init /\ [][Next]_vars

TypeOK == /\ status \in {"pending", "success", "failed"}
          /\ retries \in 0..MaxRetries

NoPrematureFailure == status = "failed" => retries = MaxRetries
=============================================================================
