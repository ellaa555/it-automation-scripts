#!/bin/bash

# Updates macOS to the latest version using the `softwareupdate` command.

echo "Checking for macOS updates..."

# Get output of available updates
updates=$(softwareupdate -l 2>&1)

if echo "$updates" | grep -q "No new software available."; then
    echo "Your macOS is already up to date."
else
    echo "Available updates:"
    echo "$updates"

    # Install all available updates
    echo "Installing updates..."
    softwareupdate -ia --verbose

    if [ $? -eq 0 ]; then
        echo "Updates installed successfully. Please restart your Mac to complete the update process."
    else
        echo "An error occurred while installing updates."
    fi
fi

exit 0