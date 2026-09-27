#!/bin/bash
DB_FILE="backend/database.sqlite"

cleanup() {
    echo "Codespace stopping! Backing up database..."
    if git status --porcelain | grep -q "database.sqlite"; then
        git add "$DB_FILE"
        git commit -m "chore: auto-backup sqlite db on codespace stop [skip ci]"
        git push origin master
    fi
    exit 0
}

trap cleanup SIGTERM SIGINT

echo "SQLite Watchdog is running..."
while true; do sleep 3600; done
