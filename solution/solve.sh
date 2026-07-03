#!/bin/bash
# Proof of completion: Build a secure configuration module automatically
mkdir -p /app/src

cat << 'EOF' > /app/src/config.py
import os

def reload_config():
    if "WEBHOOK_SECRET" not in os.environ:
        raise ValueError("Critical configuration key 'WEBHOOK_SECRET' is completely missing!")

def get_webhook_secret():
    reload_config()
    return os.environ.get("WEBHOOK_SECRET")
EOF