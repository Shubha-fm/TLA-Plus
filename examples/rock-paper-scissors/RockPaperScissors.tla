----------------------- MODULE RockPaperScissors -----------------------
EXTENDS Naturals

Moves == {"rock", "paper", "scissors"}
Players == {"P1", "P2"}
VARIABLES first, second, outcome
vars == <<first, second, outcome>>

Init == /\ first = "none"
        /\ second = "none"
        /\ outcome = "pending"

ChooseFirst(m) ==
  /\ first = "none"
  /\ m \in Moves
  /\ first' = m
  /\ UNCHANGED <<second, outcome>>

ChooseSecond(m) ==
  /\ second = "none"
  /\ m \in Moves
  /\ second' = m
  /\ UNCHANGED <<first, outcome>>

Beats(a, b) ==
  \/ /\ a = "rock" /\ b = "scissors"
  \/ /\ a = "paper" /\ b = "rock"
  \/ /\ a = "scissors" /\ b = "paper"

Result(a, b) ==
  IF a = b THEN "draw"
  ELSE IF Beats(a, b) THEN "P1" ELSE "P2"

Reveal ==
  /\ first \in Moves
  /\ second \in Moves
  /\ outcome = "pending"
  /\ outcome' = Result(first, second)
  /\ UNCHANGED <<first, second>>

Next ==
  \/ \E m \in Moves : ChooseFirst(m)
  \/ \E m \in Moves : ChooseSecond(m)
  \/ Reveal

Spec == Init /\ [][Next]_vars

TypeOK == /\ first \in Moves \cup {"none"}
          /\ second \in Moves \cup {"none"}
          /\ outcome \in {"pending", "draw"} \cup Players
ResultConsistent == outcome # "pending" =>
  /\ first \in Moves
  /\ second \in Moves
  /\ outcome = Result(first, second)
=============================================================================
