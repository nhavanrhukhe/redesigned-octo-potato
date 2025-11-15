#!/bin/bash

RENDER_GID=$(stat -c '%g' /dev/dri/renderD128)

if [ -z "$RENDER_GID" ]; then
	echo "Failed to detect GID of /dev/dri/renderD128"
	exit 1
fi

echo "$RENDER_GID"
