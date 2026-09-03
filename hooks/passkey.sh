#!/usr/bin/env bash
set -euo pipefail

# you can put this into startup hook or other
# whatever do you want to put in(ofcourse hook)
# for my version is i make panel-toggle button to trigger
# so it will running whenever i needed.

# you have to create file .env manually
# then put your passkey on it
# it is on root of dir noctalia config
# build by yourself inside $HOME/.config
# is not $HOME/.local or you can replace
# wherever do you want to save it

# if this is does not work it might causes
# cannot find .env file or .env file is empty
# you can debug using
## {
##   echo \"$passkey\"
##   exit 0
## }

passkey_dir="${XDG_STATE_HOME:-$HOME/.config}/noctalia"
passkey_file="$passkey_dir/.env"

passkey=""
[[ -r "$passkey_file" ]] && passkey="$(<"$passkey_file")"

[[ -n "$passkey" ]] || exit 0

noctalia msg clipboard-copy "$passkey"
noctalia msg panel-toggle clipboard
