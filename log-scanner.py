filename = input('Enter log file name: ')

failed_count = 0
attackers = {}

with open(filename, 'r') as f:
    for line in f:
        if 'Failed login' in line:
            failed_count += 1
            ip = line.split(' ')[0]
            if ip in attackers:
                attackers[ip] += 1
            else:
                attackers[ip] = 1

print('\n--- ALERT ---')
print('Total Failed Logins:', failed_count)
print('Top Attackers:')
for ip, count in attackers.items():
    print(ip, ':', count, 'attempts')
