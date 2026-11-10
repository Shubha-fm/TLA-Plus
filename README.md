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
| 8 | [vending-machine](examples/vending-machine) | `VendingMachine` | Accept coins, dispense stock, and refund | `TypeOK` |
| 9 | [elevator](examples/elevator) | `Elevator` | Move between floors with door interlocks | `TypeOK` |
| 10 | [request-reply](examples/request-reply) | `RequestReply` | Client request and server response | `TypeOK`, `ReplyHasRequester` |
| 11 | [two-phase-commit](examples/two-phase-commit) | `TwoPhaseCommit` | Abstract two-participant voting and commit | `TypeOK`, `DisjointVotes`, `CommitOnlyOnUnanimity` |
| 12 | [bounded-retry](examples/bounded-retry) | `BoundedRetry` | Retry a pending operation up to a configured limit | `TypeOK`, `NoPrematureFailure` |
| 13 | [dining-philosophers](examples/dining-philosophers) | `DiningPhilosophers` | Atomic acquisition and release of adjacent forks | `TypeOK`, `NoAdjacentEating`, `ForkAccounting` |
| 14 | [leader-election](examples/leader-election) | `LeaderElection` | Elect highest active node and model failures | `TypeOK`, `LeaderActive` |
| 15 | [counting-semaphore](examples/counting-semaphore) | `CountingSemaphore` | Restrict concurrent client resource ownership | `TypeOK`, `CapacityBound` |
| 16 | [railway-crossing](examples/railway-crossing) | `RailwayCrossing` | Protect a single track crossing with a gate | `TypeOK`, `CrossingProtected` |
| 17 | [readers-writers](examples/readers-writers) | `ReadersWriters` | Allow concurrent readers and exclusive writer | `TypeOK`, `ExclusiveWrite` |
| 18 | [message-channel](examples/message-channel) | `MessageChannel` | Send and receive messages through a bounded FIFO channel | `TypeOK`, `Bounded` |
| 19 | [distributed-lock](examples/distributed-lock) | `DistributedLock` | Grant one atomic lock owner at a time | `TypeOK` |
| 20 | [cache-invalidation](examples/cache-invalidation) | `CacheInvalidation` | Invalidate stale cache data after source updates | `TypeOK`, `NoStaleValidCache` |
| 21 | [sensor-alarm](examples/sensor-alarm) | `SensorAlarm` | Trigger an alarm according to a sensor threshold | `TypeOK`, `AlarmCorrect` |
| 22 | [intersection-controller](examples/intersection-controller) | `IntersectionController` | Coordinate two traffic directions | `TypeOK`, `NoConflictingGreens` |
| 23 | [parking-lot](examples/parking-lot) | `ParkingLot` | Track parking occupancy with vehicle identities | `TypeOK`, `CapacitySafe` |
| 24 | [rate-limiter](examples/rate-limiter) | `RateLimiter` | Restrict accepted requests per abstract window | `TypeOK`, `WithinLimit` |
| 25 | [job-scheduler](examples/job-scheduler) | `JobScheduler` | Schedule one job at a time while preserving job ownership | `TypeOK`, `AtMostOneRunning`, `NoLostJobs`, `DisjointStates` |
| 26 | [access-control](examples/access-control) | `AccessControl` | Grant and revoke authorization for an active session | `TypeOK`, `OnlyAuthorizedSession` |
| 27 | [backup-recovery](examples/backup-recovery) | `BackupRecovery` | Model versioned backup, crashes, and recovery | `TypeOK`, `BackupNotAhead` |
| 28 | [handshake-protocol](examples/handshake-protocol) | `HandshakeProtocol` | Three-step client-server handshake and disconnect | `TypeOK`, `ConnectionAgreement` |
| 29 | [inventory-order](examples/inventory-order) | `InventoryOrder` | Reserve, cancel, and ship inventory | `TypeOK`, `StockConserved` |
| 30 | [battery-controller](examples/battery-controller) | `BatteryController` | Charging and consumption with capacity interlock | `TypeOK`, `NeverChargeWhenFull` |
| 31 | [replica-sync](examples/replica-sync) | `ReplicaSync` | Primary writes and replica synchronization | `TypeOK`, `ReplicaNotAhead`, `SyncAccurate` |
| 32 | [pedestrian-crossing](examples/pedestrian-crossing) | `PedestrianCrossing` | Coordinate pedestrian and vehicle signals | `TypeOK`, `NoVehiclePedestrianConflict` |

