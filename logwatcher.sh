#!/bin/bash
echo "[+] Starting POCKET MINI SOC v1.2 - AUTO TICKETING"
echo "Watching for suspicious activity... Ctrl+C to stop"

while true; do
    if [ -f fake_attacks.log ]; then
        if grep -qi "failed\|attack\|brute" fake_attacks.log; then
            echo "[ALERT] Threat detected! Creating ticket..."
            ~/soc-toolkit-termux/create_jira.sh
            > fake_attacks.log  # clear it so it doesn't spam
        fi
    fi
    echo "[+] No critical alerts found - $(date)"
    sleep 5
done
