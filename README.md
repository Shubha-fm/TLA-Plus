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
| 48 | [railway-platform](examples/railway-platform) | `RailwayPlatform` | Track platform occupancy and train accounting | `TypeOK`, `PlatformCapacity`, `TrainAccounting` |
| 49 | [transaction-commit](examples/transaction-commit) | `TransactionCommit` | Prepare, commit, abort, and reset a bounded transaction | `TypeOK`, `PreparedHasPending` |
| 50 | [dual-sensor-gate](examples/dual-sensor-gate) | `DualSensorGate` | Open only if both sensor conditions hold | `TypeOK`, `OnlyOpenOnAgreement` |
| 51 | [bounded-event-log](examples/bounded-event-log) | `BoundedEventLog` | Append or clear events in a bounded log | `TypeOK`, `WithinCapacity` |
| 52 | [drone-geofence](examples/drone-geofence) | `DroneGeofence` | Move a drone within a one-dimensional boundary | `TypeOK`, `InsideGeofence` |
| 53 | [two-factor-auth](examples/two-factor-auth) | `TwoFactorAuth` | Require both password and one-time-code checks before granting access | `TypeOK`, `AccessRequiresBoth` |
| 54 | [water-tank](examples/water-tank) | `WaterTank` | Control a bounded tank with an automatic full-level valve closure | `TypeOK`, `NoOverflow`, `ClosedAtFull` |
| 55 | [resource-allocation](examples/resource-allocation) | `ResourceAllocation` | Allocate two exclusive resources to clients | `TypeOK`, `OneResourcePerClient` |
| 56 | [firmware-update](examples/firmware-update) | `FirmwareUpdate` | Download, verify, install, or cancel a firmware candidate | `TypeOK`, `NoDowngrade`, `PendingIsNewer` |
| 57 | [train-signal](examples/train-signal) | `TrainSignal` | Keep an occupied rail block protected by a red signal | `TypeOK`, `OccupiedImpliesRed` |
| 58 | [charging-station](examples/charging-station) | `ChargingStation` | Allocate a limited number of charging ports to vehicles | `TypeOK`, `PortBound` |
| 59 | [railway-switch](examples/railway-switch) | `RailwaySwitch` | Select, lock, and unlock a route for one passing train | `TypeOK`, `TrainRequiresLock` |
| 60 | [feature-rollout](examples/feature-rollout) | `FeatureRollout` | Enable staged releases and disable on detected failure | `TypeOK`, `NoEnableWhenUnhealthy` |
| 61 | [warehouse-robot](examples/warehouse-robot) | `WarehouseRobot` | Move and carry a single item along a bounded aisle | `TypeOK` |
| 62 | [medical-triage-queue](examples/medical-triage-queue) | `MedicalTriageQueue` | Account for patients through waiting, treating, and completed states | `TypeOK`, `OneAtATime`, `NoLostPatients` |
| 63 | [spacecraft-command-gate](examples/spacecraft-command-gate) | `SpacecraftCommandGate` | Release a command only after a safe assessment | `TypeOK`, `SafeRelease`, `NoUnassessedSafe` |
| 64 | [railway-route-reservation](examples/railway-route-reservation) | `RailwayRouteReservation` | Reserve, occupy, and release a single rail route | `TypeOK`, `EntryRequiresReservation` |
| 65 | [approval-workflow](examples/approval-workflow) | `ApprovalWorkflow` | Require two independent approvals for release | `TypeOK`, `OnlyFullyApproved` |
| 66 | [checkpoint-recovery](examples/checkpoint-recovery) | `CheckpointRecovery` | Save a checkpoint and recover after an abstract failure | `TypeOK`, `CheckpointNotAhead` |
| 67 | [packet-acknowledgement](examples/packet-acknowledgement) | `PacketAcknowledgement` | Model sending, retries, acknowledgements, and giving up | `TypeOK`, `FailureAtLimit` |
| 68 | [object-isolation](examples/object-isolation) | `ObjectIsolation` | Track assessments and revisions for two independent objects | `TypeOK`, `AssessmentNotFuture` |
| 69 | [satellite-maneuver-approval](examples/satellite-maneuver-approval) | `SatelliteManeuverApproval` | Require a fresh, safe assessment before releasing a maneuver | `TypeOK`, `FreshSafeRelease` |
| 70 | [dependency-scheduler](examples/dependency-scheduler) | `DependencyScheduler` | Enforce prepare-before-build and build-before-test | `TypeOK`, `BuildRequiresPrepare`, `TestRequiresBuild` |
| 71 | [elevator-emergency-recall](examples/elevator-emergency-recall) | `ElevatorEmergencyRecall` | Restrict emergency door opening to the ground floor | `TypeOK`, `EmergencyDoorGround` |
| 72 | [bounded-message-dedup](examples/bounded-message-dedup) | `BoundedMessageDedup` | Record received messages and apply each identity at most once | `TypeOK`, `OnlyReceivedApplied` |
| 73 | [shared-corridor](examples/shared-corridor) | `SharedCorridor` | Coordinate two robots accessing one shared corridor | `TypeOK`, `ExclusiveCorridor` |
| 74 | [sensor-majority-vote](examples/sensor-majority-vote) | `SensorMajorityVote` | Resolve a three-sensor vote by a two-sensor majority | `TypeOK`, `DisjointReports`, `MajorityJustified` |
| 75 | [satellite-contact-window](examples/satellite-contact-window) | `SatelliteContactWindow` | Track bounded packet transfer during contact windows | `TypeOK`, `PacketConservation` |
| 76 | [permission-revocation](examples/permission-revocation) | `PermissionRevocation` | Revoke authorization and invalidate active sessions | `TypeOK`, `AuthorizedSession` |
| 77 | [traffic-incident-control](examples/traffic-incident-control) | `TrafficIncidentControl` | Close an incident lane and control its signal | `TypeOK`, `IncidentBlocksTraffic`, `GreenOnlyWhenOpen` |
| 78 | [spacecraft-safe-mode](examples/spacecraft-safe-mode) | `SpacecraftSafeMode` | Operate a bounded-energy spacecraft with a protective safe mode | `TypeOK`, `PayloadOffInSafeMode` |
| 79 | [quorum-configuration](examples/quorum-configuration) | `QuorumConfiguration` | Commit a configuration once two of three nodes acknowledge | `TypeOK`, `CommitHasQuorum` |
| 80 | [robot-battery-return](examples/robot-battery-return) | `RobotBatteryReturn` | Track outbound travel and retained battery for the journey home | `TypeOK`, `EnoughEnergyToReturn` |
| 81 | [atomic-file-replace](examples/atomic-file-replace) | `AtomicFileReplace` | Stage, commit, or abort a bounded file version | `TypeOK`, `StagedNotOlder` |
| 82 | [bounded-worker-pool](examples/bounded-worker-pool) | `BoundedWorkerPool` | Assign three jobs to a capacity-limited worker pool | `TypeOK`, `PoolCapacity`, `JobPartition` |
| 83 | [tic-tac-toe](examples/tic-tac-toe) | `TicTacToe` | Two-player marks on a 3-by-3 board; moves stop after a win | `TypeOK`, `NoDoubleWinner` |
| 84 | [nim-game](examples/nim-game) | `NimGame` | Remove one or two stones per turn and assign the winner | `TypeOK`, `WinnerOnlyAtZero` |
| 85 | [maze-escape](examples/maze-escape) | `MazeEscape` | Traverse bounded rooms, avoid a wall, and reach the exit | `TypeOK`, `AvoidWalls`, `EscapeAtExit` |
| 86 | [rock-paper-scissors](examples/rock-paper-scissors) | `RockPaperScissors` | Choose moves and reveal a rule-consistent result | `TypeOK`, `ResultConsistent` |
| 87 | [treasure-hunt](examples/treasure-hunt) | `TreasureHunt` | Collect a key, pass a gate, and reach treasure | `TypeOK`, `KeyBeforeTreasure`, `TreasureAtGoal` |
| 88 | [monty-hall-game](examples/monty-hall-game) | `MontyHallGame` | Choose a prize door, reveal a goat door, and stay or switch | `TypeOK`, `HostNeverShowsPrize`, `HostNeverShowsChoice`, `ValidFinalChoice` |
| 89 | [river-crossing-puzzle](examples/river-crossing-puzzle) | `RiverCrossingPuzzle` | Transport a wolf, goat, and cabbage without unsafe unattended pairs | `TypeOK`, `NeverLeavePreyUnprotected`, `CompletionMeansAllAcross` |
| 90 | [connect-three-game](examples/connect-three-game) | `ConnectThreeGame` | Drop alternating marks into a 3-by-3 gravity board | `TypeOK`, `NoTwoWinners`, `Gravity` |
| 91 | [dice-race-game](examples/dice-race-game) | `DiceRaceGame` | Alternate bounded dice steps toward a finish line | `TypeOK`, `WinnerReachedGoal` |
| 92 | [tower-of-hanoi](examples/tower-of-hanoi) | `TowerOfHanoi` | Move three ordered discs between pegs in up to seven moves | `TypeOK`, `MovedWithinBudget` |

