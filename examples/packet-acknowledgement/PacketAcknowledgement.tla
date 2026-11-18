----------------------- MODULE PacketAcknowledgement -----------------------
EXTENDS Naturals

CONSTANT MaxRetries
ASSUME MaxRetries \in Nat

VARIABLES phase, retries
vars == <<phase, retries>>

Init == /\ phase = "ready"
        /\ retries = 0

Send == /\ phase = "ready"
        /\ phase' = "waiting"
        /\ UNCHANGED retries

Retry == /\ phase = "waiting"
         /\ retries < MaxRetries
         /\ retries' = retries + 1
         /\ UNCHANGED phase

Acknowledge == /\ phase = "waiting"
               /\ phase' = "done"
               /\ UNCHANGED retries

GiveUp == /\ phase = "waiting"
          /\ retries = MaxRetries
          /\ phase' = "failed"
          /\ UNCHANGED retries

Next == Send \/ Retry \/ Acknowledge \/ GiveUp
Spec == Init /\ [][Next]_vars

TypeOK == /\ phase \in {"ready", "waiting", "done", "failed"}
          /\ retries \in 0..MaxRetries
FailureAtLimit == phase = "failed" => retries = MaxRetries
=============================================================================
