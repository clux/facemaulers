#!/bin/bash
set -e

# reduce players vector in recaps, and count player occurrences found across all files
rg Players: -A 6 docs/recaps/ | rg "\- (\w*)" -r '$1' -o | sort | uniq -c | sort -hr
