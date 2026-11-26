----------------------------- MODULE TicTacToe -----------------------------
EXTENDS Naturals

Cells == 1..9
Marks == {"X", "O"}
Lines == {{1,2,3}, {4,5,6}, {7,8,9},
          {1,4,7}, {2,5,8}, {3,6,9},
          {1,5,9}, {3,5,7}}

VARIABLES board, turn
vars == <<board, turn>>

Init == /\ board = [c \in Cells |-> "empty"]
        /\ turn = "X"

HasWon(b, p) ==
  \E line \in Lines : \A c \in line : b[c] = p

Move(c) ==
  /\ c \in Cells
  /\ board[c] = "empty"
  /\ ~HasWon(board, "X")
  /\ ~HasWon(board, "O")
  /\ board' = [board EXCEPT ![c] = turn]
  /\ turn' = IF turn = "X" THEN "O" ELSE "X"

Next == \E c \in Cells : Move(c)
Spec == Init /\ [][Next]_vars

TypeOK == /\ board \in [Cells -> Marks \cup {"empty"}]
          /\ turn \in Marks
NoDoubleWinner == ~(HasWon(board, "X") /\ HasWon(board, "O"))
=============================================================================
