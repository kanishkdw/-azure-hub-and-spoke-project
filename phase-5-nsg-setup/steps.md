code phase-5-nsg-setup/steps.md

# 🔒 Phase 5: Network Security Groups (NSGs)

This phase configures subnet-level security using Network Security Groups. It ensures only required ports and protocols are allowed — tightly securing access.

---

## 🔧 Step 5.1: Create NSGs

Create 3 NSGs:
- `App-NSG` → for App-Subnet
- `Dev-NSG` → for Dev-Subnet
- `Hub-NSG` → for HubVMSubnet

> 📍 Go to Azure → "Network security groups" → Create

📸 Screenshot: `create-nsgs.png`

---

## ➕ Step 5.2: Create NSG Rules

### ✅ For App-NSG and Dev-NSG:

| Priority | Name         | Port | Protocol | Source        | Action |
|----------|--------------|------|----------|---------------|--------|
| 100      | Allow-RDP    | 3389 | TCP      | Hub subnet IP | Allow  |
| 200      | Allow-SSH    | 22   | TCP      | Hub subnet IP | Allow  |
| 300      | Allow-ICMP   | *    | ICMP     | Hub subnet IP | Allow  |
| 400      | Deny-All     | *    | *        | Any           | Deny   |

### ✅ For Hub-NSG:

| Priority | Name         | Port | Protocol | Source        | Action |
|----------|--------------|------|----------|---------------|--------|
| 100      | Allow-RDP    | 3389 | TCP      | Any           | Allow  |
| 200      | Allow-SSH    | 22   | TCP      | Any           | Allow  |

📸 Screenshot: `nsg-rules-app-dev-hub.png`

---

## 🔗 Step 5.3: Associate NSGs to Subnets

- App-NSG → App-Subnet
- Dev-NSG → Dev-Subnet
- Hub-NSG → HubVMSubnet

> 📍 Go to each NSG → Subnet → Associate

📸 Screenshot: `nsg-association.png`

---

## 🧪 Step 5.4: Validate NSG Rules

Use ping, RDP, SSH tests to confirm:
- Only Hub can access Spoke VMs
- External traffic denied unless via Firewall
- ICMP (ping) allowed only from Hub

📸 Screenshot: `nsg-test-results.png`

