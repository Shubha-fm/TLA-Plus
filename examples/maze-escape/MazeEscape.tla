----------------------------- MODULE MazeEscape -----------------------------
EXTENDS Naturals

Cells == 0..5
Walls == {2}
VARIABLES pos, escaped
vars == <<pos, escaped>>

Init == /\ pos = 0
        /\ escaped = FALSE

Step(nextCell) ==
  /\ ~escaped
  /\ nextCell \in Cells \ Walls
  /\ (nextCell = pos + 1 \/ pos = nextCell + 1)
  /\ pos' = nextCell
  /\ escaped' = (nextCell = 5)

Jump ==
  /\ ~escaped
  /\ pos = 1
  /\ pos' = 3
  /\ UNCHANGED escaped

Next == Jump \/ \E nextCell \in Cells : Step(nextCell)
Spec == Init /\ [][Next]_vars

TypeOK == /\ pos \in Cells
          /\ escaped \in BOOLEAN
AvoidWalls == pos \notin Walls
EscapeAtExit == escaped => pos = 5
=============================================================================
