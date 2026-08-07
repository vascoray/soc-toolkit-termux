#!/bin/bash
# Hash Checker - Verify file integrity
echo "[+] Hash Checker MD5/SHA256"
read -p "Enter file path: " file
if [ -f "$file" ]; then
    echo "MD5:  $(md5sum $file | awk '{print $1}')"
    echo "SHA256: $(sha256sum $file | awk '{print $1}')"
else
    echo "[!] File not found"
fi