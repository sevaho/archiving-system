$period = [timespan]::FromSeconds(45)
$lastRunTime = [DateTime]::MinValue
while (1)
{
    while ((Get-Date) - $lastRunTime -lt $period) {
        Start-Sleep -Milliseconds 500
    }
    $lastRunTime = Get-Date
    & .\Monitor.ps1
  }
