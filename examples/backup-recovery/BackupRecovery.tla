--------------------------- MODULE BackupRecovery ---------------------------
EXTENDS Naturals

CONSTANT MaxVersion
ASSUME /\ MaxVersion \in Nat
       /\ MaxVersion > 0

VARIABLES live, backup, mode
vars == <<live, backup, mode>>

Init == /\ live = 0
        /\ backup = 0
        /\ mode = "normal"

Update ==
  /\ mode = "normal"
  /\ live < MaxVersion
  /\ live' = live + 1
  /\ UNCHANGED <<backup, mode>>

TakeBackup ==
  /\ mode = "normal"
  /\ backup' = live
  /\ UNCHANGED <<live, mode>>

Crash ==
  /\ mode = "normal"
  /\ mode' = "failed"
  /\ UNCHANGED <<live, backup>>

Recover ==
  /\ mode = "failed"
  /\ live' = backup
  /\ mode' = "normal"
  /\ UNCHANGED backup

Next == Update \/ TakeBackup \/ Crash \/ Recover
Spec == Init /\ [][Next]_vars
TypeOK == /\ live \in 0..MaxVersion
          /\ backup \in 0..MaxVersion
          /\ mode \in {"normal", "failed"}
BackupNotAhead == backup <= live
=============================================================================
