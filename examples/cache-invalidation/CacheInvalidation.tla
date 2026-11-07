------------------------- MODULE CacheInvalidation -------------------------
EXTENDS Naturals

CONSTANT MaxVersion
ASSUME /\ MaxVersion \in Nat
       /\ MaxVersion > 0

VARIABLES version, cachedVersion, valid
vars == <<version, cachedVersion, valid>>

Init ==
  /\ version = 0
  /\ cachedVersion = 0
  /\ valid = TRUE

Update ==
  /\ version < MaxVersion
  /\ version' = version + 1
  /\ valid' = FALSE
  /\ UNCHANGED cachedVersion

Refresh ==
  /\ ~valid
  /\ cachedVersion' = version
  /\ valid' = TRUE
  /\ UNCHANGED version

Next == Update \/ Refresh
Spec == Init /\ [][Next]_vars

TypeOK ==
  /\ version \in 0..MaxVersion
  /\ cachedVersion \in 0..MaxVersion
  /\ valid \in BOOLEAN

NoStaleValidCache == valid => cachedVersion = version
=============================================================================
