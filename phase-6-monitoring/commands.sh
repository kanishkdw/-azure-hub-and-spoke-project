# Enable Network Watcher (if not already)
az network watcher configure --locations eastus --enabled true

# View available watchers
az network watcher list --query "[].name"

# Run connection troubleshoot
az network watcher connection-monitor create \
  --name HubToAppTest \
  --resource-group hub-spoke-rg \
  --location eastus \
  --source-resource <Hub-VM-ID> \
  --dest-address <App-VM-IP> \
  --dest-port 22
