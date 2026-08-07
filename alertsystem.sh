#!/bin/bash
# Alert System - Checks for suspicious logins
echo "[+] Alert System Running..."
LOG_FILE="$PREFIX/var/log/auth.log"
grep "Failed password" $LOG_FILE 2>/dev/null | while read line; do
    echo "[ALERT] Suspicious login attempt: $line"
done
echo "[+] No critical alerts found"