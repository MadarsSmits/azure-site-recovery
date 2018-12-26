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
- HyperV-NIC
- HyperV-NSG
- HyperV-PublicIP
- HyperV-VM
- HyperV-VM_OsDisk
- HyperV-VNET

Manual
- Run "Azure_NestedHyper-V_Script.ps1" secound time
- Join Valis Storage Account with SMB and copy both VMs
- Import both copied VMs into Hyper-V Manager

__valis3-VMs__

- w5uxvybrmvtxmsqlserver/demodatabase
- w5uxvybrmvtxmsqlserver
- valis3-SQL-VM
- valis3-SQL-NIC
- valis3-VMs-VNET
- valis3-SQL-PublicIP
- valis3-VMs-NSG
