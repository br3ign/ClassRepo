# Optional: Install IIS

# 1. Set server names
$servers = ('WINDC01')

# 2. Install Feature
Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -ComputerName $servers -LogPath 'C:\ceh_temp\feature_log.txt'