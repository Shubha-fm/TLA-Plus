# TLA+ Specifications and Examples

A growing collection of educational [TLA+](https://lamport.azurewebsites.net/tla/tla.html) specifications with finite TLC model configurations. Examples cover sequential state machines, concurrency, communication, queues, and invariants.

This repository focuses on **writing TLA+ specifications**. Model-checking algorithms and implementations belong in the separate [Model-Checking](https://github.com/Shubha-fm/Model-Checking) repository.

## Requirements

- Java 11 or newer
- `tla2tools.jar` from the [official TLA+ release page](https://github.com/tlaplus/tlaplus/releases)
- Optional: [TLA+ VS Code extension](https://marketplace.visualstudio.com/items?itemName=alygin.vscode-tlaplus)

## Example catalog

| # | Directory | Module | Purpose | TLC invariants |
|---|---|---|---|---|
| 1 | [counter](examples/counter) | `Counter` | Increment and reset a bounded counter | `TypeOK` |
| 2 | [mutex](examples/mutex) | `Mutex` | Mutual exclusion between two processes | `TypeOK`, `MutualExclusion` |
| 3 | [producer-consumer](examples/producer-consumer) | `ProducerConsumer` | Count buffered items produced and consumed | `TypeOK` |
| 4 | [traffic-light](examples/traffic-light) | `TrafficLight` | Cycle through traffic signal states | `TypeOK` |
| 5 | [token-ring](examples/token-ring) | `TokenRing` | Pass a token around a circular network | `TypeOK` |
| 6 | [bank-transfer](examples/bank-transfer) | `BankTransfer` | Transfer units between two balances | `TypeOK`, `Conservation` |
| 7 | [simple-queue](examples/simple-queue) | `SimpleQueue` | Enqueue and dequeue identical jobs in a bounded FIFO queue | `TypeOK` |

**Model scope:** The producer-consumer example abstracts away item identities and process interleavings. The token-ring example stores only the current token holder. The queue example uses identical `"job"` items. The bank-transfer example assumes atomic transfers. These choices deliberately keep the teaching models small.

## Run TLC

Download `tla2tools.jar` and set its path:

```bash
export TLA_TOOLS=/absolute/path/to/tla2tools.jar
```

Run a particular example from the repository root:

```bash
cd examples/bank-transfer
java -cp "$TLA_TOOLS" tlc2.TLC -config BankTransfer.cfg BankTransfer.tla
```

For another example, replace the directory and module name, e.g.:

```bash
cd ../token-ring
java -cp "$TLA_TOOLS" tlc2.TLC -config TokenRing.cfg TokenRing.tla
```

All configurations select `Spec`, check one or more invariants, and disable deadlock detection because stuttering or terminal states can be legitimate for these teaching models.

## Specification pattern

- `Init`: initial state
- `Next`: next-state relation composed of actions
- `Spec`: `Init /\\ [][Next]_vars`
- `TypeOK`: state-domain invariant
- Other invariants: protocol-specific requirements

A successful TLC run supports only the checked properties in the selected finite configuration. **Upload does not mean verification:** the examples have been committed, but TLC has not been executed as part of this update.

## Proposed extensions

Dining philosophers, two-phase commit, request-reply protocols, leader election, distributed locks, and faulty variants with documented TLC counterexamples.

## References

- [TLA+ language and resources](https://lamport.azurewebsites.net/tla/tla.html)
- [Official TLA+ tools](https://github.com/tlaplus/tlaplus)
- [Learn TLA+](https://learntla.com/)

## License

MIT. See [LICENSE](LICENSE).
