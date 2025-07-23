
---

### ⚙️ Step 3: Fill `commands.sh` (CLI version – optional)

```bash
# Hub → App
az network vnet peering create \
  --name Hub-to-App \
  --resource-group hub-spoke-rg \
  --vnet-name Hub-VNet \
  --remote-vnet App-VNet \
  --allow-vnet-access \
  --allow-forwarded-traffic

# App → Hub
az network vnet peering create \
  --name App-to-Hub \
  --resource-group hub-spoke-rg \
  --vnet-name App-VNet \
  --remote-vnet Hub-VNet \
  --allow-vnet-access \
  --allow-forwarded-traffic

# Hub → Dev
az network vnet peering create \
  --name Hub-to-Dev \
  --resource-group hub-spoke-rg \
  --vnet-name Hub-VNet \
  --remote-vnet Dev-VNet \
  --allow-vnet-access \
  --allow-forwarded-traffic

# Dev → Hub
az network vnet peering create \
  --name Dev-to-Hub \
  --resource-group hub-spoke-rg \
  --vnet-name Dev-VNet \
  --remote-vnet Hub-VNet \
  --allow-vnet-access \
  --allow-forwarded-traffic
