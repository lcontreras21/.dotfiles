#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

grep=""
dry_run="0"

# Check args if this is a dry-run and if there are any filters to limit packages by
while [[ $# -gt 0 ]]; do
    echo "ARG: \"$1\""
    if [[ "$1" == "--dry" ]]; then
        dry_run="1"
    else
        grep="$1"
    fi
    shift
done

log() {
    if [[ $dry_run == "1" ]]; then
        echo "[DRY_RUN]: $1"
    else
        echo "$1"
    fi
}

log "RUN: env: $env -- grep: $grep"

install_dirs=`find $script_dir/installs -mindepth 1 -maxdepth 1 -executable`

for s in $install_dirs; do
    if echo "$s" | grep -vq "$grep"; then
        log "grep \"$grep\" filtered out $s"
        continue
    fi

    log "running script: $s"

    if [[ $dry_run == "0" ]]; then
        $s
    fi
done

log "Finished Install"
