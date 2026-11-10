-------------------------- MODULE BatteryController --------------------------
EXTENDS Naturals

CONSTANT MaxCharge
ASSUME /\ MaxCharge \in Nat
       /\ MaxCharge > 0

VARIABLES charge, charging
vars == <<charge, charging>>

Init == /\ charge = 0
        /\ charging = FALSE

PlugIn == /\ ~charging
          /\ charge < MaxCharge
          /\ charging' = TRUE
          /\ UNCHANGED charge

ChargeStep == /\ charging
              /\ charge < MaxCharge
              /\ charge' = charge + 1
              /\ charging' = (charge' < MaxCharge)

Unplug == /\ charging
          /\ charging' = FALSE
          /\ UNCHANGED charge

Consume == /\ ~charging
           /\ charge > 0
           /\ charge' = charge - 1
           /\ UNCHANGED charging

Next == PlugIn \/ ChargeStep \/ Unplug \/ Consume
Spec == Init /\ [][Next]_vars

TypeOK == /\ charge \in 0..MaxCharge
          /\ charging \in BOOLEAN

NeverChargeWhenFull == charging => charge < MaxCharge
=============================================================================
