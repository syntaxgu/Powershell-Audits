# Define your list of target(s) here 
$remotehost = "<remotehost1>", "<remotehost2>"

$Cred = Get-Credential "<username>"

# Invoke command allows us to run the script on the remote computer and loop through each host 
foreach ($host in $remotehost){
    Write-host $host
    Write-host "-------------------------------------------------------------------------------------------------------------------------------------"
    Invoke-Command -ComputerName $host -credential $Cred -ScriptBlock {
        # Get all running processes
        $processes = Get-Process

        # Loop through each process to identify anything with the following. 
        foreach ($process in $processes) {
            if ($process.ProcessName -like "<processname>" -or $process.ProcessName -like "<processname>") {
            #Displays an output to screen with name, and PID if process was identified. 
                Write-Host "Results: $($process.ProcessName), PID: $($process.Id)"
            }
        }
    }
}
