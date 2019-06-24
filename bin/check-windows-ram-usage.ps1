$Memoryuse = ((get-counter -counter "\Memory\% committed bytes in use").CounterSamples[0].CookedValue)
$MemoryPencent = $Memoryuse
$MemoryDisplay = $Memoryuse.ToString("0.00")

$critical = 90
$warn = 70

if ($MemoryPencent -gt $critical)
    {
      Write-Output -InputObject "RAM usage is over 90%: $MemoryDisplay%"  
      exit 2
    }
    elseif ($MemoryPencent -ge $warn)
    {
        Write-Output -InputObject "RAM usage is over 70%: $MemoryDisplay%"
        exit 1
    }
    else 
    {  
        Write-Output -InputObject "RAM is normal: $MemoryDisplay%"
        exit 0
    } 
