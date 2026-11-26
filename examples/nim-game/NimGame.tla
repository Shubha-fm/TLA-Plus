------------------------------- MODULE NimGame -------------------------------
EXTENDS Naturals

CONSTANT InitialStones
ASSUME /\ InitialStones \in Nat
       /\ InitialStones > 0

Players == {"P1", "P2"}
VARIABLES stones, turn, winner
vars == <<stones, turn, winner>>

Init == /\ stones = InitialStones
        /\ turn = "P1"
        /\ winner = "none"

Take(n) ==
  /\ n \in {1, 2}
  /\ n <= stones
  /\ winner = "none"
  /\ stones' = stones - n
  /\ winner' = IF stones' = 0 THEN turn ELSE "none"
  /\ turn' = IF stones' = 0 THEN turn
             ELSE IF turn = "P1" THEN "P2" ELSE "P1"

Next == \E n \in {1, 2} : Take(n)
Spec == Init /\ [][Next]_vars

TypeOK == /\ stones \in 0..InitialStones
          /\ turn \in Players
          /\ winner \in Players \cup {"none"}
WinnerOnlyAtZero == (winner # "none") <=> (stones = 0)
=============================================================================
