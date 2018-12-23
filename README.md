# azure-site-recovery
Azure Workshop "Valis v0.3"

---------------
Templates
---------------
az deployment create --template-uri https://raw.githubusercontent.com/MadarsSmits/azure-site-recovery/master/rg.json --verbose --location westeurope<br/><br/>
az group deployment create --template-uri https://raw.githubusercontent.com/MadarsSmits/azure-site-recovery/master/template-BSR.json --verbose --resource-group valis3-BSR --no-wait<br/><br/>
az group deployment create --template-uri https://raw.githubusercontent.com/MadarsSmits/azure-site-recovery/master/template-HyperV.json --verbose --resource-group valis3-HyperV --no-wait<br/><br/>
az group deployment create --template-uri https://raw.githubusercontent.com/MadarsSmits/azure-site-recovery/master/template-VMs.json --verbose --resource-group valis3-VMs

__valis3-BSR:__
- valis3-BSR
- valis3-VNET
- pc47ofbueyttustorage

__valis3-HyperV:__
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