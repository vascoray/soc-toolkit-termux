#!/bin/bash
echo "[+] Starting Log Watcher... Press Ctrl+C to stop"

tail -F ~/.bash_history 2>/dev/null | while read line
do
    if echo "$line" | grep -qi "nmap"; then
        echo "[!] SUSPICIOUS COMMAND DETECTED: $line"
        echo "$(date '+%Y-%m-%d %H:%M:%S'),SUSPICIOUS_CMD:$line,HIGH" >> report.csv
    
    elif echo "$line" | grep -qi "nc "; then
        echo "[!] SUSPICIOUS COMMAND DETECTED: $line"
        echo "$(date '+%Y-%m-%d %H:%M:%S'),SUSPICIOUS_CMD:$line,HIGH" >> report.csv
    
    elif echo "$line" | grep -qi "rm -rf"; then
        echo "[!] CRITICAL COMMAND DETECTED: $line"
        echo "$(date '+%Y-%m-%d %H:%M:%S'),CRITICAL_CMD:$line,CRITICAL" >> report.csv
    fi
done
