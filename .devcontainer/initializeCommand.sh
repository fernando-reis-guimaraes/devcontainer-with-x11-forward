#!/bin/bash
set -euo pipefail

# Set the correct display variable so devcontainer can forward X11
if [[ "$(uname)" == "Darwin" ]]; then
  echo "DISPLAY=host.docker.internal:0" > .devcontainer/.env
else
  echo "DISPLAY=${DISPLAY:-:0}" > .devcontainer/.env
fi
