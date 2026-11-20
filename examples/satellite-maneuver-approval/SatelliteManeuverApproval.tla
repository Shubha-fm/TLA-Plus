--------------------- MODULE SatelliteManeuverApproval ---------------------
EXTENDS Naturals

CONSTANT MaxVersion
ASSUME /\ MaxVersion \in Nat
       /\ MaxVersion > 0

VARIABLES orbitVersion, assessmentVersion, safe, released
vars == <<orbitVersion, assessmentVersion, safe, released>>

Init == /\ orbitVersion = 0
        /\ assessmentVersion = -1
        /\ safe = FALSE
        /\ released = FALSE

UpdateOrbit ==
  /\ ~released
  /\ orbitVersion < MaxVersion
  /\ orbitVersion' = orbitVersion + 1
  /\ assessmentVersion' = -1
  /\ safe' = FALSE
  /\ UNCHANGED released

Assess(v) ==
  /\ ~released
  /\ v \in BOOLEAN
  /\ assessmentVersion' = orbitVersion
  /\ safe' = v
  /\ UNCHANGED <<orbitVersion, released>>

Release ==
  /\ ~released
  /\ safe
  /\ assessmentVersion = orbitVersion
  /\ released' = TRUE
  /\ UNCHANGED <<orbitVersion, assessmentVersion, safe>>

Next == UpdateOrbit \/ (\E v \in BOOLEAN : Assess(v)) \/ Release
Spec == Init /\ [][Next]_vars

TypeOK ==
  /\ orbitVersion \in 0..MaxVersion
  /\ assessmentVersion \in {-1} \cup (0..MaxVersion)
  /\ safe \in BOOLEAN
  /\ released \in BOOLEAN

FreshSafeRelease ==
  released => (safe /\ assessmentVersion = orbitVersion)
=============================================================================
