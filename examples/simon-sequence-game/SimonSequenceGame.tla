------------------------- MODULE SimonSequenceGame -------------------------
EXTENDS Naturals

Colors == {"red", "blue"}
Sequence == << "red", "blue", "red" >>
VARIABLES progress, status
vars == <<progress, status>>

Init ==
  /\ progress = 0
  /\ status = "playing"

Input(c) ==
  /\ status = "playing"
  /\ c \in Colors
  /\ progress < Len(Sequence)
  /\ LET correct == c = Sequence[progress + 1]
     IN /\ progress' = IF correct THEN progress + 1 ELSE progress
        /\ status' = IF ~correct THEN "lost"
                      ELSE IF progress + 1 = Len(Sequence)
                      THEN "won" ELSE "playing"

Next == \E c \in Colors : Input(c)
Spec == Init /\ [][Next]_vars

TypeOK ==
  /\ progress \in 0..Len(Sequence)
  /\ status \in {"playing", "won", "lost"}

WinMeansComplete == status = "won" => progress = Len(Sequence)
PlayingNotComplete == status = "playing" => progress < Len(Sequence)
=============================================================================
