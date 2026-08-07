#!/bin/bash
echo "[+] Creating Jira Ticket for SOC Alert"
ALERT="Failed login detected from 192.168.1.100 at $(date)"
echo "$ALERT" >> alerts.log
echo "[+] Ticket would be created: $ALERT"
echo "   In real SOC: This would POST to Jira API"
