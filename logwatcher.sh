#!/bin/bash
# Log Watcher - Monitors logs in real-time
echo "[+] Starting Log Watcher..."
echo "Press Ctrl+C to stop"
tail -f /data/data/com.termux/files/usr/var/log/syslog 2>/dev/null || tail -f $PREFIX/var/log/messages
#!/bin/bash
LOGFILE="report.csv"
echo "Timestamp,Event,Severity" > $LOGFILE

echo "[+] Starting Log Watcher..."
echo "Press Ctrl+C to stop"
echo ""

tail -f /data/data/com.termux/files/usr/var/log/syslog 2>/dev/null | while read line
do
    if echo "$line" | grep -qi "fail\|error\|denied\|attack"; then
        timestamp=$(date)
        echo "[$timestamp] ALERT: $line"
        echo "$timestamp,Potential Threat,High" >> $LOGFILE
    else
        echo "$line"
    fi
done
