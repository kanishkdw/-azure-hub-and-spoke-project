code phase-6-monitoring/steps.md

# 📡 Phase 6: Network Monitoring & Diagnostics (Network Watcher)

This phase activates monitoring tools in Azure to trace network flow and detect misconfigurations like blocked traffic, failed routing, or missing firewall rules.

---

## 🛠️ Step 6.1: Enable Network Watcher

1. Go to **Azure Portal**
2. Search **"Network Watcher"**
3. Enable it for the region where your VNets are deployed

📸 Screenshot: `enable-network-watcher.png`

---

## 📈 Step 6.2: Run IP Flow Verify

1. Go to **Network Watcher → IP Flow Verify**
2. Input:
   - **Source IP:** Private IP of Hub VM
   - **Destination IP:** AppVM / DevVM private IP
   - **Port:** 3389 or 22
3. Run test → Should say `Allow` (if NSG + Firewall allow)

📸 Screenshot: `ip-flow-verify.png`

---

## 📋 Step 6.3: Use Connection Troubleshoot

1. Go to **Network Watcher → Connection Troubleshoot**
2. Source: `Hub-VM`
3. Destination: `AppVM`, Port `22` or `3389`
4. Click **Check**
5. Should show "Reachable"

📸 Screenshot: `connection-troubleshoot.png`

---

## 📊 Step 6.4: Enable NSG Flow Logs (Optional but Good)

1. Go to **Network Security Group → Diagnostics settings**
2. Enable `NSG Flow Logs`
3. Set retention: e.g., 7 days
4. Output to Storage or Log Analytics

📸 Screenshot: `nsg-flow-logs.png`

---

## ✅ Phase 6 Validation Summary

| Tool                  | Purpose                          | Status    |
|-----------------------|----------------------------------|-----------|
| Network Watcher       | Monitoring/diagnostics enabled   | ✅        |
| IP Flow Verify        | Checks allow/deny in real time   | ✅        |
| Connection Troubleshoot | VM-to-VM reachability          | ✅        |
| NSG Flow Logs         | Tracks traffic flow via NSGs     | ✅        |


