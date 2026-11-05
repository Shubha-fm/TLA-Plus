-------------------------- MODULE VendingMachine --------------------------
EXTENDS Naturals

CONSTANT Price
ASSUME Price \in Nat \ {0}

VARIABLES credit, stock
vars == <<credit, stock>>

Init == /\ credit = 0
        /\ stock = 2

InsertCoin == /\ credit < Price
              /\ credit' = credit + 1
              /\ UNCHANGED stock

Dispense == /\ credit = Price
            /\ stock > 0
            /\ credit' = 0
            /\ stock' = stock - 1

Refund == /\ credit > 0
          /\ credit' = 0
          /\ UNCHANGED stock

Next == InsertCoin \/ Dispense \/ Refund
Spec == Init /\ [][Next]_vars
TypeOK == /\ credit \in 0..Price
          /\ stock \in 0..2
=============================================================================
