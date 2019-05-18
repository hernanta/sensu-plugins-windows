$ifIndex = Get-WmiObject -Class win32_ip4routetable | where {$_.destination -eq "0.0.0.0"} 

| select -ExpandProperty InterfaceIndex
$ifIndex = "InterfaceIndex=" + $ifIndex
$nic_name = Get-WmiObject -Class win32_networkadapterconfiguration -Filter $ifIndex | 

select -ExpandProperty Description
$nic = [System.Net.NetworkInformation.Networkinterface]::GetAllNetworkInterfaces() | where 

{($_.description -eq $nic_name) -and ($_.operationalstatus -eq "up")}
$stats = $nic.GetIPv4Statistics()
$bytesSent = $stats.BytesSent
$bytesReceived = $stats.BytesReceived
$networkIn = $bytesReceived/1000000
$networkOut = $bytesSent/1000000
$resultNetworkIn = [Math]::Round($networkIn,2)
$resultNetworkOut = [Math]::Round($networkOut,2)
$exitCode = -1

Write-Output "Bandwidth - Incoming: $resultNetworkIn MByte" 
Write-Output "Bandwidth - Outgoing: $resultNetworkOut MByte"
exit $exitCode
