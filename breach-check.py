import hashlib
import requests

password = input('Enter password to check: ')

# Hash the password to SHA1
sha1 = hashlib.sha1(password.encode()).hexdigest().upper()
prefix = sha1[:5]
suffix = sha1[5:]

# Check HaveIBeenPwned API
url = 'https://api.pwnedpasswords.com/range/' + prefix
res = requests.get(url)

if suffix in res.text:
    print('ALERT: Password FOUND in data breaches!')
    print('DO NOT USE THIS PASSWORD')
else:
    print('SAFE: Password not found in breaches')
