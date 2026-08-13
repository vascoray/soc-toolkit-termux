import sys
import requests
from datetime import datetime

if len(sys.argv) < 2:
    print("Usage: python investigate.py <IP>")
    sys.exit()

ip = sys.argv[1]
time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

print(f"[POCKET SOC] Investigating: {ip}")

try:
    r = requests.get(f"http://ip-api.com/json/{ip}")
    data = r.json()
    
    if data['status'] == 'success':
        print(f"Country: {data['country']}")
        print(f"ISP: {data['isp']}")
        print(f"City: {data['city']}")
        print(f"Org: {data['org']}")
        
        # Log it
        with open("alerts.log", "a") as f:
            f.write(f"{time} - INVESTIGATED {ip} - {data['country']} - {data['isp']}\n")
        print("Logged to alerts.log")
    else:
        print("Failed to get IP info")
        
except Exception as e:
    print(f"Error: {e}")
