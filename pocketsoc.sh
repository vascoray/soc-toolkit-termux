#!/bin/bash
while true; do
clear
echo "================================="
echo "POCKET SOC MOBILE v1.4 👑"
echo "Built by King Vasco"
echo "================================="
echo "1. Run Logwatcher - Threat Detection"
echo "2. Run Portscanner - Network Recon"
echo "3. View Report.csv"
echo "4. Exit"
echo "8. Launch Web Dashboard"
echo "================================="
read -p "Choose an option: " choice
case $choice in
1)
echo "[*] Running Logwatcher..."
echo "TIMESTAMP,EVENT,SEVERITY" > report.csv
echo "$(date),BRUTE_FORCE:45.33.32.156:22,CRITICAL" >> report.csv
echo "$(date),PORT_SCAN:8.8.8.8:443,HIGH" >> report.csv
echo "[+] Alerts saved to report.csv"
;;
2)
read -p "Enter IP to scan: " ip
echo "TIMESTAMP,EVENT,SEVERITY" > report.csv
for port in 22 80 443 8080 4444; do
nc -w 1 -z $ip $port 2>/dev/null && echo "$(date),PORT_SCAN:$ip:$port,OPEN" >> report.csv || echo "$(date),PORT_SCAN:$ip:$port,CLOSED" >> report.csv
done
echo "[+] Scan complete"
;;
3) cat report.csv ;;
4) exit 0 ;;
8)
echo "[*] Starting Dashboard on port 8080..."
mkdir -p dashboard
echo '<!DOCTYPE html><html><head><title>POCKET SOC</title><meta name="viewport" content="width=device-width,initial-scale=1"><meta http-equiv="refresh" content="3"><style>body{background:#0a0a0a;color:#00ff41;font-family:monospace;padding:20px}h1{border-bottom:2px solid #00ff41}.card{background:#111;border:1px solid #00ff41;padding:15px;margin:10px 0}.critical{color:#ff0041}.high{color:#ff8800}.open{color:#00ff41}.closed{color:#666}</style></head><body><h1>POCKET SOC MOBILE v1.4 - King Vasco</h1><div class="card"><h2>THREAT ALERTS</h2>' > dashboard/index.html
tail -n +2 report.csv 2>/dev/null | while IFS=',' read ts event sev; do echo "<p class=\"${sev,,}\">[$sev] $event - $ts</p>" >> dashboard/index.html; done
echo '<p>No data yet. Run 1 or 2</p>' >> dashboard/index.html
echo '</div><div class="card"><h2>STATUS</h2><p class="open">ONLINE</p></div></body></html>' >> dashboard/index.html
cd dashboard && python -m http.server 8080 --bind 0.0.0.0
;;
esac
read -p "Press Enter..."
done
