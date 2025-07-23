# CLI-based provisioning (Optional)

az group create --name hub-spoke-rg --location "Central India"

# Hub VNet
az network vnet create \
  --resource-group hub-spoke-rg \
  --name Hub-VNet \
  --address-prefix 10.0.0.0/16 \
  --subnet-name AzureFirewallSubnet \
  --subnet-prefix 10.0.1.0/24

az network vnet subnet create \
  --resource-group hub-spoke-rg \
  --vnet-name Hub-VNet \
  --name HubVMSubnet \
  --address-prefix 10.0.2.0/24

# App VNet
az network vnet create \
  --resource-group hub-spoke-rg \
  --name App-VNet \
  --address-prefix 10.1.0.0/16 \
  --subnet-name AppSubnet \
  --subnet-prefix 10.1.1.0/24

# Dev VNet
az network vnet create \
  --resource-group hub-spoke-rg \
  --name Dev-VNet \
  --address-prefix 10.2.0.0/16 \
  --subnet-name DevSubnet \
  --subnet-prefix 10.2.1.0/24