**Model scope:** The producer-consumer example abstracts away item identities and process interleavings. The token-ring example stores only the current token holder. The queue example uses identical `"job"` items. The bank-transfer example assumes atomic transfers. The two-phase commit example models coordinator decision logic, not networking, message loss, crashes, or recovery. The elevator example checks bounded floors and door states, and allows motion only with the door closed. The retry example abstracts away elapsed time. The dining philosophers model acquires both forks atomically and does not model starvation or actual fork-by-fork locking. The leader-election model selects the highest active identifier atomically and does not implement an election message protocol. The railway crossing is a single-train abstraction with no sensor delays. The readers-writers model does not guarantee fairness. The message channel omits message loss and delivery failures. The distributed lock assumes atomic acquire and release without network failures or starvation guarantees. The cache-invalidation model uses a single source version and one cache. Sensor readings update their alarm atomically. The intersection controller omits timing and pedestrian signals. The parking lot tracks three named cars and a bounded capacity. The rate limiter treats windows as nondeterministic resets without wall-clock time. The scheduler runs at most one job and does not address starvation. The access-control model revokes an active session immediately. The recovery model assumes atomic backup and recovery, with no partial writes. The handshake uses reliable atomic messages with no timeouts. Inventory operations are unit-sized and atomic. Battery charging is discrete and omits thermal behavior. Replica synchronization uses monotonic versions without network loss or conflicts. The pedestrian model omits amber phases and timing constraints. These choices deliberately keep the teaching models small.

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

All configurations select `Spec`, check one or more invariants, and disable deadlock detection because terminal states or stuttering can be legitimate for these teaching models. The invariants do not establish fairness, eventual completion, or real-time behavior.

To check the new two-phase commit example from the repository root:

```bash
cd examples/two-phase-commit
java -cp "$TLA_TOOLS" tlc2.TLC -config TwoPhaseCommit.cfg TwoPhaseCommit.tla
```

## Latest additions (examples 28–32)

The five new specifications cover connection handshakes, inventory accounting, charging safety, versioned replication, and pedestrian crossing coordination. Each has a matching TLC configuration.

Run the new inventory model from the repository root:

```bash
cd examples/inventory-order
java -cp "$TLA_TOOLS" tlc2.TLC -config InventoryOrder.cfg InventoryOrder.tla
```

Run replica synchronization separately from the repository root:

```bash
cd examples/replica-sync
java -cp "$TLA_TOOLS" tlc2.TLC -config ReplicaSync.cfg ReplicaSync.tla
```

These are small finite abstractions. They do not establish correctness of full network, hardware, or timing implementations. No TLC verification result is claimed until actual TLC logs are produced.

## Specification pattern

- `Init`: initial state
- `Next`: next-state relation composed of actions
- `Spec`: `Init /\\ [][Next]_vars`
- `TypeOK`: state-domain invariant
- Other invariants: protocol-specific requirements

A successful TLC run supports only the checked properties in the selected finite configuration. **Upload does not mean verification:** the examples have been committed, but TLC has not been executed as part of this update.

## Proposed extensions

Asynchronous leader-election messaging, failure-aware consensus, fairness properties, timeout-aware handshakes, multi-replica failure handling, and faulty variants with documented TLC counterexamples.

## References

- [TLA+ language and resources](https://lamport.azurewebsites.net/tla/tla.html)
- [Official TLA+ tools](https://github.com/tlaplus/tlaplus)
- [Learn TLA+](https://learntla.com/)

## License

MIT. See [LICENSE](LICENSE).
