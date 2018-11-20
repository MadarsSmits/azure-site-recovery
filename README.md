# azure-site-recovery
Azure Workshop "Valis v0.3"

---------------
Template "RG.json"
---------------
az deployment create --template-uri https://raw.githubusercontent.com/MadarsSmits/azure-site-recovery/master/RG.json --verbose --location westeurope --debug

- HyperV-onPrem RG
- BackupVMs-onPrem RG
- AzureBSR-inAzure RG

------------------------
Template "AzureBSR-inAzure.json"
------------------------
az group deployment create --template-uri https://raw.githubusercontent.com/MadarsSmits/azure-site-recovery/master/AzureBSR-inAzure.json --verbose --resource-group AzureBSR-inAzure --debug --no-wait

- AzureBSR Vault
- AzureBSR VNET
- AzureBSR StorageAccount

------------------------
Template "HyperV-onPrem.json"
------------------------
az group deployment create --template-uri https://raw.githubusercontent.com/MadarsSmits/azure-site-recovery/master/HyperV-onPrem.json --verbose --resource-group HyperV-onPrem --debug --no-wait

- Hyper-V VM
- Hyper-V OS Disk
- Hyper-V NIC
- Hyper-V Public IP
- Hyper-V NSG
- Hyper-V VNET
- Hyper-V Extention

Manual
- Run "Azure_NestedHyper-V_Script.ps1" secound time
- Join Storage Account with SMB and copy both VMs
- Import both copied VMs into Hyper-V Manager

------------------------
Template "BackupVMs-onPrem.json"
------------------------
az group deployment create --template-uri https://raw.githubusercontent.com/MadarsSmits/azure-site-recovery/master/BackupVMs-onPrem.json --verbose --resource-group BackupVMs-onPrem --debug --no-wait

- Backup NSG
- Backup VNET
- WinSCE1 VM
- WinSCE1 NIC
- WinSCE1 PUBLIC IP
- WinSCE1 OS Disk
- WinSCE2 VM
- WinSCE2 NIC
- WinSCE2 PUBLIC IP
- WinSCE2 OS Disk
- WinSCE3 VM
- WinSCE3 NIC
- WinSCE3 PUBLIC IP
- WinSCE3 OS Disk