#!/bin/bash
set -e

players=( Guy Florent April Jay Richard Svein Verity Rhys Paul Shaun Spike James )
for p in "${players[@]}"; do
    echo "$(rg Players: -A 6 docs/recaps/ | grep -E "\- $p" | sort -n | wc -l) $p"
done | sort -r -n
