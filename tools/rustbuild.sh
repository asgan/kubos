#!/bin/bash

set -e

# Link in yotta modules for those rust
# modules that need them
./tools/kubos_link.py

# Quick compile check
cargo kubos -c check

# Run all unit tests
RUST_BACKTRACE=1 cargo kubos -c test -- -- --test-threads=1
