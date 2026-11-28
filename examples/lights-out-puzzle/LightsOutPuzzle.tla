-------------------------- MODULE LightsOutPuzzle --------------------------
EXTENDS Naturals

Cells == 1..4
CONSTANT MaxPresses
ASSUME MaxPresses \in Nat

VARIABLES lights, presses
vars == <<lights, presses>>

Init ==
  /\ lights = [c \in Cells |-> c \in {1, 4}]
  /\ presses = 0

Adjacent(p, q) ==
  \/ p = q
  \/ <<p, q>> \in {<<1, 2>>, <<2, 1>>, <<1, 3>>, <<3, 1>>,
                   <<2, 4>>, <<4, 2>>, <<3, 4>>, <<4, 3>>}

Press(p) ==
  /\ p \in Cells
  /\ presses < MaxPresses
  /\ lights' = [q \in Cells |->
       IF Adjacent(p, q) THEN ~lights[q] ELSE lights[q]]
  /\ presses' = presses + 1

Next == \E p \in Cells : Press(p)
Spec == Init /\ [][Next]_vars

TypeOK ==
  /\ lights \in [Cells -> BOOLEAN]
  /\ presses \in 0..MaxPresses
PressLimit == presses <= MaxPresses
Solved == \A c \in Cells : ~lights[c]
=============================================================================
