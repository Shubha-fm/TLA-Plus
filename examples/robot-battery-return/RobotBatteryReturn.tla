------------------------ MODULE RobotBatteryReturn ------------------------
EXTENDS Naturals

CONSTANT MaxDistance
ASSUME /\ MaxDistance \in Nat
       /\ MaxDistance > 0

VARIABLES position, battery, mode
vars == <<position, battery, mode>>

Init == /\ position = 0
        /\ battery = 2 * MaxDistance
        /\ mode = "outbound"

GoOut ==
  /\ mode = "outbound"
  /\ position < MaxDistance
  /\ battery > position + 1
  /\ position' = position + 1
  /\ battery' = battery - 1
  /\ UNCHANGED mode

Return ==
  /\ mode = "outbound"
  /\ mode' = "returning"
  /\ UNCHANGED <<position, battery>>

GoHome ==
  /\ mode = "returning"
  /\ position > 0
  /\ position' = position - 1
  /\ battery' = battery - 1
  /\ UNCHANGED mode

Arrive ==
  /\ mode = "returning"
  /\ position = 0
  /\ mode' = "home"
  /\ UNCHANGED <<position, battery>>

Next == GoOut \/ Return \/ GoHome \/ Arrive
Spec == Init /\ [][Next]_vars

TypeOK == /\ position \in 0..MaxDistance
          /\ battery \in 0..(2 * MaxDistance)
          /\ mode \in {"outbound", "returning", "home"}

EnoughEnergyToReturn == battery >= position
=============================================================================
