---------------------- MODULE SpacecraftCommandGate ----------------------
EXTENDS Naturals

VARIABLES assessed, safe, sent
vars == <<assessed, safe, sent>>

Init == /\ assessed = FALSE
        /\ safe = FALSE
        /\ sent = FALSE

AssessGood == /\ ~sent
              /\ assessed' = TRUE
              /\ safe' = TRUE
              /\ UNCHANGED sent

AssessBad == /\ ~sent
             /\ assessed' = TRUE
             /\ safe' = FALSE
             /\ UNCHANGED sent

Invalidate == /\ ~sent
              /\ assessed' = FALSE
              /\ safe' = FALSE
              /\ UNCHANGED sent

Send == /\ assessed
        /\ safe
        /\ ~sent
        /\ sent' = TRUE
        /\ UNCHANGED <<assessed, safe>>

Next == AssessGood \/ AssessBad \/ Invalidate \/ Send
Spec == Init /\ [][Next]_vars

TypeOK == /\ assessed \in BOOLEAN
          /\ safe \in BOOLEAN
          /\ sent \in BOOLEAN
SafeRelease == sent => assessed /\ safe
NoUnassessedSafe == safe => assessed
=============================================================================
