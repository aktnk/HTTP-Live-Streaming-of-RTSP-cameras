#!/bin/sh
set -e

TARGET_DIR="/hls"
# Set default values if not provided by environment variables
MAX_SIZE_MB=${MAX_SIZE_MB:-1024} # Default: 1024MB (1GB)
CHECK_INTERVAL_SEC=${CHECK_INTERVAL_SEC:-300} # Default: 300 seconds (5 minutes)

echo "Cleanup service started."
echo "Target directory: $TARGET_DIR"
echo "Max size: $MAX_SIZE_MB MB"
echo "Check interval: $CHECK_INTERVAL_SEC seconds"

while true; do
    # Check if the target directory exists
    if [ ! -d "$TARGET_DIR" ]; then
        echo "Directory $TARGET_DIR not found. Waiting..."
        sleep "$CHECK_INTERVAL_SEC"
        continue
    fi

    # Get current directory size in MB
    current_size_mb=$(du -sm "$TARGET_DIR" | cut -f1)
    echo "Current size: $current_size_mb MB"

    # Check if max size is exceeded
    if [ "$current_size_mb" -gt "$MAX_SIZE_MB" ]; then
        echo "Max size exceeded. Cleaning up old files..."
        # Delete oldest files until the size is below the limit
        while [ "$(du -sm \"$TARGET_DIR\" | cut -f1)" -gt "$MAX_SIZE_MB" ]; do
            # Find the oldest .mp4 file
            oldest_file=$(ls -t "$TARGET_DIR"/*.mp4 2>/dev/null | tail -n 1)

            if [ -n "$oldest_file" ]; then
                echo "Deleting oldest file: $oldest_file"
                rm -f "$oldest_file"
            else
                echo "No .mp4 files to delete. Breaking cleanup loop."
                break
            fi
        done
        echo "Cleanup finished."
    fi

    sleep "$CHECK_INTERVAL_SEC"
done
