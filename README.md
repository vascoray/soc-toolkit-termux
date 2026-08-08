# Pocket Mini SOC v1.5 🇬🇭
**The first mobile SOC lab built on Android with Termux** 
Built by King Vasco

### Why
After my national service at Ghana Standards Authority, I built instead of waited. 
This toolkit proves you can do real SOC work from a phone.

### Features
- **[1] Network Recon** - Port scanning with Nmap + CSV export
- **[2] Threat Detection** - Logwatcher for nmap, nc, suspicious commands
- **[3] Reporting** - Generate full CSV security reports 
- **[4] Live Dashboard** - Real-time threat alerts at `http://localhost:8080`
  
  ![Dashboard Demo](dashboard.jpg)
  
- **[0] Clean Exit**

### Quick Start
```bash
pkg install nmap -y
git clone https://github.com/vascoray/soc-toolkit-termux
cd soc-toolkit-termux
chmod +x pocketsoc.sh
./pocketsoc.sh
