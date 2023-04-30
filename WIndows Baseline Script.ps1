#Define your remote target(s) here
$Rmtebox = "<yourboxhere>"

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

#Loops in every device define in your $Rmtebox variable (You may also comment out this line if your situation call for one box instead of multiple)
foreach ($box in $rmtebox){
#Invoke command allows us to remote into target device and rund the $cmd variable on the remote machine
    Write-host $box
        Invoke-Command -ComputerName -Credential $Cred -ScriptBlock { $Cmd
        }
    Write-Output "Completed Script"
}

