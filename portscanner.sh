#!/bin/bash
echo "[+] Port Scanner - Network Recon"
read -p "Enter IP to scan: " ip
echo "Scanning $ip..."

for port in 22 80 443 8080 4444; do
    if nc -z -w1 $ip $port 2>/dev/null; then
        echo "[+] [$port] OPEN"
        echo "$(date '+%Y-%m-%d %H:%M:%S'),PORT_SCAN:$ip:$port,HIGH" >> report.csv
    else
        echo "[-] [$port] CLOSED"
    fi
done
echo "[+] Scan complete. Data saved to report.csv"
