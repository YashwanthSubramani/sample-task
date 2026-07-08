# Task Description: Repair Flask Keybroker Security Configuration

## Problem Statement
You are dropping into an offline, network-blocked production microservice architecture that implements a Flask Keybroker application backed by a PostgreSQL database. The application is responsible for distributing cryptographic keys and verifying webhook incoming payloads using JSON Web Tokens (JWTs)[cite: 1]. 

The current configuration and codebase contain critical security bugs that leave the system open to authorization spoofing and configuration fallbacks[cite: 1]. Your objective is to patch the codebase, secure the application initialization sequence, and implement transactional metadata key rotation workflows[cite: 1].

## Core Implementation Requirements
1. **Secure Configuration Initialization:**
   - Update the configuration entry module to parse production properties exclusively from the runtime environment.
   - If the critical string variable `WEBHOOK_SECRET` is completely missing or unpopulated, throw an explicit `ValueError` exception immediately during startup[cite: 1]. Silently ignoring the error or falling back to unsafe `None` defaults is completely prohibited[cite: 1].

2. **Strict JWT Claim Enforcement:**
   - Modify the authentication middleware layer to use cryptographic token decoding.
   - The decoding procedure must strictly validate incoming signatures and actively verify standard claims: Issuer (`iss`), Audience (`aud`), and Expiration Time (`exp`). 
   - Any token with spoofed issuers, wrong audiences, or expired timestamps must be rejected immediately, returning `False`.

3. **PostgreSQL Key Rotation Utility:**
   - Implement the operational utility layer utilizing `psycopg2` to execute secure data key rotations.
   - The workflow must query target credentials, cleanly re-encrypt active webhook secrets, and commit updated key rotation metadata fields inside the PostgreSQL persistence layer.

## Acceptance Criteria
- Running `bash solution/solve.sh` must cleanly apply your patches to the environment without syntax or architectural compilation failures[cite: 1].
- Running `bash tests/test.sh` must execute the localized verification test suites completely error-free[cite: 1].
- Upon full success, the test runner must output an absolute, precise score of `1.0` directly to `/logs/verifier/reward.txt`[cite: 1]. If any check fails, the written score must be exactly `0.0`[cite: 1].