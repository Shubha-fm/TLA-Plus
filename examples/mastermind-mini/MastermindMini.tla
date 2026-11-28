--------------------------- MODULE MastermindMini ---------------------------
EXTENDS Naturals

Pegs == 1..2
Colors == {"red", "blue", "green"}
CONSTANT MaxGuesses
ASSUME /\ MaxGuesses \in Nat
       /\ MaxGuesses > 0

VARIABLES secret, lastGuess, attempts, won
vars == <<secret, lastGuess, attempts, won>>

Init ==
  /\ secret \in [Pegs -> Colors]
  /\ lastGuess = [p \in Pegs |-> "none"]
  /\ attempts = 0
  /\ won = FALSE

Guess(g) ==
  /\ g \in [Pegs -> Colors]
  /\ ~won
  /\ attempts < MaxGuesses
  /\ lastGuess' = g
  /\ attempts' = attempts + 1
  /\ won' = (g = secret)
  /\ UNCHANGED secret

Next == \E g \in [Pegs -> Colors] : Guess(g)
Spec == Init /\ [][Next]_vars

TypeOK ==
  /\ secret \in [Pegs -> Colors]
  /\ lastGuess \in [Pegs -> Colors \cup {"none"}]
  /\ attempts \in 0..MaxGuesses
  /\ won \in BOOLEAN

WinRequiresMatch == won => lastGuess = secret
NoGuessBeforeAttempt ==
  attempts = 0 => lastGuess = [p \in Pegs |-> "none"]
=============================================================================
