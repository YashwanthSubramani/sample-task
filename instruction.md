# Milestone 1: Load Secure Configuration

The Flask Keybroker API currently loads configuration parameters (like webhook secrets) insecurely or ignores specified fallback settings.

### Objectives:
1. Locate the configuration parsing module inside `/app/src/config.py`.
2. Fix the loading sequence so it securely parses production values from environment variables, throwing a clean initialization error if critical fallback variables are missing.
3. Ensure the test suite passes successfully. All code modifications must happen inside absolute paths.