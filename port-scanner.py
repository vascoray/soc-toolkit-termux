import socket

target = input('Enter IP to scan: ')
print('Scanning common ports...')

ports = [21, 22, 23, 25, 53, 80, 443, 445, 3389]

for port in ports:
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(1)
    result = s.connect_ex((target, port))
    if result == 0:
        print('PORT', port, 'OPEN')
    s.close()
    
print('Scan complete')
