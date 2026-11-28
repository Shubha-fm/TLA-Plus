--------------------------- MODULE MemoryPairGame ---------------------------
EXTENDS Naturals, FiniteSets

Cards == 1..4
Symbol(c) == IF c \in {1, 2} THEN "sun" ELSE "moon"

VARIABLES first, second, matched
vars == <<first, second, matched>>

Init ==
  /\ first = 0
  /\ second = 0
  /\ matched = {}

FlipFirst(c) ==
  /\ first = 0
  /\ c \in Cards \ matched
  /\ first' = c
  /\ UNCHANGED <<second, matched>>

FlipSecond(c) ==
  /\ first \in Cards
  /\ second = 0
  /\ c \in Cards \ (matched \cup {first})
  /\ second' = c
  /\ UNCHANGED <<first, matched>>

Resolve ==
  /\ first \in Cards
  /\ second \in Cards
  /\ matched' = IF Symbol(first) = Symbol(second)
               THEN matched \cup {first, second} ELSE matched
  /\ first' = 0
  /\ second' = 0

Next ==
  \/ \E c \in Cards : FlipFirst(c) \/ FlipSecond(c)
  \/ Resolve

Spec == Init /\ [][Next]_vars

TypeOK ==
  /\ first \in Cards \cup {0}
  /\ second \in Cards \cup {0}
  /\ matched \subseteq Cards

SecondRequiresFirst == second # 0 => first # 0
MatchedInPairs ==
  /\ (1 \in matched <=> 2 \in matched)
  /\ (3 \in matched <=> 4 \in matched)
NoRepeatedSelection == second = 0 \/ first # second
=============================================================================
