#!/bin/bash
# Port Scanner - Quick scan for local network
echo "[+] Port Scanner"
read -p "Enter IP to scan: " ip
echo "Scanning $ip..."
for port in 22 80 443 8080 4444; do
    nc -z -w1 $ip $port 2>/dev/null && echo "[OPEN] Port $port"
done
echo "[+] Scan complete"