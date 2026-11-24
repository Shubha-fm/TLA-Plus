--------------------------- MODULE SharedCorridor ---------------------------
EXTENDS Naturals

Robots == {"r1", "r2"}
VARIABLES positions, owner
vars == <<positions, owner>>

Init ==
  /\ positions = [r \in Robots |-> "outside"]
  /\ owner = "none"

Enter(r) ==
  /\ r \in Robots
  /\ positions[r] = "outside"
  /\ owner = "none"
  /\ positions' = [positions EXCEPT ![r] = "inside"]
  /\ owner' = r

Exit(r) ==
  /\ r \in Robots
  /\ owner = r
  /\ positions[r] = "inside"
  /\ positions' = [positions EXCEPT ![r] = "outside"]
  /\ owner' = "none"

Next == \E r \in Robots : Enter(r) \/ Exit(r)
Spec == Init /\ [][Next]_vars

TypeOK ==
  /\ positions \in [Robots -> {"outside", "inside"}]
  /\ owner \in Robots \cup {"none"}

ExclusiveCorridor ==
  \A r \in Robots : positions[r] = "inside" => owner = r
=============================================================================
