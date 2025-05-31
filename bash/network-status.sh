#!/bin/bash
# Note: This script requires 'ifconfig' to be installed.
# If 'ifconfig' is not available, you can use 'ip addr' as an alternative:
# ip addr | grep 'inet ' | grep -v '127.0.0.1'

# Displays active network interfaces and their IP addresses

echo "Fetching active network interfaces..."

# List all network interfaces with Ip addresses - IPv4 only
ifconfig | grep 'inet ' | grep -v '127.0.0.1' | while read -r line ; do
    ip=$(echo $line | awk '{print $2}')
    iface=$(echo $line | awk '{print $1}')
    echo "Interface: $iface, IP Address: $ip"
done

echo "Network check complete!"

# Exit with success status
exit 0

