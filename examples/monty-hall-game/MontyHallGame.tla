---------------------------- MODULE MontyHallGame ----------------------------
Doors == {"a", "b", "c"}
VARIABLES prize, choice, shown, finalChoice, phase
vars == <<prize, choice, shown, finalChoice, phase>>

Init ==
  /\ prize \in Doors
  /\ choice = "none"
  /\ shown = "none"
  /\ finalChoice = "none"
  /\ phase = "choose"

Choose(d) ==
  /\ phase = "choose"
  /\ d \in Doors
  /\ choice' = d
  /\ phase' = "reveal"
  /\ UNCHANGED <<prize, shown, finalChoice>>

Reveal(d) ==
  /\ phase = "reveal"
  /\ d \in Doors \ {choice, prize}
  /\ shown' = d
  /\ phase' = "decide"
  /\ UNCHANGED <<prize, choice, finalChoice>>

Stay ==
  /\ phase = "decide"
  /\ finalChoice' = choice
  /\ phase' = "finished"
  /\ UNCHANGED <<prize, choice, shown>>

Switch ==
  /\ phase = "decide"
  /\ finalChoice' \in Doors \ {choice, shown}
  /\ phase' = "finished"
  /\ UNCHANGED <<prize, choice, shown>>

Next == (\E d \in Doors : Choose(d) \/ Reveal(d)) \/ Stay \/ Switch
Spec == Init /\ [][Next]_vars
TypeOK ==
  /\ prize \in Doors
  /\ choice \in Doors \cup {"none"}
  /\ shown \in Doors \cup {"none"}
  /\ finalChoice \in Doors \cup {"none"}
  /\ phase \in {"choose", "reveal", "decide", "finished"}
HostNeverShowsPrize == shown # "none" => shown # prize
HostNeverShowsChoice == shown # "none" => shown # choice
ValidFinalChoice == phase = "finished" =>
  (finalChoice \in Doors \ {shown})
=============================================================================
