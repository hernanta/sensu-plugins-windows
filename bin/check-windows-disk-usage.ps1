$freeMemoryDetail = (Get-counter  -Counter "\LogicalDisk(*)\% Free Space").countersamples | where {$_.InstanceName -ne "_total" -and $_.InstanceName -notmatch "harddiskvolume"} | Sort-Object InstanceName
$freeMemoryPercent = [System.Math]::Round($freeMemoryDetail.CookedValue,2)
$memoryUsagePercent = 100 - $freeMemoryPercent
$warningValue = 80
$critialValue = 90
$message = ""
$exitCode = -1


if ($cpuPercent -gt $criticalValue)
{
    $message = "HDD usage is over 90%: $memoryUsagePercent%"
    $exitCode = 2
}
elseif ($cpuPercent -ge $warningValue)
{
    $message = "HDD usage is over 80%: $memoryUsagePercent%"
    $exitCode = 1
}
else
{
    $message = "HDD is normal: $memoryUsagePercent%"
    $exitCode = 0
}

Write-Output $message
exit $exitCode
