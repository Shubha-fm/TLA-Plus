--------------------------- MODULE InventoryOrder ---------------------------
EXTENDS Naturals

CONSTANT Stock
ASSUME /\ Stock \in Nat
       /\ Stock > 0

VARIABLES available, reserved, sold
vars == <<available, reserved, sold>>

Init == /\ available = Stock
        /\ reserved = 0
        /\ sold = 0

Reserve == /\ available > 0
           /\ available' = available - 1
           /\ reserved' = reserved + 1
           /\ UNCHANGED sold

Cancel == /\ reserved > 0
          /\ reserved' = reserved - 1
          /\ available' = available + 1
          /\ UNCHANGED sold

Ship == /\ reserved > 0
        /\ reserved' = reserved - 1
        /\ sold' = sold + 1
        /\ UNCHANGED available

Next == Reserve \/ Cancel \/ Ship
Spec == Init /\ [][Next]_vars

TypeOK == /\ available \in 0..Stock
          /\ reserved \in 0..Stock
          /\ sold \in 0..Stock

StockConserved == available + reserved + sold = Stock
=============================================================================
