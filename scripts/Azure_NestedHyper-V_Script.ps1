Start-Transcript -Path C:\provision.log -Append

Function SetupPhase1 {

Write-Host "Installing Hyper-V"
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart
  Install-WindowsFeature Hyper-V-Tools
  Install-WindowsFeature Hyper-V-PowerShell
  Install-WindowsFeature Failover-Clustering

Write-Host "Rebooting"
  Restart-Computer
}


Function SetupPhase2 {

Write-Host "Adding NAT"
  New-VMSwitch -SwitchName "vSwitch" -SwitchType Internal
  New-NetIPAddress -IPAddress 192.168.0.1 -PrefixLength 24 -InterfaceIndex (Get-NetAdapter -name "vEthernet (vSwitch)").ifIndex
  New-NetNat -Name MyNATnetwork -InternalIPInterfaceAddressPrefix 192.168.0.0/24

Write-Host "Adding DHCP scope"
  Install-WindowsFeature DHCP -IncludeManagementTools
  Add-DhcpServerv4Scope -Name "Internal" -StartRange 192.168.0.10 -EndRange 192.168.0.250 -SubnetMask 255.255.255.0 -Description "Internal Network"
  Set-DhcpServerv4OptionValue -ScopeID 192.168.0 -DNSServer 8.8.8.8 -Router 192.168.0.1

Write-Host "Rebooting the secound time"
  Restart-Computer -Force
  }

  if (!(Test-Path 'C:\Program Files\Hyper-V')) {
   SetupPhase1
} else {
  SetupPhase2
}