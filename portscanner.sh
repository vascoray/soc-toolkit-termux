#!/bin/bash
LOGFILE="report.csv"
echo "Timestamp,Event,Severity" > $LOGFILE

echo "[+] Starting Log Watcher..."
echo "Press Ctrl+C to stop"
echo ""

tail -f /data/data/com.termux/files/usr/var/log/syslog 2>/dev/null | while read line
do
    if echo "$line" | grep -qi "fail\|error\|denied\|attack"; then
        timestamp=$(date)
        echo "[$timestamp] ALERT: $line"
        echo "$timestamp,Potential Threat,High" >> $LOGFILE
    else
        echo "$line"
    fi
done#!/bin/bash
# Port Scanner - Quick scan for local network
echo "[+] Port Scanner"
read -p "Enter IP to scan: " ip
echo "Scanning $ip..."
for port in 22 80 443 8080 4444; do
    nc -z -w1 $ip $port 2>/dev/null && echo "[OPEN] Port $port"
done
echo "[+] Scan complete"
