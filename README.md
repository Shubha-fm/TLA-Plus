# TLA+ Specifications and Examples

A collection of educational TLA+ specifications, ranging from small state machines to concurrent protocols. This repository focuses on **modeling and specification**. The companion [Model-Checking](https://github.com/Shubha-fm/Model-Checking) repository focuses on verification algorithms and tools.

## Prerequisites

- Java 11 or newer and `tla2tools.jar` from the official [TLA+ releases](https://github.com/tlaplus/tlaplus/releases)
- Optional: [TLA+ VS Code extension](https://marketplace.visualstudio.com/items?itemName=alygin.vscode-tlaplus)

## Examples

| Directory | Concept | Properties |
|---|---|---|
| `examples/counter/` | Bounded state machine | State bounds, increment behavior |
| `examples/mutex/` | Two-process mutual exclusion | Mutual exclusion and type correctness |

Run TLC from a directory containing its `.tla` and `.cfg` files:

```bash
java -cp /path/to/tla2tools.jar tlc2.TLC -config Counter.cfg Counter.tla
java -cp /path/to/tla2tools.jar tlc2.TLC -config Mutex.cfg Mutex.tla
```

TLC checks finite configurations, not an unbounded correctness proof. A passing run establishes the configured properties only for the explored model.

## Roadmap

Add modules for producer-consumer, dining philosophers, distributed locks, leader election, traffic intersections, and requirements-to-properties examples. Accompany each module with a short explanation and expected TLC outcome.

## References

- [TLA+ official site](https://lamport.azurewebsites.net/tla/tla.html)
- [TLA+ tools](https://github.com/tlaplus/tlaplus)

## License

MIT. See `LICENSE`.
