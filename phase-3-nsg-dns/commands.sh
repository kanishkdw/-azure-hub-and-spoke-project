# Create Public IP
az network public-ip create \
  --name Hub-Firewall-IP \
  --resource-group hub-spoke-rg \
  --sku Standard \
  --location eastus

# Create Azure Firewall
az network firewall create \
  --name Hub-Firewall \
  --resource-group hub-spoke-rg \
  --location eastus \
  --vnet-name Hub-VNet

# Set firewall IP config
az network firewall ip-config create \
  --firewall-name Hub-Firewall \
  --name FWConfig \
  --public-ip-address Hub-Firewall-IP \
  --resource-group hub-spoke-rg \
  --vnet-name Hub-VNet

# Create Route Table
az network route-table create \
  --name Spoke-RT \
  --resource-group hub-spoke-rg \
  --location eastus

# Add Route
az network route-table route create \
  --resource-group hub-spoke-rg \
  --route-table-name Spoke-RT \
  --name DefaultRoute \
  --address-prefix 0.0.0.0/0 \
  --next-hop-type VirtualAppliance \
  --next-hop-ip-address <FIREWALL_PRIVATE_IP>
