# 🚥 Phase 4: Verify Traffic Flow via Azure Firewall

In this step, we validate that the **Azure Firewall** is correctly filtering all outbound traffic from the spoke VMs using the UDR we created earlier.

---

## 🌐 Step 4.1: Test Internet Access from AppVM

1. Go to Azure → AppVM → Connect (SSH)
2. In the terminal, run:

   ```bash
   curl https://www.microsoft.com
