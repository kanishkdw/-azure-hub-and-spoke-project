#  Phase 2: VNet Peering – Hub and Spoke Connections

In this phase, we establish **peering** between Hub and Spoke VNets to enable secure communication.

---

## 🧷 2.1 Peering: Hub ↔ App-VNet

1. Go to **Virtual Networks**
2. Click **Hub-VNet**
3. Go to **Peerings** → Click **+ Add**
4. Fill form:
   - **Peering link name** (Hub to App): `Hub-to-App`
   - **Remote virtual network**: `App-VNet`
   - Enable:
     -  Allow traffic from remote network
     -  Allow forwarded traffic
   - Do **not** allow gateway transit
5. Click **Add**

---

##  2.2 Peering: App-VNet → Hub-VNet

Repeat for the reverse:

1. Go to **App-VNet** → Peerings → **+ Add**
2. Name: `App-to-Hub`
3. Remote virtual network: `Hub-VNet`
4. Enable:
   -  Allow traffic from remote network
   -  Allow forwarded traffic
5. Click **Add**



---

##  2.3 Peering: Hub ↔ Dev-VNet

Repeat same steps:
- Hub-VNet → Dev-VNet → `Hub-to-Dev`
- Dev-VNet → Hub-VNet → `Dev-to-Hub`


---

##  2.4 Disable Spoke-to-Spoke Peering

>  No direct peering between App-VNet and Dev-VNet.

This ensures secure and centralized traffic control.



---

##  2.5 Test Peering

Once VMs are deployed:

1. SSH into `HubVM`
2. Ping `AppVM` and `DevVM` private IPs:

```bash
ping <AppVM_Private_IP>
ping <DevVM_Private_IP>
