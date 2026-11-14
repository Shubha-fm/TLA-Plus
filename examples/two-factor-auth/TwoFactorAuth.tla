--------------------------- MODULE TwoFactorAuth ---------------------------
EXTENDS Naturals

VARIABLES passwordOK, otpOK, access
vars == <<passwordOK, otpOK, access>>

Init == /\ passwordOK = FALSE
        /\ otpOK = FALSE
        /\ access = FALSE

SubmitPassword ==
  /\ ~passwordOK
  /\ passwordOK' = TRUE
  /\ UNCHANGED <<otpOK, access>>

SubmitOTP ==
  /\ passwordOK
  /\ ~otpOK
  /\ otpOK' = TRUE
  /\ UNCHANGED <<passwordOK, access>>

GrantAccess ==
  /\ passwordOK
  /\ otpOK
  /\ ~access
  /\ access' = TRUE
  /\ UNCHANGED <<passwordOK, otpOK>>

Logout ==
  /\ access
  /\ passwordOK' = FALSE
  /\ otpOK' = FALSE
  /\ access' = FALSE

Reset ==
  /\ ~access
  /\ passwordOK \/ otpOK
  /\ passwordOK' = FALSE
  /\ otpOK' = FALSE
  /\ UNCHANGED access

Next == SubmitPassword \/ SubmitOTP \/ GrantAccess \/ Logout \/ Reset
Spec == Init /\ [][Next]_vars

TypeOK == /\ passwordOK \in BOOLEAN
          /\ otpOK \in BOOLEAN
          /\ access \in BOOLEAN
AccessRequiresBoth == access => (passwordOK /\ otpOK)
=============================================================================
