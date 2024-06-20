#!/bin/bash
set -x

LOCK_NAME=copy
SOURCE=$1
TARGET=$2
EXCLUDE=$3

echo "($LOCK_NAME) Copying $SOURCE to $TARGET with exclude $EXCLUDE"

mkdir -p /locks

exec {lock_fd}>/locks/$LOCK_NAME || exit 1

flock -n "$lock_fd" || { echo "ERROR: flock() failed." >&2; exit 1; }

rclone copy "$SOURCE" "$TARGET" --exclude="$EXCLUDE" --log-level INFO

flock -u "$lock_fd"

exec {lock_fd}>&-