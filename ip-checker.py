import requests

ip = input('Enter IP: ')
url = 'http://ip-api.com/json/' + ip
data = requests.get(url).json()

if data['status'] == 'success':
    print('IP:', data['query'])
    print('Country:', data['country'])
    print('ISP:', data['isp'])
    
    risk = 0
    if data.get('proxy'):
        risk = risk + 3
    if data.get('hosting'):
        risk = risk + 2
    
    print('Risk Score:', risk)
    if risk >= 3:
        print('HIGH RISK')
    else:
        print('LOW RISK')
else:
    print('Invalid IP')
