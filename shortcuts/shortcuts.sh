#!/usr/bin/env bash
set -euo pipefail

output=$(driftwm msg state | grep '^outputs' | awk '{print $2}')

[[ "$output" != 1 ]] || {
    noctalia msg panel-toggle launcher
    exit 0
}

panel=$(noctalia msg status | grep '"activePanelId"' | awk '{print $2}' | tr -d ',"')

[[ "$panel" == null ]] || {
    noctalia msg panel-toggle launcher
    exit 0
}

fuzzel &
fuzzel_pid=$!

noctalia msg panel-toggle launcher

kill "$fuzzel_pid" 2>/dev/null || true

exit 0
