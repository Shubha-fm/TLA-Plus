------------------------- MODULE SlidingTilePuzzle -------------------------
EXTENDS Naturals, FiniteSets

Cells == 1..4
Tiles == {0, 1, 2, 3}
VARIABLE board
vars == <<board>>

Init ==
  board = [c \in Cells |-> IF c = 1 THEN 1
                          ELSE IF c = 2 THEN 2
                          ELSE IF c = 3 THEN 0 ELSE 3]

Adjacent(a, b) ==
  <<a,b>> \in {<<1,2>>, <<2,1>>, <<1,3>>, <<3,1>>,
              <<2,4>>, <<4,2>>, <<3,4>>, <<4,3>>}

Slide(a, b) ==
  /\ a \in Cells
  /\ b \in Cells
  /\ Adjacent(a, b)
  /\ board[a] = 0
  /\ board[b] # 0
  /\ board' = [board EXCEPT ![a] = board[b], ![b] = 0]

Next == \E a \in Cells : \E b \in Cells : Slide(a, b)
Spec == Init /\ [][Next]_vars

TypeOK == board \in [Cells -> Tiles]
TilePreservation == {board[c] : c \in Cells} = Tiles
Solved == board = [c \in Cells |-> c - 1]
=============================================================================
