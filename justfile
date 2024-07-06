default:
  @just --list --unsorted --color=always | rg -v "    default"
open := if os() == "macos" { "open" } else { "xdg-open" }

# Start a development server assuming virtualenv deps have been installed
serve:
  #!/usr/bin/env bash
  if [ -z "${VIRTUAL_ENV}" ]; then
    echo "Activate virtualenv first"
    echo "Please run:"
    echo "python3 -m venv venv && source/venv/bin/activate && pip install -r requirements.txt"
    echo "or, if you have already installed it:"
    echo "source venv/bin/activate"
    exit 1
  fi
  (sleep 2 && {{open}} http://127.0.0.1:8000/) &
  mkdocs serve

# generate player statistics
stats:
  #!/usr/bin/env sh
  rg Players: -A 6 docs/recaps/ | rg "\- (\w*)" -r '$1' -o | sort | uniq -c | sort -hr

# helper to try-upgrade everything in the pip environment
upgrade:
  #!/usr/bin/env bash
  rm -rf ./venv
  python3 -m venv venv
  source venv/bin/activate
  pip3 install mkdocs-material=="9.*"
  pip3 install mkdocs-roamlinks-plugin
  pip3 install mkdocs-exclude
  pip3 freeze > requirements.txt
