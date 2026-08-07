#!/bin/bash
# System Report Generator
echo "[+] SOC System Report"
echo "Date: $(date)"
echo "Device: $(uname -a)"
echo "Uptime: $(uptime)"
echo "Memory: $(free -h | grep Mem)"
echo "Disk: $(df -h /data | tail -1)"
echo "[+] Report Complete"