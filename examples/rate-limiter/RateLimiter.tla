----------------------------- MODULE RateLimiter -----------------------------
EXTENDS Naturals

CONSTANT Limit
ASSUME /\ Limit \in Nat
       /\ Limit > 0

VARIABLE used
vars == <<used>>

Init == used = 0

Accept ==
  /\ used < Limit
  /\ used' = used + 1

NewWindow ==
  /\ used' = 0

Next == Accept \/ NewWindow
Spec == Init /\ [][Next]_vars

TypeOK == used \in 0..Limit
WithinLimit == used <= Limit
=============================================================================
