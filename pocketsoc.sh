#!/bin/bash
clear
echo "====================================="
echo "  POCKET SOC MOBILE v1.4 👑"
echo "  Built by King Vasco"
echo "====================================="
echo "1. Run Logwatcher - Threat Detection"
echo "2. Run Portscanner - Network Recon"
echo "3. View Report.csv"
echo "8. Launch Web Dashboard"
echo "4. Exit"
echo "====================================="
read -p "Choose an option: " choice

if [ $choice -eq 1 ]; then
    echo "[+] Running Logwatcher..."
    python3 logwatcher.py
elif [ $choice -eq 2 ]; then
    echo "[+] Running Portscanner..."
    python3 portscanner.py
elif [ $choice -eq 3 ]; then
    cat report.csv
elif [ $choice -eq 8 ]; then
    echo "[+] Launching Web Dashboard on port 8080..."
    echo "Open http://localhost:8080 in Chrome"
    cd dashboard && python3 -m http.server 8080
elif [ $choice -eq 4 ]; then
    exit
fi
