# World’s First OFFLINE Pocket Mini SOC v1.6.5 🇬🇭
**The first OFFLINE mobile SOC lab built on Android with Termux** 
Built by King Vasco

### # POCKET SOC v1.6.5 FULL 📱🇬🇭
### The 1st Mobile Security Operations Center Built on Termux

![Python](https://img.shields.io/badge/Python-3-blue) 
![Flask](https://img.shields.io/badge/Flask-WebDashboard-green)
![Termux](https://img.shields.io/badge/Platform-Termux-orange)
![License](https://img.shields.io/badge/License-MIT-yellow)

**Cybersecurity should be accessible to everyone, even without a laptop.**

POCKET SOC is a pocket-sized SOC toolkit that runs Wazuh, Splunk, and Python security workflows directly from your Android phone using Termux.

## ✨ FEATURES v1.6.5 FULL
- **Live IDS Alerts** - Simulated Suricata alerts dashboard
- **Port Scanner** - Scan any IP for open ports 1-1024
- **Android Log Reader** - View live `logcat` system logs
- **Mobile Web Dashboard** - Flask UI that works on your phone browser
- **Color Terminal Menu** - Easy navigation with colorama
- **Live Dashboard** `http://localhost:5000`
  
  ![Dashboard Demo](V8.jpg.JPG)
  ### 📱 Proof of Life
Running live on Android with real threat alerts:

![Dashboard Main](V6.jpg.JPG)
Real ,Offline and Live
![Install Steps](Install.jpg.JPG)
![Dashboard Alt](Dashboard10.jpg.JPG)
  
- **[0] Clean Exit**

### Quick Start
```bash
pkg install nmap -y
git clone https://github.com/vascoray/soc-toolkit-termux
cd soc-toolkit-termux
chmod +x pocketsoc.sh
./pocketsoc.sh
