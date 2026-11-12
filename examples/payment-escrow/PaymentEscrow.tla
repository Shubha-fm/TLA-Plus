---------------------------- MODULE PaymentEscrow ----------------------------
EXTENDS Naturals

CONSTANT Amount
ASSUME /\ Amount \in Nat
       /\ Amount > 0

VARIABLES buyer, escrow, seller, phase
vars == <<buyer, escrow, seller, phase>>

Init == /\ buyer = Amount
        /\ escrow = 0
        /\ seller = 0
        /\ phase = "created"

Deposit == /\ phase = "created"
           /\ buyer' = 0
           /\ escrow' = Amount
           /\ phase' = "funded"
           /\ UNCHANGED seller

Release == /\ phase = "funded"
           /\ escrow' = 0
           /\ seller' = Amount
           /\ phase' = "released"
           /\ UNCHANGED buyer

Refund == /\ phase = "funded"
          /\ escrow' = 0
          /\ buyer' = Amount
          /\ phase' = "refunded"
          /\ UNCHANGED seller

Next == Deposit \/ Release \/ Refund
Spec == Init /\ [][Next]_vars

TypeOK == /\ buyer \in 0..Amount
          /\ escrow \in 0..Amount
          /\ seller \in 0..Amount
          /\ phase \in {"created", "funded", "released", "refunded"}
Conservation == buyer + escrow + seller = Amount
NoDoubleSettlement == ~(buyer = Amount /\ seller = Amount)
=============================================================================
