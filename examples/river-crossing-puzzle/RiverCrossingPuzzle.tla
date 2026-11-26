------------------------- MODULE RiverCrossingPuzzle -------------------------
Entities == {"farmer", "wolf", "goat", "cabbage"}
Banks == {"left", "right"}
VARIABLES side, completed
vars == <<side, completed>>

Other(b) == IF b = "left" THEN "right" ELSE "left"
Safe(s) ==
  /\ ~(s["wolf"] = s["goat"] /\ s["farmer"] # s["goat"])
  /\ ~(s["goat"] = s["cabbage"] /\ s["farmer"] # s["goat"])

Init ==
  /\ side = [e \in Entities |-> "left"]
  /\ completed = FALSE

Cross(passenger) ==
  /\ ~completed
  /\ passenger \in Entities
  /\ passenger = "farmer" \/ side[passenger] = side["farmer"]
  /\ LET moved == [e \in Entities |->
       IF e = "farmer" \/ e = passenger
       THEN Other(side[e]) ELSE side[e]]
     IN /\ Safe(moved)
        /\ side' = moved
        /\ completed' = \A e \in Entities : moved[e] = "right"

Next == \E p \in Entities : Cross(p)
Spec == Init /\ [][Next]_vars
TypeOK ==
  /\ side \in [Entities -> Banks]
  /\ completed \in BOOLEAN
NeverLeavePreyUnprotected == Safe(side)
CompletionMeansAllAcross ==
  completed => \A e \in Entities : side[e] = "right"
=============================================================================
