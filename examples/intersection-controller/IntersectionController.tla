---------------------- MODULE IntersectionController ----------------------
EXTENDS Naturals

VARIABLES ns, ew
vars == <<ns, ew>>

Init ==
  /\ ns = "green"
  /\ ew = "red"

NSToYellow ==
  /\ ns = "green"
  /\ ew = "red"
  /\ ns' = "yellow"
  /\ UNCHANGED ew

NSToRed ==
  /\ ns = "yellow"
  /\ ew = "red"
  /\ ns' = "red"
  /\ UNCHANGED ew

EWToGreen ==
  /\ ns = "red"
  /\ ew = "red"
  /\ ew' = "green"
  /\ UNCHANGED ns

EWToYellow ==
  /\ ew = "green"
  /\ ns = "red"
  /\ ew' = "yellow"
  /\ UNCHANGED ns

EWToRed ==
  /\ ew = "yellow"
  /\ ns = "red"
  /\ ew' = "red"
  /\ UNCHANGED ns

NSToGreen ==
  /\ ew = "red"
  /\ ns = "red"
  /\ ns' = "green"
  /\ UNCHANGED ew

Next == NSToYellow \/ NSToRed \/ EWToGreen \/
        EWToYellow \/ EWToRed \/ NSToGreen

Spec == Init /\ [][Next]_vars

TypeOK ==
  /\ ns \in {"red", "yellow", "green"}
  /\ ew \in {"red", "yellow", "green"}

NoConflictingGreens == ~(ns = "green" /\ ew = "green")
=============================================================================
