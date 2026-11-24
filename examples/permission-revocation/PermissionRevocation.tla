------------------------ MODULE PermissionRevocation ------------------------
EXTENDS Naturals

VARIABLES permission, session, epoch, sessionEpoch
vars == <<permission, session, epoch, sessionEpoch>>

Init ==
  /\ permission = TRUE
  /\ session = FALSE
  /\ epoch = 0
  /\ sessionEpoch = 0

Login ==
  /\ permission
  /\ ~session
  /\ session' = TRUE
  /\ sessionEpoch' = epoch
  /\ UNCHANGED <<permission, epoch>>

Revoke ==
  /\ permission
  /\ permission' = FALSE
  /\ session' = FALSE
  /\ epoch' = 1
  /\ UNCHANGED sessionEpoch

Grant ==
  /\ ~permission
  /\ permission' = TRUE
  /\ UNCHANGED <<session, epoch, sessionEpoch>>

Logout ==
  /\ session
  /\ session' = FALSE
  /\ UNCHANGED <<permission, epoch, sessionEpoch>>

Next == Login \/ Revoke \/ Grant \/ Logout
Spec == Init /\ [][Next]_vars

TypeOK ==
  /\ permission \in BOOLEAN
  /\ session \in BOOLEAN
  /\ epoch \in 0..1
  /\ sessionEpoch \in 0..1

AuthorizedSession ==
  session => (permission /\ sessionEpoch = epoch)
=============================================================================
