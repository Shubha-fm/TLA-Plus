------------------------- MODULE DependencyScheduler -------------------------
EXTENDS FiniteSets

Tasks == {"prepare", "build", "test"}
VARIABLE done
vars == <<done>>

Init == done = {}

DoPrepare ==
  /\ "prepare" \notin done
  /\ done' = done \cup {"prepare"}

DoBuild ==
  /\ "prepare" \in done
  /\ "build" \notin done
  /\ done' = done \cup {"build"}

DoTest ==
  /\ "build" \in done
  /\ "test" \notin done
  /\ done' = done \cup {"test"}

Next == DoPrepare \/ DoBuild \/ DoTest
Spec == Init /\ [][Next]_vars

TypeOK == done \subseteq Tasks
BuildRequiresPrepare == "build" \in done => "prepare" \in done
TestRequiresBuild == "test" \in done => "build" \in done
=============================================================================
