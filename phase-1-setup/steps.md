# 📘 Phase 1: Initial Setup – Resource Group, VNets, Subnets, and VMs

This phase sets up the core infrastructure using the Azure Portal and/or CLI.

---

## 🧱 1. Create Resource Group

1. Go to [Azure Portal](https://portal.azure.com)
2. Search for **Resource groups** → Click **+ Create**
3. Fill the form:
   - Subscription: Your default
   - **Resource Group Name**: `hub-spoke-rg`
   - **Region**: `Central India`
4. Click **Review + Create → Create**

📸 Save screenshot as `create-resource-group.png` and place it in `screenshots/`

---

## 🌐 2. Create Hub VNet

1. Go to **Virtual networks** → **+ Create**
2. Fill details:
   - Name: `Hub-VNet`
   - Address space: `10.0.0.0/16`
   - Subnets:
     - `AzureFirewallSubnet` → `10.0.1.0/24`
     - `HubVMSubnet` → `10.0.2.0/24`
3. Click **Review + Create → Create**

📸 Screenshot: `hub-vnet.png`

---

## 🌐 3. Create App VNet (Spoke 1)

- Name: `App-VNet`
- Address space: `10.1.0.0/16`
- Subnet:
  - `AppSubnet` → `10.1.1.0/24`

📸 Screenshot: `app-vnet.png`

---

## 🌐 4. Create Dev VNet (Spoke 2)

- Name: `Dev-VNet`
- Address space: `10.2.0.0/16`
- Subnet:
  - `DevSubnet` → `10.2.1.0/24`

📸 Screenshot: `dev-vnet.png`

---

## 💻 5. Deploy VMs

Create 3 VMs in different subnets:

| VM Name | VNet     | Subnet      | Region        | OS     | Purpose        |
|---------|----------|-------------|---------------|--------|----------------|
| `HubVM` | Hub-VNet | HubVMSubnet | Central India | Ubuntu | Jumpbox        |
| `AppVM` | App-VNet | AppSubnet   | Central India | Ubuntu | App workloads  |
| `DevVM` | Dev-VNet | DevSubnet   | Central India | Ubuntu | Testing/dev    |

📸 Screenshot examples: `hubvm.png`, `appvm.png`, `devvm.png`

---
"C:\Users\Kanishk Dwivedi\OneDrive\Pictures\Screenshots\Screenshot 2025-07-23 153909.png""C:\Users\Kanishk Dwivedi\OneDrive\Pictures\Screenshots\Screenshot 2025-07-23 153904.png"


"C:\Users\Kanishk Dwivedi\OneDrive\Pictures\Screenshots\Screenshot 2025-07-23 153855.png"

