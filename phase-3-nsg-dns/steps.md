# 🔥 Phase 3: Azure Firewall Setup in Hub Network

This phase sets up a centralized Azure Firewall in the Hub Virtual Network. All traffic from Spoke VNets is routed through the firewall for inspection and control.

---

## 🔧 Step 1: Create Azure Firewall

1. Go to **Azure Portal**
2. Search **"Firewall"**
3. Click **Create**
4. Basics tab:
   - **Name:** `Hub-Firewall`
   - **Region:** Same as Hub VNet
   - **Resource Group:** `hub-spoke-rg`
5. Select **Virtual Network**: `Hub-VNet`
6. Subnet: Select **AzureFirewallSubnet** (required default name)
7. Create a **new public IP address** (Name: `Hub-Firewall-IP`)
8. Click **Review + Create**

📸 Screenshots:
- `create-firewall.png`
- `firewall-public-ip.png`

---

## 📘 Step 2: Create Route Table for Spokes

1. Go to **Route Tables** → Click **Create**
2. Name: `Spoke-RT`
3. Region: Same as VNets
4. Associate to:
   - `App-Subnet` in App-VNet
   - `Dev-Subnet` in Dev-VNet

📸 Screenshot: `create-route-table.png`

---

## ➕ Step 3: Add UDR to Route Table

1. Open `Spoke-RT`
2. Go to **Routes** → Click **+ Add**
3. Enter:
   - **Name:** `DefaultRoute`
   - **Address prefix:** `0.0.0.0/0`
   - **Next hop type:** Virtual Appliance
   - **Next hop IP:** Private IP of `Hub-Firewall`

📸 Screenshot: `add-udr.png`

> 📌 To get firewall private IP:
Go to Firewall → Overview → **Private IP**

---

## 🔄 Step 4: Associate Route Table to Subnets

1. In **Spoke-RT**, go to **Subnet Associations**
2. Click **+ Associate**
3. Select:
   - Virtual Network: `App-VNet`
   - Subnet: `App-Subnet`
4. Repeat for:
   - `Dev-VNet` → `Dev-Subnet`

📸 Screenshot: `associate-rt-subnet.png`

---

## ✅ Step 5: Add Application Rule (Optional)

1. Go to Firewall → **Rules (Classic)** → **+ Add rule collection**
2. Type: **Application Rule Collection**
3. Name: `AllowWeb`
4. Target: 0.0.0.0/0 or all Spoke VM subnets
5. FQDNs: `www.microsoft.com`, `www.google.com`


