------------------------ MODULE PedestrianCrossing ------------------------
EXTENDS Naturals

VARIABLES vehicleLight, pedestrianLight
vars == <<vehicleLight, pedestrianLight>>

Init == /\ vehicleLight = "green"
        /\ pedestrianLight = "dontWalk"

StopVehicles == /\ vehicleLight = "green"
                /\ vehicleLight' = "red"
                /\ UNCHANGED pedestrianLight

AllowWalking == /\ vehicleLight = "red"
                /\ pedestrianLight = "dontWalk"
                /\ pedestrianLight' = "walk"
                /\ UNCHANGED vehicleLight

StopWalking == /\ pedestrianLight = "walk"
               /\ pedestrianLight' = "dontWalk"
               /\ UNCHANGED vehicleLight

ResumeVehicles == /\ vehicleLight = "red"
                  /\ pedestrianLight = "dontWalk"
                  /\ vehicleLight' = "green"
                  /\ UNCHANGED pedestrianLight

Next == StopVehicles \/ AllowWalking \/ StopWalking \/ ResumeVehicles
Spec == Init /\ [][Next]_vars

TypeOK == /\ vehicleLight \in {"green", "red"}
          /\ pedestrianLight \in {"walk", "dontWalk"}

NoVehiclePedestrianConflict ==
  ~(vehicleLight = "green" /\ pedestrianLight = "walk")
=============================================================================
