#!/bin/bash

LOCK_NAME=$1
SOURCE=$2
TARGET=$3
EXCLUDE=$4

echo "($LOCK_NAME) Copying $SOURCE to $TARGET with exclude $EXCLUDE"

mkdir -p /locks

exec {lock_fd}>/locks/$LOCK_NAME || exit 1

flock -n "$lock_fd" || { echo "ERROR: flock() failed." >&2; exit 1; }

rclone copy "$SOURCE" "$TARGET" --exclude="$EXCLUDE"

flock -u "$lock_fd"

exec {lock_fd}>&-