# Download and Install SQL Server

# 1. Set variables

$source_url = "https://go.microsoft.com/fwlink/?linkid=866658"
$output_path = "E:\temp\"
$output_file = "sqlexpress2019.exe"
$output = $output_path+$output_file
$start_date = Get-Date

# 2. Download SQL Server

New-Item $output -ItemType file -Force
try{
    $query = Invoke-WebRequest -Uri $url -OutFile $output -ErrorAction Stop
    $status = $query.StatusCode >> $output_path\log.txt
} catch {
    $status = $_.Exception.Response.StatusCode.value__
}
Write-Output "Time taken: $((Get-Date).Subtract($start_date).Seconds) second(s)" >> $output_path\log.txt

# 3. Begin installation

Invoke-Expression $output
