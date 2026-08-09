from flask import Flask, render_template_string, request
from colorama import Fore, init
import time, random, threading, socket, os

init(autoreset=True)
app = Flask(__name__)

attack_types = ["SQL Injection", "Port Scan", "Brute Force", "XSS Attack"]
ips = ["192.168.1.45", "10.0.0.12", "172.16.0.88"]

alerts = ["[+] SYSTEM: Pocket SOC v1.6.5 Started"]
port_scan_results = []
log_reader_results = []

def generate_alerts():
    global alerts
    while True:
        time.sleep(4)
        attack = random.choice(attack_types)
        ip = random.choice(ips)
        new_alert = "[+] " + time.strftime('%H:%M:%S') + " - [SURICATA] " + attack + " - " + ip
        alerts.insert(0, new_alert)
        if len(alerts) > 10: alerts.pop()

def read_logs():
    global log_reader_results
    while True:
        time.sleep(5)
        try:
            logs = os.popen('logcat -d -t 5').read().split('\n')
            log_reader_results = ["[ANDROID] " + l for l in logs if l]
        except:
            log_reader_results = ["[ERROR] No log permission"]

threading.Thread(target=generate_alerts, daemon=True).start()
threading.Thread(target=read_logs, daemon=True).start()

HTML = '''
<!DOCTYPE html>
<html>
<head><title>Pocket SOC v1.6.5</title>
<style>
body{background:#000; color:#0f0; font-family:monospace; padding:10px;}
.card{border:2px solid #0f0; padding:10px; width:150px; text-align:center; margin:5px;}
.flex{display:flex; gap:10px; justify-content:center; flex-wrap:wrap;}
.logs{background:#111; padding:10px; border:1px solid #0f0; height:250px; overflow-y:scroll;}
.tabs a button{background:#0f0; color:#000; border:none; padding:8px; margin:5px; font-weight:bold;}
input,button{background:#000; color:#0f0; border:1px solid #0f0; padding:5px;}
</style>
<script>setTimeout(function(){location.reload();},4000);</script>
</head>
<body>
    <h1 style="text-align:center;">POCKET SOC v1.6.5 FULL</h1>
    <p style="text-align:center;">King Vasco | Ghana</p>
    <div class="flex">
        <div class="card"><h3>SURICATA</h3><p>[ONLINE]</p></div>
        <div class="card"><h3>SCANNER</h3><p>[ONLINE]</p></div>
        <div class="card"><h3>LOGS</h3><p>[ONLINE]</p></div>
    </div>
    <div class="tabs">
        <a href="/?tab=ids"><button>IDS ALERTS</button></a>
        <a href="/?tab=scan"><button>PORT SCANNER</button></a>
        <a href="/?tab=logs"><button>LOG READER</button></a>
    </div>
    <h3>[ {{tab_name}} ]</h3>
    <div class="logs">
        {% for item in data %}<p>{{item}}</p>{% endfor %}
    </div>
    {% if tab == 'scan' %}
    <form method="POST" action="/scan">
        <input name="target" placeholder="Enter IP: 192.168.1.1" required>
        <button type="submit">START SCAN</button>
    </form>
    {% endif %}
</body>
</html>
'''

@app.route("/")
def dashboard():
    tab = request.args.get('tab', 'ids')
    if tab == 'scan':
        data = port_scan_results if port_scan_results else ["Enter IP and START SCAN"]
        tab_name = "PORT SCANNER"
    elif tab == 'logs':
        data = log_reader_results if log_reader_results else ["Loading logs..."]
        tab_name = "LOG READER"
    else:
        data = alerts
        tab_name = "IDS ALERTS"
    return render_template_string(HTML, data=data, tab=tab, tab_name=tab_name)

@app.route("/scan", methods=["POST"])
def scan():
    global port_scan_results
    target = request.form['target']
    port_scan_results = ["[+] Scanning " + target]
    for port in [21,22,80,443,8080]:
        s = socket.socket()
        s.settimeout(0.5)
        if s.connect_ex((target, port)) == 0:
            port_scan_results.append("[OPEN] Port " + str(port))
        s.close()
    port_scan_results.append("[+] Scan Done")
    return dashboard()

def menu():
    while True:
        print(Fore.CYAN + "========================================")
        print(Fore.YELLOW + "POCKET SOC MOBILE v1.6.5 FULL")
        print(Fore.CYAN + "========================================")
        print("8. Launch Web Dashboard")
        print("4. Exit")
        choice = input("Select: ")
        if choice == "8":
            print(Fore.GREEN + "[+] Dashboard: http://172.20.10.6:5000")
            app.run(host="0.0.0.0", port=5000)
        elif choice == "4": break

if __name__ == "__main__": menu()
