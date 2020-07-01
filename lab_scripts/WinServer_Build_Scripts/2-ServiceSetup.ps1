# Set up AD on Server Script
# This script assumes that you intend on setting a 'lab'.
# As such, DNS and GPMC will be installed

# 1. Adding ADDS. DNS and GPMC

$logPath = "C:\ceh_temp\logs.txt"
Start-Job -Name addFeatures -ScriptBlock {
    Add-WindowsFeature -Name "AD-Domain-Services" -IncludeAllSubFeature -IncludeManagementTools
    Add-WindowsFeature -Name "DNS" -IncludeAllSubFeature -IncludeManagementTools
    Add-WindowsFeature -Name "GPMC" -IncludeAllSubFeature -IncludeManagementTools
}
Wait-Job -Name addFeatures

# 2. Setting up the Forest

$domainName = "lab.fakeorg.local"
$netbiosName = "LAB"

Import-Module ADDSDeployment
Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "WinThreshold" -DomainName $domainname -DomainNetbiosName $netbiosName -ForestMode "Win2012" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -SysvolPath "C:\Windows\SYSVOL" -Force:$true

# 3. Confirm installation
Get-WindowsFeature | Where installed >> $logPath