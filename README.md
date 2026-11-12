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
| 33 | [thermostat](examples/thermostat) | `Thermostat` | Heat and cool within a bounded temperature range | `TypeOK`, `HeaterPolicy` |
| 34 | [quorum-approval](examples/quorum-approval) | `QuorumApproval` | Gather three votes and require a quorum of two | `TypeOK`, `NoDoubleVoting`, `DecisionJustified` |
| 35 | [bounded-pipeline](examples/bounded-pipeline) | `BoundedPipeline` | Transfer jobs through a one-at-a-time processing stage | `TypeOK`, `Conservation` |
| 36 | [file-locking](examples/file-locking) | `FileLocking` | Permit shared readers or a single exclusive writer | `TypeOK`, `ExclusiveWriter` |
| 37 | [deployment-rollback](examples/deployment-rollback) | `DeploymentRollback` | Stage candidate deployment and roll back on failure | `TypeOK`, `ActiveNotAhead`, `RollbackPreservesActive` |
| 38 | [circuit-breaker](examples/circuit-breaker) | `CircuitBreaker` | Open a service circuit after repeated failures and probe recovery | `TypeOK`, `OpenAfterLimit` |
| 39 | [rover-obstacle](examples/rover-obstacle) | `RoverObstacle` | Halt rover motion when an obstacle is detected | `TypeOK`, `StopOnObstacle`, `NoOverrun` |
| 40 | [lease-manager](examples/lease-manager) | `LeaseManager` | Acquire, renew, release, and expire an exclusive lease | `TypeOK`, `LeaseConsistency` |
| 41 | [watchdog-monitor](examples/watchdog-monitor) | `WatchdogMonitor` | Track heartbeats and raise an alarm at a timeout | `TypeOK`, `AlarmAtTimeout` |
| 42 | [round-robin-scheduler](examples/round-robin-scheduler) | `RoundRobinScheduler` | Cycle through a finite set of tasks | `TypeOK` |
| 43 | [payment-escrow](examples/payment-escrow) | `PaymentEscrow` | Deposit, release, or refund an escrow payment | `TypeOK`, `Conservation`, `NoDoubleSettlement` |
| 44 | [api-idempotency](examples/api-idempotency) | `ApiIdempotency` | Process each request ID at most once | `TypeOK`, `AtMostOnce` |
| 45 | [emergency-stop](examples/emergency-stop) | `EmergencyStop` | Latch an emergency stop until reset and restart | `TypeOK`, `StoppedOnEmergency` |
| 46 | [bounded-broadcast](examples/bounded-broadcast) | `BoundedBroadcast` | Publish once and track delivery to three recipients | `TypeOK`, `OnlyAfterPublish` |
| 47 | [satellite-separation](examples/satellite-separation) | `SatelliteSeparation` | Allow bounded moves only when separation remains safe | `TypeOK`, `SafeSeparation` |

**Model scope:** The producer-consumer example abstracts away item identities and process interleavings. The token-ring example stores only the current token holder. The queue example uses identical `"job"` items. The bank-transfer example assumes atomic transfers. The two-phase commit example models coordinator decision logic, not networking, message loss, crashes, or recovery. The elevator example checks bounded floors and door states, and allows motion only with the door closed. The retry example abstracts away elapsed time. The dining philosophers model acquires both forks atomically and does not model starvation or actual fork-by-fork locking. The leader-election model selects the highest active identifier atomically and does not implement an election message protocol. The railway crossing is a single-train abstraction with no sensor delays. The readers-writers model does not guarantee fairness. The message channel omits message loss and delivery failures. The distributed lock assumes atomic acquire and release without network failures or starvation guarantees. The cache-invalidation model uses a single source version and one cache. Sensor readings update their alarm atomically. The intersection controller omits timing and pedestrian signals. The parking lot tracks three named cars and a bounded capacity. The rate limiter treats windows as nondeterministic resets without wall-clock time. The scheduler runs at most one job and does not address starvation. The access-control model revokes an active session immediately. The recovery model assumes atomic backup and recovery, with no partial writes. The handshake uses reliable atomic messages with no timeouts. Inventory operations are unit-sized and atomic. Battery charging is discrete and omits thermal behavior. Replica synchronization uses monotonic versions without network loss or conflicts. The pedestrian model omits amber phases and timing constraints. The thermostat model uses discrete temperature steps and has no timed environment. Quorum approval assumes one vote per named voter and no distributed messages. The bounded pipeline has one processing slot and no job identities. File locking models shared readers and a single writer, but omits fairness and file contents. Deployment rollback treats testing, promotion, and rollback as atomic actions and does not model partial deployment. The circuit breaker models discrete failure counts and recovery probes without real service calls. Rover obstacle detection and braking are atomic, so sensor latency is not represented. Lease time advances in abstract ticks without clock drift. The watchdog models heartbeat resets but not message loss. Round-robin scheduling assumes one atomic step per turn, with no task execution time or fairness proof. Payment escrow assumes atomic financial transfers. API idempotency assumes a durable processed-ID set and counts effects rather than executing them. Emergency stop is an atomic logical latch without actuator delay. Broadcast models one publication and no delivery loss. Satellite separation uses one-dimensional positions and discrete unit moves, not orbital dynamics or continuous collision checking. These choices deliberately keep the teaching models small.

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

## Latest additions (examples 43–47)

Five new bounded models cover escrow payments, idempotent API requests, emergency stops, single-message broadcast, and simplified satellite separation. Each example contains a `.tla` specification and matching TLC `.cfg` file.

To check payment conservation, from the repository root:

```bash
cd examples/payment-escrow
java -cp "$TLA_TOOLS" tlc2.TLC -config PaymentEscrow.cfg PaymentEscrow.tla
```

To check the one-dimensional satellite separation model, start again from the repository root:

```bash
cd examples/satellite-separation
java -cp "$TLA_TOOLS" tlc2.TLC -config SatelliteSeparation.cfg SatelliteSeparation.tla
```

The satellite model uses bounded positions and unit steps, not orbital mechanics; the emergency stop models immediate logical halting, not physical braking. Other examples also abstract from network failures, concurrency timing, and implementation faults.

**Verification status:** GitHub upload and commits are confirmed. These new models have not been executed in TLC here; no model-checker PASS or state counts are claimed.

## Specification pattern

- `Init`: initial state
- `Next`: next-state relation composed of actions
- `Spec`: `Init /\\ [][Next]_vars`
- `TypeOK`: state-domain invariant
- Other invariants: protocol-specific requirements

A successful TLC run supports only the checked properties in the selected finite configuration. **Upload does not mean verification:** the examples have been committed, but TLC has not been executed as part of this update.

## Proposed extensions

Asynchronous leader-election messaging, failure-aware consensus, fairness and liveness properties, delayed emergency-stop response, multi-dimensional separation, and faulty variants with documented TLC counterexamples.

## References

- [TLA+ language and resources](https://lamport.azurewebsites.net/tla/tla.html)
- [Official TLA+ tools](https://github.com/tlaplus/tlaplus)
- [Learn TLA+](https://learntla.com/)

## License

MIT. See [LICENSE](LICENSE).
