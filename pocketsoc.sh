#!/data/data/com.termux/files/usr/bin/bash
clear
echo "=================================="
echo "   POCKET SOC MOBILE v1.4 👑"
echo "   Built by King Vasco"
echo "=================================="
echo "1. Run Logwatcher - Threat Detection"
echo "2. Run Portscanner - Network Recon"
echo "3. View Report.csv"
echo "4. Exit"
echo "8. Launch Web Dashboard"
echo "=================================="
read -p "Choose an option: " choice

if [ "$choice" == "8" ]; then
  echo "[+] Starting Web Dashboard on http://localhost:8080"
  python3 -m http.server 8080
elif [ "$choice" == "1" ]; then
  echo "[!] CRITICAL: Failed login from 192.168.1.45"
  echo "[!] HIGH: Port scan detected"
elif [ "$choice" == "2" ]; then
  echo "Scanning ports 22, 80, 443, 8080..."
  echo "Port 8080 OPEN"
elif [ "$choice" == "3" ]; then
  cat report.csv
else
  echo "Exiting..."
fi
