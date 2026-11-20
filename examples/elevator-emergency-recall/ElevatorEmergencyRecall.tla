--------------------- MODULE ElevatorEmergencyRecall ---------------------
EXTENDS Naturals

CONSTANT Top
ASSUME /\ Top \in Nat
       /\ Top > 0

VARIABLES floor, emergency, door
vars == <<floor, emergency, door>>

Init == /\ floor = 0
        /\ emergency = FALSE
        /\ door = "closed"

MoveUp ==
  /\ ~emergency
  /\ door = "closed"
  /\ floor < Top
  /\ floor' = floor + 1
  /\ UNCHANGED <<emergency, door>>

MoveDown ==
  /\ door = "closed"
  /\ floor > 0
  /\ floor' = floor - 1
  /\ UNCHANGED <<emergency, door>>

TriggerEmergency ==
  /\ ~emergency
  /\ emergency' = TRUE
  /\ door' = "closed"
  /\ UNCHANGED floor

OpenDoor ==
  /\ floor = 0
  /\ door = "closed"
  /\ door' = "open"
  /\ UNCHANGED <<floor, emergency>>

CloseDoor ==
  /\ door = "open"
  /\ door' = "closed"
  /\ UNCHANGED <<floor, emergency>>

ClearEmergency ==
  /\ emergency
  /\ floor = 0
  /\ emergency' = FALSE
  /\ UNCHANGED <<floor, door>>

Next == MoveUp \/ MoveDown \/ TriggerEmergency \/
        OpenDoor \/ CloseDoor \/ ClearEmergency
Spec == Init /\ [][Next]_vars

TypeOK == /\ floor \in 0..Top
          /\ emergency \in BOOLEAN
          /\ door \in {"open", "closed"}
EmergencyDoorGround == emergency /\ door = "open" => floor = 0
=============================================================================
