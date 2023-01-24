#!/bin/bash
set -e

rg Players: -A 6 docs/recaps/ | rg "\- (\w*)" -r '$1' -o | sort | uniq -c | sort -hr
