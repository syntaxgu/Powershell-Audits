#Define your remote target(s) here
$Remotehost = "<remotehost1>", "<remotehost2>"

#Tailor your commands to your output desires
$Cmd = {
 Write-Output "----------------------------------------------------------------------------------------------------------------"
    systeminfo
 Write-Output "----------------------------------------------------------------------------------------------------------------"
    ipconfig /all 
 Write-Output "----------------------------------------------------------------------------------------------------------------"
    Netstat -anbo
 Write-Output "----------------------------------------------------------------------------------------------------------------"
    Get-Process
 Write-Output "-----------------------------------------------End of Script----------------------------------------------------" 
}

#Displays a login portal with your username 
$Cred = Get-Credential "<username>"

#Loops through every device define in your $Remotehost variable (You may also comment out this line if your situation call for one box instead of multiple)
foreach ($host in $Remotehost){
#Invoke command allows us to run the $cmd variable on the remote device 
    Write-host $box
        Invoke-Command -ComputerName -Credential $Cred -ScriptBlock { $Cmd
        }
    Write-Output "Completed Script"
}

