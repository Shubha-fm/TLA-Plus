-------------------------- MODULE SpacecraftSafeMode --------------------------
EXTENDS Naturals

CONSTANT MaxEnergy
ASSUME /\ MaxEnergy \in Nat
       /\ MaxEnergy > 1

VARIABLES energy, mode, payload
vars == <<energy, mode, payload>>

Init == /\ energy = MaxEnergy
        /\ mode = "normal"
        /\ payload = "off"

StartPayload ==
  /\ mode = "normal"
  /\ energy > 1
  /\ payload = "off"
  /\ payload' = "on"
  /\ UNCHANGED <<energy, mode>>

StopPayload ==
  /\ payload = "on"
  /\ payload' = "off"
  /\ UNCHANGED <<energy, mode>>

Consume ==
  /\ mode = "normal"
  /\ energy > 1
  /\ energy' = energy - 1
  /\ UNCHANGED <<mode, payload>>

EnterSafeMode ==
  /\ mode = "normal"
  /\ mode' = "safe"
  /\ payload' = "off"
  /\ UNCHANGED energy

Recharge ==
  /\ mode = "safe"
  /\ energy < MaxEnergy
  /\ energy' = energy + 1
  /\ UNCHANGED <<mode, payload>>

Resume ==
  /\ mode = "safe"
  /\ energy = MaxEnergy
  /\ mode' = "normal"
  /\ UNCHANGED <<energy, payload>>

Next == StartPayload \/ StopPayload \/ Consume \/
        EnterSafeMode \/ Recharge \/ Resume
Spec == Init /\ [][Next]_vars

TypeOK == /\ energy \in 0..MaxEnergy
          /\ mode \in {"normal", "safe"}
          /\ payload \in {"off", "on"}
PayloadOffInSafeMode == mode = "safe" => payload = "off"
=============================================================================
