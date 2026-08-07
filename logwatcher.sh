#!/bin/bash
# Log Watcher - Monitors logs in real-time
echo "[+] Starting Log Watcher..."
echo "Press Ctrl+C to stop"
tail -f /data/data/com.termux/files/usr/var/log/syslog 2>/dev/null || tail -f $PREFIX/var/log/messages