**Model scope:** The producer-consumer example abstracts away item identities and process interleavings. The token-ring example stores only the current token holder. The queue example uses identical `"job"` items. The bank-transfer example assumes atomic transfers. The two-phase commit example models coordinator decision logic, not networking, message loss, crashes, or recovery. The elevator example checks bounded floors and door states, and allows motion only with the door closed. The retry example abstracts away elapsed time. The dining philosophers model acquires both forks atomically and does not model starvation or actual fork-by-fork locking. The leader-election model selects the highest active identifier atomically and does not implement an election message protocol. The railway crossing is a single-train abstraction with no sensor delays. The readers-writers model does not guarantee fairness. The message channel omits message loss and delivery failures. The distributed lock assumes atomic acquire and release without network failures or starvation guarantees. The cache-invalidation model uses a single source version and one cache. Sensor readings update their alarm atomically. The intersection controller omits timing and pedestrian signals. The parking lot tracks three named cars and a bounded capacity. The rate limiter treats windows as nondeterministic resets without wall-clock time. The scheduler runs at most one job and does not address starvation. The access-control model revokes an active session immediately. The recovery model assumes atomic backup and recovery, with no partial writes. The handshake uses reliable atomic messages with no timeouts. Inventory operations are unit-sized and atomic. Battery charging is discrete and omits thermal behavior. Replica synchronization uses monotonic versions without network loss or conflicts. The pedestrian model omits amber phases and timing constraints. The thermostat model uses discrete temperature steps and has no timed environment. Quorum approval assumes one vote per named voter and no distributed messages. The bounded pipeline has one processing slot and no job identities. File locking models shared readers and a single writer, but omits fairness and file contents. Deployment rollback treats testing, promotion, and rollback as atomic actions and does not model partial deployment. The circuit breaker models discrete failure counts and recovery probes without real service calls. Rover obstacle detection and braking are atomic, so sensor latency is not represented. Lease time advances in abstract ticks without clock drift. The watchdog models heartbeat resets but not message loss. Round-robin scheduling assumes one atomic step per turn, with no task execution time or fairness proof. Payment escrow assumes atomic financial transfers. API idempotency assumes a durable processed-ID set and counts effects rather than executing them. Emergency stop is an atomic logical latch without actuator delay. Broadcast models one publication and no delivery loss. Satellite separation uses one-dimensional positions and discrete unit moves, not orbital dynamics or continuous collision checking. The railway platform is a one-track, single-platform abstraction. Transaction commitment is atomic, without crash recovery or distributed participants. Sensor readings and gate decisions are updated together, with no sensor latency. The event log omits durable storage and concurrent writers. The drone model is one-dimensional, with no weather, dynamics, or GPS uncertainty. The two-factor login model assumes trusted successful checks and omits credential expiry. The water tank uses discrete fill and drain steps, without sensor faults. Resource allocation is atomic and does not model queues or starvation. Firmware verification is an abstract step without cryptographic checks or power failures. The train-signal model covers one railway block with atomic train entry and exit, not train braking or signaling delays. The charging station models atomic port allocation rather than physical electrical charging. The railway switch assumes instantaneous route locking and train passage without interlocking sensor faults. Feature rollout uses a discrete stage counter and atomic failure detection. Warehouse motion is one-dimensional without collisions or energy costs. Medical triage models patient accounting and single-patient treatment, not clinical priority or decisions. The spacecraft command gate represents a Boolean assessment without assessing its accuracy or freshness over real time. Railway route reservation abstracts away points, track geometry and multiple blocks. The approval workflow uses atomic decisions, not a real approval system. Checkpoint recovery models saved integer progress but not file integrity. Packet acknowledgements omit network latency and packet identities. The object-isolation example models only two objects and version-linked assessments. The satellite release model treats assessment outcomes as trusted Boolean inputs and does not model orbital dynamics. The dependency scheduler has three tasks and no parallel execution times. The elevator recalls to floor zero through abstract motion, without modeling braking or sensor failures. Message deduplication uses durable sets and no crash or message-loss behavior. The shared-corridor example assumes atomic robot entry and exit. The three-sensor voting model does not account for correlated sensor failures. Satellite contact windows represent logical open/close events rather than orbital visibility calculations or bandwidth limits. Permission revocation invalidates sessions atomically without distributed cache propagation. Traffic incidents trigger immediate lane closure and omit human reaction time and traffic flow. Spacecraft safe mode models immediate payload shutdown and idealized charging. The configuration example counts acknowledgements without modeling network partitions or leader terms. Robot motion is one-dimensional and each step consumes one unit of energy. Atomic file replacement omits disk failures and persistence semantics. The worker pool uses atomic starts and completions and does not check starvation. The five game examples model finite rule systems without rendering, player input devices, game AI, or networking. These choices deliberately keep the teaching models small.

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

