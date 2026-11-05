------------------------- MODULE TwoPhaseCommit -------------------------
EXTENDS FiniteSets

Participants == {"p1", "p2"}

VARIABLES phase, yesVotes, noVotes
vars == <<phase, yesVotes, noVotes>>

Init == /\ phase = "voting"
        /\ yesVotes = {}
        /\ noVotes = {}

VoteYes(p) == /\ phase = "voting"
              /\ p \in Participants \ (yesVotes \cup noVotes)
              /\ yesVotes' = yesVotes \cup {p}
              /\ UNCHANGED <<phase, noVotes>>

VoteNo(p) == /\ phase = "voting"
             /\ p \in Participants \ (yesVotes \cup noVotes)
             /\ noVotes' = noVotes \cup {p}
             /\ UNCHANGED <<phase, yesVotes>>

Commit == /\ phase = "voting"
          /\ yesVotes = Participants
          /\ phase' = "committed"
          /\ UNCHANGED <<yesVotes, noVotes>>

Abort == /\ phase = "voting"
         /\ noVotes # {}
         /\ phase' = "aborted"
         /\ UNCHANGED <<yesVotes, noVotes>>

Next == \/ \E p \in Participants : VoteYes(p)
        \/ \E p \in Participants : VoteNo(p)
        \/ Commit
        \/ Abort

Spec == Init /\ [][Next]_vars

TypeOK == /\ phase \in {"voting", "committed", "aborted"}
          /\ yesVotes \subseteq Participants
          /\ noVotes \subseteq Participants

DisjointVotes == yesVotes \cap noVotes = {}
CommitOnlyOnUnanimity == phase = "committed" => yesVotes = Participants
=============================================================================
