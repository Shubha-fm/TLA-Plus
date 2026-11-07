---------------------------- MODULE SensorAlarm ----------------------------
EXTENDS Naturals

CONSTANT Threshold
ASSUME /\ Threshold \in Nat
       /\ Threshold > 0

VARIABLES reading, alarm
vars == <<reading, alarm>>

Init ==
  /\ reading = 0
  /\ alarm = FALSE

Sample(n) ==
  /\ n \in 0..(Threshold + 1)
  /\ reading' = n
  /\ alarm' = (n >= Threshold)

Next == \E n \in 0..(Threshold + 1) : Sample(n)
Spec == Init /\ [][Next]_vars

TypeOK ==
  /\ reading \in 0..(Threshold + 1)
  /\ alarm \in BOOLEAN

AlarmCorrect == alarm = (reading >= Threshold)
=============================================================================
