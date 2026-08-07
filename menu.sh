#!/bin/bash
while true; do
clear
echo "====================================="
echo " POCKET MINI SOC v1.3 - BY KING VASCO"
echo "====================================="
echo "[1] Start Log Monitor"
echo "[2] Run Port Scan"
echo "[3] View Alerts"
echo "[4] Export Report"
echo "[5] Exit"
echo "====================================="
read -p "Select option: " choice

case $choice in
    1)
        ~/soc-toolkit-termux/logwatcher.sh
        ;;
    2)
        echo "[+] Running Port Scan... install nmap first: pkg install nmap"
        read -p "Enter IP to scan: " ip
        nmap -F $ip
        read -p "Press Enter to continue"
        ;;
    3)
        echo "[+] Current Alerts:"
        cat ~/soc-toolkit-termux/alerts.log 2>/dev/null || echo "No alerts yet"
        read -p "Press Enter to continue"
        ;;
    4)
        echo "[+] Exporting report to report.csv"
        echo "Time,Alert" > report.csv
        cat alerts.log | sed 's/\[ALERT\] Threat detected at /,/g' >> report.csv
        echo "[+] Report saved: ~/soc-toolkit-termux/report.csv"
        read -p "Press Enter to continue"
        ;;
    5)
        echo "Exiting... Stay secure King Vasco"
        exit 0
        ;;
    *)
        echo "Invalid option"
        sleep 1
        ;;
esac
done
