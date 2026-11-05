--------------------------- MODULE BankTransfer ---------------------------
EXTENDS Naturals

CONSTANT Total
ASSUME Total \in Nat

VARIABLES alice, bob
vars == <<alice, bob>>

Init == /\ alice = Total
        /\ bob = 0

TransferToBob == /\ alice > 0
                 /\ alice' = alice - 1
                 /\ bob' = bob + 1

TransferToAlice == /\ bob > 0
                   /\ alice' = alice + 1
                   /\ bob' = bob - 1

Next == TransferToBob \/ TransferToAlice
Spec == Init /\ [][Next]_vars
TypeOK == /\ alice \in Nat
          /\ bob \in Nat
Conservation == alice + bob = Total
=============================================================================
