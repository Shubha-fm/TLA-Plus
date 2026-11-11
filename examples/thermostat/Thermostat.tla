----------------------------- MODULE Thermostat -----------------------------
EXTENDS Integers

CONSTANTS MinTemp, MaxTemp, SetPoint
ASSUME /\ MinTemp \in Int
       /\ MaxTemp \in Int
       /\ SetPoint \in Int
       /\ MinTemp < SetPoint
       /\ SetPoint < MaxTemp

VARIABLES temp, heater
vars == <<temp, heater>>

Init == /\ temp = SetPoint
        /\ heater = FALSE

Cool == /\ temp > MinTemp
        /\ ~heater
        /\ temp' = temp - 1
        /\ heater' = (temp' < SetPoint)

Heat == /\ temp < MaxTemp
        /\ heater
        /\ temp' = temp + 1
        /\ heater' = (temp' < SetPoint)

Next == Cool \/ Heat
Spec == Init /\ [][Next]_vars

TypeOK == /\ temp \in MinTemp..MaxTemp
          /\ heater \in BOOLEAN
HeaterPolicy == heater => temp < SetPoint
=============================================================================
