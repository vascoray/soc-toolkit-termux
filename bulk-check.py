import requests

print('Paste IPs one per line. Type DONE when finished')
ips = []
while True:
    ip = input()
    if ip == 'DONE':
        break
    ips.append(ip)

print('\n--- RESULTS ---')
for ip in ips:
    url = 'http://ip-api.com/json/' + ip
    data = requests.get(url).json()
    
    risk = 0
    if data.get('proxy'): risk += 3
    if data.get('hosting'): risk += 2
    
    status = 'HIGH' if risk >= 3 else 'LOW'
    print(ip, '->', status, 'Risk:', risk)
