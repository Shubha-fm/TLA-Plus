---------------------------- MODULE TreasureHunt ----------------------------
EXTENDS Naturals

Rooms == {"start", "keyRoom", "gate", "treasure"}
VARIABLES room, hasKey, completed
vars == <<room, hasKey, completed>>

Init == /\ room = "start"
        /\ hasKey = FALSE
        /\ completed = FALSE

FindKey ==
  /\ room = "start"
  /\ room' = "keyRoom"
  /\ hasKey' = TRUE
  /\ UNCHANGED completed

ApproachGate ==
  /\ room = "keyRoom"
  /\ room' = "gate"
  /\ UNCHANGED <<hasKey, completed>>

OpenGate ==
  /\ room = "gate"
  /\ hasKey
  /\ room' = "treasure"
  /\ completed' = TRUE
  /\ UNCHANGED hasKey

Next == FindKey \/ ApproachGate \/ OpenGate
Spec == Init /\ [][Next]_vars

TypeOK == /\ room \in Rooms
          /\ hasKey \in BOOLEAN
          /\ completed \in BOOLEAN
KeyBeforeTreasure == completed => hasKey
TreasureAtGoal == completed <=> room = "treasure"
=============================================================================
