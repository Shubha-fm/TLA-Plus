----------------------------- MODULE RateLimiter -----------------------------
EXTENDS Naturals

CONSTANT Limit
ASSUME /\ Limit \in Nat
       /\ Limit > 0

VARIABLES used, accepted
vars == <<used, accepted>>

Init == /\ used = 0
        /\ accepted = 0

Accept ==
  /\ used < Limit
  /\ used' = used + 1
  /\ accepted' = accepted + 1

NewWindow ==
  /\ used' = 0
  /\ UNCHANGED accepted

Next == Accept \/ NewWindow
Spec == Init /\ [][Next]_vars

TypeOK == /\ used \in 0..Limit
          /\ accepted \in Nat
WithinLimit == used <= Limit
=============================================================================
