8)
echo "[*] Launching POCKET SOC MOBILE Dashboard..."
mkdir -p dashboard
cat > dashboard/index.html <<'EOF'
<!DOCTYPE html><html><head><title>POCKET SOC MOBILE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="refresh" content="3">
<style>body{background:#0a0a0a;color:#00ff41;font-family:monospace;padding:20px}
h1{border-bottom:2px solid #00ff41}.card{background:#111;border:1px solid #00ff41;padding:15px;margin:10px 0;border-radius:8px}
.critical{color:#ff0041;font-weight:bold}.high{color:#ff8800}.open{color:#00ff41}.closed{color:#666}.log{font-size:12px}</style></head><body>
<h1>POCKET SOC MOBILE v1.2</h1>
<div class="card"><h2>THREAT ALERTS - LIVE</h2>
EOF

if [ -f report.csv ]; then
tail -n +2 report.csv | while IFS=',' read ts event sev; do
if echo "$sev" | grep -q "CRITICAL"; then
echo "<p class=\"critical\">[$sev] $event - $ts</p>" >> dashboard/index.html
elif echo "$sev" | grep -q "HIGH"; then
echo "<p class=\"high\">[$sev] $event - $ts</p>" >> dashboard/index.html
elif echo "$sev" | grep -q "OPEN"; then
echo "<p class=\"open\">[OPEN] $event - $ts</p>" >> dashboard/index.html
elif echo "$sev" | grep -q "CLOSED"; then
echo "<p class=\"closed\">[CLOSED] $event - $ts</p>" >> dashboard/index.html
fi
done
else
echo "<p class=\"open\">No data yet. Run Option 1 or 2 to generate threats</p>" >> dashboard/index.html
fi

cat >> dashboard/index.html <<'EOF'
</div>
<div class="card"><h2>SYSTEM STATUS</h2>
<p class="open">Scanner: ONLINE</p><p class="open">Dashboard: ACTIVE</p>
<p class="log">Auto-refresh: 3s | Reading: report.csv</p></div>
</body></html>
EOF
cd dashboard
python -m http.server 8080 --bind 0.0.0.0
;;
