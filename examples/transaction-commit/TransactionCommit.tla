------------------------- MODULE TransactionCommit -------------------------
EXTENDS Naturals

CONSTANT Amount
ASSUME /\ Amount \in Nat
       /\ Amount > 0

VARIABLES balance, pending, status
vars == <<balance, pending, status>>

Init == /\ balance = Amount
        /\ pending = 0
        /\ status = "idle"

Begin ==
  /\ status = "idle"
  /\ pending' = 1
  /\ status' = "prepared"
  /\ UNCHANGED balance

Commit ==
  /\ status = "prepared"
  /\ balance > 0
  /\ balance' = balance - 1
  /\ pending' = 0
  /\ status' = "committed"

Abort ==
  /\ status = "prepared"
  /\ pending' = 0
  /\ status' = "aborted"
  /\ UNCHANGED balance

Reset ==
  /\ status \in {"committed", "aborted"}
  /\ status' = "idle"
  /\ UNCHANGED <<balance, pending>>

Next == Begin \/ Commit \/ Abort \/ Reset
Spec == Init /\ [][Next]_vars

TypeOK == /\ balance \in 0..Amount
          /\ pending \in 0..1
          /\ status \in {"idle", "prepared", "committed", "aborted"}
PreparedHasPending == (status = "prepared") <=> (pending = 1)
=============================================================================
