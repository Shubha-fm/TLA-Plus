----------------------------- MODULE TowerOfHanoi -----------------------------
EXTENDS Naturals

Pegs == {"A", "B", "C"}
Discs == 1..3
VARIABLES peg, moves
vars == <<peg, moves>>

Init ==
  /\ peg = [d \in Discs |-> "A"]
  /\ moves = 0

Top(d) == \A smaller \in Discs : smaller < d => peg[smaller] # peg[d]

Move(d, target) ==
  /\ d \in Discs
  /\ target \in Pegs \ {peg[d]}
  /\ Top(d)
  /\ \A smaller \in Discs : smaller < d => peg[smaller] # target
  /\ moves < 7
  /\ peg' = [peg EXCEPT ![d] = target]
  /\ moves' = moves + 1

Next == \E d \in Discs : \E target \in Pegs : Move(d, target)
Spec == Init /\ [][Next]_vars

TypeOK ==
  /\ peg \in [Discs -> Pegs]
  /\ moves \in 0..7
MovedWithinBudget == moves <= 7
=============================================================================
