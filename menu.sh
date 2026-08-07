#!/bin/bash
clear
echo "====================================="
echo "    POCKET MINI SOC v1.3 👑"
echo "    Built by King Vasco"
echo "====================================="
echo "1. Run Logwatcher - Threat Detection"
echo "2. Run Portscanner - Network Recon"
echo "3. View Report.csv"
echo "4. Exit"
echo "====================================="
read -p "Choose an option: " choice

case $choice in
    1) ./logwatcher.sh ;;
    2) ./portscanner.sh ;;
    3) cat report.csv ;;
    4) exit ;;
    *) echo "Invalid option" ;;
esac

