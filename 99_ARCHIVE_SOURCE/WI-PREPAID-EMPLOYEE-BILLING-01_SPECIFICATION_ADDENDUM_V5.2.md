# F&B SMART V5.2 — PREPAID EMPLOYEE BILLING SPECIFICATION ADDENDUM

## 0. Document Control

- **Document ID:** WI-PREPAID-EMPLOYEE-BILLING-01
- **Version:** DRAFT V0.1
- **Status:** DRAFT — PENDING PO REVIEW / NOT APPROVED FOR IMPLEMENTATION
- **Target:** F&B SMART V5.2
- **Parent baseline:** F&B SMART V5.1 Clean Rebuild Master Specification and four V5.1 technical contracts
- **Scope:** Store prepaid wallet and daily billing for eligible employee/kitchen connections
- **Authority boundary:** This draft records the requirements already stated in project discussion. It does not replace the V5.1 contracts, does not claim PO approval, and does not authorize application-code changes.

## 1. Purpose

Define the product and technical acceptance boundary for prepaid billing of eligible employee/kitchen connections. The system must prevent uncollected usage, duplicate charging, negative wallet balances, cross-store data access, and unverifiable wallet movements.

## 2. Requirements Captured from PO Direction

1. Daily charge: **3,000 VND per active eligible employee/kitchen connection per service day**.
2. Time basis: Vietnam local time, **UTC+07:00**.
3. Store owners are exempt from this employee/kitchen connection charge.
4. Wallet balance must not become negative.
5. When the available balance cannot cover required billing, eligible employee/kitchen connections are locked according to the approved lifecycle rules.
6. Top-up codes are one-time use; successful redemption must not be replayable.
7. Wallet balance changes and ledger records must be atomic and auditable.
8. Trial eligibility threshold: **100 successful commercial orders, excluding the 5 test orders**, as recorded in the PO Decision Register.
9. Low-wallet warning is required before connection lock; its exact trigger and delivery behavior remain unresolved as described in Section 7.

These are captured requirements, not proof that implementation exists or that runtime billing has been verified.

## 3. Domain Objects — Draft Boundary

The final schema must define, at minimum:

- Store wallet and its available balance.
- Append-only wallet ledger with transaction type, amount, timestamp, source/reference, idempotency key, and resulting balance or reconciliation reference.
- Daily billing record per eligible connection and service day.
- Top-up code with unique identity, value, lifecycle, and redemption reference.
- Connection billing/lock status and the reason for any lock.
- Trial eligibility state and the authoritative count of qualifying commercial orders.

Exact collection/document paths, required fields, indexes, security rules, retention, and migration strategy must be reconciled with `DATABASE_SCHEMA_V0.1.md` before implementation. This draft does not prescribe an unverified Firestore path.

## 4. Financial and Security Invariants

- All monetary values are integer VND; no floating-point money arithmetic.
- A service-day charge is applied at most once per eligible connection per service day.
- Retries must be idempotent; duplicate scheduled jobs, repeated requests, or replayed top-up codes must not duplicate financial effects.
- Wallet debit and ledger append must be atomic or use a documented recoverable transaction design that prevents balance/ledger divergence.
- Insufficient funds must never produce a negative wallet balance.
- Top-up code redemption is one-time and concurrency-safe.
- Store/tenant authorization must be checked server-side; one store must not read or mutate another store's wallet, ledger, connections, or codes.
- Owner exemption must be enforced by authoritative membership/connection classification, not a client-provided flag.
- Financial mutations require server authority and auditable provenance.
- Connection locking must not erase billing history and must be recoverable after a valid top-up according to the approved state machine.
- A qualifying commercial order must be counted only once and must exclude test orders under a verifiable rule. The exact authoritative order predicate and exclusion mechanism must be specified before implementation.

## 5. Draft Lifecycle Boundaries

The detailed state machine remains pending contract reconciliation. At minimum, the design must define:

- Wallet: usable, insufficient/blocked, topped-up/reconciled states as applicable.
- Connection: eligible/active, warning state if approved, locked for insufficient wallet, and restored after successful funding.
- Top-up code: available, redeemed, expired/revoked if expiry/revocation is supported.
- Daily billing: pending, charged, skipped with reason, or failed/retryable; each service day must have a single authoritative terminal result.

Do not implement these labels as canonical enum values until the state machine and schema are reconciled and approved.

## 6. Required Acceptance Tests

1. Charge one eligible connection exactly 3,000 VND for one service day.
2. Owner connection is not charged.
3. Re-running a billing job does not double-charge.
4. Two concurrent charge attempts cannot make the wallet negative.
5. Insufficient funds cause the approved warning/lock behavior without negative balance.
6. Successful top-up updates wallet and ledger consistently.
7. A top-up code cannot be redeemed twice, including concurrent redemption attempts.
8. Replaying the same request/idempotency key produces no second financial effect.
9. Store A cannot read or mutate Store B's wallet, ledger, connection, or top-up code.
10. Vietnam service-day boundary is correct around UTC+07:00 midnight.
11. The 100-order trial threshold counts successful commercial orders and excludes the 5 test orders exactly once.
12. Warning duplicate suppression and delivery failure behavior match the eventual PO-approved parameters.
13. Billing/ledger state can be reconciled after a simulated interrupted transaction or retry.
14. Lock and restore operations preserve audit history and do not modify unrelated orders or store state.

## 7. PO Decision 2 — Low-Wallet Warning

**PO-confirmed trigger:** Warn **3 days before the wallet balance is projected to become insufficient** to cover the daily charges for eligible employee/kitchen connections. The warning must arrive before those connections are locked due to insufficient funds.

For forecasting, use the current eligible billable connections and the approved daily rate of 3,000 VND per connection per Vietnam service day. The implementation contract must define the calculation precisely, including changes in eligible connection count, so the warning is reliable and does not create duplicate charges.

**Already decided:**
- Warning is required before connection lock.
- Warning lead time is 3 days before projected insufficient balance.

**Still OPEN / PENDING PO DECISION:**
- Delivery channel(s).
- Frequency / schedule for repeated reminders within the 3-day window.
- Duplicate suppression and re-notification behavior.

Do not reopen the 3-day lead time as an unresolved choice. Do not invent the remaining delivery and repeat-notification parameters. Implementation must wait until the addendum and remaining parameters are approved.

## 8. Technical Decisions Required Before Implementation

The design review must resolve and record:

- Canonical Firestore collection/document paths and indexes.
- Definition of an active billable connection and the authoritative source for owner exemption.
- Service-day charging schedule, retry policy, and idempotency-key format.
- Atomic wallet/ledger transaction design and recovery/reconciliation procedure.
- Top-up code creation, value limits, expiry policy, authorization, and audit trail.
- Authoritative definition of a successful commercial order and how the 5 test orders are excluded.
- Lock/unlock authorization, restoration conditions, and behavior for existing sessions.
- Security rules and server-side authorization tests.
- Monitoring, alerts, audit retention, and query-cost limits.

These are specification gaps, not permission to invent implementation choices.

## 9. Gate and Release Conditions

This addendum is not implementation-ready until:

1. PO reviews and approves the addendum and its unresolved product choices.
2. Decision 2 is recorded with exact parameters.
3. Schema, state machine, security, idempotency, and query-cost contracts are reconciled.
4. Acceptance criteria and test evidence are agreed.
5. The canonical Master Specification Gate status is updated through the repository's governance procedure.

**Current verdict:** DRAFT / NOT PO-VERIFIED / NO APPLICATION-CODE AUTHORIZATION.
