#!/bin/bash

# List /dev/dri and print the result
DRI_LIST=$(ls /dev/dri 2>/dev/null)
echo "Contents of /dev/dri:"
echo "$DRI_LIST"

# Check if renderD128 exists in the listing
if echo "$DRI_LIST" | grep -q "renderD128"; then
    RENDER_GID=$(stat -c '%g' /dev/dri/renderD128)

    if [ -z "$RENDER_GID" ]; then
        echo "Failed to detect GID of /dev/dri/renderD128"
        exit 1
    fi

    echo "Detected GID: $RENDER_GID"
else
    echo "renderD128 not found in /dev/dri"
    exit 1
fi