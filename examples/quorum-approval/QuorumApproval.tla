--------------------------- MODULE QuorumApproval ---------------------------
EXTENDS Naturals, FiniteSets

Voters == {"a", "b", "c"}
Quorum == 2

VARIABLES approved, rejected, decision
vars == <<approved, rejected, decision>>

Init == /\ approved = {}
        /\ rejected = {}
        /\ decision = "pending"

VoteYes(v) ==
  /\ decision = "pending"
  /\ v \in Voters \ (approved \cup rejected)
  /\ approved' = approved \cup {v}
  /\ UNCHANGED <<rejected, decision>>

VoteNo(v) ==
  /\ decision = "pending"
  /\ v \in Voters \ (approved \cup rejected)
  /\ rejected' = rejected \cup {v}
  /\ UNCHANGED <<approved, decision>>

Approve ==
  /\ decision = "pending"
  /\ Cardinality(approved) >= Quorum
  /\ decision' = "accepted"
  /\ UNCHANGED <<approved, rejected>>

Reject ==
  /\ decision = "pending"
  /\ Cardinality(rejected) >= Quorum
  /\ decision' = "denied"
  /\ UNCHANGED <<approved, rejected>>

Next == (\/ \E v \in Voters : VoteYes(v) \/ VoteNo(v))
        \/ Approve \/ Reject
Spec == Init /\ [][Next]_vars

TypeOK == /\ approved \subseteq Voters
          /\ rejected \subseteq Voters
          /\ decision \in {"pending", "accepted", "denied"}
NoDoubleVoting == approved \cap rejected = {}
DecisionJustified ==
  /\ (decision = "accepted" => Cardinality(approved) >= Quorum)
  /\ (decision = "denied" => Cardinality(rejected) >= Quorum)
=============================================================================
