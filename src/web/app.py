from fastapi import FastAPI
import subprocess

app = FastAPI(title="POCKET SOC v1.1")

@app.get("/")
def home():
    return {"message": "POCKET SOC is running. Go to /docs"}

@app.get("/api/health")
def health():
    return {"status": "ok", "offline": True, "device": "Android"}

@app.get("/api/scan/{target}")
def scan_network(target: str):
    result = subprocess.run(['nmap', '-sn', target], capture_output=True, text=True)
    return {"target": target, "result": result.stdout}
