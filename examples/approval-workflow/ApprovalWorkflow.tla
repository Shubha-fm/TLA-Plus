-------------------------- MODULE ApprovalWorkflow --------------------------
EXTENDS Naturals

VARIABLES review, security, released
vars == <<review, security, released>>

Init == /\ review = "pending"
        /\ security = "pending"
        /\ released = FALSE

ApproveReview == /\ review = "pending"
                 /\ review' = "approved"
                 /\ UNCHANGED <<security, released>>

RejectReview == /\ review = "pending"
                /\ review' = "rejected"
                /\ UNCHANGED <<security, released>>

ApproveSecurity == /\ security = "pending"
                   /\ security' = "approved"
                   /\ UNCHANGED <<review, released>>

RejectSecurity == /\ security = "pending"
                  /\ security' = "rejected"
                  /\ UNCHANGED <<review, released>>

Release == /\ ~released
           /\ review = "approved"
           /\ security = "approved"
           /\ released' = TRUE
           /\ UNCHANGED <<review, security>>

Next == ApproveReview \/ RejectReview \/ ApproveSecurity \/
        RejectSecurity \/ Release
Spec == Init /\ [][Next]_vars

TypeOK == /\ review \in {"pending", "approved", "rejected"}
          /\ security \in {"pending", "approved", "rejected"}
          /\ released \in BOOLEAN
OnlyFullyApproved == released =>
  (review = "approved" /\ security = "approved")
=============================================================================
