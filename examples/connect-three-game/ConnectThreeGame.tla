--------------------------- MODULE ConnectThreeGame ---------------------------
EXTENDS Naturals

Columns == 1..3
Rows == 1..3
Players == {"X", "O"}
VARIABLES board, turn
vars == <<board, turn>>

Init ==
  /\ board = [c \in Columns |-> [r \in Rows |-> "empty"]]
  /\ turn = "X"

Won(b, p) ==
  \/ \E r \in Rows : \A c \in Columns : b[c][r] = p
  \/ \E c \in Columns : \A r \in Rows : b[c][r] = p
  \/ \A i \in 1..3 : b[i][i] = p
  \/ \A i \in 1..3 : b[i][4-i] = p

Drop(c, r) ==
  /\ c \in Columns
  /\ r \in Rows
  /\ board[c][r] = "empty"
  /\ (r = 1 \/ board[c][r-1] # "empty")
  /\ ~Won(board, "X")
  /\ ~Won(board, "O")
  /\ board' = [board EXCEPT ![c][r] = turn]
  /\ turn' = IF turn = "X" THEN "O" ELSE "X"

Next == \E c \in Columns : \E r \in Rows : Drop(c, r)
Spec == Init /\ [][Next]_vars
TypeOK ==
  /\ board \in [Columns -> [Rows -> Players \cup {"empty"}]]
  /\ turn \in Players
NoTwoWinners == ~(Won(board, "X") /\ Won(board, "O"))
Gravity ==
  \A c \in Columns : \A r \in 2..3 :
    board[c][r] # "empty" => board[c][r-1] # "empty"
=============================================================================
