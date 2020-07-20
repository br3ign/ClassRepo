# Set up Server Script

# 0. Set Policy Execution
Set-ExecutionPolicy Unrestricted

# 1. Set hostname

Rename-Computer -NewName "WINDC01"

# 2. Install primary features

$logPath = "C:\ceh_temp\logs.txt"
New-Item $logPath -ItemType file -Force

$addTools = "RSAT-AD-Tools"
Add-WindowsFeature $addTools
Get-WindowsFeature | Where installed >> $logPath

# 3. Restart
# Once the installation is successful, the system will need to reboot

Restart-Computer
