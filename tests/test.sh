#!/bin/bash

# Dynamically navigate to the project root directory relative to this script
cd "$(dirname "$0")/.."

# Point directly to the unified tests/test_outputs.py file
pytest tests/test_outputs.py -v --tb=short > /logs/verifier/pytest_output.log 2>&1

if [ $? -eq 0 ]
then
    echo "1.0" > /logs/verifier/reward.txt
else
    echo "0.0" > /logs/verifier/reward.txt
fi