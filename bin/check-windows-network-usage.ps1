$bytesReceived = (Get-NetAdapterStatistics -Name Ethernet).ReceivedBytes
$bytesSent = (Get-NetAdapterStatistics -Name Ethernet).SentBytes
$networkIn = $bytesReceived/1000000
$networkOut = $bytesSent/1000000
$resultNetworkIn = [Math]::Round($networkIn,2)
$resultNetworkOut = [Math]::Round($networkOut,2)
$exitCode = -1

Write-Output "Bandwidth - Incoming: $resultNetworkIn MByte" 
Write-Output "Bandwidth - Outgoing: $resultNetworkOut MByte"
exit $exitCode