## Game and puzzle TLA+ specifications (examples 83–92)

Ten examples now explore small, finite-state games and puzzles. Examples 83–87 include Tic-Tac-Toe, Nim, Maze Escape, Rock-Paper-Scissors, and Treasure Hunt. The newest additions are:

| Example | Model | Checked safety rules |
|---|---|---|
| 88 | Monty Hall | Host cannot reveal the prize or the originally chosen door |
| 89 | River Crossing | Wolf and goat, or goat and cabbage, cannot be left together without the farmer |
| 90 | Connect Three | Marks must obey gravity and both players cannot win simultaneously |
| 91 | Dice Race | A declared winner must have reached the goal |
| 92 | Tower of Hanoi | Moves take a top disc to a peg without a smaller disc |

Each folder contains a TLA+ specification (`.tla`) and a TLC configuration (`.cfg`).

Run Monty Hall from the repository root:

```bash
cd examples/monty-hall-game
java -cp "$TLA_TOOLS" tlc2.TLC -config MontyHallGame.cfg MontyHallGame.tla
```

Run the River Crossing puzzle separately, again from the repository root:

```bash
cd examples/river-crossing-puzzle
java -cp "$TLA_TOOLS" tlc2.TLC -config RiverCrossingPuzzle.cfg RiverCrossingPuzzle.tla
```

