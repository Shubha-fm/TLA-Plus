-------------------------- MODULE WatchdogMonitor --------------------------
EXTENDS Naturals

CONSTANT Timeout
ASSUME /\ Timeout \in Nat
       /\ Timeout > 0

VARIABLES age, state
vars == <<age, state>>

Init == /\ age = 0
        /\ state = "healthy"

Tick ==
  /\ state = "healthy"
  /\ age < Timeout
  /\ age' = age + 1
  /\ state' = IF age' = Timeout THEN "alarm" ELSE "healthy"

Heartbeat ==
  /\ state = "healthy"
  /\ age' = 0
  /\ UNCHANGED state

Reset ==
  /\ state = "alarm"
  /\ age' = 0
  /\ state' = "healthy"

Next == Tick \/ Heartbeat \/ Reset
Spec == Init /\ [][Next]_vars

TypeOK == /\ age \in 0..Timeout
          /\ state \in {"healthy", "alarm"}
AlarmAtTimeout == (age = Timeout) <=> (state = "alarm")
=============================================================================
