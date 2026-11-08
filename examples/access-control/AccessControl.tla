---------------------------- MODULE AccessControl ----------------------------
EXTENDS FiniteSets

Users == {"alice", "bob"}
VARIABLES authorized, session
vars == <<authorized, session>>

Init == /\ authorized = {"alice"}
        /\ session = "none"

Grant(u) ==
  /\ u \in Users \ authorized
  /\ authorized' = authorized \cup {u}
  /\ UNCHANGED session

Revoke(u) ==
  /\ u \in authorized
  /\ authorized' = authorized \ {u}
  /\ session' = IF session = u THEN "none" ELSE session

Login(u) ==
  /\ u \in authorized
  /\ session = "none"
  /\ session' = u
  /\ UNCHANGED authorized

Logout ==
  /\ session # "none"
  /\ session' = "none"
  /\ UNCHANGED authorized

Next == (\/ \E u \in Users : Grant(u) \/ Revoke(u) \/ Login(u))
        \/ Logout

Spec == Init /\ [][Next]_vars
TypeOK == /\ authorized \subseteq Users
          /\ session \in Users \cup {"none"}
OnlyAuthorizedSession == session # "none" => session \in authorized
=============================================================================
