#!/usr/bin/env bash
set -euo pipefail

panel_id="${1:-panel-toggle launcher}"
output=$(driftwm msg state | grep '^outputs' | awk '{print $2}')

[[ "$output" != 1 ]] || {
    noctalia msg "$panel_id"
    exit 0
}

panel=$(noctalia msg status | grep '"activePanelId"' | awk '{print $2}' | tr -d ',"')

[[ "$panel" == null ]] || {
    noctalia msg "$panel_id"
    exit 0
}

fuzzel &
fuzzel_pid=$!

noctalia msg "$panel_id"

kill "$fuzzel_pid" 2>/dev/null || true

