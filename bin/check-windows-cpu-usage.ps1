$cpuPercent = [Math]::Truncate((get-counter -counter "\Processor(_Total)\% Processor Time").CounterSamples[0].CookedValue)
$criticalValue = 90
$warningValue = 80
$message = ""
$exitCode = -1

if ($cpuPercent -gt $criticalValue)
{
    $message = "CPU usage is over 90%: $CPUPercent%"  
    $exitCode = 2
}
elseif ($cpuPercent -ge $warningValue)
{
    $message = "CPU usage is over 80%: $CPUPercent%"
    $exitCode = 1
}
else 
{  
    $message = "CPU is normal: $CPUPercent%"
    $exitCode = 0
} 

Write-Output $message
exit $exitCode
