#!/bin/bash
# Universal VPN status check for Waybar
# Checks if point-to-point interface has an IP address

interface=$(ip link show | grep POINTOPOINT | awk '{print $2}' | sed 's/://' | head -1)
if [ -n "$interface" ] && ip addr show $interface | grep -q inet; then
    echo "VPN"
else
    echo ""
fi