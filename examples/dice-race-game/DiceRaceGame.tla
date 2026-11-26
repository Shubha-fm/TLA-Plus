----------------------------- MODULE DiceRaceGame -----------------------------
EXTENDS Naturals

Players == {"P1", "P2"}
CONSTANT Goal
ASSUME /\ Goal \in Nat
       /\ Goal > 1

VARIABLES position, turn, winner
vars == <<position, turn, winner>>

Init ==
  /\ position = [p \in Players |-> 0]
  /\ turn = "P1"
  /\ winner = "none"

Roll(n) ==
  /\ winner = "none"
  /\ n \in {1, 2}
  /\ LET nextPos == Min({Goal, position[turn] + n})
     IN /\ position' = [position EXCEPT ![turn] = nextPos]
        /\ winner' = IF nextPos = Goal THEN turn ELSE "none"
        /\ turn' = IF nextPos = Goal THEN turn
                   ELSE IF turn = "P1" THEN "P2" ELSE "P1"

Min(s) == CHOOSE x \in s : \A y \in s : x <= y

Next == \E n \in {1, 2} : Roll(n)
Spec == Init /\ [][Next]_vars
TypeOK ==
  /\ position \in [Players -> 0..Goal]
  /\ turn \in Players
  /\ winner \in Players \cup {"none"}
WinnerReachedGoal == winner # "none" => position[winner] = Goal
=============================================================================