The examples model rules, not graphical user interfaces or playable games. Monty Hall explores possible prize placements but does not estimate probability distributions; Dice Race models outcomes 1 and 2 rather than a six-sided die; Tower of Hanoi limits moves to seven and its invariants do not independently prove puzzle completion. All examples rely on finite-state abstractions.

**Verification status:** GitHub uploads succeeded. TLC has not been executed for examples 88–92 in this update. Report a TLC PASS only after executing the corresponding configurations and inspecting the results.

## Specification pattern

- `Init`: initial state
- `Next`: next-state relation composed of actions
- `Spec`: `Init /\\ [][Next]_vars`
- `TypeOK`: state-domain invariant
- Other invariants: protocol-specific requirements

A successful TLC run supports only the checked properties in the selected finite configuration. **Upload does not mean verification:** the examples have been committed, but TLC has not been executed as part of this update.

## Proposed extensions

Automated TLC checks with recorded results, asynchronous leader election, failure-aware consensus, fairness and liveness properties, sensor fault injection, and multidimensional collision safety.

## References

- [TLA+ language and resources](https://lamport.azurewebsites.net/tla/tla.html)
- [Official TLA+ tools](https://github.com/tlaplus/tlaplus)
- [Learn TLA+](https://learntla.com/)

## License

MIT. See [LICENSE](LICENSE).
